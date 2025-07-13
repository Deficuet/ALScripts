return {
	id = "TIEYIQINGFENG6",
	mode = 2,
	fadeOut = 1.5,
	scripts = {
		{
			mode = 1,
			stopbgm = true,
			asideType = 3,
			blackBg = true,
			bgm = "airraidalarm",
			sequence = {
				{
					"キリスィマスィ島・幻境内部",
					1
				},
				{
					"周辺海域",
					2
				},
				{
					"……？",
					3
				}
			}
		},
		{
			nameColor = "#A9F548FF",
			side = 2,
			bgName = "bg_xiangting_2",
			hidePaintObj = true,
			say = "夜空を覆う硝煙。鳴り響く警報音。大地と海が燃えている。",
			bgm = "story-6",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			expression = 4,
			side = 2,
			bgName = "bg_xiangting_2",
			hidePaintObj = true,
			dir = 1,
			nameColor = "#A9F548FF",
			actor = 102330,
			say = "……周辺の地形から推測すると、ここはユニオンNYシティ近辺・LI防衛線みたい",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			expression = 3,
			side = 2,
			bgName = "bg_xiangting_2",
			hidePaintObj = true,
			dir = 1,
			nameColor = "#A9F548FF",
			actor = 101520,
			say = "LI防衛線…？わたしたち、キリスィマスィ島にいなかった？",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			actor = 105150,
			side = 2,
			bgName = "bg_xiangting_2",
			hidePaintObj = true,
			dir = 1,
			nameColor = "#A9F548FF",
			say = "ここは本当の「夢」の中なのかもしれないな。ファーゴ、ほかに分かることは？",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			expression = 5,
			side = 2,
			bgName = "bg_xiangting_2",
			hidePaintObj = true,
			dir = 1,
			nameColor = "#A9F548FF",
			actor = 102330,
			say = "襲撃を受けてから防衛線に防御施設を大量に増設したはず。でもここには見当たらない",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			expression = 4,
			side = 2,
			bgName = "bg_xiangting_2",
			hidePaintObj = true,
			dir = 1,
			nameColor = "#A9F548FF",
			actor = 102330,
			say = "おそらくこの幻境は、防衛戦が襲撃を受けた時の「夢」かも",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			expression = 4,
			side = 2,
			bgName = "bg_xiangting_2",
			hidePaintObj = true,
			dir = 1,
			nameColor = "#A9F548FF",
			actor = 103280,
			say = "NYシティが襲撃された日、指揮官、ボルチモア、ヴィクトリアスたちの奮闘でテスターを撃退した……",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			actor = 103280,
			side = 2,
			bgName = "bg_xiangting_2",
			hidePaintObj = true,
			dir = 1,
			nameColor = "#A9F548FF",
			say = "そして、キリスィマスィ島に配属されていたデューイもあの時、ちょうど防衛線にいたわ",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			expression = 1,
			side = 2,
			bgName = "bg_xiangting_2",
			hidePaintObj = true,
			dir = 1,
			nameColor = "#A9F548FF",
			actor = 108090,
			say = "もしかしたら苦戦のトラウマを狙って……だとしたらデューイたちは危ないよ！",
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
			expression = 4,
			side = 2,
			bgName = "bg_xiangting_2",
			hidePaintObj = true,
			dir = 1,
			nameColor = "#A9F548FF",
			actor = 105150,
			say = "デューイたち駐留艦隊はどこにいる？！",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			expression = 4,
			side = 2,
			bgName = "bg_xiangting_2",
			hidePaintObj = true,
			dir = 1,
			nameColor = "#A9F548FF",
			actor = 102330,
			say = "まだ見つかってないわ。今捜索範囲を広げるから――",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			actor = 102330,
			side = 2,
			bgName = "bg_xiangting_2",
			hidePaintObj = true,
			dir = 1,
			nameColor = "#A9F548FF",
			say = "…最新情報によると、侵攻してきたセイレーン艦隊をもう全部倒したみたいね",
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
			expression = 4,
			side = 2,
			bgName = "bg_xiangting_2",
			hidePaintObj = true,
			dir = 1,
			nameColor = "#A9F548FF",
			actor = 102330,
			say = "デューイたちには申し訳ないけど、この戦果はとても彼女たちだけで達成できるものじゃない",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			expression = 6,
			side = 2,
			bgName = "bg_xiangting_2",
			hidePaintObj = true,
			dir = 1,
			nameColor = "#A9F548FF",
			actor = 105150,
			say = "そうだな。おかしいぞ",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			expression = 2,
			side = 2,
			bgName = "bg_xiangting_2",
			hidePaintObj = true,
			dir = 1,
			nameColor = "#A9F548FF",
			actor = 102330,
			say = "反応があった。陸に向かって移動している艦隊がいるわ。デューイだけでなく、ハルゼー・パウエルにヘイゼルウッドも",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			actor = 101520,
			side = 2,
			bgName = "bg_xiangting_2",
			hidePaintObj = true,
			dir = 1,
			nameColor = "#A9F548FF",
			say = "よかった…早くみんなと合流して――",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			actor = 102330,
			side = 2,
			bgName = "bg_xiangting_2",
			hidePaintObj = true,
			dir = 1,
			nameColor = "#A9F548FF",
			say = "お面を被ってる怪しいやつも紛れ込んでいるわ",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			expression = 4,
			side = 2,
			bgName = "bg_xiangting_2",
			hidePaintObj = true,
			dir = 1,
			nameColor = "#A9F548FF",
			actor = 102330,
			say = "……そして例の「重桜の量産艦にちょっと似ている謎の敵」も",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			expression = 4,
			side = 2,
			bgName = "bg_xiangting_2",
			hidePaintObj = true,
			dir = 1,
			nameColor = "#A9F548FF",
			actor = 103280,
			say = "これは…完全に取り込まれてるわね…",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			expression = 3,
			side = 2,
			bgName = "bg_xiangting_2",
			hidePaintObj = true,
			dir = 1,
			nameColor = "#A9F548FF",
			actor = 105150,
			say = "すぐ出撃してデューイたちを救出しよう！",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			},
			dialogShake = {
				speed = 0.08,
				x = 15,
				number = 2
			}
		}
	}
}
