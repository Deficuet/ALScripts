return {
	id = "SHENGYINQIANDETONGMENG2-3",
	mode = 2,
	fadeOut = 1.5,
	scripts = {
		{
			bgm = "battle-shenguang-freely",
			side = 2,
			bgName = "star_level_bg_549",
			nameColor = "#A9F548FF",
			say = "轰————！",
			soundeffect = "event:/battle/boom2",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			},
			flashin = {
				delay = 0,
				dur = 1,
				black = true,
				alpha = {
					1,
					0
				}
			},
			location = {
				"？？？·？？？",
				3
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
			actor = 9701110,
			side = 2,
			bgName = "star_level_bg_549",
			factiontag = "神圣联合帝国",
			dir = 1,
			nameColor = "#FFC960",
			say = "嗯——敌人的密度已经十分稀薄了，新一批还没有产生……好机会。",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			expression = 6,
			side = 2,
			bgName = "star_level_bg_549",
			factiontag = "神圣联合帝国",
			dir = 1,
			actor = 9701110,
			nameColor = "#FFC960",
			say = "便携式自动驱散装置——启动！",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			nameColor = "#A9F548FF",
			side = 2,
			bgName = "star_level_bg_518",
			say = "伴随着装置的启动，齐颂之音在空间各处同时响起。",
			bgm = "battle-shenguang-holy",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			},
			flashout = {
				black = false,
				dur = 0.5,
				alpha = {
					0,
					1
				}
			},
			flashin = {
				delay = 0.5,
				dur = 0.5,
				black = false,
				alpha = {
					1,
					0
				}
			}
		},
		{
			nameColor = "#A9F548FF",
			side = 2,
			bgName = "star_level_bg_518",
			say = "没等我仔细分辨其中吟诵的内容，黑境就在转瞬间悄无声息地瓦解了。",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			expression = 3,
			side = 2,
			bgName = "star_level_bg_518",
			factiontag = "神圣联合帝国",
			dir = 1,
			paintingNoise = true,
			actor = 9701110,
			nameColor = "#FFC960",
			say = "哼~哼哼♪委托结束！",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		}
	}
}
