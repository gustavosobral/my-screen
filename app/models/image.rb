class Image < Resource
  mount_uploader :file, ImageUploader
  validate :image_size

  private

    # Validates the size of an uploaded image.
    def image_size
      if file.size > 4.megabytes
        errors.add(:file, 'deve ser menor que 4MB')
      end
    end
end
