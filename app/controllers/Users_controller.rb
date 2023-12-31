class UsersController < ApplicationController
    
    def new
     @user = User.new
    end

    def edit
     @user = User.find(params[:id])
    end

    def update
        @user = User.find(params[:id])
        if @user.update(user_params)
            flash[:notice] = "Your Information was succesfully updated"
            redirect_to articles_path
        else
            render "edit"
        end
    end

    
    def create
        @user = User.new(user_params)
        if @user.save
         flash[:notice] = "Welcome to Alpha Blog #{@user.username},you have successfully signed up"
         redirect_to new_article_path
        else
            render "new"
        end
    end


    private

    def user_params
        params.require(:user).permit(:username, :email, :password)
    end
end
