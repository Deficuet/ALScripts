return {
	fadeOut = 1.5,
	mode = 2,
	id = "QIYUANXIADEMIMI20-1",
	placeholder = {
		"playername"
	},
	scripts = {
		{
			actor = 206040,
			side = 2,
			bgName = "star_level_bg_187",
			nameColor = "#A9F548FF",
			dir = 1,
			say = "——弓箭手预备！",
			bgm = "battle-tulipa",
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
			actor = 206040,
			nameColor = "#A9F548FF",
			bgName = "star_level_bg_187",
			side = 2,
			dir = 1,
			say = "——放箭！！",
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
			nameColor = "#A9F548FF",
			side = 2,
			bgName = "star_level_bg_187",
			say = "箭雨从城垛倾泻而下，却未能阻碍敌人的进军。",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			expression = 1,
			nameColor = "#A9F548FF",
			bgName = "star_level_bg_187",
			side = 2,
			dir = 1,
			actor = 205110,
			say = "半人马阁下，第一重防线被击破了！",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			expression = 3,
			nameColor = "#A9F548FF",
			bgName = "star_level_bg_187",
			side = 2,
			dir = 1,
			actor = 205140,
			say = "第二重防线告急！",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			expression = 1,
			nameColor = "#A9F548FF",
			bgName = "star_level_bg_187",
			side = 2,
			dir = 1,
			actor = 206040,
			say = "……坚持住！只需等待黎明降临！",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			expression = 3,
			nameColor = "#A9F548FF",
			bgName = "star_level_bg_187",
			side = 2,
			dir = 1,
			actor = 205140,
			say = "半人马，小心城墙裂口！",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			expression = 4,
			side = 2,
			bgName = "star_level_bg_187",
			actor = 206040,
			dir = 1,
			nameColor = "#A9F548FF",
			say = "糟糕……！",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			},
			options = {
				{
					content = "释放魔法——“舰炮齐射”",
					flag = 1
				}
			}
		},
		{
			nameColor = "#A9F548FF",
			side = 2,
			bgName = "star_level_bg_187",
			say = "整齐划一的炮弹划亮夜空，瞬间将准备涌入城中的敌人尽数消灭。",
			soundeffect = "event:/battle/boom2",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			},
			flashout = {
				black = false,
				dur = 0.5,
				alpha = {
					0,
					1
				}
			},
			flashin = {
				delay = 0.5,
				dur = 0.5,
				black = false,
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
			expression = 2,
			nameColor = "#A9F548FF",
			bgName = "star_level_bg_187",
			side = 2,
			dir = 1,
			actor = 206040,
			say = "法师阁下，您怎么来了！",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			actor = 0,
			nameColor = "#A9F548FF",
			bgName = "star_level_bg_187",
			side = 2,
			portrait = "zhihuiguan",
			say = "我们可是援军，不可能袖手旁观的啊。",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			expression = 4,
			nameColor = "#A9F548FF",
			bgName = "star_level_bg_187",
			side = 2,
			dir = 1,
			actor = 206040,
			say = "但是……",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			expression = 1,
			nameColor = "#A9F548FF",
			bgName = "star_level_bg_187",
			side = 2,
			dir = 1,
			actor = 205110,
			say = "不妙，城墙被砸塌了！",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			side = 2,
			actorName = "地狱恶魔啾莱姆",
			bgName = "star_level_bg_187",
			nameColor = "#FF9B93",
			say = "Demon啾~Demon啾~",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			},
			movableNode = {
				{
					time = 3.7,
					name = "jiulaimu_emo",
					spine = {
						action = "move",
						scale = 1
					},
					path = {
						{
							-1500,
							-280
						},
						{
							1500,
							-280
						}
					}
				},
				{
					time = 2.8,
					name = "jiulaimu_emo",
					spine = {
						action = "move",
						scale = 1
					},
					path = {
						{
							-1000,
							0
						},
						{
							1600,
							0
						}
					}
				},
				{
					time = 3.5,
					name = "jiulaimu_emo",
					spine = {
						action = "move",
						scale = 1
					},
					path = {
						{
							-1500,
							350
						},
						{
							1500,
							350
						}
					}
				},
				{
					time = 3,
					name = "jiulaimu_emo",
					spine = {
						action = "move",
						scale = 1
					},
					path = {
						{
							-1200,
							-350
						},
						{
							1600,
							-350
						}
					}
				}
			}
		}
	}
}
