FactoryGirl.define do
  factory :user do
    name     "Jacob Dixon"
    email    "jacob.dixon@gmail.com"
    password "foobar"
    password_confirmation "foobar"
  end
end