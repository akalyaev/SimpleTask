FactoryGirl.define do

  factory :user, :aliases => [:assigned_to,
                              :commenter] do
    username 'test'
    password 'test'
  end

  factory :user_profile do
    user

    surname 'Doe'
    given_names 'John'
  end

  factory :developer do
    user

    factory :busy_developer do
      busy true
    end
  end


end