return {
	id = "YOUMIYAGUANQIAPIAN25",
	mode = 2,
	fadeOut = 1.5,
	scripts = {
		{
			mode = 1,
			stopbgm = true,
			bgName = "bg_yumia_4",
			asideType = 1,
			bgm = "yumia-az-theme-pv",
			sequence = {
				{
					"Chapter4",
					1
				},
				{
					"廃骸階層",
					2
				},
				{
					"海抜：約6000メートル",
					3
				}
			}
		},
		{
			nameColor = "#A9F548FF",
			side = 2,
			bgName = "star_level_bg_582",
			hidePaintObj = true,
			say = "再稼働させたエレベーターに乗り、一行は新しいエリアに足を踏み入れた。",
			bgm = "yumia-az-story",
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
			actor = 501020,
			side = 2,
			bgName = "star_level_bg_582",
			hidePaintObj = true,
			dir = 1,
			nameColor = "#A9F548FF",
			say = "『魍魎山岳帯。本物の幽霊が出没するから、お化け屋敷を作るのに持ってこいの場所。お客がいないのは残念だけどね——ピュリっち』",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			actor = 501020,
			side = 2,
			bgName = "star_level_bg_582",
			hidePaintObj = true,
			dir = 1,
			nameColor = "#A9F548FF",
			say = "確かに……これは残念だね……",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			expression = 1,
			side = 2,
			bgName = "star_level_bg_582",
			hidePaintObj = true,
			dir = 1,
			nameColor = "#A9F548FF",
			actor = 501090,
			say = "ゆ……幽霊……",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			expression = 3,
			side = 2,
			bgName = "star_level_bg_582",
			hidePaintObj = true,
			dir = 1,
			nameColor = "#A9F548FF",
			actor = 9600090,
			say = "なんだか嫌な感じがするわ",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			expression = 3,
			side = 2,
			bgName = "star_level_bg_582",
			hidePaintObj = true,
			dir = 1,
			nameColor = "#A9F548FF",
			actor = 11300010,
			say = "見つけました——狙いを定めて……撃ちます！",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			side = 2,
			nameColor = "#A9F548FF",
			bgName = "star_level_bg_582",
			hidePaintObj = true,
			say = "ドン————！",
			soundeffect = "event:/battle/boom2",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			},
			flashN = {
				color = {
					1,
					1,
					1,
					1
				},
				alpha = {
					{
						0,
						1,
						0.2,
						0
					},
					{
						1,
						0,
						0.2,
						0.2
					},
					{
						0,
						1,
						0.2,
						0.4
					},
					{
						1,
						0,
						0.2,
						0.6
					}
				}
			},
			dialogShake = {
				speed = 0.09,
				x = 8.5,
				number = 2
			}
		},
		{
			expression = 5,
			side = 2,
			bgName = "star_level_bg_582",
			hidePaintObj = true,
			dir = 1,
			nameColor = "#A9F548FF",
			actor = 501090,
			say = "躊躇わずに撃った……！？",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			actor = 11300010,
			side = 2,
			bgName = "star_level_bg_582",
			hidePaintObj = true,
			dir = 1,
			nameColor = "#A9F548FF",
			say = "放っておくと危険かもしれないので",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			expression = 2,
			side = 2,
			bgName = "star_level_bg_582",
			hidePaintObj = true,
			dir = 1,
			nameColor = "#A9F548FF",
			actor = 11300010,
			say = "それに、今までにないタイプの魔物なので、新しい材料が手に入るかもしれませんし……",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			expression = 4,
			side = 2,
			bgName = "star_level_bg_582",
			hidePaintObj = true,
			dir = 1,
			nameColor = "#A9F548FF",
			actor = 9600100,
			say = "……幽霊のようなぱっと消える魔物からでも材料は手に入るの？",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			actor = 11300010,
			side = 2,
			bgName = "star_level_bg_582",
			hidePaintObj = true,
			dir = 1,
			nameColor = "#A9F548FF",
			say = "もちろん入手できますよ。例えば気体のような素材とか……",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			expression = 5,
			side = 2,
			bgName = "star_level_bg_582",
			hidePaintObj = true,
			dir = 1,
			nameColor = "#A9F548FF",
			actor = 11300010,
			say = "もしかしたら、秘薬の隠し味としても使えるかもしれません！",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			actor = 9600100,
			side = 2,
			bgName = "star_level_bg_582",
			hidePaintObj = true,
			dir = 1,
			nameColor = "#A9F548FF",
			say = "にゃははは！幽霊狩り！幽霊狩りだ！",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			actor = 9600100,
			side = 2,
			bgName = "star_level_bg_582",
			hidePaintObj = true,
			dir = 1,
			nameColor = "#A9F548FF",
			say = "みんなで幽霊を狩りつくそう！",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		}
	}
}
