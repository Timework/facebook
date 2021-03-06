class PostsController < ApplicationController
    def new
        @post = Post.new
    end

    def create
        @post = current_user.posts.build(post_params)
        if @post.save
            flash.notice = "Post '#{@post.title}' Created!"
            redirect_to action: "index"
        else
            render :new
        end
    end

    def destroy
        @post = Post.find(params[:id])
        if current_user == @post.user
            @post.destroy
            flash.alert = "Post '#{@post.title}' Deleted!"
        else
            flash.alert = "You Are Not The Owner Of This Post!"
        end
        redirect_to action: "index"
    end

    def index
        @posts = []
        current_user.posts.each do |post|
            @posts.push(post)
        end

        current_user.friends.each do |friend|
            friend.posts.each do |fpost|
                @posts.push(fpost)
            end
        end

        @posts = @posts.sort_by(&:created_at).reverse
    end


    private
    def post_params
        params.require(:post).permit(:title, :body, :image)
    end
end
