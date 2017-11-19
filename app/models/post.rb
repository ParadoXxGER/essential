class Post < ApplicationRecord
  has_many :comments, dependent: :destroy
  has_many :filter, dependent: :destroy
  has_many :tags, dependent: :destroy

  belongs_to :user

  has_many :photos, dependent: :destroy
  has_many :links, dependent: :destroy

  attr_accessor :weight
  attr_accessor :sort_by

  paginates_per 50
end
