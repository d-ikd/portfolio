User.create!(
  name: ENV['RAILS_ADMIN_USER'],
  email: ENV['RAILS_ADMIN_ADDRESS'],
  password: ENV['RAILS_ADMIN_KEY'],
  password_confirmation: ENV['RAILS_ADMIN_KEY'],
  admin: true
)

Post.create(
  user_id: 1,
  name: 'はじめまして！',
  quickword: '右下のボタンで募集ページを作成しましょう！',
  catchcopy: '閲覧ありがとうございます！',
  member: 3,
  place: '集合場所',
  category: '',
  price: '1000',
  start_time: '2022-06-01T03:00:00.000Z',
  finish_time: '2022-06-01T09:00:00.000Z',
  release: '2022-5-31',
  image: Rails.root.join('app/assets/images/1_begin/image.jpg').open
)

User.create!(
  name: ENV['RAILS_GUEST_USER'],
  email: ENV['RAILS_GUEST_ADDRESS'],
  password: ENV['RAILS_GUEST_KEY'],
  password_confirmation: ENV['RAILS_GUEST_KEY'],
  admin: false,
  image: Rails.root.join('app/assets/images/1_begin/user.jpg').open
)

User.create!(
  name: 'Tester3',
  email: 'test-3@gmail.com',
  password: 'password',
  password_confirmation: 'password',
  admin: false,
  image: Rails.root.join('app/assets/images/1_begin/user.jpg').open
)

Post.create(
  user_id: 3,
  name: 'Ruby on Rails',
  quickword: 'Yay! You\'re on Rails!',
  catchcopy: 'Do you know rails?',
  member: 5,
  place: 'Test',
  category: '',
  price: '1000',
  start_time: '2022-01-01T03:00:00.000Z',
  finish_time: '2022-01-01T09:00:00.000Z',
  release: '2022-5-10',
  image: Rails.root.join('app/assets/images/1_begin/image.jpg').open
)

User.create!(
  name: 'Tester4',
  email: 'test-4@gmail.com',
  password: 'password',
  password_confirmation: 'password',
  admin: false,
  image: Rails.root.join('app/assets/images/1_begin/user.jpg').open
)

Post.create(
  user_id: 4,
  name: 'Nuxt.js',
  quickword: 'Welcom to Nuxt.js!',
  catchcopy: 'Let\'s study Nuxt',
  member: 5,
  place: 'Test',
  category: '',
  price: '1000',
  start_time: '2022-01-01T03:00:00.000Z',
  finish_time: '2022-01-01T09:00:00.000Z',
  release: '2022-5-10',
  image: Rails.root.join('app/assets/images/1_begin/image.jpg').open
)

User.create!(
  name: 'Tester5',
  email: 'test-5@gmail.com',
  password: 'password',
  password_confirmation: 'password',
  admin: false
  # image: Rails.root.join('app/assets/images/1_begin/user.jpg').open
)

Post.create(
  user_id: 5,
  name: 'Next.js',
  quickword: 'Welcom to Next.js!',
  catchcopy: 'Let\'s study Next',
  member: 5,
  place: 'Zoom',
  category: '',
  price: '3000',
  start_time: '2022-01-01T03:00:00.000Z',
  finish_time: '2022-01-01T09:00:00.000Z',
  release: '2022-5-10'
  # image: Rails.root.join('app/assets/images/1_begin/image.jpg').open
)

User.create!(
  name: 'Tester6',
  email: 'test-6@gmail.com',
  password: 'password',
  password_confirmation: 'password',
  admin: false,
  image: Rails.root.join('app/assets/images/1_begin/user.jpg').open
)

Post.create(
  user_id: 6,
  name: 'Next.js',
  quickword: 'Welcom to Next.js!',
  catchcopy: 'Let\'s study Next',
  member: 5,
  place: 'Zoom',
  category: '',
  price: '3000',
  start_time: '2022-01-01T03:00:00.000Z',
  finish_time: '2022-01-01T09:00:00.000Z',
  release: '2022-5-10',
  image: Rails.root.join('app/assets/images/1_begin/image.jpg').open
)

User.create!(
  name: 'Tester7',
  email: 'test-7@gmail.com',
  password: 'password',
  password_confirmation: 'password',
  admin: false,
  image: Rails.root.join('app/assets/images/1_begin/user.jpg').open
)

Post.create(
  user_id: 7,
  name: 'Next.js',
  quickword: 'Welcom to Next.js!',
  catchcopy: 'Let\'s study Next',
  member: 7,
  place: 'Zoom',
  category: '',
  price: '3000',
  start_time: '2022-01-01T03:00:00.000Z',
  finish_time: '2022-01-01T09:00:00.000Z',
  release: '2021-5-10',
  image: Rails.root.join('app/assets/images/1_begin/image.jpg').open
)

User.create!(
  name: 'Tester8',
  email: 'test-8@gmail.com',
  password: 'password',
  password_confirmation: 'password',
  admin: false,
  image: Rails.root.join('app/assets/images/1_begin/user.jpg').open
)

Post.create(
  user_id: 8,
  name: 'Next.js',
  quickword: 'Welcom to Next.js!',
  catchcopy: 'Let\'s study Next',
  member: 8,
  place: 'Zoom',
  category: '',
  price: '3000',
  start_time: '2022-01-01T03:00:00.000Z',
  finish_time: '2022-01-01T09:00:00.000Z',
  release: '2022-5-10',
  image: Rails.root.join('app/assets/images/1_begin/image.jpg').open
)

User.create!(
  name: 'Tester9',
  email: 'test-9@gmail.com',
  password: 'password',
  password_confirmation: 'password',
  admin: false,
  image: Rails.root.join('app/assets/images/1_begin/user.jpg').open
)

Post.create(
  user_id: 9,
  name: 'Next.js',
  quickword: 'Welcom to Next.js!',
  catchcopy: 'Let\'s study Next',
  member: 5,
  place: 'Zoom',
  category: '',
  price: '3000',
  start_time: '2022-01-01T03:00:00.000Z',
  finish_time: '2022-01-01T09:00:00.000Z',
  release: '2022-5-10',
  image: Rails.root.join('app/assets/images/1_begin/image.jpg').open
)

User.create!(
  name: 'Tester10',
  email: 'test-10@gmail.com',
  password: 'password',
  password_confirmation: 'password',
  admin: false,
  image: Rails.root.join('app/assets/images/1_begin/user.jpg').open
)

Post.create(
  user_id: 10,
  name: 'Next.js',
  quickword: 'Welcom to Next.js!',
  catchcopy: 'Let\'s study Next',
  member: 5,
  place: 'Zoom',
  category: '',
  price: '3000',
  start_time: '2022-01-01T03:00:00.000Z',
  finish_time: '2022-01-01T09:00:00.000Z',
  release: '2022-5-10',
  image: Rails.root.join('app/assets/images/1_begin/image.jpg').open
)

User.create!(
  name: 'Tester11',
  email: 'test-11@gmail.com',
  password: 'password',
  password_confirmation: 'password',
  admin: false,
  image: Rails.root.join('app/assets/images/1_begin/user.jpg').open
)

Post.create(
  user_id: 11,
  name: 'Next.js',
  quickword: 'Welcom to Next.js!',
  catchcopy: 'Let\'s study Next',
  member: 5,
  place: 'Zoom',
  category: '',
  price: '3000',
  start_time: '2022-01-01T03:00:00.000Z',
  finish_time: '2022-01-01T09:00:00.000Z',
  release: '2022-5-10',
  image: Rails.root.join('app/assets/images/1_begin/image.jpg').open
)

User.create!(
  name: 'Tester12',
  email: 'test-12@gmail.com',
  password: 'password',
  password_confirmation: 'password',
  admin: false,
  image: Rails.root.join('app/assets/images/1_begin/user.jpg').open
)

Post.create(
  user_id: 12,
  name: 'Next.js',
  quickword: 'Welcom to Next.js!',
  catchcopy: 'Let\'s study Next',
  member: 5,
  place: 'Zoom',
  category: '',
  price: '3000',
  start_time: '2022-01-01T03:00:00.000Z',
  finish_time: '2022-01-01T09:00:00.000Z',
  release: '2022-5-10',
  image: Rails.root.join('app/assets/images/1_begin/image.jpg').open
)

User.create!(
  name: 'Tester13',
  email: 'test-13@gmail.com',
  password: 'password',
  password_confirmation: 'password',
  admin: false,
  image: Rails.root.join('app/assets/images/1_begin/user.jpg').open
)

Post.create(
  user_id: 13,
  name: 'Next.js',
  quickword: 'Welcom to Next.js!',
  catchcopy: 'Let\'s study Next',
  member: 5,
  place: 'Zoom',
  category: '',
  price: '2000',
  start_time: '2022-01-01T03:00:00.000Z',
  finish_time: '2022-01-01T09:00:00.000Z',
  release: '2022-5-10',
  image: Rails.root.join('app/assets/images/1_begin/image.jpg').open
)

User.create!(
  name: 'Tester14',
  email: 'test-14@gmail.com',
  password: 'password',
  password_confirmation: 'password',
  admin: false,
  image: Rails.root.join('app/assets/images/1_begin/user.jpg').open
)

Post.create(
  user_id: 14,
  name: 'Next.js',
  quickword: 'Welcom to Next.js!',
  catchcopy: 'Let\'s study Next',
  member: 5,
  place: 'Zoom',
  category: '',
  price: '2000',
  start_time: '2000-01-01T18:00:00.000Z',
  finish_time: '2000-01-01T19:00:00.000Z',
  release: '2022-5-10',
  image: Rails.root.join('app/assets/images/1_begin/image.jpg').open
)

User.create!(
  name: 'Tester15',
  email: 'test-15@gmail.com',
  password: ENV['RAILS_FOLLOWUSER_KEY'],
  password_confirmation: ENV['RAILS_FOLLOWUSER_KEY'],
  admin: false,
  image: Rails.root.join('app/assets/images/1_begin/user.jpg').open
)

Post.create(
  user_id: 15,
  name: 'Next.js',
  quickword: 'Welcom to Next.js!',
  catchcopy: 'Let\'s study Next',
  member: 5,
  place: 'Zoom',
  category: '',
  price: '2000',
  start_time: '2022-01-01T03:00:00.000Z',
  finish_time: '2022-01-01T09:00:00.000Z',
  release: '2022-5-10',
  image: Rails.root.join('app/assets/images/1_begin/image.jpg').open
)

User.create!(
  name: 'Tester16',
  email: 'test-16@gmail.com',
  password: ENV['RAILS_FOLLOWUSER_KEY'],
  password_confirmation: ENV['RAILS_FOLLOWUSER_KEY'],
  admin: false,
  image: Rails.root.join('app/assets/images/1_begin/user.jpg').open
)

Post.create(
  user_id: 16,
  name: 'Next.js',
  quickword: 'Welcom to Next.js!',
  catchcopy: 'Let\'s study Next',
  member: 5,
  place: 'Zoom',
  category: '',
  price: '2000',
  start_time: '2022-01-01T03:00:00.000Z',
  finish_time: '2022-01-01T09:00:00.000Z',
  release: '2022-5-10',
  image: Rails.root.join('app/assets/images/1_begin/image.jpg').open
)

User.create!(
  name: 'Tester17',
  email: 'test-17@gmail.com',
  password: ENV['RAILS_FOLLOWUSER_KEY'],
  password_confirmation: ENV['RAILS_FOLLOWUSER_KEY'],
  admin: false,
  image: Rails.root.join('app/assets/images/1_begin/user.jpg').open
)

Post.create(
  user_id: 17,
  name: 'Next.js',
  quickword: 'Welcom to Next.js!',
  catchcopy: 'Let\'s study Next',
  member: 5,
  place: 'Zoom',
  category: '',
  price: '2000',
  start_time: '2022-01-01T03:00:00.000Z',
  finish_time: '2022-01-01T09:00:00.000Z',
  release: '2022-5-10',
  image: Rails.root.join('app/assets/images/1_begin/image.jpg').open
)

User.create!(
  name: 'Tester18',
  email: 'test-18@gmail.com',
  password: ENV['RAILS_FOLLOWUSER_KEY'],
  password_confirmation: ENV['RAILS_FOLLOWUSER_KEY'],
  admin: false,
  image: Rails.root.join('app/assets/images/1_begin/user.jpg').open
)

Post.create(
  user_id: 18,
  name: 'Next.js',
  quickword: 'Welcom to Next.js!',
  catchcopy: 'Let\'s study Next',
  member: 5,
  place: 'Zoom',
  category: '',
  price: '2000',
  start_time: '2022-01-01T03:00:00.000Z',
  finish_time: '2022-01-01T09:00:00.000Z',
  release: '2022-5-10',
  image: Rails.root.join('app/assets/images/1_begin/image.jpg').open
)

User.create!(
  name: 'Tester19',
  email: 'test-19@gmail.com',
  password: ENV['RAILS_FOLLOWUSER_KEY'],
  password_confirmation: ENV['RAILS_FOLLOWUSER_KEY'],
  admin: false,
  image: Rails.root.join('app/assets/images/1_begin/user.jpg').open
)

Post.create(
  user_id: 19,
  name: 'Next.js',
  quickword: 'Welcom to Next.js!',
  catchcopy: 'Let\'s study Next',
  member: 5,
  place: 'Zoom',
  category: '',
  price: '2000',
  start_time: '2022-01-01T03:00:00.000Z',
  finish_time: '2022-01-01T09:00:00.000Z',
  release: '2022-5-10',
  image: Rails.root.join('app/assets/images/1_begin/image.jpg').open
)

User.create!(
  name: 'Tester20',
  email: 'test-20@gmail.com',
  password: ENV['RAILS_FOLLOWUSER_KEY'],
  password_confirmation: ENV['RAILS_FOLLOWUSER_KEY'],
  admin: false,
  image: Rails.root.join('app/assets/images/1_begin/user.jpg').open
)

Post.create(
  user_id: 20,
  name: 'Next.js',
  quickword: 'Welcom to Next.js!',
  catchcopy: 'Let\'s study Next',
  member: 5,
  place: 'Zoom',
  category: '',
  price: '2000',
  start_time: '2022-01-01T03:00:00.000Z',
  finish_time: '2022-01-01T09:00:00.000Z',
  release: '2022-5-10',
  image: Rails.root.join('app/assets/images/1_begin/image.jpg').open
)
