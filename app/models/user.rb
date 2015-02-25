class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :confirmable
  has_many :posts
    mount_uploader :avatar, AvatarUploader
  has_many :comments
  has_many :votes
  
  def admin?
   role == 'admin'
  end
 
   def moderator?
     role == 'moderator'
   end
  
   def favorited(post)
     favorites.where(post_id: post.id).first
   end
end

 
