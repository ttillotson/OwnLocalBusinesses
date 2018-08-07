class SessionsController < ApplicationController

    def new 
        @user = User.new
    end

    def create 
        @user = User.find_by_credentials(params[:user][:username], params[:user][:password])

        if @user 
            sign_in(@user)
            redirect_to '/businesses'
        else 
            render json: ['Invalid Credentials'], status: 422
        end
    end

    # def destroy
    #     @user = current_user 

    #     if current_user
    #         sign_out
    #         redirect_to new_session_url, status: 403
    #     else 
    #         render json: ['Nobody is currently signed in.'], status: 404
    #     end
    # end

    def log_out
        # redirect_to :destroy
        @user = current_user 

        if current_user
            sign_out
            redirect_to new_session_url, status: 200
        else 
            render json: ['Nobody is currently singed in.'], status: 404
        end
    end

    private 

    def user_params
        params.require(:user).permit(:username, :password)
    end
end
