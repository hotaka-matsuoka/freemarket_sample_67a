class Image < ApplicationRecord
  mount_uploader :image_url, ImagesUploader
  belongs_to :exhibition

end
