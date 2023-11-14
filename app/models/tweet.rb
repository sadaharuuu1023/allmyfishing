class Tweet < ApplicationRecord
  belongs_to :user 
  has_one_attached :image

  validates :title, presence: true
  validates :text_field, presence: true
  has_many :comments

end
