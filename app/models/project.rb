class Project < ApplicationRecord
  belongs_to :user
  has_many :comments, dependent: :destroy
  has_many :participations, dependent: :destroy
  has_many :participation_users, through: :participations, source: :user

  has_one_attached :image
  default_scope -> { order(created_at: :desc) }

  validates :user_id, presence: true
  validates :title, presence: true, length: { maximum: 150 }
  validates :content, presence: true
  validates :start_on, presence: true
  validates :end_on, presence: true

end
