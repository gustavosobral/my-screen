describe Video do
  it 'should be valid' do
    video = FactoryGirl.build(:video)
    expect(video.valid?).to be true
  end

  it 'should raise error on invalid video' do
    expect { FactoryGirl.build(:invalid_video) }.to raise_error(FFMPEG::Error)
  end

  it 'should not accept invalid video formats' do
    video = FactoryGirl.build(:invalid_video_format)
    expect(video.valid?).to be false
    expect(video.errors.messages[:file].join).to include("não é permitido o envio de arquivos \"mkv\"")
  end
end
