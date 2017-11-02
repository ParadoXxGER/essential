class Post < ApplicationRecord
  cti_base_class
  has_many :comments
  belongs_to :user
end
