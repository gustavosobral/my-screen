`which ffmpeg`.strip
raise SystemCallError, 'FFmpeg not found. You need to have it to generate thumbnails from videos' unless $?.success?
