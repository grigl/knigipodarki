class UserSessionsController < Devise::SessionsController
  include SpreeBase
  helper :users, 'spree/base'

  include Spree::CurrentOrder

  after_filter :associate_user, :only => :create

  ssl_required :new, :create, :destroy, :update
  ssl_allowed :login_bar

  # GET /resource/sign_in
  def new
    super
  end

  def create
    authenticate_user!

    if user_signed_in?
      respond_to do |format|
        format.html {
          flash[:notice] = I18n.t("logged_in_succesfully")
          redirect_back_or_default(products_path)
        }
        format.js {
          render js: "window.location = '#{products_url}';"
        }
      end
    else
      respond_to do |format|
        format.html {
          flash[:error] = I18n.t("devise.failure.invalid")
          render :new
        }
        format.js {
          @errors = I18n.t("devise.failure.invalid")
          render :show_login_errors
        }
      end
    end
  end

  def destroy
    session.clear
    super
  end

  def nav_bar
    render :partial => "shared/nav_bar"
  end

  private

  def associate_user
    return unless current_user and current_order
    current_order.associate_user!(current_user)
    session[:guest_token] = nil
  end

  def accurate_title
    I18n.t(:log_in)
  end

end
