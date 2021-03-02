class InvitationsController < ApplicationController
    def create
        user = User.find(params[:friend_id])
        current_user.send_invitation(user)
        flash.notice = "Friend Request Sent"
        redirect_to root_path
    end

    def update
        invitation = Invitation.find(params[:invitation_id])
        invitation.update(confirmed: true)
        flash.notice = "Friend Request Accepted"
        redirect_to root_path
    end

    def destroy
        invitation = Invitation.find(params[:invitation_id])
        invitation.destroy
        flash.notice = "Friend Request Denied"
        redirect_to root_path
    end
end
