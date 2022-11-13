class PostImage < ApplicationRecord
  has_one_attached :image
  belings_to :user
end
