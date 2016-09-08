describe User do
  it 'should be valid' do
    user = FactoryGirl.build(:user)
    expect(user.valid?).to be true
  end
end
