class AddressesController < Spree::BaseController
  rescue_from ActiveRecord::RecordNotFound, :with => :render_404

  def new
    @address = Address.default
  end
  
  def edit
    session["user_return_to"] = request.env['HTTP_REFERER']
    @address = Address.find(params[:id])
    render_404 unless current_user && current_user.addresses.include?(@address)
  end

  def create
    @address = Address.new(params[:address])

    if @address.save
      flash[:notice] = I18n.t(:successfully_updated, :resource => I18n.t(:address))
      redirect_back_or_default(account_path)
    else
      render :new
    end
  end
  
  def update
    @address = Address.find(params[:id])
    if @address.editable?
      if @address.update_attributes(params[:address])
        flash[:notice] = I18n.t(:successfully_updated, :resource => I18n.t(:address))
        redirect_back_or_default(account_path)
      else
        render :edit
      end
    else
      new_address = @address.clone
      new_address.attributes = params[:address]
      @address.update_attribute(:deleted_at, Time.now)
      if new_address.save
        flash[:notice] = I18n.t(:successfully_updated, :resource => I18n.t(:address))
        redirect_back_or_default(account_path)
      else
        render :edit
      end
    end
  end

  def destroy
    @address = Address.find(params[:id])
    if current_user && current_user.addresses.include?(@address)
      if @address.can_be_deleted?
        @address.destroy
      else
        @address.update_attribute(:deleted_at, Time.now)
      end
      redirect_to(request.env['HTTP_REFERER'] || account_path) unless request.xhr?
    else
      render_404
    end
  end
end
