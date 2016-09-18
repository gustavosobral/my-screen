describe User do
  let(:user) { FactoryGirl.build(:user) }

  it 'should be valid' do
    expect(user.valid?).to be true
  end

  it 'name should be present' do
    user.name = ''
    expect(user.valid?).to be false
    expect(user.errors.messages[:name].join).to match('não pode ficar em branco')
  end

  it 'name should note be too long' do
    user.name = 'a' * 51
    expect(user.valid?).to be false
    expect(user.errors.messages[:name].join).to match('é muito longo (máximo: 50 caracteres)')
  end

  it 'email should be unique' do
    user.email = 'valid@valid.com'
    user.save
    other_user = FactoryGirl.build(:user, email: 'valid@valid.com')
    expect(other_user.valid?).to be false
    expect(other_user.errors.messages[:email].join).to match('já está em uso')
  end
end
