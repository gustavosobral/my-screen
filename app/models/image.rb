class Image < Resource
  mount_uploader :file, ImageUploader
end
