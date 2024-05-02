class Group < ApplicationRecord
  has_many :group_users, dependent: :destroy
  has_many :users, through: :group_users
  
  validates :name, presence: true
  validates :introduction, presence: true
  has_one_attached :group_image
  
  def get_group_image
    (group_image.attached?) ? group_image : 'no_image.jpg'
  end
  
  def include_user?(user)
    group_users.exists?(user_id: user.id)
  end
  
end
