describe PlaylistItem do
  let(:playlist_item) { FactoryGirl.build(:playlist_item) }

  it 'should be valid' do
    expect(playlist_item.valid?).to be true
  end

  it 'position should be present' do
    playlist_item.position = nil
    expect(playlist_item.valid?).to be false
    expect(playlist_item.errors.messages[:position].join).to include('não é um número')
  end

  it 'position should not be negative' do
    playlist_item.position = -2.3
    expect(playlist_item.valid?).to be false
    expect(playlist_item.errors.messages[:position].join).to include('deve ser maior ou igual a 0')
  end

  it 'duration should be present' do
    playlist_item.duration = nil
    expect(playlist_item.valid?).to be false
    expect(playlist_item.errors.messages[:duration].join).to include('não é um número')
  end

  it 'duration should be greater than 1' do
    playlist_item.duration = 0.5
    expect(playlist_item.valid?).to be false
    expect(playlist_item.errors.messages[:duration].join).to include('deve ser maior que 1')
  end
end
