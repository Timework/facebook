class UsersController < ApplicationController
    def index
        @users = User.all.filter { |i| i if i.id != current_user.id}
        @friends = current_user.friends
    end

    def new
        @profile = Profile.new
        @user = current_user
    end

    def show
        @user = User.find(params[:id])
        @profile = @user.profile
        @friends = current_user.friends
        @posts = @user.posts
    end

    def edit
        @user = current_user
        @profile = @user.profile
    end
end
