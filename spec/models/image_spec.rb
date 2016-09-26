describe Image do
  it 'should be valid' do
    image = FactoryGirl.build(:image)
    expect(image.valid?).to be true
    expect(image.file_url(:thumb)).to_not be_falsey
    expect(image.file_url(:small_thumb)).to_not be_falsey
  end

  it 'should not accept invalid image formats' do
    invalid_image = FactoryGirl.build(:invalid_image_format)
    expect(invalid_image.valid?).to be false
    expect(invalid_image.errors.messages[:file].join).to include("não é permitido o envio de arquivos \"gif\"")
  end

  it 'should have default duration' do
    image = FactoryGirl.create(:image)
    expect(image.duration).to be 10.0
  end
end
