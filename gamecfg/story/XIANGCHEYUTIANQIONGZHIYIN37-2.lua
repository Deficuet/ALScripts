return {
	id = "XIANGCHEYUTIANQIONGZHIYIN37-2",
	mode = 2,
	fadeOut = 1.5,
	scripts = {
		{
			nameColor = "#A9F548FF",
			side = 2,
			bgName = "bg_tianqiong_5",
			bgm = "battle-thechariotVII",
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
			actor = 900478,
			side = 2,
			bgName = "bg_tianqiong_5",
			nameColor = "#A9F548FF",
			dir = 1,
			say = "这个型号……启动VII=VI连协——",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			actor = 900478,
			side = 2,
			bgName = "bg_tianqiong_5",
			nameColor = "#A9F548FF",
			dir = 1,
			say = "开始清理！",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		}
	}
}
