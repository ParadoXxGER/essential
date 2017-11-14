class Post < ApplicationRecord
  cti_base_class

  has_many :comments, dependent: :destroy
  has_many :photo_album_posts, dependent: :destroy
  has_many :text_posts, dependent: :destroy
  has_many :file_posts, dependent: :destroy
  has_many :filter, dependent: :destroy
  has_many :tags, dependent: :destroy

  belongs_to :user

  paginates_per 50

  attr_writer :type
  attr_accessor :weight

end
