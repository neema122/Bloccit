class CommentsController < ApplicationController
  def create
    @topic = Topic.find(params[:topic_id])
    @post = @topic.posts.find(params[:post_id])
    @comments = @post.comments

    @comment = current_user.comments.build(params[:comment])
    @comment.post = @post
      @new_comment = Comment.new
  end
  
  def destroy
     @topic = Topic.find(params[:topic_id])
     @post = @topic.posts.find(params[:post_id])
     @comment = @post.comments.find(params[:id])
 
     authorize @comment
     if @comment.destroy
       flash[:notice] = "Comment was removed."
       
     else
       flash[:error] = "Comment couldn't be deleted. Try again." 
     end
        respond_to do |format|
          format.html
          format.js
        end
  end
end

private

  def comment_params
    params.require(:comment).permit(:body)
  end
