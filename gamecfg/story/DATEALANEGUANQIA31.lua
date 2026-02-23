return {
	id = "DATEALANEGUANQIA31",
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
			expression = 6,
			nameColor = "#A9F548FF",
			bgName = "bg_zhuiluo_2",
			side = 2,
			dir = 1,
			actor = 699010,
			say = "Ohohoho! Did you see that? Such is the might of Marco Polo!",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			actor = 306040,
			side = 2,
			bgName = "bg_zhuiluo_2",
			nameColor = "#A9F548FF",
			dir = 1,
			say = "Indeed! You're so very impressive! (*claps*)",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			actor = 699010,
			side = 2,
			bgName = "bg_zhuiluo_2",
			nameColor = "#A9F548FF",
			dir = 1,
			say = "Mwaha! I'll have you know, I've mastered far more impressive techniques! Allow me to display them against those enemies over there!",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			},
			action = {
				{
					type = "move",
					y = 0,
					delay = 0.6,
					dur = 0.5,
					x = -2500
				}
			}
		},
		{
			actor = 306040,
			side = 2,
			bgName = "bg_zhuiluo_2",
			nameColor = "#A9F548FF",
			dir = 1,
			say = "Of course! I shall gladly follow you!",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			},
			action = {
				{
					type = "move",
					y = 0,
					delay = 0.6,
					dur = 0.5,
					x = -2500
				}
			}
		},
		{
			actor = 301290,
			side = 2,
			bgName = "bg_zhuiluo_2",
			nameColor = "#A9F548FF",
			dir = 1,
			say = "Ack... Wait for me, Zuihouuu!",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			},
			action = {
				{
					type = "move",
					y = 0,
					delay = 0.6,
					dur = 0.5,
					x = -2500
				}
			}
		}
	}
}
