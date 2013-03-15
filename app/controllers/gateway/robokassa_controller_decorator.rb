Gateway::RobokassaController.class_eval do
  skip_before_filter :verify_authenticity_token, :only => [:result, :success, :fail]
  before_filter :load_order,                     :only => [:result, :success, :fail]
  ssl_required :show
  
  def show
    @order =  Order.find(params[:order_id])
    @gateway = @order.available_payment_methods.find{|x| x.id == params[:gateway_id].to_i }

    if @order.blank? || @gateway.blank?
      flash[:error] = I18n.t("invalid_arguments")
      redirect_to :back
    else
      @signature =  Digest::MD5.hexdigest([ @gateway.options[:mrch_login],
                                            @order.total, @order.id, @gateway.options[:password1]
                                          ].join(':')).upcase
      render :action => :show
    end
  end

  def result
    if @order && @gateway && valid_signature?(@gateway.options[:password2])
      payment = @order.payments.build(:payment_method => @order.shipping_method.payment_methods.where('type = ?', 'Gateway::Robokassa').first)
      payment.state = "completed"
      payment.amount = params["OutSum"].to_f
      payment.save
      @order.save!
      @order.state = 'complete'
      @order.update!
      @order.payment_state = 'paid'
      @order.save
      @order.finalize!
      
      render :text => "OK#{@order.id}"
    else
      render :text => "Invalid Signature"
    end
  end

  def success
    if @order && @gateway && valid_signature?(@gateway.options[:password1]) && @order.complete?
      OrderMailer.confirm_email(@order, current_user).deliver
      OrderMailer.confirm_email_admin(@order, current_user).deliver
      session[:order_id] = nil
      flash[:order_complete] = true
      redirect_to order_path(@order), :notice => I18n.t("payment_success")
    else
      flash[:error] =  t("payment_fail")
      redirect_to root_url
    end
  end

  def fail
    flash[:error] = t("payment_fail")
    redirect_to @order.blank? ? root_url : checkout_state_path("payment")
  end

  private

  def load_order
    @order = Order.find_by_id(params["InvId"])
    @gateway = Gateway::Robokassa.current
  end

  def valid_signature?(key)
    params["SignatureValue"].upcase == Digest::MD5.hexdigest([params["OutSum"], params["InvId"], key ].join(':')).upcase
  end

end
