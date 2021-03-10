class ProfilesController < ApplicationController
    def create
        @profile = current_user.build_profile(profile_params)

        if @profile.save
            redirect_to user_path(@profile.user)
            flash.notice = "Profile Created!"
        else
            render 'users/new'
        end
    end

    def update
        @user = User.find(params[:user_id])
        @profile = @user.profile
        if @profile.update(profile_params)
            redirect_to user_path(@profile.user)
            flash.notice = "Profile Edited!"
        else
            render 'users/edit'
        end
    end

    def show
        redirect_to user_path(current_user)
    end

    private

    def profile_params
        params.require(:profile).permit(:image, :name, :about)
    end
end
