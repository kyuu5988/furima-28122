FactoryBot.define do
  factory :item do
    p_name    {Faker::Name.initials(number: 10)}
    p_info    {Faker::Lorem.sentence}
    ctg_id    {2} 
    status_id {2}
    de_fee_id {2}
    de_are_id {2}
    de_day_id {2}
    sold      {0}
    price     {300}
    association :user

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test.jpg'), filename: 'test.jpg')
    end
  end
end
