class Image < Resource
  mount_uploader :file, ImageUploader
  before_create :set_duration

  validate :image_size

  private

  # Set default duration
  def set_duration
    self.duration = 10.0
  end

  # Validates the size of an uploaded image.
  def image_size
    if file.size > 4.megabytes
      errors.add(:file, 'deve ser menor que 4MB')
    end
  end
end
