FactoryBot.define do
  factory :post do
    sequence(:name) { |n| "#{n}testpost" }
    user_id { '1' }
    quickword { '早速、右下のボタンで募集ページをつくりましょう！' }
    catchcopy { 'ご閲覧ありがとうございます' }
    member { 3 }
    place { '集合場所' }
    category {}
    price { 1000 }
    start_time { '2000-01-01T09:00:00.000Z' }
    finish_time { '2000-01-01T03:00:00.000Z' }
    release { '2021-5-10' }
    image { Rack::Test::UploadedFile.new(Rails.root.join('spec/fixtures/test.jpg')) }
    association :user
  end
end
