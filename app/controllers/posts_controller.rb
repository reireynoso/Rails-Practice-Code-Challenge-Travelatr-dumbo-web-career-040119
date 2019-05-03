class PostsController < ApplicationController
    def index
        @posts = Post.all
    end

    def new
        @bloggers = Blogger.all
        @destinations = Destination.all
        @post = Post.new
    end

    def create
        @post = Post.create(params_check)
        redirect_to post_path(@post)
    end

    def show
        @post = Post.find(params[:id])
    end

    def edit
        @post = Post.find(params[:id])
    end

    def update
        @post = Post.find(params[:id])
        @post.update(params_check)
        #@post.update
        redirect_to post_path(@post)
    end

    private

    def params_check
        params.require(:post).permit(:title,:content,:likes,:blogger_id,:destination_id)
    end



    
end