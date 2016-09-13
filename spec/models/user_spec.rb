describe User do
  it 'should be valid' do
    user = FactoryGirl.build(:user)
    expect(user.valid?).to be true
  end

  it 'email should be unique' do
    FactoryGirl.create(:user)
    other_user = FactoryGirl.build(:user, name: 'Jose')
    expect(other_user.valid?).to be false
    expect(other_user.errors.messages[:email].join).to match('já está em uso')
  end
end
