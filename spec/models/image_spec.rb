describe Image do
  it 'should be valid' do
    image = FactoryGirl.build(:image)
    expect(image.valid?).to be true
    expect(image.file_url(:thumb)).to_not be_falsey
    expect(image.file_url(:small_thumb)).to_not be_falsey
  end

  it 'should not accept invalid image formats' do
    image = FactoryGirl.build(:invalid_image_format)
    expect(image.valid?).to be false
    expect(image.errors.messages[:file].join).to include("não é permitido o envio de arquivos \"gif\"")
  end
end
