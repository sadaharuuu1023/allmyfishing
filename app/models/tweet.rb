class Tweet < ApplicationRecord
  belongs_to :user 
  has_one_attached :image

  validates :title, presence: true
  validates :text_field, presence: true
  validates :text_tackle, presence: true
end
