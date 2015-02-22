class PostsController < ApplicationController
  def index
    @posts = Post.paginate(page: params[:page], per_page: 10)
       authorize @posts
  end

 def show
    @topic = Topic.find(params[:topic_id])
    @post = Post.find(params[:id])
    @comments = @post.comments
    @comment = Comment.new
  end

  def new
        @topic = Topic.find(params[:topic_id])
       @post = Post.new
       authorize @post
  end
  
  def create
        @topic = Topic.find(params[:topic_id])
    @post = current_user.posts.build(post_params)
            authorize @post
     if @post.save
       flash[:notice] = "Post was saved."
       redirect_to @post
     else
       flash[:error] = "There was an error saving the post. Please try again."
       render :new
     end
   end

  def edit
      @topic = Topic.find(params[:topic_id])
    @post = Post.find(params[:id])
    authorize @post
  end


   def update
         @topic = Topic.find(params[:topic_id])
     @post = Post.find(params[:id])
       authorize @post
     if @post.update_attributes(params.require(:post).permit(:title, :body))
       flash[:notice] = "Post was updated."
       redirect_to @post
     else
       flash[:error] = "There was an error saving the post. Please try again."
       render :edit
     end
   end
  
private

def post_params
  params.require(:post).permit(:title, :body, :avatar)
end
  
end
