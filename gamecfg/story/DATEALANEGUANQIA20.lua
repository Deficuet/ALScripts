return {
	id = "DATEALANEGUANQIA20",
	mode = 2,
	fadeOut = 1.5,
	scripts = {
		{
			nameColor = "#A9F548FF",
			side = 2,
			bgName = "bg_dal2",
			hidePaintObj = true,
			say = "在「佛拉克西纳斯AL」、白鹰舰队、重樱舰队与郁金王国舰队的联合打击下，五号战区中的敌人被尽数清理完毕了。",
			bgm = "dal-az-theme",
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
			actor = 11500060,
			nameColor = "#A9F548FF",
			bgName = "star_level_bg_211",
			hidePaintObj = true,
			actorName = "八舞耶俱矢",
			side = 2,
			say = "初次见面，被称为指挥官之人哟。",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			},
			location = {
				"佛拉克西纳斯AL·指挥室",
				3
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
			expression = 4,
			side = 2,
			bgName = "star_level_bg_211",
			hidePaintObj = true,
			actor = 11500060,
			actorName = "八舞耶俱矢",
			nameColor = "#A9F548FF",
			say = "吾等乃横扫万象的飓风巫女！八舞耶俱矢和——",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			actor = 11500060,
			nameColor = "#A9F548FF",
			bgName = "star_level_bg_211",
			hidePaintObj = true,
			side = 2,
			actorName = "八舞夕弦",
			say = "「同样。八舞夕弦。」",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			expression = 7,
			side = 2,
			bgName = "star_level_bg_211",
			hidePaintObj = true,
			actor = 11500060,
			actorName = "八舞耶俱矢",
			nameColor = "#A9F548FF",
			say = "感谢汝为吾等提供的帮助，接下来也与吾等并肩作战吧！",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			actor = 11500060,
			nameColor = "#A9F548FF",
			bgName = "star_level_bg_211",
			hidePaintObj = true,
			side = 2,
			actorName = "八舞夕弦",
			say = "「附议，让不守规矩的敌人好好尝尝苦头吧。」",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		}
	}
}
