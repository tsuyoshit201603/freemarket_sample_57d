class Picture < ApplicationRecord
  belongs_to :product
  mount_uploaders :image, ImageUploader
end
