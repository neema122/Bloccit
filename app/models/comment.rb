class Comment < ActiveRecord::Base
  belongs_to :post
  
  after_create :send_favorite_emails
 
   private
 
   def send_favorite_emails
     post.favorites.each do |favorite|
        if favorite.user_id != self.user_id && favorite.user.email_favorites?
         FavoriteMailer.new_comment(favorite.user, self.post, self).deliver
       end
     end
   end
end
