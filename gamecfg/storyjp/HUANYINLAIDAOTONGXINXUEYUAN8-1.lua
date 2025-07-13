return {
	id = "HUANYINLAIDAOTONGXINXUEYUAN8-1",
	mode = 2,
	fadeOut = 1.5,
	scripts = {
		{
			nameColor = "#A9F548FF",
			side = 2,
			bgName = "bg_story_childschool",
			hidePaintObj = true,
			say = "紆余曲折を経て、一同はようやく管理棟の異変を解決した。",
			bgm = "story-richang-11",
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
			expression = 6,
			side = 2,
			bgName = "bg_story_childschool",
			hidePaintObj = true,
			dir = 1,
			nameColor = "#A9F548FF",
			actor = 408131,
			say = "指揮官、これで学園内の主な施設は全て調べ終ったよ。次は――",
			painting = {
				alpha = 0.3,
				time = 1
			},
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			expression = 2,
			side = 2,
			bgName = "bg_story_childschool",
			paintingNoise = true,
			dir = 1,
			actor = 101480,
			nameColor = "#A9F548FF",
			hidePaintObj = true,
			say = "話の途中でごめん。指揮官、緊急のお知らせがあるよ",
			painting = {
				alpha = 0.3,
				time = 1
			},
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			paintingNoise = true,
			side = 2,
			bgName = "bg_story_childschool",
			hidePaintObj = true,
			dir = 1,
			nameColor = "#A9F548FF",
			actor = 101480,
			say = "「学園オトモシステム」のシステム端末が、学園の制御室にあることを確認できた",
			painting = {
				alpha = 0.3,
				time = 1
			},
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			expression = 1,
			side = 2,
			bgName = "bg_story_childschool",
			paintingNoise = true,
			dir = 1,
			actor = 101480,
			nameColor = "#A9F548FF",
			hidePaintObj = true,
			say = "行方不明になった夕張もおそらくそこにいるはず",
			painting = {
				alpha = 0.3,
				time = 1
			},
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			actor = 0,
			side = 2,
			bgName = "bg_story_childschool",
			hidePaintObj = true,
			nameColor = "#A9F548FF",
			say = "（制御室か…そこが今回の異常事態の発生源である可能性が高いな）",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			actor = 0,
			side = 2,
			bgName = "bg_story_childschool",
			factiontag = "通信モード",
			hidePaintObj = true,
			nameColor = "#A9F548FF",
			say = "――２つの探索隊に連絡しよう。制御室で合流するように、と",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			expression = 5,
			side = 2,
			bgName = "bg_story_childschool",
			hidePaintObj = true,
			dir = 1,
			nameColor = "#A9F548FF",
			actor = 408131,
			say = "了解～",
			painting = {
				alpha = 0.3,
				time = 1
			},
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			nameColor = "#A9F548FF",
			side = 2,
			bgName = "star_level_bg_503",
			hidePaintObj = true,
			say = "リトル学園・制御室",
			bgm = "votefes-up",
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
			bgName = "star_level_bg_503",
			hidePaintObj = true,
			say = "制御室の中に巨大モニターが設置されていて、カラーノイズを点滅させながらゲートの横断幕と同じ内容を表示させていた。",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			nameColor = "#A9F548FF",
			side = 2,
			bgName = "star_level_bg_503",
			hidePaintObj = true,
			say = "――「童心、無邪気、わんぱくリトルパラダイス」。",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			nameColor = "#A9F548FF",
			side = 2,
			bgName = "star_level_bg_503",
			hidePaintObj = true,
			say = "制御装置の操作パネルの前で、巨大な石膏オフニャが危険そうな青い光を目から輝かせていた。",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			nameColor = "#A9F548FF",
			side = 2,
			bgName = "star_level_bg_503",
			hidePaintObj = true,
			say = "そして、オフニャに立ち向かっている人物も――",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			expression = 3,
			side = 2,
			bgName = "star_level_bg_503",
			hidePaintObj = true,
			dir = 1,
			nameColor = "#A9F548FF",
			actor = 408131,
			say = "夕張だ！指揮官、夕張を見つけたよ！",
			painting = {
				alpha = 0.3,
				time = 1
			},
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			actor = 302019,
			side = 2,
			bgName = "star_level_bg_503",
			hidePaintObj = true,
			dir = 1,
			nameColor = "#A9F548FF",
			say = "よかった…みんな、よく来てくれた！",
			painting = {
				alpha = 0.3,
				time = 1
			},
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			actor = 0,
			side = 2,
			bgName = "star_level_bg_503",
			factiontag = "通信モード",
			hidePaintObj = true,
			nameColor = "#A9F548FF",
			say = "――夕張、状況はどうなってる？",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			expression = 3,
			side = 2,
			bgName = "star_level_bg_503",
			hidePaintObj = true,
			dir = 1,
			nameColor = "#A9F548FF",
			actor = 302019,
			say = "まだ膠着状態だけど…でも指揮官とみんなの助けがあれば、この危機は必ず打開できるぞ",
			painting = {
				alpha = 0.3,
				time = 1
			},
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			nameColor = "#A9F548FF",
			side = 2,
			bgName = "star_level_bg_503",
			hidePaintObj = true,
			say = "巨大石膏オフニャに警戒しつつ、夕張は手短に状況を説明してくれた。",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			nameColor = "#A9F548FF",
			side = 2,
			bgName = "star_level_bg_503",
			hidePaintObj = true,
			say = "今日は「学園オトモシステム」の定期メンテナンス日。いつも通り設備を点検しようとシャットダウンした時、異常事態が発生した。",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			nameColor = "#A9F548FF",
			side = 2,
			bgName = "star_level_bg_503",
			hidePaintObj = true,
			say = "シャットダウンされたはずのシステムが異常稼働し、併設の生産ラインから石膏オフニャが次から次へと作り出された。",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			nameColor = "#A9F548FF",
			side = 2,
			bgName = "star_level_bg_503",
			hidePaintObj = true,
			say = "夕張が生産ラインの問題に集中せざるを得なくなり、その隙を狙われ工具箱を奪われてしまい――",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			nameColor = "#A9F548FF",
			side = 2,
			bgName = "star_level_bg_503",
			hidePaintObj = true,
			say = "その後、学園全体を覆う特殊な空間が現れ、異変が母港の皆に知られることとなった。",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			actor = 0,
			side = 2,
			bgName = "star_level_bg_503",
			factiontag = "通信モード",
			hidePaintObj = true,
			nameColor = "#A9F548FF",
			say = "――夕張の工具箱を奪ったのも、特殊な空間を作り出したのも、ここで夕張と対峙している巨大石膏オフニャに違いないな",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			actor = 302019,
			side = 2,
			bgName = "star_level_bg_503",
			hidePaintObj = true,
			dir = 1,
			nameColor = "#A9F548FF",
			say = "うん。気づいた時、すべて遅すぎた…",
			painting = {
				alpha = 0.3,
				time = 1
			},
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			expression = 3,
			side = 2,
			bgName = "star_level_bg_503",
			hidePaintObj = true,
			dir = 1,
			nameColor = "#A9F548FF",
			actor = 302019,
			say = "でも、オトモシステムにはまだ最後の安全装置がある――",
			painting = {
				alpha = 0.3,
				time = 1
			},
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			nameColor = "#A9F548FF",
			side = 2,
			bgName = "star_level_bg_503",
			hidePaintObj = true,
			say = "夕張は片手にしっかりと握られているレバーを指さした。",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			actor = 302019,
			side = 2,
			bgName = "star_level_bg_503",
			hidePaintObj = true,
			dir = 1,
			nameColor = "#A9F548FF",
			say = "このレバーを下ろして、5秒以内に制御パネルで正確なボタンを押されさえしなければ、オトモシステムの電源を強制的に切ることができる。",
			painting = {
				alpha = 0.3,
				time = 1
			},
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			expression = 3,
			side = 2,
			bgName = "star_level_bg_503",
			hidePaintObj = true,
			dir = 1,
			nameColor = "#A9F548FF",
			actor = 302019,
			say = "逆に、オトモシステムをオーバーロードさせて特殊空間を広げられると、こっちもレバーを下ろしてオーバーロードを無効化しないといけない…",
			painting = {
				alpha = 0.3,
				time = 1
			},
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			expression = 1,
			side = 2,
			bgName = "star_level_bg_503",
			hidePaintObj = true,
			dir = 1,
			nameColor = "#A9F548FF",
			actor = 302019,
			say = "だから…みんなが見ての通り、先に手を出したほうが負ける膠着状態に…",
			painting = {
				alpha = 0.3,
				time = 1
			},
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			side = 2,
			actorName = "純真無垢・石膏オフニャ",
			bgName = "star_level_bg_503",
			hidePaintObj = true,
			nameColor = "#FF9B93",
			say = "にゃ～～～～～！",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			},
			icon = {
				scale = 1,
				image = "Props/shigaomiao_yongbaotongxin",
				pos = {
					0,
					0
				}
			}
		},
		{
			expression = 6,
			side = 2,
			bgName = "star_level_bg_503",
			hidePaintObj = true,
			dir = 1,
			nameColor = "#A9F548FF",
			actor = 408131,
			say = "ふっふん、なるほど～",
			painting = {
				alpha = 0.3,
				time = 1
			},
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			actor = 408131,
			side = 2,
			bgName = "star_level_bg_503",
			hidePaintObj = true,
			dir = 1,
			nameColor = "#A9F548FF",
			say = "んで、わたしたちが来て状況が変わったってことでいいよね？",
			painting = {
				alpha = 0.3,
				time = 1
			},
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			actor = 405060,
			side = 2,
			bgName = "star_level_bg_503",
			hidePaintObj = true,
			dir = 1,
			nameColor = "#A9F548FF",
			say = "作戦目標「おかしくなった石膏オフニャを倒す」、ね",
			painting = {
				alpha = 0.3,
				time = 1
			},
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			expression = 3,
			side = 2,
			bgName = "star_level_bg_503",
			hidePaintObj = true,
			dir = 1,
			nameColor = "#A9F548FF",
			actor = 102200,
			say = "あいつを倒せば、みんな帰れるんだぞ！",
			painting = {
				alpha = 0.3,
				time = 1
			},
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			expression = 8,
			side = 2,
			bgName = "star_level_bg_503",
			hidePaintObj = true,
			dir = 1,
			nameColor = "#A9F548FF",
			actor = 307140,
			say = "戻れば…柔らかくも心地よき寝床と、指揮官も…",
			painting = {
				alpha = 0.3,
				time = 1
			},
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			expression = 4,
			side = 2,
			bgName = "star_level_bg_503",
			hidePaintObj = true,
			dir = 1,
			nameColor = "#A9F548FF",
			actor = 102210,
			say = "みんな、行くよー☆",
			painting = {
				alpha = 0.3,
				time = 1
			},
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			},
			action = {
				{
					type = "shake",
					y = 30,
					delay = 0,
					dur = 0.15,
					x = 0,
					number = 2
				}
			}
		}
	}
}
