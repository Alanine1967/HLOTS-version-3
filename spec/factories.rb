FactoryGirl.define do
  
  factory :episode do
    association :season
    title "the title"
    sequence(:number)
    first_shown Date.parse("1993-1-1")
    synopsis "some events happened"
  end
  
    
  factory :season do
    sequence(:number)
    year 1993
  end
  
  factory :participant do
    association :episode
    role "Pippy dog"
    surname "Churchill"
  end
end