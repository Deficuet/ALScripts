return {
	id = "WEIXIANFAMINGPOJINZHONGGUANQIA15-3",
	mode = 2,
	fadeOut = 1.5,
	scripts = {
		{
			bgm = "story-richang-7",
			side = 2,
			bgName = "star_level_bg_504",
			nameColor = "#A9F548FF",
			say = "KABOOOOM!",
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
			hideOther = true,
			nameColor = "#A9F548FF",
			bgName = "star_level_bg_504",
			side = 0,
			dir = 1,
			actor = 11100050,
			actorName = "Haruna Sairenji & Yui Kotegawa",
			say = "Yami!",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			},
			subActors = {
				{
					paintingNoise = false,
					actor = 11100060,
					dir = 1,
					hidePaintObj = false,
					pos = {
						x = 1125,
						y = 0
					}
				}
			}
		},
		{
			actor = 11100040,
			side = 2,
			bgName = "star_level_bg_504",
			nameColor = "#A9F548FF",
			dir = 1,
			say = "...Mission complete.",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		}
	}
}
