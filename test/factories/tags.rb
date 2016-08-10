FactoryGirl.define do
  factory :tag do
    content 'Ionic and React Native are both competing for hybrid apps market'

    factory :tag_with_a_tag_type do
      after(:create) do |tag|
        create(:tag_type, tag: tag)
      end
    end
  end
end
