require 'rubygems'
require 'sinatra'
require 'sinatra/reloader'
require 'haml'
require 'erb'

# residents = ['yuiseki', 'yusukezzz', 'youchan', 'xga', 'itoyanagi', 'takano32']

get '/' do
  # 各機能へのリンク
  "hoge"
end

get '/tweet' do
  #定型文＋ハッシュタグでつぶやくためのボタンのリスト
  tweets = {}
  tweets['在宅情報'] = {
        "#geekusa_now"    => "ギークハウス浅草にいる",
        "#geekusa_ktk"    => "帰宅した",
        "#geekusa_lounge" => "リビングにいる",
        "#geekusa_myroom" => "部屋にいる",
  }
  tweets['お風呂関係'] = {
        "#geekusa_wash"   => "入浴中",
        "#geekusa_wash"   => "つぎ入浴したい",
        "#geekusa_wash"   => "ふろあがりました",
  }
  tweets['洗濯関係'] = {
        "#geekusa_wash"   => "洗濯してる",
        "#geekusa_wash"   => "洗濯終わった",
        "#geekusa_wash"   => "洗濯物回収待ち",
        "#geekusa_towel"  => "タオル洗濯中",
        "#geekusa_towel"  => "洗剤入れ替えた",
  }
  tweets['ゴミ出し関係'] = {
        "#geekusa_towel"  => "明日は燃やさないゴミの日",
        "#geekusa_towel"  => "明日は燃えるゴミの日",
        "#geekusa_towel"  => "明日は資源ゴミの日",
        "#geekusa_towel"  => "ゴミ出した",
  }
  tweets['その他'] = {
        "#geekusa_towel"  => "皿洗った",
        "#geekusa_towel"  => "家賃振り込んだ",
        "#geekusa_towel"  => "虫が発生した！！",
        "#geekusa_towel"  => "なんか臭い",
  }
end

get '/who' do
  # 現在ギークハウスにいるひとの一覧
end

get '/map' do
  # 画像が地図上におけるだけの超簡易map wiki
  # gyazoとかと連携する
  # 画像と座標の対応をjsonでファイルに保持する
end

get '/find' do
  # モノをどこに仕舞ったかなどの備忘録の検索
end


