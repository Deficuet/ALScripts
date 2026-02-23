return {
	id = "DATEALANEGUANQIA27",
	mode = 2,
	fadeOut = 1.5,
	scripts = {
		{
			bgm = "theme-dos",
			side = 2,
			bgName = "bg_zhuiluo_2",
			nameColor = "#A9F548FF",
			say = "KABOOOM!",
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
			actor = 105170,
			side = 2,
			bgName = "bg_zhuiluo_2",
			nameColor = "#A9F548FF",
			dir = 1,
			say = "Honey~♪ The Eagle Union Main Fleet is coming to your rescue~!",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			actor = 118020,
			side = 2,
			bgName = "bg_zhuiluo_2",
			nameColor = "#A9F548FF",
			dir = 1,
			say = "Hahah! The battle's heating up! We came at the perfect time!",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			expression = 2,
			nameColor = "#A9F548FF",
			bgName = "bg_zhuiluo_2",
			side = 2,
			dir = 1,
			actor = 199040,
			say = "Combat power sufficient. Commencing enemy annihilation!",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		}
	}
}
