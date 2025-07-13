return {
	defaultTb = 2001,
	mode = 2,
	fadeOut = 1.5,
	id = "LINGYANGZHEYANGCHENGJIHUA5",
	placeholder = {
		"tb"
	},
	scripts = {
		{
			expression = 7,
			side = 2,
			bgName = "bg_project_oceana_room1",
			tbActor = true,
			actorName = "ナビィ",
			bgm = "qe-ova-2",
			actor = 2001,
			nameColor = "#A9F548FF",
			hidePaintObj = true,
			say = "へぇ～なるほどね。{tb}って呼んでほしいわけ？",
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
			expression = 8,
			side = 2,
			bgName = "bg_project_oceana_room1",
			actorName = "ナビィ",
			tbActor = true,
			actor = 2001,
			nameColor = "#A9F548FF",
			hidePaintObj = true,
			say = "なら今日からそう呼んでやるわ。{tb}〜",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			nameColor = "#A9F548FF",
			side = 2,
			bgName = "bg_project_oceana_room1",
			hidePaintObj = true,
			say = "こうして、ナビィとの共同生活が正式に幕を開けたのだった――",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		}
	}
}
