describe Image do
  it 'should be valid' do
    image = FactoryGirl.build(:image)
    expect(image.valid?).to be true
  end
end
