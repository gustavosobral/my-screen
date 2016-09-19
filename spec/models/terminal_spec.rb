describe Terminal do
  let(:terminal) { FactoryGirl.build(:terminal) }

  it 'should be valid' do
    expect(terminal.valid?).to be true
  end

  it 'user should be present' do
    terminal.user = nil
    expect(terminal.valid?).to be false
    expect(terminal.errors.messages[:user].join).to match('não pode ficar em branco')
  end

  it 'title should be present' do
    terminal.title = ''
    expect(terminal.valid?).to be false
    expect(terminal.errors.messages[:title].join).to match('não pode ficar em branco')
  end

  it 'title should not be too long' do
    terminal.title = 'a' * 51
    expect(terminal.valid?).to be false
    expect(terminal.errors.messages[:title].join).to match('é muito longo (máximo: 50 caracteres)')
  end
end
