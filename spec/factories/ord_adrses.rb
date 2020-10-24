FactoryBot.define do
  factory :ord_adrs do
    post      {"123-4567"}
    pref_id   {2}
    city      {Faker::Address.city} 
    area      {Faker::Address.street_address}
    phone     {Faker::Base.numerify('090########')}
    # association :user
    
  end
end
