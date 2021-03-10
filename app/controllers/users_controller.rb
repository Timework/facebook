class UsersController < ApplicationController
    def index
        @users = User.all.filter { |i| i if i.id != current_user.id}
        @friends = current_user.friends
        @recieved = []
        current_user.pending_invitations.each do |invite|
            if invite.user_id == current_user.id 
                user = User.find(invite.friend_id)
            else
                user = User.find(invite.user_id)
            end
            @recieved.push(user)
        end 
    end

    def new
        @profile = Profile.new
        @user = current_user
    end

    def show
        @user = User.find(params[:id])
        @profile = @user.profile
        @friends = @user.friends
        @posts = @user.posts
    end

    def edit
        @user = current_user
        @profile = @user.profile
    end
end
