require 'rubygems'
require 'sinatra'
require 'sinatra/reloader'
require 'uri'
require 'haml'
require 'erb'
$KCODE = 'u'

configure do
  # 住人一覧
  set :residents, ['yuiseki', 'yusukezzz', 'youchan', 'xga', 'itoyanagi', 'takano32']
  # ハッシュタグの共通部分。これで検索とかもする
  set :prefix, "#geekusa"
  #定型文＋ハッシュタグでつぶやくためのボタンのリスト
  set :statuses, {
    '000_在宅情報_home' => {
      "now"=> "ギークハウス浅草にいる", "lounge" => "リビングにいる", 
      "inmyroom" => "部屋にいる",
      "outgoing" => "でかける",
      "return" => "いまから帰宅", "ktk" => "帰宅した",
    },
    '001_お風呂関係_bath' => {
        "go"   => "ふろはいります", "getout"   => "ふろでました",
        "queue"   => "つぎ入浴したい",
    },
    '002_洗濯関係_wash' => {
        "now"   => "洗濯してる",
        "done"   => "洗濯終わった",
        "queue"   => "洗濯物回収待ち",
        "towel"  => "タオル洗濯中",
        "powder"  => "洗剤入れ替えた",
    },
    '003_掃除関係_clean' => {
      "bug"  => "虫が発生した！！",
      "stairs"  => "階段掃除した",
      "bath"  => "風呂掃除した",
      "smell"  => "なんか臭い",
    },
    '004_ゴミ出し関係_garbage' => {
        "noncambustible"  => "明日は燃やさないゴミの日",
        "cambustible"  => "明日は燃えるゴミの日",
        "recyclable"  => "明日は資源ゴミの日",
        "dump"  => "ゴミ出した",
    },
    '999_その他_other' => {
      "bomb"  => "爆発炎上してる",
      "kitchen_wash"  => "皿洗った",
      "house_rent"  => "家賃振り込んだ",
    },
  }
end

template :layout do
<<EOF
<!DOCTYPE html>
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
    <title><%= @title %></title>
    <%= @head %>
    <script type="text/javascript" src="http://www.google.com/jsapi"></script>
    <script type="text/javascript">google.load("jquery", "1");</script>
    <script type="text/javascript">google.load("jqueryui", "1");</script>
  </head>
  <body>
    <div class="templates" style="width:1000px; float:left;">
      <%= yield %>
    </div>

    <script src="http://widgets.twimg.com/j/2/widget.js"></script>
    <script>
    new TWTR.Widget({
      version: 2,
      type: 'list',
      interval: 6000,
      title: 'geekusa', subject: 'ギークハウス浅草情報',
      width: 250, height: 600,
      theme: {
        shell: {
          background: '#8ec1da',
          color: '#ffffff'
        },
        tweets: {
          background: '#ffffff',
          color: '#444444',
          links: '#1985b5'
        }
      },
      features: {
        scrollbar: true,
        loop: false,
        live: true,
        hashtags: true,
        timestamp: true,
        avatars: true,
        toptweets: true,
        behavior: 'all'
      }
    }).render().setList("yuiseki", "asakusa-house").start();
    $("div.twtr-widget").attr("style", "width:250px; float:right;")
    </script>
  </body>
</html>
EOF
end

get '/' do
  # 各機能へのリンク
  # <% cat = " #"+category.scan(/.+_.+_(.+)$/).first.first+"_" %>
  @title = "ギークハウス浅草情報"
  erb %{
  <% options.statuses.sort_by{|key,val| key}.each do |category, tweets| %>
    <%= category %>
    <% tweets.each do |tag, tw| %>
      <div style="display:inline; margin:4px;">
        <a href="http://twitter.com/?status=<%= URI.encode(tw+" "+options.prefix) %>" target="blank_">
        <img src="http://twitter-badges.s3.amazonaws.com/t_small-a.png" />
        <%= tw %>
        </a>
      </div>
    <% end %>
  <br /><br />
  <% end %>

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


