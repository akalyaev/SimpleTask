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

  factory :story do
    name 'test'

    trait :assigned do
      assigned_to
    end

    trait :in_backlog do
      active false
    end

    trait :new do
      status 'new'
    end

    trait :started do
      status 'started'
    end

    trait :finished do
      status 'finished'
    end

    trait :accepted do
      status 'accepted'
    end

    trait :rejected do
      status 'rejected'
    end

    factory :new_story, :traits => [:new]
    factory :new_story_in_backlog, :traits => [:new, :in_backlog]
    factory :accepted_story, :traits => [:accepted, :assigned]
    factory :rejected_story, :traits => [:rejected]
  end

  factory :story_comment do
    commenter
    story
    comment 'Test comment'
  end
end