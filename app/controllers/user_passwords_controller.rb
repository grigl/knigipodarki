# encoding: utf-8
class UserPasswordsController < Devise::PasswordsController
  include SpreeBase
  helper :users, 'spree/base'

  def new
    super
  end

  def create
    self.resource = resource_class.send_reset_password_instructions(params[resource_name])

    if resource.errors.empty?
      set_flash_message(:notice, :send_instructions)
      respond_to do |format|
        format.html { respond_with resource, :location => new_session_path(resource_name) }
        format.js { render :show_restore_message }
      end
    else
      @errors = resource.errors
      respond_to do |format|
        format.html { render :new }
        format.js { render :show_restore_password_errors }
      end
    end
  end

  def edit
    super
  end

  def update
    unless params[:user][:password].empty? && params[:user][:password_confirmation].empty?
      self.resource = resource_class.reset_password_by_token(params[resource_name])

      if resource.errors.empty?
        set_flash_message(:notice, :updated) if is_navigational_format?
        sign_in(resource_name, resource)
        respond_with resource, :location => redirect_location(resource_name, resource)
      else
        respond_with_navigational(resource){ render_with_scope :edit }
      end
    else
      @user = User.find_by_reset_password_token(params[:user][:reset_password_token])
      @user ||= User.new
      
      @error = 'Вы не ввели пароль'
      respond_with_navigational(resource){ render_with_scope :edit }
    end
  end
end
