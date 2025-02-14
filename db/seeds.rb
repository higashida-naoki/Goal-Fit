# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Food.create!([
  # 主食
  { name: "ご飯", calories: 168, category: "主食" },
  { name: "食パン", calories: 264, category: "主食" },
  { name: "うどん", calories: 105, category: "主食" },
  { name: "そば", calories: 132, category: "主食" },
  { name: "パスタ", calories: 149, category: "主食" },
  # 肉類
  { name: "牛肉（赤身）", calories: 182, category: "肉類" },
  { name: "牛肉（脂身）", calories: 517, category: "肉類" },
  { name: "豚肉（赤身）", calories: 143, category: "肉類" },
  { name: "豚肉（脂身）", calories: 386, category: "肉類" },
  { name: "鶏むね肉（皮なし）", calories: 108, category: "肉類" },
  { name: "鶏もも肉（皮つき）", calories: 204, category: "肉類" },
  { name: "鶏ささみ", calories: 105, category: "肉類" },
  # 魚介類
  { name: "サーモン", calories: 208, category: "魚介類" },
  { name: "マグロ（赤身）", calories: 125, category: "魚介類" },
  { name: "ブリ", calories: 257, category: "魚介類" },
  { name: "イワシ", calories: 169, category: "魚介類" },
  { name: "サバ", calories: 202, category: "魚介類" },
  { name: "タラ", calories: 77, category: "魚介類" },
  { name: "イカ", calories: 88, category: "魚介類" },
  { name: "エビ", calories: 97, category: "魚介類" },
  # 野菜
  { name: "ブロッコリー", calories: 33, category: "野菜" },
  { name: "キャベツ", calories: 23, category: "野菜" },
  { name: "トマト", calories: 19, category: "野菜" },
  { name: "にんじん", calories: 37, category: "野菜" },
  { name: "ピーマン", calories: 22, category: "野菜" },
  { name: "ほうれん草", calories: 20, category: "野菜" },
  { name: "大根", calories: 18, category: "野菜" },
  # 豆類・ナッツ
  { name: "豆腐", calories: 80, category: "豆類" },
  { name: "納豆", calories: 200, category: "豆類" },
  { name: "枝豆", calories: 135, category: "豆類" },
  { name: "アーモンド", calories: 598, category: "ナッツ" },
  { name: "くるみ", calories: 654, category: "ナッツ" },
  { name: "ピーナッツ", calories: 585, category: "ナッツ" },
  # デザート
  { name: "チョコレート", calories: 550, category: "デザート" },
  { name: "アイスクリーム", calories: 210, category: "デザート" },
  { name: "プリン", calories: 126, category: "デザート" },
  { name: "ショートケーキ", calories: 308, category: "デザート" },
  { name: "どら焼き", calories: 271, category: "デザート" },
  # 揚げ物
  { name: "唐揚げ", calories: 320, category: "揚げ物" },
  { name: "とんかつ", calories: 412, category: "揚げ物" },
  { name: "天ぷら", calories: 317, category: "揚げ物" },
  { name: "フライドポテト", calories: 312, category: "揚げ物" }
])

Exercise.create([
  # 有酸素運動
  { name: "ジョギング", category: "有酸素運動", target_body_part: "全身", calories: 300 },
  { name: "ウォーキング", category: "有酸素運動", target_body_part: "下半身・心肺機能", calories: 150 },
  { name: "サイクリング", category: "有酸素運動", target_body_part: "下半身・心肺機能", calories: 250 },
  { name: "水泳", category: "有酸素運動", target_body_part: "全身", calories: 400 },
  { name: "縄跳び", category: "有酸素運動", target_body_part: "下半身・心肺機能", calories: 350 },
  { name: "階段昇降", category: "有酸素運動", target_body_part: "下半身・心肺機能", calories: 200 },
  { name: "エアロビクス", category: "有酸素運動", target_body_part: "全身", calories: 280 },
  { name: "ダンス", category: "有酸素運動", target_body_part: "全身", calories: 230 },

  # 自重筋トレ
  { name: "スクワット", category: "筋トレ（自重）", target_body_part: "太もも・臀部", calories: 200 },
  { name: "腕立て伏せ（プッシュアップ）", category: "筋トレ（自重）", target_body_part: "胸・腕・肩", calories: 180 },
  { name: "腹筋（クランチ）", category: "筋トレ（自重）", target_body_part: "腹筋", calories: 100 },
  { name: "プランク", category: "筋トレ（自重）", target_body_part: "体幹・腹筋", calories: 90 },
  { name: "ランジ", category: "筋トレ（自重）", target_body_part: "太もも・臀部", calories: 150 },
  { name: "ヒップリフト", category: "筋トレ（自重）", target_body_part: "臀部・腰", calories: 120 },
  { name: "サイドプランク", category: "筋トレ（自重）", target_body_part: "体幹・腹斜筋", calories: 80 },
  { name: "マウンテンクライマー", category: "筋トレ（自重）", target_body_part: "全身・心肺機能", calories: 220 },
  { name: "バーピー", category: "筋トレ（自重）", target_body_part: "全身・心肺機能", calories: 300 },

  # ウェイトトレーニング
  { name: "ダンベルカール", category: "筋トレ（ウェイト）", target_body_part: "腕（上腕二頭筋）", calories: 80 },
  { name: "ベンチプレス", category: "筋トレ（ウェイト）", target_body_part: "胸・腕・肩", calories: 200 },
  { name: "デッドリフト", category: "筋トレ（ウェイト）", target_body_part: "背中・臀部・太もも", calories: 350 },
  { name: "スクワット（バーベル）", category: "筋トレ（ウェイト）", target_body_part: "太もも・臀部", calories: 280 },
  { name: "ショルダープレス", category: "筋トレ（ウェイト）", target_body_part: "肩・腕", calories: 160 },
  { name: "ラットプルダウン", category: "筋トレ（ウェイト）", target_body_part: "背中", calories: 180 },

  # ストレッチ・ヨガ
  { name: "ストレッチ", category: "ストレッチ・柔軟", target_body_part: "全身", calories: 50 },
  { name: "ヨガ（一般的）", category: "ストレッチ・柔軟", target_body_part: "全身", calories: 120 },
  { name: "ピラティス", category: "ストレッチ・柔軟", target_body_part: "体幹・腹筋", calories: 150 },
  { name: "太陽礼拝（ヨガ）", category: "ストレッチ・柔軟", target_body_part: "全身", calories: 100 },

  # スポーツ
  { name: "サッカー", category: "スポーツ", target_body_part: "全身", calories: 400 },
  { name: "バスケットボール", category: "スポーツ", target_body_part: "全身", calories: 380 },
  { name: "バドミントン", category: "スポーツ", target_body_part: "全身", calories: 300 },
  { name: "テニス", category: "スポーツ", target_body_part: "全身", calories: 320 },
  { name: "ボクシング", category: "スポーツ", target_body_part: "全身・心肺機能", calories: 500 },
  { name: "柔道", category: "スポーツ", target_body_part: "全身", calories: 450 },
  { name: "卓球", category: "スポーツ", target_body_part: "全身", calories: 200 },
  { name: "ゴルフ", category: "スポーツ", target_body_part: "腕・体幹", calories: 180 },
  { name: "登山", category: "スポーツ", target_body_part: "全身", calories: 420 }
])
