FactoryGirl.define do
  factory :user do
    name      'Felipe'
    email     'felipe@gmail.com'
    password  '12345678'
  end

  factory :admin_user, parent: :user do
    admin true
  end
end
