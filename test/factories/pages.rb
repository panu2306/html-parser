FactoryGirl.define do
  factory :page do
    url 'https://google.com'
    factory :page_with_tags do
      after(:create) do |page|
        create(:tag_with_a_tag_type, page: page)
      end
    end
  end
end
