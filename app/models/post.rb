class Post < ApplicationRecord
  cti_base_class
  has_many :comments, dependent: :destroy
  belongs_to :user
  paginates_per 50
end
