describe Resource do
  it 'title should be present' do
    resource = FactoryGirl.build(:resource, title: '')
    expect(resource.valid?).to be false
    expect(resource.errors.messages[:title]).to include('não pode ficar em branco')
  end

  it 'description should be present' do
    resource = FactoryGirl.build(:resource, description: '')
    expect(resource.valid?).to be false
    expect(resource.errors.messages[:description]).to include('não pode ficar em branco')
  end

  it 'file should be present' do
    resource = FactoryGirl.build(:resource, file: '')
    expect(resource.valid?).to be false
    expect(resource.errors.messages[:file]).to include('não pode ficar em branco')
  end

  it 'title should not be too long' do
    resource = FactoryGirl.build(:resource)
    resource.title = 'a' * 46
    expect(resource.valid?).to be false
    expect(resource.errors.messages[:title].join).to include('máximo: 45 caracteres')
  end

  it 'description should not to be too long' do
    resource = FactoryGirl.build(:resource)
    resource.description = 'a' * 256
    expect(resource.valid?).to be false
    expect(resource.errors.messages[:description].join).to include('máximo: 255 caracteres')
  end
end
