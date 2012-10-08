FactoryGirl.define do
  
  factory :season do
    number 101
    year 1993
    id 999
  end
  
  factory :invalid_season, class: :season do
    number -99
  end
  
  factory :episode do
    season
    title "the title"
    number 101
    first_shown 1993-1-1
    synopsis "some events happened"
    season_id 999
  end
  
  factory :invalid_episode, class: :episode do
    season
    title "invalid eppisode"
    number -99
  end
end