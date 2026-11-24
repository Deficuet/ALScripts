return {
	id = "ZHENLIXUEYUANDEZHUANXIAOSHENG6-1",
	mode = 2,
	fadeOut = 1.5,
	scripts = {
		{
			NextIcon = 1,
			side = 2,
			bgName = "star_level_bg_311",
			hidePaintObj = true,
			nameColor = "#A9F548FF",
			say = "随着对校舍探索的深入，一阵阵低沉的咆哮声从黑暗中传来。",
			bgm = "theme-hospitalnight-mystic",
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
			location = {
				"真理学院·旧校舍",
				3
			}
		},
		{
			side = 2,
			NextIcon = 1,
			bgName = "star_level_bg_311",
			hidePaintObj = true,
			nameColor = "#A9F548FF",
			say = "吼——",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			expression = 4,
			side = 2,
			bgName = "star_level_bg_311",
			NextIcon = 1,
			dir = 1,
			actor = 705110,
			nameColor = "#A9F548FF",
			hidePaintObj = true,
			say = "那是什么声音……",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			side = 2,
			NextIcon = 1,
			bgName = "star_level_bg_311",
			hidePaintObj = true,
			nameColor = "#A9F548FF",
			say = "走廊尽头，数只奇怪的生物正在缓慢地游荡。",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			bgName = "star_level_bg_311",
			mode = 1,
			sequence = {
				{
					"",
					0
				}
			},
			movableNode = {
				{
					time = 3,
					name = "katong_hangmu",
					spine = {
						action = "move",
						scale = 1.3
					},
					path = {
						{
							-1500,
							-200
						},
						{
							1800,
							-200
						}
					}
				},
				{
					delay = 0.4,
					name = "katong_zhongxun",
					time = 3,
					spine = {
						action = "move",
						scale = 1.3
					},
					path = {
						{
							-1600,
							-200
						},
						{
							1800,
							-200
						}
					}
				},
				{
					delay = 0.8,
					name = "katong_zhongxun",
					time = 3,
					spine = {
						action = "move",
						scale = 1.3
					},
					path = {
						{
							-1700,
							-400
						},
						{
							1800,
							-400
						}
					}
				},
				{
					delay = 1.2,
					name = "katong_zibao",
					time = 3,
					spine = {
						action = "move",
						scale = 1.3
					},
					path = {
						{
							-1800,
							-100
						},
						{
							1800,
							-100
						}
					}
				},
				{
					time = 3,
					name = "katong_zibao",
					spine = {
						action = "move",
						scale = 1.3
					},
					path = {
						{
							-1550,
							-200
						},
						{
							1800,
							-200
						}
					}
				},
				{
					delay = 2,
					name = "katong_zibao",
					time = 3,
					spine = {
						action = "move",
						scale = 1.3
					},
					path = {
						{
							-1650,
							0
						},
						{
							1800,
							0
						}
					}
				}
			}
		},
		{
			side = 2,
			nameColor = "#FF9B93",
			bgName = "star_level_bg_311",
			hidePaintObj = true,
			NextIcon = 1,
			actorName = "财富？",
			say = "*每天睡在金币上♪*",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			},
			movableNode = {
				{
					time = 1000,
					name = "katong_hangmu",
					spine = {
						action = "",
						scale = 1.3
					},
					path = {
						{
							0,
							-200
						},
						{
							0,
							-200
						}
					}
				}
			}
		},
		{
			side = 2,
			nameColor = "#FF9B93",
			bgName = "star_level_bg_311",
			hidePaintObj = true,
			NextIcon = 1,
			actorName = "甜蜜？",
			say = "*好吃的糖果如泉涌♪*",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			},
			movableNode = {
				{
					time = 1000,
					name = "katong_zibao",
					spine = {
						action = "",
						scale = 1.3
					},
					path = {
						{
							0,
							-200
						},
						{
							0,
							-200
						}
					}
				}
			}
		},
		{
			side = 2,
			nameColor = "#FF9B93",
			bgName = "star_level_bg_311",
			hidePaintObj = true,
			NextIcon = 1,
			actorName = "美食？",
			say = "*一日三餐都是大鸡腿♪*",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			},
			movableNode = {
				{
					time = 1000,
					name = "katong_zhongxun",
					spine = {
						action = "",
						scale = 1.3
					},
					path = {
						{
							0,
							-200
						},
						{
							0,
							-200
						}
					}
				}
			}
		},
		{
			expression = 2,
			side = 2,
			bgName = "star_level_bg_311",
			NextIcon = 1,
			dir = 1,
			actor = 705110,
			nameColor = "#A9F548FF",
			hidePaintObj = true,
			say = "这些怪物的身体……是糖果构成的？",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			expression = 6,
			side = 2,
			bgName = "star_level_bg_311",
			NextIcon = 1,
			dir = 1,
			actor = 702130,
			nameColor = "#A9F548FF",
			hidePaintObj = true,
			say = "还有金币和烤鸡腿。",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			portrait = "zhihuiguan",
			side = 2,
			bgName = "star_level_bg_311",
			hidePaintObj = true,
			actor = 0,
			NextIcon = 1,
			nameColor = "#A9F548FF",
			say = "看来这些就是因为许愿而产生的怪物了。",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			expression = 3,
			side = 2,
			bgName = "star_level_bg_311",
			NextIcon = 1,
			dir = 1,
			actor = 705110,
			nameColor = "#A9F548FF",
			hidePaintObj = true,
			say = "明明都是为了变得幸福而许下的愿望，为什么会变成伤害别人的怪物呢……",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			side = 2,
			NextIcon = 1,
			bgName = "star_level_bg_311",
			hidePaintObj = true,
			nameColor = "#A9F548FF",
			say = "下一刻，怪物似乎发现了我们，嘶吼着向我们冲来。",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			actor = 702130,
			nameColor = "#A9F548FF",
			bgName = "star_level_bg_311",
			hidePaintObj = true,
			dir = 1,
			NextIcon = 1,
			side = 2,
			say = "别害怕，老师会保护你们。",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			expression = 7,
			side = 2,
			bgName = "star_level_bg_311",
			NextIcon = 1,
			dir = 1,
			actor = 705100,
			nameColor = "#A9F548FF",
			hidePaintObj = true,
			say = "别看我平时懒懒散散的……真要打起来，我可是很厉害的呢……",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			expression = 8,
			side = 2,
			bgName = "star_level_bg_311",
			NextIcon = 1,
			dir = 1,
			actor = 705100,
			nameColor = "#A9F548FF",
			hidePaintObj = true,
			say = "准确来说，是我的幽魂仆从们很厉害。",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		}
	}
}
