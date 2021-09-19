FactoryBot.define do
  factory :user do
    role
    email { 'teste@email.com' }
    password { 'Teste123' }
    name { 'Teste' }
  end
end