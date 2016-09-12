describe Video do
  it 'should be valid' do
    video = FactoryGirl.build(:video)
    expect(video.valid?).to be true
    expect(video.file_url(:thumb)).to_not be_falsey
    expect(video.file_url(:small_thumb)).to_not be_falsey
  end

  it 'should not accept invalid video formats' do
    video = FactoryGirl.build(:invalid_video_format)
    expect(video.valid?).to be false
    expect(video.errors.messages[:file].join).to include("não é permitido o envio de arquivos \"mkv\"")
  end
end
