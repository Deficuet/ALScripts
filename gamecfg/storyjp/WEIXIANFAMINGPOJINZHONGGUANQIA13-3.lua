return {
	id = "WEIXIANFAMINGPOJINZHONGGUANQIA13-3",
	mode = 2,
	fadeOut = 1.5,
	scripts = {
		{
			nameColor = "#A9F548FF",
			side = 2,
			bgName = "star_level_bg_504",
			say = "それでも、敵の包囲を突破しつつ撤退する道は厳しかった。",
			bgm = "story-richang-refreshing",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			portrait = 11100060,
			side = 2,
			bgName = "star_level_bg_504",
			hidePainting = true,
			dir = 1,
			actor = 11100060,
			nameColor = "#A9F548FF",
			say = "こ、こいつら、どこから湧いてきたのよ",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			portrait = 11100050,
			side = 2,
			bgName = "star_level_bg_504",
			hidePainting = true,
			dir = 1,
			actor = 11100050,
			nameColor = "#A9F548FF",
			say = "お、お願い…近寄らないで…！",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			actor = 11100020,
			side = 2,
			bgName = "star_level_bg_504",
			nameColor = "#A9F548FF",
			dir = 1,
			say = "なっ…水中から出てきただと！？",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			actor = 202330,
			side = 2,
			bgName = "star_level_bg_504",
			hidePaintObj = true,
			dir = 1,
			nameColor = "#A9F548FF",
			say = "まずいですね…メイド長、敵は客人たちを連れ去るつもりです！",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			nameColor = "#A9F548FF",
			side = 2,
			bgName = "star_level_bg_504",
			say = "ーーーーーー！",
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
			actor = 202120,
			side = 2,
			bgName = "star_level_bg_504",
			nameColor = "#A9F548FF",
			dir = 1,
			say = "……っ！？間に合いません…！！",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			expression = 10,
			side = 2,
			bgName = "star_level_bg_504",
			actor = 11100030,
			dir = 1,
			nameColor = "#A9F548FF",
			say = "春菜さん！古手川さん！",
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
			nameColor = "#A9F548FF",
			side = 2,
			bgName = "star_level_bg_504",
			say = "一瞬の出来事だった。春菜と唯は突如現れた無数のコピー体たちに取り囲まれ、そのまま戦場から連れ去られてしまったのだった。",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		}
	}
}
