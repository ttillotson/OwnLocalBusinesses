class ApplicationController < ActionController::Base

    helper_method :current_user, :signed_in?

    private 

    def current_user
        @current_user ||= User.find_by(session_token: session[:session_token])
    end

    def sign_in(user)
        session[:session_token] = user.reset_token!
    end

    def sign_out
        current_user.reset_token! 
        session[:session_token] = SecureRandom.urlsafe_base64(16)
    end

    def signed_in?
        !!current_user
    end

    def require_signed_in
        unless signed_in?
            render json: ['Must be signed in.'], status: 401 
            # request_http_basic_authentication
        end
    end
end
