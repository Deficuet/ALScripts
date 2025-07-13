return {
	id = "MENGHUANLEYUANDEMENGHUANJIARI19",
	mode = 2,
	fadeOut = 1.5,
	scripts = {
		{
			actor = 0,
			side = 2,
			bgName = "star_level_bg_109",
			hidePaintObj = true,
			nameColor = "#A9F548FF",
			say = "――……ふぅ……",
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
			bgName = "star_level_bg_109",
			hidePaintObj = true,
			say = "昨日は一日中遊園地を楽しんだ後、自分の部屋のベッドに倒れ込んでいた。",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			nameColor = "#A9F548FF",
			side = 2,
			bgName = "star_level_bg_109",
			hidePaintObj = true,
			say = "そして今、意識がぼんやりとしている中、ふと些細な違和感があることに気づいた。",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			expression = 5,
			side = 2,
			bgName = "star_level_bg_109",
			actorName = "？？？",
			dir = 1,
			actor = 900454,
			nameColor = "#A9F548FF",
			hidePaintObj = true,
			say = "ふふん。グッドモーニング指揮官！",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			nameColor = "#A9F548FF",
			side = 2,
			bgName = "star_level_bg_109",
			hidePaintObj = true,
			say = "ギシッとベッドから音がして、それからいきなり少女の重量が体にのしかかった。",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			},
			options = {
				{
					content = "ブレマートン…？",
					flag = 1
				},
				{
					content = "グッドモーニング……？",
					flag = 2
				}
			}
		},
		{
			actor = 0,
			side = 2,
			bgName = "star_level_bg_109",
			hidePaintObj = true,
			nameColor = "#A9F548FF",
			optionFlag = 1,
			say = "――どうしてここに？",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			expression = 3,
			side = 2,
			bgName = "star_level_bg_109",
			dir = 1,
			optionFlag = 1,
			actor = 900454,
			nameColor = "#A9F548FF",
			hidePaintObj = true,
			say = "指揮官は昨日一日中遊んで疲れてるはずだから、そろそろマッサージしてほしくなったんじゃないかなーと思って",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			expression = 2,
			side = 2,
			bgName = "star_level_bg_109",
			dir = 1,
			optionFlag = 1,
			actor = 900454,
			nameColor = "#A9F548FF",
			hidePaintObj = true,
			say = "それで来てみたら、まさか指揮官がこんなに無防備だなんてね～。だから普通に入っちゃった♪",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			actor = 0,
			side = 2,
			bgName = "star_level_bg_109",
			hidePaintObj = true,
			nameColor = "#A9F548FF",
			optionFlag = 1,
			say = "――……",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			expression = 3,
			side = 2,
			bgName = "star_level_bg_109",
			dir = 1,
			optionFlag = 1,
			actor = 900454,
			nameColor = "#A9F548FF",
			hidePaintObj = true,
			say = "はいはい、細いことは気にしな～い。アタシがマッサージしてあげるわよ？",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			actor = 0,
			side = 2,
			bgName = "star_level_bg_109",
			hidePaintObj = true,
			nameColor = "#A9F548FF",
			optionFlag = 2,
			say = "――とは言えないよな…まだ早朝だし…",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			expression = 2,
			side = 2,
			bgName = "star_level_bg_109",
			dir = 1,
			optionFlag = 2,
			actor = 900454,
			nameColor = "#A9F548FF",
			hidePaintObj = true,
			say = "早朝でも朝は朝でしょ？だからモーニングで大丈夫！えへへ",
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
			expression = 5,
			side = 2,
			bgName = "star_level_bg_109",
			dir = 1,
			optionFlag = 2,
			actor = 900454,
			nameColor = "#A9F548FF",
			hidePaintObj = true,
			say = "昨日は一日遊んで疲れたでしょ！だからアタシが特別なマッサージサービスをしてあげる♪",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			},
			options = {
				{
					content = "受け入れる",
					flag = 1
				},
				{
					content = "断る",
					flag = 2
				}
			}
		},
		{
			actor = 0,
			side = 2,
			bgName = "star_level_bg_109",
			hidePaintObj = true,
			nameColor = "#A9F548FF",
			optionFlag = 1,
			say = "――うん。頼んだ",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			expression = 2,
			side = 2,
			bgName = "star_level_bg_109",
			dir = 1,
			optionFlag = 1,
			actor = 900454,
			nameColor = "#A9F548FF",
			hidePaintObj = true,
			say = "あはは♪頑張るわよ！",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			actor = 0,
			side = 2,
			bgName = "star_level_bg_109",
			hidePaintObj = true,
			nameColor = "#A9F548FF",
			optionFlag = 2,
			say = "――まだ寝たいから断ってもいいかな…？",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			expression = 1,
			side = 2,
			bgName = "star_level_bg_109",
			dir = 1,
			optionFlag = 2,
			actor = 900454,
			nameColor = "#A9F548FF",
			hidePaintObj = true,
			say = "気持ちは分かるけど、ちゃんと筋肉をほぐしてから寝ないと。起きたら筋肉痛になるわよ？",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			expression = 5,
			side = 2,
			bgName = "star_level_bg_109",
			hidePaintObj = true,
			dir = 1,
			nameColor = "#A9F548FF",
			actor = 900454,
			say = "指揮官は目を閉じて、アタシにぜーんぶ任せてくれればいいから！",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			expression = 3,
			side = 2,
			bgName = "star_level_bg_109",
			hidePaintObj = true,
			dir = 1,
			nameColor = "#A9F548FF",
			actor = 900454,
			say = "まずはオイルを塗って……うーん♪いい匂い～。んでこれを手のひらで温めて……",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			nameColor = "#A9F548FF",
			side = 2,
			bgName = "star_level_bg_109",
			hidePaintObj = true,
			say = "温められたオイルが肩と背中に塗りたくられ、淡い香りが鼻腔に充満してきた。",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			nameColor = "#A9F548FF",
			side = 2,
			bgName = "star_level_bg_109",
			hidePaintObj = true,
			say = "そしてちょうどいい力加減のマッサージが施術され始めた。",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			actor = 900454,
			side = 2,
			bgName = "star_level_bg_109",
			hidePaintObj = true,
			dir = 1,
			nameColor = "#A9F548FF",
			say = "うわっ。指揮官のここ完全凝ってるよ…ちゃんとほぐさないと",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			expression = 3,
			side = 2,
			bgName = "star_level_bg_109",
			hidePaintObj = true,
			dir = 1,
			nameColor = "#A9F548FF",
			actor = 900454,
			say = "どうやら昨日は本当に遊び疲れてるみたい。だってほら、筋肉が全部ガチガチだもん",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			actor = 900454,
			side = 2,
			bgName = "star_level_bg_109",
			hidePaintObj = true,
			dir = 1,
			nameColor = "#A9F548FF",
			say = "それで…遊園地は楽しかった？感想をちょっと教えてくれない？",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			},
			options = {
				{
					content = "色んなアトラクションが楽しかった",
					flag = 1
				},
				{
					content = "思いっきり遊べた",
					flag = 2
				}
			}
		},
		{
			expression = 5,
			side = 2,
			bgName = "star_level_bg_109",
			dir = 1,
			optionFlag = 1,
			actor = 900454,
			nameColor = "#A9F548FF",
			hidePaintObj = true,
			say = "アタシも！ジェットコースターと観覧車が一番好きだよ！今度一緒に乗ろう！",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			actor = 900454,
			side = 2,
			bgName = "star_level_bg_109",
			hidePaintObj = true,
			dir = 1,
			optionFlag = 2,
			nameColor = "#A9F548FF",
			say = "うん！指揮官がそんなに遊べたのはだいぶ久しぶりでしょ～",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			nameColor = "#A9F548FF",
			side = 2,
			bgName = "star_level_bg_109",
			hidePaintObj = true,
			say = "他愛のない会話をしながらリズミカルなマッサージを受け、なんだか眠気が再び襲ってきた………",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			expression = 3,
			side = 2,
			bgName = "star_level_bg_109",
			hidePaintObj = true,
			dir = 1,
			nameColor = "#A9F548FF",
			actor = 900454,
			say = "おーい、指揮官、ここは？ここも押していい？",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			actor = 0,
			side = 2,
			bgName = "star_level_bg_109",
			hidePaintObj = true,
			nameColor = "#A9F548FF",
			say = "――……",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			expression = 5,
			side = 2,
			bgName = "star_level_bg_109",
			hidePaintObj = true,
			dir = 1,
			nameColor = "#A9F548FF",
			actor = 900454,
			say = "答えないなら押すよ！",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			actor = 0,
			side = 2,
			bgName = "star_level_bg_109",
			hidePaintObj = true,
			nameColor = "#A9F548FF",
			say = "――……",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			nameColor = "#A9F548FF",
			side = 2,
			bgName = "star_level_bg_109",
			hidePaintObj = true,
			say = "夢と現実の狭間を漂う中、ブレマートンの少し愚痴っぽい独り言が聞こえた。",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
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
			expression = 1,
			side = 2,
			bgName = "star_level_bg_109",
			hidePaintObj = true,
			dir = 1,
			nameColor = "#A9F548FF",
			actor = 900454,
			say = "もう……こんなにマッサージしてあげてるのにすやすや寝ちゃって",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			actor = 900454,
			side = 2,
			bgName = "star_level_bg_109",
			hidePaintObj = true,
			dir = 1,
			nameColor = "#A9F548FF",
			say = "しょうがないわね……",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			nameColor = "#A9F548FF",
			side = 2,
			bgName = "star_level_bg_109",
			hidePaintObj = true,
			say = "ベッドが微かに揺れると、頬に温かく優しいキスをされた。",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			expression = 1,
			side = 2,
			bgName = "star_level_bg_109",
			hidePaintObj = true,
			dir = 1,
			nameColor = "#A9F548FF",
			actor = 900454,
			say = "ぐっすり眠ってね、指揮官",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			expression = 5,
			side = 2,
			bgName = "star_level_bg_109",
			hidePaintObj = true,
			dir = 1,
			nameColor = "#A9F548FF",
			actor = 900454,
			say = "おやすみ♪",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		}
	}
}
