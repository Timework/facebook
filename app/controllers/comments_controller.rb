class CommentsController < ApplicationController
    def create
        @comment = Comment.new(comment_params)
        @comment.post_id = params[:post_id]
        @comment.user_id = current_user.id
        
        @comment.save

        flash.notice = "Comment Saved!"

        redirect_back(fallback_location: root_path)
    end

    def destroy
        comment = Comment.find(params[:id])
        if comment.user == current_user
            if comment.destroy
                flash.alert = "Comment Deleted!"
             else
                flash.alert = "Comment Failed to Delete"
            end
        else
            flash.alert = "You must be the owner of the comment to delete it"
        end

        redirect_back(fallback_location: root_path)
    end

    private

    def comment_params
        params.permit(:body)
    end
end
