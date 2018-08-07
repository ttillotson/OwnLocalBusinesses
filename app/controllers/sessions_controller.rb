class SessionsController < ApplicationController
    def create 
        @user = User.find_by_credentials(user_params)

        if @user 
            sign_in(@user)
            render `dashboard/home`
        else 
            render json: ['Invalid Credentials'], status: 422
        end
    end

    def destroy
        @user = current_user 

        if current_user
            sign_out
            redirect_to :root, status: 403
        else 
            render json: ['Nobody is currently singed in.'], status: 404
        end
    end

    private 

    def user_params
        params.require(:user).permit(:username, :password)
    end
end
