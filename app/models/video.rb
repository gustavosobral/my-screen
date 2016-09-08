class Video < Resource
  mount_uploader :file, VideoUploader
  validate :video_size

  private

    # Validates the size of an uploaded video.
    def video_size
      if file.size > 1.gigabyte
        errors.add(:file, 'deve ser menor que 1GB')
      end
    end
end
