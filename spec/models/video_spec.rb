describe Video do
  it 'should be valid' do
    video = FactoryGirl.build(:video)
    expect(video.valid?).to be true
  end
end
