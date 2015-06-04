class Users::RegistrationsController < Devise::RegistrationsController
  # POST /resource
  respond_to :json
  def create

    user = User.new(sign_up_params)
  
    if user.save
      render :json => user.as_json(:email => user.email), :status => 201
    else
      warden.custom_failure!
      render :json => user.errors, :status=>422
    end
  end

  def sign_up_params
    params.require(:user).permit(:email, :name, :password, :password_confirmation)
  end

end