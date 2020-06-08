class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  
  attachment :profile_image 

  has_many :books, dependent: :destroy
  has_many :favorites, dependent: :destroy
  has_many :book_comments, dependent: :destroy
  has_many :relationships, dependent: :destroy
  # has_many :active_relationships, class_name: "Relationship"
  # has_many :passive_relationships, class_name: "Relationship"
   #フォローする側のUserから見て、フォローされる側のUserを(中間テーブルを介して)集める。なので親はfollowing_id(フォローする側)
   has_many :active_relationships, class_name: "Relationship", foreign_key: :follow_id
   # 中間テーブルを介して「follower」モデルのUser(フォローされた側)を集めることを「followings」と定義
   has_many :follows, through: :active_relationships, source: :follower
   
  
   #フォローされる側のUserから見て、フォローしてくる側のUserを(中間テーブルを介して)集める。なので親はfollower_id(フォローされる側)
   has_many :passive_relationships, class_name: "Relationship", foreign_key: :follower_id
   # 中間テーブルを介して「following」モデルのUser(フォローする側)を集めることを「followers」と定義
   has_many :followers, through: :passive_relationships, source: :follow
   
  
  def followed_by?(user)
    passive_relationships.where(follow_id: user.id).exists?
  end

  # validates :introduction, presence: true, length: {maximum: 50},on: :update
  # with_options on: :update do
  #   validates :introduction, presence: true, length: {maximum: 50}
  # end

  validates :introduction, presence: false, length: {maximum: 50}

  validates :name, presence: true, length: {in: 2..20}
end
