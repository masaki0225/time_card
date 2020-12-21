class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :project
  belongs_to :comment,  class_name: "Comment", optional: true
  has_many   :replies, class_name: "Comment", dependent: :destroy

  has_one_attached :image

  validates :content, presence: true
  validates :user_id, presence: true
  validates :project_id, presence: true
end
