return {
	id = "ZHENLIXUEYUANDEZHUANXIAOSHENG6-3",
	mode = 2,
	fadeOut = 1.5,
	scripts = {
		{
			side = 2,
			NextIcon = 1,
			bgName = "star_level_bg_381",
			hidePaintObj = true,
			nameColor = "#A9F548FF",
			bgm = "story-richang-afterschool",
			say = "轰隆隆——",
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
			expression = 3,
			side = 2,
			bgName = "star_level_bg_381",
			NextIcon = 1,
			dir = 1,
			actor = 201361,
			nameColor = "#A9F548FF",
			hidePaintObj = true,
			say = "对不起，我们知道错了！",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			side = 2,
			NextIcon = 1,
			bgName = "star_level_bg_381",
			hidePaintObj = true,
			nameColor = "#A9F548FF",
			say = "在我们击退了所有怪物后，乖乖认错的学生们交出了圣杯。",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			expression = 5,
			side = 2,
			bgName = "star_level_bg_381",
			NextIcon = 1,
			dir = 1,
			actor = 705100,
			nameColor = "#A9F548FF",
			hidePaintObj = true,
			say = "这就是传闻中提到的圣杯……",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			portrait = "zhihuiguan",
			side = 2,
			bgName = "star_level_bg_381",
			hidePaintObj = true,
			actor = 0,
			NextIcon = 1,
			nameColor = "#A9F548FF",
			say = "看起来不像是可以物理破坏的样子。",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			actor = 705110,
			nameColor = "#A9F548FF",
			bgName = "star_level_bg_381",
			hidePaintObj = true,
			dir = 1,
			NextIcon = 1,
			side = 2,
			say = "能让我仔细看看吗？",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			side = 2,
			NextIcon = 1,
			bgName = "star_level_bg_381",
			hidePaintObj = true,
			nameColor = "#A9F548FF",
			say = "玛丽亚靠近时，她怀中的宝石突然发出了耀眼的强光——",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			side = 2,
			NextIcon = 1,
			bgName = "star_level_bg_381",
			hidePaintObj = true,
			nameColor = "#A9F548FF",
			say = "强光消散过后，圣杯凭空消失了，像是从未存在过。",
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
			}
		},
		{
			expression = 4,
			side = 2,
			bgName = "star_level_bg_381",
			NextIcon = 1,
			dir = 1,
			actor = 705110,
			nameColor = "#A9F548FF",
			hidePaintObj = true,
			say = "圣杯……消失不见了？",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			side = 2,
			NextIcon = 1,
			bgName = "star_level_bg_381",
			hidePaintObj = true,
			nameColor = "#A9F548FF",
			say = "与此同时，房间里遍地的糖果、美食、现金……则变成了粉笔、树叶和稿纸。",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			expression = 4,
			side = 2,
			bgName = "star_level_bg_381",
			NextIcon = 1,
			dir = 1,
			actor = 705110,
			nameColor = "#A9F548FF",
			hidePaintObj = true,
			say = "这才是那些怪物的真面目……",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			portrait = "zhihuiguan",
			side = 2,
			bgName = "star_level_bg_381",
			hidePaintObj = true,
			actor = 0,
			NextIcon = 1,
			nameColor = "#A9F548FF",
			say = "所谓的实现愿望原来只是假象。",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			expression = 3,
			side = 2,
			bgName = "star_level_bg_381",
			NextIcon = 1,
			dir = 1,
			actor = 201361,
			nameColor = "#A9F548FF",
			hidePaintObj = true,
			say = "等等，我们这几天吃的……是这些东西吗？！",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			},
			action = {
				{
					type = "shake",
					y = 45,
					delay = 0,
					dur = 0.15,
					x = 0,
					number = 2
				}
			}
		},
		{
			expression = 3,
			side = 2,
			bgName = "star_level_bg_381",
			NextIcon = 1,
			dir = 1,
			actor = 101161,
			nameColor = "#A9F548FF",
			hidePaintObj = true,
			say = "我突然感觉肚子不太舒服……",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			actor = 101271,
			nameColor = "#A9F548FF",
			bgName = "star_level_bg_381",
			hidePaintObj = true,
			dir = 1,
			NextIcon = 1,
			side = 2,
			say = "我也是！我要上厕所！",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			},
			action = {
				{
					type = "move",
					y = 0,
					delay = 1,
					dur = 1,
					x = 2500
				}
			}
		},
		{
			side = 2,
			NextIcon = 1,
			bgName = "star_level_bg_381",
			hidePaintObj = true,
			nameColor = "#A9F548FF",
			say = "几个人一溜烟地冲出了房间。",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			portrait = "zhihuiguan",
			side = 2,
			bgName = "star_level_bg_381",
			hidePaintObj = true,
			actor = 0,
			NextIcon = 1,
			nameColor = "#A9F548FF",
			say = "重点是，玛丽亚的宝石为什么能让圣杯的作用消失？",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			expression = 3,
			side = 2,
			bgName = "star_level_bg_381",
			NextIcon = 1,
			dir = 1,
			actor = 705110,
			nameColor = "#A9F548FF",
			hidePaintObj = true,
			say = "或者，我真的像同学们说的那样……是个天生的邪术师？",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			expression = 7,
			side = 2,
			bgName = "star_level_bg_381",
			NextIcon = 1,
			dir = 1,
			actor = 705100,
			nameColor = "#A9F548FF",
			hidePaintObj = true,
			say = "我想并非如此……关于圣杯与宝石的联系，我在图书馆的校史中发现了蛛丝马迹。",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			expression = 7,
			side = 2,
			bgName = "star_level_bg_381",
			NextIcon = 1,
			dir = 1,
			actor = 705100,
			nameColor = "#A9F548FF",
			hidePaintObj = true,
			say = "「罗曼蒂克圣杯」是玛丽亚同学的宫廷教师，也就是学院的创始人亲自发现的。",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			expression = 5,
			side = 2,
			bgName = "star_level_bg_381",
			NextIcon = 1,
			dir = 1,
			actor = 705100,
			nameColor = "#A9F548FF",
			hidePaintObj = true,
			say = "据记载，它可以实现许愿者任何有关“浪漫”的愿望。",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			expression = 1,
			side = 2,
			bgName = "star_level_bg_381",
			NextIcon = 1,
			dir = 1,
			actor = 702130,
			nameColor = "#A9F548FF",
			hidePaintObj = true,
			say = "如果这个真的是「罗曼蒂克圣杯」，那用创始人留下的宝石能够消除其效果，或许也能说得通。",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			expression = 6,
			side = 2,
			bgName = "star_level_bg_381",
			NextIcon = 1,
			dir = 1,
			actor = 702130,
			nameColor = "#A9F548FF",
			hidePaintObj = true,
			say = "就有点类似“锁”和“钥匙”的关系呢……",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			expression = 4,
			side = 2,
			bgName = "star_level_bg_381",
			NextIcon = 1,
			dir = 1,
			actor = 705110,
			nameColor = "#A9F548FF",
			hidePaintObj = true,
			say = "浪漫的愿望……？好模糊的范围。",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			expression = 3,
			side = 2,
			bgName = "star_level_bg_381",
			NextIcon = 1,
			dir = 1,
			actor = 705100,
			nameColor = "#A9F548FF",
			hidePaintObj = true,
			say = "但英雄她们许的愿望，和浪漫完全不沾边吧。即使如此还是实现了？",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			expression = 1,
			side = 2,
			bgName = "star_level_bg_381",
			NextIcon = 1,
			dir = 1,
			actor = 702130,
			nameColor = "#A9F548FF",
			hidePaintObj = true,
			say = "对于圣杯，我们还是知之甚少……",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			expression = 3,
			side = 2,
			bgName = "star_level_bg_381",
			NextIcon = 1,
			dir = 1,
			actor = 702130,
			nameColor = "#A9F548FF",
			hidePaintObj = true,
			say = "不过，至少眼下的危机算是解除了，大家先回去休息吧。",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			bgName = "star_level_bg_381",
			mode = 1,
			asideType = 4,
			spacing = 30,
			rectMargin = {
				100,
				100,
				200,
				200
			},
			sequence = {
				{
					"<size=45>「距离玛丽亚访学结束，还有<color=#ff5c5c>四天</color>——」</size>",
					0
				}
			}
		}
	}
}
