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
        format.html { render_with_scope :new }
        format.js { render :show_restore_password_errors }
      end
    end
  end

  def edit
    super
  end

  def update
    super
  end
end
