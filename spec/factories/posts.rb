require 'faker'

FactoryGirl.define do
  factory :post do
    association   :user
    title         { Faker::Lorem.sentence(5) }
    body          { Faker::Lorem.paragraph(2) }

    factory :invalid_post do
      body          nil
    end
  end

end