return {
	id = "ZHENLIXUEYUANDEZHUANXIAOSHENG10-2",
	mode = 2,
	fadeOut = 1.5,
	scripts = {
		{
			NextIcon = 1,
			side = 2,
			bgName = "star_level_bg_130",
			hidePaintObj = true,
			nameColor = "#A9F548FF",
			bgm = "battle-inthememory",
			say = "轰隆隆——",
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
			actor = 705100,
			nameColor = "#A9F548FF",
			bgName = "star_level_bg_130",
			hidePaintObj = true,
			dir = 1,
			NextIcon = 1,
			side = 2,
			say = "哈……老师，你为了转校生同学，真的很拼命呢。",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			expression = 5,
			side = 2,
			bgName = "star_level_bg_130",
			NextIcon = 1,
			dir = 1,
			actor = 705100,
			nameColor = "#A9F548FF",
			hidePaintObj = true,
			say = "只是战斗的话，我大概永远不可能赢过你吧……",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			actor = 705100,
			nameColor = "#A9F548FF",
			bgName = "star_level_bg_130",
			hidePaintObj = true,
			dir = 1,
			NextIcon = 1,
			side = 2,
			say = "不过，我不需要赢。只要拖延时间就够了。",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			side = 2,
			jumpto = "ZHENLIXUEYUANDEZHUANXIAOSHENG11-1",
			dir = 1,
			blackBg = true,
			say = "",
			globalOptionFlag = {
				id = 1,
				section = {
					{
						1,
						1
					}
				}
			},
			flashout = {
				black = true,
				dur = 0.5,
				alpha = {
					0,
					1
				}
			},
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			side = 2,
			jumpto = "ZHENLIXUEYUANDEZHUANXIAOSHENG11-2",
			dir = 1,
			blackBg = true,
			say = "",
			globalOptionFlag = {
				id = 1,
				section = {
					{
						2,
						2
					}
				}
			},
			flashout = {
				black = true,
				dur = 0.5,
				alpha = {
					0,
					1
				}
			},
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			side = 2,
			jumpto = "ZHENLIXUEYUANDEZHUANXIAOSHENG11-3",
			dir = 1,
			blackBg = true,
			say = "",
			globalOptionFlag = {
				id = 1,
				section = {
					{
						3,
						3
					}
				}
			},
			flashout = {
				black = true,
				dur = 0.5,
				alpha = {
					0,
					1
				}
			},
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		}
	}
}
