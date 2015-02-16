class PostsController < ApplicationController
  def index
    @posts = Post.all
  end

  def show
<<<<<<< HEAD
=======
    @post = Post.find(params[:id])
>>>>>>> create-posts-controller
  end

  def new
  end

  def edit
  end
end
