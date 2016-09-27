describe Playlist do
  let(:playlist) { FactoryGirl.build(:playlist) }

  it 'should be valid' do
    expect(playlist.valid?).to be true
  end

  it 'user should be present' do
    playlist.user = nil
    expect(playlist.valid?).to be false
    expect(playlist.errors.messages[:user].join).to include('não pode ficar em branco')
  end

  it 'title should be present' do
    playlist.title = ''
    expect(playlist.valid?).to be false
    expect(playlist.errors.messages[:title].join).to include('não pode ficar em branco')
  end

  it 'title should not be too long' do
    playlist.title = 'a' * 46
    expect(playlist.valid?).to be false
    expect(playlist.errors.messages[:title].join).to include('máximo: 45 caracteres')
  end

  it 'description should not be too long' do
    playlist.description = 'a' * 256
    expect(playlist.valid?).to be false
    expect(playlist.errors.messages[:description].join).to include('máximo: 255 caracteres')
  end

  it 'duration should be present' do
    playlist.duration = nil
    expect(playlist.valid?).to be false
    expect(playlist.errors.messages[:duration].join).to include('não é um número')
  end

  it 'duration should be greater than 0' do
    playlist.duration = 0.0
    expect(playlist.valid?).to be false
    expect(playlist.errors.messages[:duration].join).to include('deve ser maior que 0.0')
  end
end
