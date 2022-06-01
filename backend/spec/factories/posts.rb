FactoryBot.define do
  factory :post do
    sequence(:name) { |n| "#{n}testpost" }
    user_id { '1' }
    quickword { '右下のボタンで募集ページをつくりましょう！' }
    catchcopy { '閲覧ありがとうございます！' }
    member { 3 }
    place { '集合場所' }
    category {}
    price { 1000 }
    start_time { '2022-06-01T03:00:00.000Z' }
    finish_time { '2022-06-01T09:00:00.000Z' }
    release { '2022-5-31' }
    image { Rack::Test::UploadedFile.new(Rails.root.join('spec/fixtures/test.jpg')) }
    association :user
  end
end
