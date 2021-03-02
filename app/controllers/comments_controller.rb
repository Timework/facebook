class CommentsController < ApplicationController
    def create
        @comment = Comment.new(comment_params)
        @comment.post_id = params[:post_id]
        @comment.user_id = current_user.id

        @comment.save

        redirect_to post_path(@comment.post)
    end

    private

    def comment_params
        params.permit(:body)
    end
end
