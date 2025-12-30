return {
	id = "XIANGCHEYUTIANQIONGZHIYIN14",
	mode = 2,
	fadeOut = 1.5,
	scripts = {
		{
			nameColor = "#A9F548FF",
			side = 2,
			bgName = "star_level_bg_598",
			hidePaintObj = true,
			say = "NY港に到着してから3日目、自分はレキシントンと飛行機でシアトルへ向かった。",
			bgm = "story-date-light",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			},
			flashin = {
				black = true,
				dur = 1,
				alpha = {
					1,
					0
				}
			}
		},
		{
			nameColor = "#A9F548FF",
			side = 2,
			bgName = "star_level_bg_598",
			hidePaintObj = true,
			say = "飛行機の窓から見える景色を見て、この世界の繁栄ぶりと技術水準について新たな印象を抱いた。",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			nameColor = "#A9F548FF",
			side = 2,
			bgName = "star_level_bg_598",
			hidePaintObj = true,
			say = "その夜、シアトルの港でフェリー船に乗り、アンカレッジへ向かった。",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			nameColor = "#A9F548FF",
			side = 2,
			bgName = "star_level_bg_598",
			hidePaintObj = true,
			say = "旅路の途中、頭を悩ます複雑なことはすべて忘れ、ただお互いに、そしてこの旅に集中するようにしていた。",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			nameColor = "#A9F548FF",
			side = 2,
			bgName = "star_level_bg_597",
			hidePaintObj = true,
			say = "楽しい時間はあっという間に終わるものだ。気づけば3日目の朝日がもう昇り始めていた。",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			},
			flashout = {
				black = true,
				dur = 1,
				alpha = {
					0,
					1
				}
			},
			flashin = {
				delay = 1,
				dur = 1,
				black = true,
				alpha = {
					1,
					0
				}
			}
		},
		{
			nameColor = "#A9F548FF",
			side = 2,
			bgName = "star_level_bg_597",
			hidePaintObj = true,
			say = "かすんだ朝霧の中、目に映ったのは、前印象とは全く異なる繁栄したアンカレッジの姿だった。",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			nameColor = "#A9F548FF",
			side = 2,
			bgName = "star_level_bg_597",
			hidePaintObj = true,
			say = "フェリー船が着岸すると、そこにはレキシントンの連絡を受けて駆けつけた現地の駐留艦隊の姿があった。",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			actor = 101100,
			side = 2,
			bgName = "bg_tianqiong_4",
			hidePaintObj = true,
			dir = 1,
			nameColor = "#A9F548FF",
			say = "アンカレッジ市へようこそ！理事会第7任務艦隊、ウィリアム・D・ポーター分艦隊のウィリアム・D・ポーターだよ♪",
			bgm = "story-dailyfuture-soft",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			},
			location = {
				"アンカレッジ・1日目",
				3
			},
			flashout = {
				black = true,
				dur = 0.5,
				alpha = {
					0,
					1
				}
			},
			flashin = {
				delay = 0.5,
				dur = 0.5,
				black = true,
				alpha = {
					1,
					0
				}
			}
		},
		{
			actor = 101100,
			side = 2,
			bgName = "bg_tianqiong_4",
			hidePaintObj = true,
			dir = 1,
			nameColor = "#A9F548FF",
			say = "指揮官、レキシントン、二人ともお疲れさま～♪",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			actor = 107160,
			side = 2,
			bgName = "bg_tianqiong_4",
			hidePaintObj = true,
			dir = 1,
			nameColor = "#A9F548FF",
			say = "あなたたちが……第7任務艦隊？",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			expression = 5,
			side = 2,
			bgName = "bg_tianqiong_4",
			hidePaintObj = true,
			dir = 1,
			nameColor = "#A9F548FF",
			actor = 107160,
			say = "ええと、とりあえず……うん、そういうことにしましょうか",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			expression = 1,
			side = 2,
			bgName = "bg_tianqiong_4",
			hidePaintObj = true,
			dir = 1,
			nameColor = "#A9F548FF",
			actor = 107160,
			say = "私たち以外のVIPは、もう到着してるの？",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			actor = 101550,
			side = 2,
			bgName = "bg_tianqiong_4",
			hidePaintObj = true,
			dir = 1,
			nameColor = "#A9F548FF",
			say = "ううん、まだ他は誰も来てないわ。一週間以内に順次到着する予定よ",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			expression = 2,
			side = 2,
			bgName = "bg_tianqiong_4",
			hidePaintObj = true,
			dir = 1,
			nameColor = "#A9F548FF",
			actor = 101550,
			say = "それと、観測に最適な期間も一週間後になるわ",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			actor = 101550,
			side = 2,
			bgName = "bg_tianqiong_4",
			hidePaintObj = true,
			dir = 1,
			nameColor = "#A9F548FF",
			say = "その時期は激しい磁気嵐が発生するので、各種電子デバイスの取り扱いには十分気をつけて……",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			expression = 8,
			side = 2,
			bgName = "bg_tianqiong_4",
			hidePaintObj = true,
			dir = 1,
			nameColor = "#A9F548FF",
			actor = 107160,
			say = "気をつけるわ、教えてくれてありがとう",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			expression = 1,
			side = 2,
			bgName = "bg_tianqiong_4",
			hidePaintObj = true,
			dir = 1,
			nameColor = "#A9F548FF",
			actor = 107160,
			say = "指揮官、また一週間の自由時間ができたわね～",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			actor = 0,
			nameColor = "#A9F548FF",
			bgName = "bg_tianqiong_4",
			hidePaintObj = true,
			side = 2,
			portrait = "zhihuiguan",
			say = "――一週間か……それだけあれば、この街をじっくり観光できそうだな",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			expression = 1,
			nameColor = "#A9F548FF",
			bgName = "bg_tianqiong_4",
			hidePaintObj = true,
			side = 2,
			actor = 102350,
			say = "ふふん、長年有名なリゾート地として知られるこの街なら、きっと二人を失望させたりしないと思うよ～♪",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			expression = 2,
			side = 2,
			bgName = "bg_tianqiong_4",
			hidePaintObj = true,
			dir = 1,
			nameColor = "#A9F548FF",
			actor = 107160,
			say = "おすすめの観光スポットはある？",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			actor = 102350,
			side = 2,
			bgName = "bg_tianqiong_4",
			hidePaintObj = true,
			nameColor = "#A9F548FF",
			say = "アンカレッジ市は主に都市エリア、工業エリア、ハイテク産業エリア、防衛管制エリア、そして自然保護エリアに分かれていて～",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			expression = 6,
			nameColor = "#A9F548FF",
			bgName = "bg_tianqiong_4",
			hidePaintObj = true,
			side = 2,
			actor = 102350,
			say = "都市エリアには必要なものが全て揃ってるわよ。中でもアンカレッジ歴史芸術博物館は特におすすめね！",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			expression = 5,
			nameColor = "#A9F548FF",
			bgName = "bg_tianqiong_4",
			hidePaintObj = true,
			side = 2,
			actor = 102350,
			say = "工業エリアは、確か通常のキューブエネルギー工業とは異なる技術が使われてるとかで…",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			expression = 1,
			nameColor = "#A9F548FF",
			bgName = "bg_tianqiong_4",
			hidePaintObj = true,
			side = 2,
			actor = 102350,
			say = "一応、見学する価値はあるのかな……？ちょっとその辺は詳しくなくて…えへへ",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			actor = 102350,
			side = 2,
			bgName = "bg_tianqiong_4",
			hidePaintObj = true,
			nameColor = "#A9F548FF",
			say = "あっ！そういえばウィッター町も近いし、あそこには歴史的建造物である「ベギーチ・タワーズ」があるよ",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			expression = 5,
			nameColor = "#A9F548FF",
			bgName = "bg_tianqiong_4",
			hidePaintObj = true,
			side = 2,
			actor = 102350,
			say = "そこから工業エリアを眺めると、なんというか時代を跨いだみたいな感覚が味わえるよ～",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			expression = 5,
			nameColor = "#A9F548FF",
			bgName = "bg_tianqiong_4",
			hidePaintObj = true,
			side = 2,
			actor = 102350,
			say = "次はハイテク産業エリア。主に航空宇宙とか地球外探索とかを扱う企業が集まってるね",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			expression = 1,
			nameColor = "#A9F548FF",
			bgName = "bg_tianqiong_4",
			hidePaintObj = true,
			side = 2,
			actor = 102350,
			say = "こういうのも全然詳しくはないけど……見学する価値はあると思う！",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			expression = 6,
			nameColor = "#A9F548FF",
			bgName = "bg_tianqiong_4",
			hidePaintObj = true,
			side = 2,
			actor = 102350,
			say = "あとは…防衛管制エリアだけど、これといった特別な見どころはないかな……",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			expression = 5,
			nameColor = "#A9F548FF",
			bgName = "bg_tianqiong_4",
			hidePaintObj = true,
			side = 2,
			actor = 102350,
			say = "あっでも、アンカレッジ天文台があるから、ここは一般的な沿岸都市より警備が厳重ってくらいかな",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			expression = 1,
			nameColor = "#A9F548FF",
			bgName = "bg_tianqiong_4",
			hidePaintObj = true,
			side = 2,
			actor = 102350,
			say = "バカンスにはちょっと向いてないけど、ただの見学ならアリだと思う～",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			actor = 102350,
			side = 2,
			bgName = "bg_tianqiong_4",
			hidePaintObj = true,
			nameColor = "#A9F548FF",
			say = "ついでに、私のイチオシは、近くにある自然保護エリアだよ～♪",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			expression = 6,
			nameColor = "#A9F548FF",
			bgName = "bg_tianqiong_4",
			hidePaintObj = true,
			side = 2,
			actor = 102350,
			say = "かわいい野生動物がたくさんいるし、ユニークな氷河ツアーもできるからね～",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			expression = 5,
			nameColor = "#A9F548FF",
			bgName = "bg_tianqiong_4",
			hidePaintObj = true,
			side = 2,
			actor = 102350,
			say = "そうだ。実はアンカレッジ国立天文台も自然保護エリアの山の頂上にあって――",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			expression = 1,
			nameColor = "#A9F548FF",
			bgName = "bg_tianqiong_4",
			hidePaintObj = true,
			side = 2,
			actor = 102350,
			say = "星を見ないで、遠くを眺めるだけでも息をのむような景色が楽しめるよ～",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			expression = 4,
			side = 2,
			bgName = "bg_tianqiong_4",
			hidePaintObj = true,
			dir = 1,
			nameColor = "#A9F548FF",
			actor = 107160,
			say = "……まとめると、どこも訪れる価値があるって意味かしら？",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			expression = 1,
			side = 2,
			bgName = "bg_tianqiong_4",
			hidePaintObj = true,
			nameColor = "#A9F548FF",
			actor = 102350,
			say = "そうだよ～！",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			},
			action = {
				{
					type = "shake",
					y = 45,
					delay = 0,
					dur = 0.15,
					x = 0,
					number = 2
				}
			}
		},
		{
			expression = 8,
			side = 2,
			bgName = "bg_tianqiong_4",
			hidePaintObj = true,
			dir = 1,
			nameColor = "#A9F548FF",
			actor = 107160,
			say = "ふふ、これから数日は充実した日々になりそうね？指揮官～",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		}
	}
}
