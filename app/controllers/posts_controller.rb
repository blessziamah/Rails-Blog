class PostsController < ApplicationController
    before_action :find_post, only: [:show, :edit, :update, :destroy]

    def index
        @posts = Post.all.order(created_at: :desc)
    end

    def new
        @post = Post.new
    end

    def create
        @post = Post.new(post_params)

        if @post.save
            redirect_to @post
        else
            render "new"
        end
        
    end

    def show
    end

    def update

        if @post.update(post_params)
            redirect_to @post
        else
            render "edit"
        end
    end

    def edit
    end

    def destroy
        @post.destroy

        redirect_to posts_path
    end

    private

    def post_params
        params.require(:post).permit(:title, :content)
    end

    def find_post
        @post = Post.find(params[:id])
    end

end
