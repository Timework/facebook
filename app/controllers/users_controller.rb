class UsersController < ApplicationController
    def index
        @users = User.all.filter { |i| i if i.id != current_user.id}
        @friends = current_user.friends
    end
end
