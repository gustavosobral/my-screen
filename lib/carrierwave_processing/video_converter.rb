module CarrierWave
  module FFMPEG
    module ClassMethods
      def gen_video_thumb(width, height)
        process :gen_video_thumb => [width, height]
      end
    end

    def gen_video_thumb(width, height)
      directory = File.dirname(current_path)
      tmpfile = File.join(directory, 'tmpfile')

      FileUtils.move(current_path, tmpfile)
      file = ::FFMPEG::Movie.new(tmpfile)
      model.duration = file.duration.round(1)
      file.screenshot(current_path, { seek_time: (file.duration*0.5), resolution: "#{width}x#{height}" })

      FileUtils.rm(tmpfile)
    end
  end
end
