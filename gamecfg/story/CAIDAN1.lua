return {
	fadeOut = 1.5,
	mode = 2,
	id = "CAIDAN1",
	placeholder = {
		"playername"
	},
	scripts = {
		{
			side = 2,
			NextIcon = 1,
			bgName = "star_level_bg_308",
			hidePaintObj = true,
			nameColor = "#A9F548FF",
			say = "再次睁开眼时，映入眼帘的是一尘不染的天花板。",
			bgm = "story-hospital-light",
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
			effects = {
				{
					active = true,
					name = "memoryFog"
				}
			}
		},
		{
			side = 2,
			NextIcon = 1,
			bgName = "star_level_bg_308",
			hidePaintObj = true,
			nameColor = "#A9F548FF",
			say = "空气里飘着淡淡的消毒水味，以及……炸薯条的香味。",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			side = 2,
			NextIcon = 1,
			bgName = "star_level_bg_308",
			hidePaintObj = true,
			nameColor = "#A9F548FF",
			say = "少女充满活力的声音从床旁的白色拉帘后传来。",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			side = 2,
			nameColor = "#A9F548FF",
			bgName = "star_level_bg_308",
			hidePaintObj = true,
			dir = 1,
			NextIcon = 1,
			actorName = "？？",
			say = "呀，指挥官这么快就醒啦！",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			side = 2,
			nameColor = "#A9F548FF",
			bgName = "star_level_bg_308",
			hidePaintObj = true,
			dir = 1,
			NextIcon = 1,
			actorName = "？？",
			say = "你想吃浪漫觉醒成人套餐，还是想吃趣味永存儿童套餐？",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			portrait = "zhihuiguan",
			side = 2,
			bgName = "star_level_bg_308",
			hidePaintObj = true,
			actor = 0,
			NextIcon = 1,
			nameColor = "#A9F548FF",
			say = "……成人餐吧。",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			portrait = "zhihuiguan",
			side = 2,
			bgName = "star_level_bg_308",
			hidePaintObj = true,
			actor = 0,
			NextIcon = 1,
			nameColor = "#A9F548FF",
			say = "不过，如果有附送玩具，感觉也不错。",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		}
	}
}
