class FavoritesController < ApplicationController
   def create
     @post = Post.find(params[:post_id])
     favorite = current_user.favorites.build(post: @post)
 
     if favorite.save
       flash[:notice] = "Favorited post"
       redirect_to [@topic, @post]
    else
      flash[:error] = "Unable to add favorite."
      redirect_to [@topic, @post]
     end
   end
  
  def destroy
    @topic = Topic.find(params[:topic_id])
    @post = @topic.posts.find(params[:post_id])
    favorite = current_user.favorites.find(params[:id])

    authorize favorite

    if favorite.destroy
      flash[:notice] = "Removed favorite."
      redirect_to [@topic, @post]
    else
      flash[:error] = "Unable to remove favorite.""
      redirect_to [@topic, @post]
   end
 end
end
