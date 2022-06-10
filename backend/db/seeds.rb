User.create!(
  name: ENV['RAILS_ADMIN_USER'],
  email: ENV['RAILS_ADMIN_ADDRESS'],
  password: ENV['RAILS_ADMIN_KEY'],
  password_confirmation: ENV['RAILS_ADMIN_KEY'],
  admin: true
)

# Post.create(
#   user_id: 1,
#   name: 'はじめまして',
#   quickword: '早速、右下のボタンで募集ページをつくりましょう！',
#   catchcopy: 'ご閲覧ありがとうございます',
#   member: 3,
#   place: '集合場所',
#   category: '',
#   price: '1000',
#   start_time: '2000-01-01T09:00:00.000Z',
#   finish_time: '2000-01-01T03:00:00.000Z',
#   release: '2021-5-10',
#   image: Rails.root.join('app/assets/images/1_begin/image.jpg').open
# )

User.create!(
  name: ENV['RAILS_GUEST_USER'],
  email: ENV['RAILS_GUEST_ADDRESS'],
  password: ENV['RAILS_GUEST_KEY'],
  password_confirmation: ENV['RAILS_GUEST_KEY'],
  admin: false,
  image: Rails.root.join('app/assets/images/1_begin/s-user.jpg').open
)

User.create!(
  name: 'だいすけ',
  email: 'test-3@gmail.com',
  password: 'password',
  password_confirmation: 'password',
  admin: false,
  image: Rails.root.join('app/assets/images/3_fledgling/s-3_user.jpg').open
)

Post.create(
  user_id: 3,
  name: '駆け出しエンジニアです',
  quickword: '集中して勉強し、時には励まし合う仲間が欲しい！',
  catchcopy: 'もくもく会',
  details: '
  最近Web系エンジニアへ転職成功した30代です。
  職場の雰囲気には慣れてきた頃ですが、周りの先輩方の会話についていけない自分が悔しくなり、今以上に勉強をし、少しでも会社へ貢献したく思い、記事を投稿しました。

  自宅で一人の時間が多いとどうしても誘惑に負けてしまうことがありませんか？
  自分を勉強する環境下に置き、共に成長していければいいなと思います。

  時間を決め休憩を挟みつつ、会話もできるラフな雰囲気で実施して行きたいです。
  一緒に勉強し、日々頑張っていけたらいいなと思います！
  よろしくお願いします。
  * 当方Zoom課金済みですのでお気軽に参加して下さい。
  ',
  member: 5,
  place: 'Zoom',
  category: '',
  price: '0',
  start_time: '2000-01-01T06:00:00.000Z',
  finish_time: '2000-01-01T09:00:00.000Z',
  release: '2022-6-3',
  image: Rails.root.join('app/assets/images/3_fledgling/s-3_image.jpg').open
)

User.create!(
  name: '沙織',
  email: 'test-4@gmail.com',
  password: 'password',
  password_confirmation: 'password',
  admin: false,
  image: Rails.root.join('app/assets/images/4_bordgame/s-4_user.jpg').open
)

Post.create(
  user_id: 4,
  name: 'ボードゲームをしませんか！？',
  quickword: 'ボードゲームカフェなので持ち物無しで参加できます',
  catchcopy: '初心者歓迎！',
  details: '
  ボードゲームに興味がある方、または経験のある方。
  会話が苦手だなという方もゲームをしている内に自然と喋ってしまいますよ♪
  今流行りのマーダーミステリーも扱っているお店です！

  当方カップルでの参加なので、女性の方も安心してご参加下さい！

  当日は、駅から徒歩でお店へ向かいたいと思います。

  ご興味がありましたら気軽にメッセージを下さい。
  ',
  member: 4,
  place: '名古屋大須',
  category: '',
  price: '3000',
  start_time: '2000-01-01T03:00:00.000Z',
  finish_time: '2000-01-01T06:00:00.000Z',
  release: '2022-5-22',
  image: Rails.root.join('app/assets/images/4_bordgame/s-4_image.jpg').open
)

User.create!(
  name: '早川',
  email: 'test-5@gmail.com',
  password: 'password',
  password_confirmation: 'password',
  admin: false,
  image: Rails.root.join('app/assets/images/5_webengineer/s-5_user.jpg').open
)

Post.create(
  user_id: 5,
  name: '集まれWebエンジニア',
  quickword: '仕事依頼、もくもく会、雑談など',
  catchcopy: 'これから目指す方もいます！',
  details: '
  新型コロナウイルスの影響もあり、リモートワークを導入する企業が増えてきました。
  コロナとの共存は逃れられない中で、IT系への転職を考える方も増えてきたと思います。
  現役WebエンジニアCTOの私を含め、駆け出しWebエンジニアとWebエンジニア志望の3人から始まったコミュニティでしたが、今は10人のグループとなりました。
  当初は身内だけで集まりもくもく会をしていましたが、
  新しく切磋琢磨できる仲間を募集する為、投稿しました！

  現役エンジニアの方もいますし、みんな話しやすく優しい方なので質問等もしやすい環境です。
  一人で悩みを抱え込まず、一緒に頑張りましょう。

  今のところ男女比は 4:1 です。女性の方も是非ご参加ください。
  まずはメッセージでも良いのでお声かけよろしくお願いします！
  ',
  member: 15,
  place: 'Zoom',
  category: '',
  price: '3000',
  start_time: '2000-01-01T01:00:00.000Z',
  finish_time: '2000-01-01T07:00:00.000Z',
  release: '2022-5-11',
  image: Rails.root.join('app/assets/images/5_webengineer/s-5_image.jpg').open
)

User.create!(
  name: 'Ars',
  email: 'test-6@gmail.com',
  password: 'password',
  password_confirmation: 'password',
  admin: false,
  image: Rails.root.join('app/assets/images/6_read/s-6_user.jpg').open
)

Post.create(
  user_id: 6,
  name: 'Reading Session',
  quickword: 'I\'m looking forward to reading together!',
  catchcopy: 'Through books we discover a new world!',
  details: '
  Hi, let me introduce the session of Almaroom.

  Reading is essential for higher wizards!
  Through books we discover a new world!
  Let\'s Read a book!

  Don\'t worry I am here to guide you.
  And I have helped many lost lambs to enroll in a magic school.
  ',
  member: 8,
  place: 'Nagoya',
  category: '',
  price: '3000',
  start_time: '2000-01-01T02:00:00.000Z',
  finish_time: '2000-01-01T03:00:00.000Z',
  release: '2022-5-7',
  image: Rails.root.join('app/assets/images/6_read/s-6_image.jpg').open
)

User.create!(
  name: '小池',
  email: 'test-7@gmail.com',
  password: 'password',
  password_confirmation: 'password',
  admin: false,
  image: Rails.root.join('app/assets/images/7_bike/s-7_user.jpg').open
)

Post.create(
  user_id: 7,
  name: 'バイクでツーリング',
  quickword: 'まだまだペーペーですが、バイク愛はすごいです！',
  catchcopy: 'Ride On!!',
  details: '
  ようやく普通二輪免許を取得しました！
  毎日通勤で乗っていますが、近場でもいいからツーリングしたくてうずうずしてます！
  一緒に近場へ遊びに行けるお友達がいてくれると嬉しいです！
  ',
  member: 3,
  place: '静岡駅周辺',
  category: '',
  price: '3000',
  start_time: '2000-01-01T01:00:00.000Z',
  finish_time: '2000-01-01T03:00:00.000Z',
  release: '2022-6-3',
  image: Rails.root.join('app/assets/images/7_bike/s-7_image.jpg').open
)

User.create!(
  name: '綾菜',
  email: 'test-8@gmail.com',
  password: 'password',
  password_confirmation: 'password',
  admin: false,
  image: Rails.root.join('app/assets/images/8_yukata/s-8_user.jpg').open
)

Post.create(
  user_id: 8,
  name: '浴衣を着て夏祭りへ',
  quickword: '可愛く美しく、優雅たれ',
  catchcopy: '着付けはお任せ下さい！',
  member: 4,
  place: '岡崎公園',
  category: '',
  price: '5000',
  start_time: '2000-01-01T02:00:00.000Z',
  finish_time: '2000-01-01T04:00:00.000Z',
  release: '2022-5-27',
  image: Rails.root.join('app/assets/images/8_yukata/s-8_image.jpg').open
)

User.create!(
  name: 'あかり',
  email: 'test-9@gmail.com',
  password: 'password',
  password_confirmation: 'password',
  admin: false,
  image: Rails.root.join('app/assets/images/9_photo/s-9_user.jpg').open
)

Post.create(
  user_id: 9,
  name: '写真の練習をさせて下さい！',
  quickword: 'Adobeで編集した写真を無料で差し上げます',
  catchcopy: '写真歴2年目',
  details: '
  20代女子です。
  コスプレをしているので普段は撮られる方が専門です...(笑)
  カメラを新調したのでポートレートの練習にお付き合いして頂ける被写体さんを募集します。

  私と同じく20代女性の方が良いです。

  カメラが好きな方、コスプレが好きな方メッセージお待ちしています。
  インスタも見てね♪
  instagram : @akarin0914
  ',
  member: 5,
  place: '名城公園',
  category: '',
  price: '3000',
  start_time: '2000-01-01T03:00:00.000Z',
  finish_time: '2000-01-01T06:00:00.000Z',
  release: '2022-5-7',
  image: Rails.root.join('app/assets/images/9_photo/s-9_image.jpg').open
)

User.create!(
  name: 'Mako',
  email: 'test-10@gmail.com',
  password: 'password',
  password_confirmation: 'password',
  admin: false,
  image: Rails.root.join('app/assets/images/10_dance/s-10_user.jpg').open
)

Post.create(
  user_id: 10,
  name: 'ダンス教室行きませんか？',
  quickword: 'まだ始めたばかりです',
  catchcopy: '急募！お願いします！',
  details: '
  身近に通えるダンス教室は私にとって少々ハードルが高くついていけるか、心配です。
  私は小さい頃、姉に連れられてTWICEのライブを観に行ったことがきっかけでダンスに憧れました。
  しかし姉より全く上手く踊れず、一度はダンスを諦めてしまいました。
  ある日、また姉と一緒にライブへ行ったところ、またダンスをやりたい気持ちが再熱しました。

  家でも練習をしているのですが、最寄りで通えるダンス教室は初心者には少々ハードで通うには心細くて。
  一緒に通える友達がいると、気持ちに余裕もでてくる思うので、
  一緒に通いたい人、ダンスが好きな方もぜひメッセージをいただけると幸いです！
  ',
  member: 1,
  place: '池袋',
  category: '',
  price: '4000',
  start_time: '2000-01-01T04:30:00.000Z',
  finish_time: '2000-01-01T06:30:00.000Z',
  release: '2022-5-21',
  image: Rails.root.join('app/assets/images/10_dance/s-10_image.jpg').open
)

User.create!(
  name: 'なおき',
  email: 'test-11@gmail.com',
  password: 'password',
  password_confirmation: 'password',
  admin: false,
  profile: 'サッカー好き集まれ！/週末にフットサルしています！/',
  image: Rails.root.join('app/assets/images/11_futsal/s-11_user.jpg').open
)

Post.create(
  user_id: 11,
  name: '女子フットサルクラブ',
  quickword: 'サッカー好き募集！',
  catchcopy: '運動でいい汗かきましょ！',
  details:
  '
  こんにちは！
  私は小中高とサッカー部で今は女性フットサルのコーチをしながらプレーもしています！

  最近では女性も「痩せたい！運動したい！」という方が増えてきて
  ジムに通ったり、お家でエクササイズする方がたくさんいるかと思います。

  フットサルは良いですよ！良い有酸素運動にもなりますし、
  始めたばかりの方もいるので雰囲気も和気藹々としております！
  先日も新しく数名参加してくださり、かなりの賑わいを見せております。

  そんなこんなでまだまだメンバーを募集しております！良い汗かいて心も体もリフレッシュしましょう！
  はじめての方でも遊びに来てくださいね！
  ',

  member: 8,
  place: '名古屋市屋内コート',
  category: '',
  price: '0',
  start_time: '2000-01-01T00:00:00.000Z',
  finish_time: '2000-01-01T06:00:00.000Z',
  release: '2022-5-21',
  image: Rails.root.join('app/assets/images/11_futsal/s-11_image.jpg').open
)

User.create!(
  name: 'きい',
  email: 'test-12@gmail.com',
  password: 'password',
  password_confirmation: 'password',
  admin: false,
  image: Rails.root.join('app/assets/images/12_study/s-12_user.jpg').open
)

Post.create(
  user_id: 12,
  name: '勉強しよう',
  quickword: '人生一度きり、悔いのないように！',
  catchcopy: '昨日の自分よりも賢く',
  details: '
  こんにちは、30代の会社員です。
  休みの日には図書館やカフェを利用し資格勉強をしています。
  この年にもなると、なかなか新しい人との出会いもなく
  毎日一人で黙々と勉強しております。

  今回「勉強」というざっくりしたタイトルにしてみましたが、
  どういったジャンルの勉強でも構いません。ちなみに私は基本情報技術者試験の勉強をしています。
  一緒に勉強を頑張れる方がいると私も励みになります。
  Zoomに課金しているので無制限で参加いただけますので
  何卒よろしくお願いします。
  ',
  member: 3,
  place: 'Zoom',
  category: '',
  price: '0',
  start_time: '2000-01-01T01:00:00.000Z',
  finish_time: '2000-01-01T03:00:00.000Z',
  release: '2022-5-10',
  image: Rails.root.join('app/assets/images/12_study/s-12_image.jpg').open
)

User.create!(
  name: 'かなえ',
  email: 'test-13@gmail.com',
  password: 'password',
  password_confirmation: 'password',
  admin: false,
  image: Rails.root.join('app/assets/images/13_exam/s-13_user.jpg').open
)

Post.create(
  user_id: 13,
  name: '大学受験する方いますか？',
  quickword: 'どうやって勉強を進めていますか？',
  catchcopy: '相談相手が欲しいです',
  details: '
  都内の大学受験を考えています。
  今の自分の勉強方法が合っているのかどうか。
  一度不安になると気になってなかなか勉強に集中が出来なくなる癖も治したいです。
  おすすめの教材や勉強方法を教えていただきたいと思い投稿しました。
  ',
  member: 4,
  place: 'Zoom',
  category: '',
  price: '0',
  start_time: '2000-01-01T06:00:00.000Z',
  finish_time: '2000-01-01T07:00:00.000Z',
  release: '2021-11-15',
  image: Rails.root.join('app/assets/images/13_exam/s-13_image.jpg').open
)

User.create!(
  name: '吉田',
  email: 'test-14@gmail.com',
  password: 'password',
  password_confirmation: 'password',
  admin: false,
  image: Rails.root.join('app/assets/images/14_dogrun/s-14_user.jpg').open
)

Post.create(
  user_id: 14,
  name: 'わんちゃんとドッグラン',
  quickword: '暖かくなってきましたね！',
  catchcopy: '愛犬との時間が日々楽しみです',
  details: '
  仕事であまり行けていなかったのですが、
  先日ようやく休みをもらって近くのドッグランへ。
  やっぱりわんちゃんにもたまには外で大はしゃぎしてもらって、運動不足を解消してもらいたいです。
  わんちゃんが入れるカフェも知っていますので、ご一緒にいかがですか？
  初の投稿で緊張しておりますが、よろしくお願い致します。
  ',
  member: 3,
  place: '大高緑地',
  category: '',
  price: '1000',
  start_time: '2000-01-01T04:00:00.000Z',
  finish_time: '2000-01-01T07:30:00.000Z',
  release: '2022-5-15',
  image: Rails.root.join('app/assets/images/14_dogrun/s-14_image.jpg').open
)

User.create!(
  name: 'かえで',
  email: 'test-15@gmail.com',
  password: 'password',
  password_confirmation: 'password',
  admin: false,
  image: Rails.root.join('app/assets/images/15_monhun/s-15_user.jpg').open
)

Post.create(
  user_id: 15,
  name: '一狩りしませんか？',
  quickword: 'お時間のある方！',
  catchcopy: '武器作成用の素材集め',
  details: '
  Youtuberをしてます！
  モンハンライズの続編発売まで残り数ヶ月ですね！楽しみです！
  本題ですが、動画にて使用したい武器の作成をお手伝いして頂ける方を募集します。
  動画には映らないので裏の作業です。

  連戦可能な方メッセージお願いします！

  # Youtubeにて毎日配信中。
  # 全武器扱えます！
  ',
  member: 4,
  place: 'Discode',
  category: '',
  price: '0',
  start_time: '2000-01-01T07:30:00.000Z',
  finish_time: '2000-01-01T09:30:00.000Z',
  release: '2022-4-10',
  image: Rails.root.join('app/assets/images/15_monhun/s-15_image.jpg').open
)

User.create!(
  name: '綾美',
  email: 'test-16@gmail.com',
  password: 'password',
  password_confirmation: 'password',
  admin: false,
  image: Rails.root.join('app/assets/images/16_oiden/s-16_user.jpg').open
)

Post.create(
  user_id: 16,
  name: '今年こそおいでん行きます！',
  quickword: '夏といえば花火！',
  catchcopy: 'コロナ対策をして楽しむ',
  details: '
  おいでんまつりまでもうすぐですね！

  昨年は中止となり非常に残念な結果となりました。
  今年こそはと準備を始めてる方もたくさんいらっしゃると思います。
  東海地区最大規模の花火大会を一緒に観て思い出作りませんか！？

  私はボランティアとして参加もする予定です。

  屋台やイベントもたくさんあるので一緒に回ってくれる方、募集しています。
  お酒大好きなので奢って下さい(笑)冗談です！
  メッセージお待ちしています！
  ',
  member: 3,
  place: '豊田おいでんまつり',
  category: '',
  price: '3000',
  start_time: '2000-01-01T00:00:00.000Z',
  finish_time: '2000-01-01T08:00:00.000Z',
  release: '2021-7-31',
  image: Rails.root.join('app/assets/images/16_oiden/s-16_image.jpg').open
)

User.create!(
  name: 'Mary',
  email: 'test-17@gmail.com',
  password: 'password',
  password_confirmation: 'password',
  admin: false,
  image: Rails.root.join('app/assets/images/17_confused/user.jpg').open
)

Post.create(
  user_id: 17,
  name: 'Help me!!',
  quickword: 'Stay Home is stressfull, isn\'t it!?',
  catchcopy: 'Unfortunately, this exam is ...',
  details:'
  This is Mary.
  I\'m planning my next examination.
  But, It\'s going to be out of my way.
  Unfortunately, the University\'s dormitory was closed this year.
  And now, I have to take care of niece. I can\'t leave them to my grandfather or grandmother.
  Also, to my working parents.
  I liked to take care of kids.
  I couldn\'t concentrate.
  So, please give message to me.
  ',
  member: 99,
  place: 'Yokohama',
  category: '',
  price: '0',
  start_time: '2000-01-01T03:00:00.000Z',
  finish_time: '2000-01-01T02:59:00.000Z',
  release: '2021-7-10',
  image: Rails.root.join('app/assets/images/17_confused/image.jpg').open
)

User.create!(
  name: 'けい',
  profile: 'エンジニア志望です。',
  email: 'test-18@gmail.com',
  password: 'password',
  password_confirmation: 'password',
  admin: false,
  image: Rails.root.join('app/assets/images/18_programing/s-18_user.jpg').open
)

# Post.create(
#   user_id: 18,
#   name: 'プログラミング',
#   quickword: 'フォロバックします',
#   catchcopy: 'Zoomでお話しできる方',
#   details: '
#   最近プログラミングの独学を始めました。
#   マークアップ言語から始め、今はRailsチュートリアルを始めている所です。
#   独学で始めたので、コミュニケーションを取りつつ、同じ状況の方と共に学習していきたいです。

#   プログラミングの学習を始めたばかりの方いらっしゃいますか？
#   Twitterでも日々の積み上げをツイートしていますので
#   @kei012345 フォローお願いします！

#   DM、メッセージお待ちしてます。よろしくお願いします！
#   ',
#   member: 2,
#   place: 'Zoom',
#   category: '',
#   price: '0',
#   start_time: '2000-01-01T03:00:00.000Z',
#   finish_time: '2000-01-01T08:00:00.000Z',
#   release: '2022-5-20',
#   image: Rails.root.join('app/assets/images/18_programing/image.jpg').open
# )

User.create!(
  name: 'Sherry',
  email: 'test-19@gmail.com',
  password: 'password',
  password_confirmation: 'password',
  admin: false,
  image: Rails.root.join('app/assets/images/19_anime/s-19_user.jpg').open
)

# Post.create(
#   user_id: 19,
#   name: 'Hi, From America',
#   quickword: 'Tell me about Japanese anime!',
#   catchcopy: 'Japanenes anime is amazing!',
#   details: '
#   Hi there! I\'m Sherry.
#   Welcome to my page. I\'m from Florida, USA.
#   I love Japanese anime!
#   I grew up in Japanese anime since I was little.
#   So, I wanna know more for Japanese anime!
#   You can communicate with Japanese.
#   Come and join me and let me know about Japanese anime!
#   ',
#   member: 2,
#   place: 'Akihabara',
#   category: '',
#   price: '0',
#   start_time: '2000-01-01T00:00:00.000Z',
#   finish_time: '2000-01-01T08:00:00.000Z',
#   release: '2022-3-13',
#   image: Rails.root.join('app/assets/images/default.png').open
# )

User.create!(
  name: 'ありす',
  email: 'test-20@gmail.com',
  password: 'password',
  password_confirmation: 'password',
  admin: false,
  image: Rails.root.join('app/assets/images/20_meet/s-20_user.jpg').open
)

Post.create(
  user_id: 20,
  name: '初投稿です！',
  quickword: '初めまして。よろしくお願いします。',
  catchcopy: 'お気軽に映画やご飯でも',
  details: '
  20代の女です。
  こういったマッチングアプリは初めてなので不慣れなことが多々あると思いますが、
  お友達になってくれる人がいらっしゃったら嬉しいです。
  気軽に声をかけてください。
  趣味は映画鑑賞で、恋愛映画が好きです。ホラーやアクションも好きでよく映画館にも観に行きます。
  週末は家にいることが多いので、連れ出してくれる方がいいなと思っています。
  よかったらご飯や映画に一緒にいきませんか？よろしくお願いします。
  ',
  member: 3,
  place: '名古屋駅',
  category: '',
  price: '0',
  start_time: '2000-01-01T01:00:00.000Z',
  finish_time: '2000-01-01T04:00:00.000Z',
  release: '2022-6-4',
  image: Rails.root.join('app/assets/images/20_meet/s-20_image.jpg').open
)

User.create!(
  name: 'ゆうか',
  email: 'test-21@gmail.com',
  password: ENV['RAILS_FOLLOWUSER_KEY'],
  password_confirmation: ENV['RAILS_FOLLOWUSER_KEY'],
  admin: false,

  image: Rails.root.join('app/assets/images/guestusers/21.jpg').open
)

User.create!(
  name: 'あきな',
  email: 'test-22@gmail.com',
  password: ENV['RAILS_FOLLOWUSER_KEY'],
  password_confirmation: ENV['RAILS_FOLLOWUSER_KEY'],
  admin: false,

  image: Rails.root.join('app/assets/images/guestusers/22.jpg').open
)

User.create!(
  name: 'けいこ',
  email: 'test-23@gmail.com',
  password: ENV['RAILS_FOLLOWUSER_KEY'],
  password_confirmation: ENV['RAILS_FOLLOWUSER_KEY'],
  admin: false,

  image: Rails.root.join('app/assets/images/guestusers/23.jpg').open
)

User.create!(
  name: 'Lisa',
  email: 'test-24@gmail.com',
  password: ENV['RAILS_FOLLOWUSER_KEY'],
  password_confirmation: ENV['RAILS_FOLLOWUSER_KEY'],
  admin: false,

  image: Rails.root.join('app/assets/images/guestusers/24.jpg').open
)

User.create!(
  name: 'れん',
  email: 'test-25@gmail.com',
  password: ENV['RAILS_FOLLOWUSER_KEY'],
  password_confirmation: ENV['RAILS_FOLLOWUSER_KEY'],
  admin: false,

  image: Rails.root.join('app/assets/images/guestusers/25.jpg').open
)

User.create!(
  name: 'しゅり',
  email: 'test-26@gmail.com',
  password: ENV['RAILS_FOLLOWUSER_KEY'],
  password_confirmation: ENV['RAILS_FOLLOWUSER_KEY'],
  admin: false,

  image: Rails.root.join('app/assets/images/guestusers/26.jpg').open
)

User.create!(
  name: 'Emma',
  email: 'test-27@gmail.com',
  password: ENV['RAILS_FOLLOWUSER_KEY'],
  password_confirmation: ENV['RAILS_FOLLOWUSER_KEY'],
  admin: false,

  image: Rails.root.join('app/assets/images/guestusers/27.jpg').open
)

User.create!(
  name: 'ことみ',
  email: 'test-28@gmail.com',
  password: ENV['RAILS_FOLLOWUSER_KEY'],
  password_confirmation: ENV['RAILS_FOLLOWUSER_KEY'],
  admin: false,

  image: Rails.root.join('app/assets/images/guestusers/28.jpg').open
)

User.create!(
  name: 'ゆい',
  email: 'test-29@gmail.com',
  password: ENV['RAILS_FOLLOWUSER_KEY'],
  password_confirmation: ENV['RAILS_FOLLOWUSER_KEY'],
  admin: false,
  image: Rails.root.join('app/assets/images/guestusers/29.jpg').open
)

User.create!(
  name: 'ひろみ',
  email: 'test-30@gmail.com',
  password: ENV['RAILS_FOLLOWUSER_KEY'],
  password_confirmation: ENV['RAILS_FOLLOWUSER_KEY'],
  admin: false,
  image: Rails.root.join('app/assets/images/guestusers/30.jpg').open
)

User.create!(
  name: 'りょうた',
  email: 'test-31@gmail.com',
  password: ENV['RAILS_FOLLOWUSER_KEY'],
  password_confirmation: ENV['RAILS_FOLLOWUSER_KEY'],
  admin: false,
  image: Rails.root.join('app/assets/images/guestusers/31.jpg').open
)

User.create!(
  name: 'Lucas',
  email: 'test-32@gmail.com',
  password: ENV['RAILS_FOLLOWUSER_KEY'],
  password_confirmation: ENV['RAILS_FOLLOWUSER_KEY'],
  admin: false,
  image: Rails.root.join('app/assets/images/guestusers/32.jpg').open
)

User.create!(
  name: 'あきら',
  email: 'test-33@gmail.com',
  password: ENV['RAILS_FOLLOWUSER_KEY'],
  password_confirmation: ENV['RAILS_FOLLOWUSER_KEY'],
  admin: false,
  image: Rails.root.join('app/assets/images/guestusers/33.jpg').open
)

User.create!(
  name: 'ゆうり',
  email: 'test-34@gmail.com',
  password: ENV['RAILS_FOLLOWUSER_KEY'],
  password_confirmation: ENV['RAILS_FOLLOWUSER_KEY'],
  admin: false,
  image: Rails.root.join('app/assets/images/guestusers/34.jpg').open
)

User.create!(
  name: 'Jas-m',
  email: 'test-35@gmail.com',
  password: ENV['RAILS_FOLLOWUSER_KEY'],
  password_confirmation: ENV['RAILS_FOLLOWUSER_KEY'],
  admin: false,
  image: Rails.root.join('app/assets/images/guestusers/35.jpg').open
)

User.create!(
  name: 'Sophia',
  email: 'test-36@gmail.com',
  password: ENV['RAILS_FOLLOWUSER_KEY'],
  password_confirmation: ENV['RAILS_FOLLOWUSER_KEY'],
  admin: false,
  image: Rails.root.join('app/assets/images/guestusers/36.jpg').open
)

User.create!(
  name: 'まこと',
  email: 'test-37@gmail.com',
  password: ENV['RAILS_FOLLOWUSER_KEY'],
  password_confirmation: ENV['RAILS_FOLLOWUSER_KEY'],
  admin: false,
  image: Rails.root.join('app/assets/images/guestusers/37.jpg').open
)

User.create!(
  name: 'けいた',
  email: 'test-38@gmail.com',
  password: ENV['RAILS_FOLLOWUSER_KEY'],
  password_confirmation: ENV['RAILS_FOLLOWUSER_KEY'],
  admin: false,
  image: Rails.root.join('app/assets/images/guestusers/38.jpg').open
)

User.create!(
  name: 'みお',
  email: 'test-39@gmail.com',
  password: ENV['RAILS_FOLLOWUSER_KEY'],
  password_confirmation: ENV['RAILS_FOLLOWUSER_KEY'],
  admin: false,
  image: Rails.root.join('app/assets/images/guestusers/39.jpg').open
)

User.create!(
  name: 'Noah',
  email: 'test-40@gmail.com',
  password: ENV['RAILS_FOLLOWUSER_KEY'],
  password_confirmation: ENV['RAILS_FOLLOWUSER_KEY'],
  admin: false,
  image: Rails.root.join('app/assets/images/guestusers/40.jpg').open
)

User.create!(
  name: 'しゅん',
  email: 'test-41@gmail.com',
  password: ENV['RAILS_FOLLOWUSER_KEY'],
  password_confirmation: ENV['RAILS_FOLLOWUSER_KEY'],
  admin: false,
  image: Rails.root.join('app/assets/images/guestusers/41.jpg').open
)

User.create!(
  name: 'えりな',
  email: 'test-42@gmail.com',
  password: ENV['RAILS_FOLLOWUSER_KEY'],
  password_confirmation: ENV['RAILS_FOLLOWUSER_KEY'],
  admin: false,
  image: Rails.root.join('app/assets/images/guestusers/42.jpg').open
)

User.create!(
  name: 'Luna',
  email: 'test-43@gmail.com',
  password: ENV['RAILS_FOLLOWUSER_KEY'],
  password_confirmation: ENV['RAILS_FOLLOWUSER_KEY'],
  admin: false,
  image: Rails.root.join('app/assets/images/guestusers/43.jpg').open
)

User.create!(
  name: 'Noctis',
  email: 'test-44@gmail.com',
  password: ENV['RAILS_FOLLOWUSER_KEY'],
  password_confirmation: ENV['RAILS_FOLLOWUSER_KEY'],
  admin: false,
  image: Rails.root.join('app/assets/images/guestusers/44.jpg').open
)

User.create!(
  name: 'あお',
  email: 'test-45@gmail.com',
  password: ENV['RAILS_FOLLOWUSER_KEY'],
  password_confirmation: ENV['RAILS_FOLLOWUSER_KEY'],
  admin: false,
  image: Rails.root.join('app/assets/images/guestusers/45.jpg').open
)

User.create!(
  name: 'みなこ',
  email: 'test-46@gmail.com',
  password: ENV['RAILS_FOLLOWUSER_KEY'],
  password_confirmation: ENV['RAILS_FOLLOWUSER_KEY'],
  admin: false,
  image: Rails.root.join('app/assets/images/guestusers/46.jpg').open
)

User.create!(
  name: 'ありさ',
  email: 'test-47@gmail.com',
  password: ENV['RAILS_FOLLOWUSER_KEY'],
  password_confirmation: ENV['RAILS_FOLLOWUSER_KEY'],
  admin: false,

  image: Rails.root.join('app/assets/images/guestusers/47.jpg').open
)

User.create!(
  name: 'さやか',
  email: 'test-48@gmail.com',
  password: ENV['RAILS_FOLLOWUSER_KEY'],
  password_confirmation: ENV['RAILS_FOLLOWUSER_KEY'],
  admin: false,

  image: Rails.root.join('app/assets/images/guestusers/48.jpg').open
)

User.create!(
  name: 'りく',
  email: 'test-49@gmail.com',
  password: ENV['RAILS_FOLLOWUSER_KEY'],
  password_confirmation: ENV['RAILS_FOLLOWUSER_KEY'],
  admin: false,

  image: Rails.root.join('app/assets/images/guestusers/49.jpg').open
)

User.create!(
  name: 'まいか',
  email: 'test-50@gmail.com',
  password: ENV['RAILS_FOLLOWUSER_KEY'],
  password_confirmation: ENV['RAILS_FOLLOWUSER_KEY'],
  admin: false,

  image: Rails.root.join('app/assets/images/guestusers/50.jpg').open
)

User.create!(
  name: 'こうせい',
  email: 'test-51@gmail.com',
  password: ENV['RAILS_FOLLOWUSER_KEY'],
  password_confirmation: ENV['RAILS_FOLLOWUSER_KEY'],
  admin: false,
  image: Rails.root.join('app/assets/images/guestusers/51.jpg').open
)

User.create!(
  name: 'まりな',
  email: 'test-52@gmail.com',
  password: ENV['RAILS_FOLLOWUSER_KEY'],
  password_confirmation: ENV['RAILS_FOLLOWUSER_KEY'],
  admin: false,

  image: Rails.root.join('app/assets/images/guestusers/52.jpg').open
)

User.create!(
  name: 'てつや',
  email: 'test-53@gmail.com',
  password: ENV['RAILS_FOLLOWUSER_KEY'],
  password_confirmation: ENV['RAILS_FOLLOWUSER_KEY'],
  admin: false,

  image: Rails.root.join('app/assets/images/guestusers/53.jpg').open
)

User.create!(
  name: 'りょう',
  email: 'test-54@gmail.com',
  password: ENV['RAILS_FOLLOWUSER_KEY'],
  password_confirmation: ENV['RAILS_FOLLOWUSER_KEY'],
  admin: false,

  image: Rails.root.join('app/assets/images/guestusers/54.jpg').open
)

join1 = Post.find(1)
join1.post_joins.create(
  [
    { user_id: 26 },
    { user_id: 29 },
    { user_id: 30 },
    { user_id: 48 }
  ]
)

join1.messages.create(
  [
    { user_id: 26,
      title: '転職おめでとうございます！',
      image: Rails.root.join('app/assets/images/3_fledgling/s-m1.jpg').open,
      content: '
      同じく最近Webエンジニアへ転職したばかりです。
      未経験で初めてばかりで苦労も悩みも多いので、一緒に頑張れたらなと思いメッセしました！
      ' },
    { user_id: 29,
      title: '最初は大変ですよね',
      image: Rails.root.join('app/assets/images/3_fledgling/s-m2.jpg').open,
      content: '
      私も2年前同じ立場でしたのでよくわかります。
      まだまだこれから大変だと思いますが、
      その分得るものがあると思います。
      私ももくもく会参加したいです。よろしくお願いします。
      ' },
    { user_id: 30,
      title: '転職おめでとうございます。',
      image: Rails.root.join('app/assets/images/3_fledgling/s-m3.jpg').open,
      content: '
      独学で辛い毎日でした。
      これから先の成長の日々ですね！
      私も一緒に勉強したいと思い、メッセージしました！
      ' },
    { user_id: 48,
      title: '私も最近、エンジニア転職を意識し始めました。',
      image: Rails.root.join('app/assets/images/3_fledgling/s-m4.jpg').open,
      content: '
      一人だと誘惑に負けてしまい勉強がなかなか続かないので、
      お試しで参加させてください。
      ' }
  ]
)

join2 = Post.find(2)
join2.post_joins.create(
  [
    { user_id: 37 },
    { user_id: 47 },
    { user_id: 25 }
  ]
)

join2.messages.create(
  [
    { user_id: 37,
      title: 'はじめまして！',
      image: Rails.root.join('app/assets/images/4_bordgame/s-m1.jpg').open,
      content: '
      いろいろなボドゲを買ったり、ネットでプレイするほどのボドゲ好きです！
      知ってるゲームであれば説明も可能です！参加したいです。
      ' },
    { user_id: 47,
      title: '大学生女子です！',
      image: Rails.root.join('app/assets/images/4_bordgame/s-m2.jpg').open,
      content: '
      女性がいるとのことで安心です！女性一人でも参加可能でしょうか？
      よろしければ参加したいです！
      ' },
    { user_id: 25,
      title: 'ボドゲ初心者です。',
      image: Rails.root.join('app/assets/images/4_bordgame/s-m3.jpg').open,
      content: '
      始めたいと思っていたのですが、なかなかきっかけがなく行けずじまいでした。
      ぜひいろんなボードゲームを教えてください！初心者の友達と一緒に参加したいです！
      ' }
  ]
)

join3 = Post.find(3)
join3.post_joins.create(
  [
    { user_id: 21 },
    { user_id: 36 },
    { user_id: 41 },
    { user_id: 47 },
    { user_id: 49 },
    { user_id: 50 },
    { user_id: 54 },
    { user_id: 34 },
    { user_id: 33 },
    { user_id: 31 },
    { user_id: 23 },
    { user_id: 22 },
    { user_id: 24 }
  ]
)

join3.messages.create(
  [
    { user_id: 21,
      title: '参加希望です',
      image: Rails.root.join('app/assets/images/5_webengineer/s-m1.jpg').open,
      content: '
      こういった場を待っていました！
      ' },
    { user_id: 36,
      title: 'Hello!',
      image: Rails.root.join('app/assets/images/5_webengineer/s-m2.jpg').open,
      content: '
      Hi! I\'m also interested. I want to participate.
      ' },
    { user_id: 41,
      title: '前から気になっていました。',
      image: Rails.root.join('app/assets/images/5_webengineer/s-m3.jpg').open,
      content: '
      初めての参加になるのですが、私もグループに入りたいです。
      よろしくお願いします！
      ' },
    { user_id: 47,
      title: 'Webエンジニア志望です。',
      image: Rails.root.join('app/assets/images/5_webengineer/s-m4.jpg').open,
      content: '
      大学生です！Webエンジニア目指して勉強中です！参加したいです。
      ' },
    { user_id: 49,
      title: '現役エンジニアです。',
      image: Rails.root.join('app/assets/images/5_webengineer/s-m5.jpg').open,
      content: '
      いろいろな方との交流が楽しみです。良い刺激になるので参加希望です。
      ' },
    { user_id: 50,
      title: '参加したいです！',
      image: Rails.root.join('app/assets/images/5_webengineer/s-m6.jpg').open,
      content: '
      よろしくお願い致します！
      ' },
    { user_id: 54,
      title: '友人と参加いいですか？',
      image: Rails.root.join('app/assets/images/5_webengineer/s-m7.jpg').open,
      content: '
      友人と参加したいです。
      ' },
    { user_id: 34,
      title: '参加希望',
      image: Rails.root.join('app/assets/images/5_webengineer/s-m8.jpg').open,
      content: '
      同じ仲間が欲しいと思っていました。
      あまり積極的な方ではなく緊張していますが、お願いします。
      ' },
    { user_id: 33,
      title: 'よろしくお願いします',
      image: Rails.root.join('app/assets/images/5_webengineer/s-m9.jpg').open,
      content: '
      Webエンジニアとして東京に転勤して半年が経つころです。
      不慣れなとこもありますが是非参加させて頂きたいです。
      ' },
    { user_id: 31,
      title: 'メンバー増えましたね！',
      image: Rails.root.join('app/assets/images/5_webengineer/s-m10.jpg').open,
      content: '
      以前参加してました！かなり賑わっていますね！これからも頑張ってください！
      ' },
    { user_id: 23,
      title: 'こんばんは',
      image: Rails.root.join('app/assets/images/5_webengineer/s-m11.jpg').open,
      content: '
      試しに1週間参加してみたいです！お願いします！
      ' },
    { user_id: 22,
      title: '2度目の参加です。',
      image: Rails.root.join('app/assets/images/5_webengineer/s-m12.jpg').open,
      content: '
      先日はどうもありがとうございました！今回も参加させて下さい！
      ' },
    { user_id: 24,
      title: 'よろしくお願いします',
      image: Rails.root.join('app/assets/images/5_webengineer/s-m13.jpg').open,
      content: '
      前回お試しで参加しました。また参加したくメッセージしました。よろしくお願いします。
      ' }
  ]
)

join4 = Post.find(4)
join4.post_joins.create(
  [
    { user_id: 27 },
    { user_id: 36 },
    { user_id: 32 },
    { user_id: 43 },
    { user_id: 44 }
  ]
)

join4.messages.create(
  [
    { user_id: 27,
      title: 'I\'d like to join',
      image: Rails.root.join('app/assets/images/6_read/s-m1.jpg').open,
      content: '
      I want to join for the session.
      I also likes reading. I often read it when I go to bed.
      But, I\'m shy, so I\'m a little nervous.
      ' },
    { user_id: 36,
      title: 'Nice!',
      image: Rails.root.join('app/assets/images/6_read/s-m2.jpg').open,
      content: '
      What kind of books do you read?
      I\'m interested in!
      ' },
    { user_id: 32,
      title: 'Great',
      image: Rails.root.join('app/assets/images/6_read/s-m3.jpg').open,
      content: '
      I think learning to read is a magical process
      Yours will change our lives.
      We wanna join with my friends.
      ' },
    { user_id: 43,
      title: 'It\’s very intriguing',
      image: Rails.root.join('app/assets/images/6_read/s-m4.jpg').open,
      content: '
      I\'ve read many books so far.
      Reading\'s great!
      I want to know what you read. We join!
      ' },
    { user_id: 44,
      title: 'Hi!',
      image: Rails.root.join('app/assets/images/6_read/s-m5.jpg').open,
      content: '
      ArsTeacher, and the students around you look happy.
      I want to be an advanced wizard, so I want to participate.
      ' }
  ]
)

join5 = Post.find(5)
join5.post_joins.create(
  [
    { user_id: 37 }
  ]
)

join5.messages.create(
  [
    { user_id: 37,
      title: 'こんにちは',
      image: Rails.root.join('app/assets/images/7_bike/s-m1.jpg').open,
      content: '
      私も最近新しいバイクを納車しました。是非いきましょう！
      事故のないよう安全に楽しみましょう！一度近場で慣らしツーリングにいきませんか！？
      ' }
  ]
)

join6 = Post.find(6)
join6.post_joins.create(
  [
    { user_id: 21 },
    { user_id: 29 },
    { user_id: 30 }
  ]
)

join6.messages.create(
  [
    { user_id: 21,
      title: '浴衣かわいいです！',
      image: Rails.root.join('app/assets/images/8_yukata/s-m1.jpg').open,
      content: '
      去年は緊急事態宣言で中止でしたね...
      今年こそは浴衣を着て見に行きたいです！
      私も思い出をつくりたいと思い、メッセージさせていただきました。
      ' },
    { user_id: 29,
      title: '夏祭りで浴衣を着たことがなくて',
      image: Rails.root.join('app/assets/images/8_yukata/s-m2.jpg').open,
      content: '
      夏祭りで浴衣を着る機会がなかったので、とても興味を持ちました。
      浴衣姿を写真に納めて、両親に見せたいと思いメッセージしました。
      ' },
    { user_id: 30,
      title: '素敵ですね！',
      image: Rails.root.join('app/assets/images/8_yukata/s-m3.jpg').open,
      content: '
      一夏の思い出にしたいです。
      この投稿を見た瞬間に参加を決意しました！
      当日晴れることを祈って！よろしくお願いします！
      ' }
  ]
)

join7 = Post.find(7)
join7.post_joins.create(
  [
    { user_id: 23 },
    { user_id: 30 },
    { user_id: 34 },
    { user_id: 45 }
  ]
)

join7.messages.create(
  [
    { user_id: 23,
      title: 'こんにちは！',
      image: Rails.root.join('app/assets/images/9_photo/s-m1.jpg').open,
      content: '
      私も名古屋でレイヤー活動している大学生です！
      ポトレにとても興味があったので、気になりメッセージさせていただきました！
      普段どんなコスしているのかも気になるのでぜひお話しからでもよろしくお願いします〜！
      ' },
    { user_id: 30,
      title: 'コスプレは未経験ですが',
      image: Rails.root.join('app/assets/images/9_photo/s-m2.jpg').open,
      content: '
      はじめまして！
      題名にも書かせてもらったのですが、コスプレは未経験です...
      それでもアニメやゲームは大好きです！
      被写体を募集とのことで、過去にもポトレ経験ありますので、是非インスタをご覧いただけたらなと思いメッセージしました！
      @hirorin12345
      DMもお待ちしてます！
      ' },
    { user_id: 34,
      title: '',
      image: Rails.root.join('app/assets/images/9_photo/s-m3.jpg').open,
      content: '
      20代前半の女子です。
      インスタ見ました！すごくかわいいです...！
      あかりさんみたいな可愛い方にポトレ撮ってもらえるなんて！
      写真のデータもいただけるとのことで、至れり尽くせりですね(笑)
      私でよければお手伝いさせてください！
      ' },
    { user_id: 45,
      title: 'サロンモデルしてました！',
      image: Rails.root.join('app/assets/images/9_photo/s-m4.jpg').open,
      content: '
      はじめましてこんにちは(・v・)/
      ポトレいいですよね〜！私も最近レイヤーになり撮影もしてます！
      少し前までサロンモデルもしていたので、撮られるのも慣れています！
      私でよろしければ練習になればいいなと思いコメントしてみました！
      ' }
  ]
)

join8 = Post.find(8)
join8.post_joins.create(
  [
    { user_id: 42 }
  ]
)

join8.messages.create(
  [
    { user_id: 42,
      title: '同じく一度諦めたことが...',
      image: Rails.root.join('app/assets/images/10_dance/s-m1.jpg').open,
      content: '
      私もお家で練習をしています、でもやっぱりダンス教室でレッスンを受けたいなと思っています。
      実は小さい頃にダンス教室へ通っていた経験があるのですが、周りと自分を比べてしまって一度諦めてしまったんです。
      それから悔しくていっぱい練習するようになりました！
      新しいことを始めるのはとても勇気がいりますよね。モチベーションも必要だと思います。
      ぜひ一度ご一緒に体験にいきませんか！？
      ' }
  ]
)

join9 = Post.find(9)
join9.post_joins.create(
  [
    { user_id: 36 },
    { user_id: 46 },
    { user_id: 52 }
  ]
)

join9.messages.create(
  [
    { user_id: 36,
      title: 'Can I participate?',
      image: Rails.root.join('app/assets/images/11_futsal/s-m1.jpg').open,
      content: '
      日本に来て2年経ちました。ようやく日本にも慣れました。
      私はサッカーをTVで見ます。フットサルをしてみたいと思ってました。
      一緒にフットサルしましょう。よろしくお願いします。
      ' },
    { user_id: 46,
      title: 'フットサル興味あります！',
      image: Rails.root.join('app/assets/images/11_futsal/s-m2.jpg').open,
      content: '
      運動神経は学生時代に球技をしていたこともあり自信あります！
      最近はステイホームで運動不足をより実感しています...
      仕事終わりなどに一緒に混ぜてもらいたいと思いメッセージしました。
      ' },
    { user_id: 52,
      title: 'はじめまして',
      image: Rails.root.join('app/assets/images/11_futsal/s-m3.jpg').open,
      content: '
      女性のみとことで安心です！
      男性と混ざってやるのは少し怖かったので...
      一度経験してみたくメッセージをしてみました。
      是非一度見学させてもらってもよろしいでしょうか？
      ' }
  ]
)

join10 = Post.find(10)
join10.post_joins.create(
  [
    { user_id: 38 },
    { user_id: 51 }
  ]
)

join10.messages.create(
  [
    { user_id: 38,
      title: 'こんにちは',
      image: Rails.root.join('app/assets/images/13_exam/s-m1.jpg').open,
      content: '
      資格の勉強をしています。家にいるとなかなか勉強に集中できないことが多くこのような場を探していました。
      メッセージをしたのも初めてでまだこのサイトを始めて間もないので、わからないこともありますが、よろしくお願いします。
      ' },
    { user_id: 51,
      title: 'はじめまして！',
      image: Rails.root.join('app/assets/images/13_exam/s-m2.jpg').open,
      content: '
      自分も普段はネットカフェやファストフード店などで勉強することが多いです。
      なので自宅でもZoomで自分を勉強する環境下におけて、人の目もあるのでやらざるを得ないですよね。
      Zoomも課金されているとのことで非常に助かります。
      是非一度参加させて下さい。
      ' }
  ]
)

join11 = Post.find(11)
join11.post_joins.create(
  [
    { user_id: 22 },
    { user_id: 53 },
    { user_id: 54 }
  ]
)

join11.messages.create(
  [
    { user_id: 22,
      title: 'はじめまして、こんにちは',
      image: Rails.root.join('app/assets/images/13_exam/s-m1.jpg').open,
      content: '
      私も大学受験を控えています。
      支え合える仲間、友達がいるときっとやる気もあがるはずです。
      受験は互いに競争ではなく、支え合いだと私は思っています。
      一緒に勉強頑張りましょう！私も感化されました。
      ' },
    { user_id: 53,
      title: '受験勉強お疲れ様です',
      image: Rails.root.join('app/assets/images/13_exam/s-m2.jpg').open,
      content: '
      私は過去問題集をひたすら解き、時間はしっかりとタイマーなどを使い集中的に勉強していましたよ！
      睡眠はしっかりと摂って下さいね。睡眠の質は記憶に関わっていると耳にしたことがあります。
      習慣化できればもうこっちのものです。
      集中するときは集中して、休む時は休みメリハリをつけて私は勉強していました！
      お身体に気をつけて、受験勉強頑張って下さい！
      私も陰ながら応援してます。
      ' },
    { user_id: 54,
      title: '僕も受験勉強中です',
      image: Rails.root.join('app/assets/images/13_exam/s-m3.jpg').open,
      content: '
      僕も悩んでいる時期です。同じような境遇の方がいるんだと思いこちらの投稿を見て少し安心しました。
      不安になりますよね。自分も心配性なのでこれで合っているのか、今のままでいいのかと不安になることがあります。
      上の方のメッセージを見てとても参考になりました。
      あまり自分を追い詰めると余裕がなくなってしまいますよね。
      達成できる目標を目の前に掲げて、少しずつ徐々に乗り越えてしていきましょ！
      共に受験勉強を頑張りましょう。
      ' }
  ]
)

join12 = Post.find(12)
join12.post_joins.create(
  [
    { user_id: 31 }
  ]
)

join12.messages.create(
  [
    { user_id: 31,
      title: '吉田さん！ご無沙汰してます',
      image: Rails.root.join('app/assets/images/14_dogrun/s-m1.jpg').open,
      content: '
      まさかここで吉田さんに会うとは！ご無沙汰しております。
      次回の休みにでも行こうかなと思っていた所なんですよ。
      久しぶりにお話もできればと思います。結婚もしたんですよ！
      また連絡しますので、その時はよろしくお願いします！
      ' }
  ]
)

join13 = Post.find(13)
join13.post_joins.create(
  [
    { user_id: 25 },
    { user_id: 30 },
    { user_id: 47 }
  ]
)

join13.messages.create(
  [
    { user_id: 25,
      title: 'いつも見てます！',
      image: Rails.root.join('app/assets/images/15_monhun/s-m1.jpg').open,
      content: '
      ここでも募集されていたんですね！
      一緒にモンハンするのが夢でした...！
      私も武器はなんでも使えますので、臨機応変に対応します。
      ぜひとも参加したいです！
      ' },
    { user_id: 30,
      title: '参加します',
      image: Rails.root.join('app/assets/images/15_monhun/s-m2.jpg').open,
      content: '
      いつも楽しい動画ありがとうございます。
      参加します。HRカンストしているのでなんでもお任せ下さい。
      体調には気をつけてこれからも応援しています。
      ' },
    { user_id: 47,
      title: '参加希望です！',
      image: Rails.root.join('app/assets/images/15_monhun/s-m3.jpg').open,
      content: '
      解説動画いつも参考にさせてもらっています！
      私も参加します。長時間連戦も可能なのでなんでも連れ回してください！！
      ' }
  ]
)

join14 = Post.find(14)
join14.post_joins.create(
  [
    { user_id: 38 },
    { user_id: 28 },
    { user_id: 39 }
  ]
)

join14.messages.create(
  [
    { user_id: 38,
      title: '以前はお世話になりました！',
      image: Rails.root.join('app/assets/images/16_oiden/s-m1.jpg').open,
      content: '
      今年は僕も参加です！ボランティアにも参加するんですか！？
      僕も友人連れて一緒にやりますよ！友人には僕から言っときますんで！
      あ、お酒は自分で買って下さいね〜(笑)
      ' },
    { user_id: 28,
      title: 'こんにちは〜！',
      image: Rails.root.join('app/assets/images/16_oiden/s-m2.jpg').open,
      content: '
      わたしもボランティア参加しますよっ♪
      今年も熱い夏になりそうですね〜！気温も暑くなると思うのでお互い体調には気をつけましょ！
      ボランティア終わった後、わたしひとりなので...よければ一緒に回りたいのです！
      当日はよろしくお願いしますっ！
      ' },
    { user_id: 39,
      title: 'こんにちは☀︎',
      image: Rails.root.join('app/assets/images/16_oiden/s-m3.jpg').open,
      content: '
      最近東京から愛知へ引っ越してきました。
      東海地区最大の花火が見られるということでとても楽しみにしています！
      こっちにきてから友達もいないのでよければ参加してもよろしいですか？
      お酒ごちそうしますよ〜w
      よろしくお願いします！
      ' }
  ]
)

join15 = Post.find(15)
join15.post_joins.create(
  [
    { user_id: 27 }
  ]
)

join15.messages.create(
  [
    { user_id: 27,
      title: 'How are you?',
      image: Rails.root.join('app/assets/images/17_confused/m1.jpg').open,
      content: '
      Hi, Mary. You\'re being busy. Could I take care of them?
      I know you. Do you remember?
      We saw at the entrance ceremony with your mother before.
      Give your mother a call. She must know me.
      But You\'re earnest, so you won\'t. Don\'t worry. I can help you.
      ' }
  ]
)
