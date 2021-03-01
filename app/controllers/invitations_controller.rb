class InvitationsController < ApplicationController
    def create
        user = User.find(params[:friend_id])
        current_user.send_invitation(user)
        redirect_to root_path
    end

    def update
        invitation = Invitation.find(params[:invitation_id])
        invitation.update(confirmed: true)
        redirect_to root_path
    end

    def destroy
        invitation = Invitation.find(params[:invitation_id])
        invitation.destroy
        redirect_to root_path
    end
end
