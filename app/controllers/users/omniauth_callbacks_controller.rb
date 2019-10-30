# frozen_string_literal: true

class Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController
  # You should configure your model like this:
  # devise :omniauthable, omniauth_providers: [:twitter]

  def google_oauth2
    @user = User.from_omniauth(request.env["omniauth.auth"])
    # @user.save!(validation: false)
    if @user.persisted?
      binding.pry
      sign_in @user
      redirect_to user_path(@user.id), notice: 'Successfully logged in.'
      # set_flash_message(:notice, :success, :kind => "Google") if is_navigational_format?
    else
      binding.pry
      session["devise.google_data"] = request.env["omniauth.auth"]
      redirect_to root_path, alert: 'Something went wrong. Please try to register instead.'
    end
  end
  # You should also create an action method in this controller like this:
  # def twitter
  # end

  # More info at:
  # https://github.com/plataformatec/devise#omniauth

  # GET|POST /resource/auth/twitter
  # def passthru
  #   super
  # end

  # GET|POST /users/auth/twitter/callback
  # def failure
  #   super
  # end

  # protected

  # The path used when OmniAuth fails
  # def after_omniauth_failure_path_for(scope)
  #   super(scope)
  # end
end
