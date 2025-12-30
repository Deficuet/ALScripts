return {
	id = "DATEALANEGUANQIA30",
	mode = 2,
	fadeOut = 1.5,
	scripts = {
		{
			bgm = "theme-dos",
			side = 2,
			bgName = "bg_zhuiluo_2",
			nameColor = "#A9F548FF",
			say = "——！",
			soundeffect = "event:/battle/boom2",
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
			actor = 599010,
			side = 2,
			bgName = "bg_zhuiluo_2",
			nameColor = "#A9F548FF",
			say = "はぁーん、噂には聞いていたが、実際目にすると圧巻だな",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			actor = 501010,
			side = 2,
			bgName = "bg_zhuiluo_2",
			nameColor = "#A9F548FF",
			dir = 1,
			say = "ご飯は一口ずつ、敵艦も一隻ずつ……戦場へ切り込む突破口を早く見つけないと",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			expression = 1,
			nameColor = "#A9F548FF",
			bgName = "bg_zhuiluo_2",
			side = 2,
			dir = 1,
			actor = 705050,
			say = "共に肩を並べて戦おう！",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		}
	}
}
