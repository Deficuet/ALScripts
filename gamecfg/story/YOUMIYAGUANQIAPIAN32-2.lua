return {
	id = "YOUMIYAGUANQIAPIAN32-2",
	mode = 2,
	fadeOut = 1.5,
	scripts = {
		{
			expression = 7,
			side = 2,
			bgName = "star_level_bg_650",
			actor = 11300040,
			dir = 1,
			nameColor = "#A9F548FF",
			say = "……大家小心，在那边的应该就是我们要打的敌人……！",
			bgm = "yumia-az-battle",
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
			side = 2,
			actorName = "？？？",
			bgName = "star_level_bg_650",
			nameColor = "#FF9B93",
			dir = 1,
			say = "…………",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			},
			movableNode = {
				{
					time = 1000,
					name = "weixu_baojian_2",
					spine = {
						action = "normal",
						scale = 1
					},
					path = {
						{
							0,
							-100
						},
						{
							0,
							-100
						}
					}
				}
			}
		},
		{
			actor = 501020,
			side = 2,
			bgName = "star_level_bg_650",
			nameColor = "#A9F548FF",
			dir = 1,
			say = "你就是维序者？",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			actor = 501020,
			side = 2,
			bgName = "star_level_bg_650",
			nameColor = "#A9F548FF",
			dir = 1,
			say = "这场大冒……这场邪恶的阴谋是你发起的吗！",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			side = 2,
			actorName = "？？？",
			bgName = "star_level_bg_650",
			nameColor = "#FF9B93",
			dir = 1,
			say = "…………",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			},
			movableNode = {
				{
					time = 1000,
					name = "weixu_baojian_2",
					spine = {
						action = "normal",
						scale = 1
					},
					path = {
						{
							0,
							-100
						},
						{
							0,
							-100
						}
					}
				}
			}
		},
		{
			actor = 501020,
			side = 2,
			bgName = "star_level_bg_650",
			nameColor = "#A9F548FF",
			dir = 1,
			say = "它说是！",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			expression = 3,
			nameColor = "#A9F548FF",
			bgName = "star_level_bg_650",
			side = 2,
			dir = 1,
			actor = 11300020,
			say = "……它不是什么话都没说吗？",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			actor = 501020,
			side = 2,
			bgName = "star_level_bg_650",
			nameColor = "#A9F548FF",
			dir = 1,
			say = "不说话就代表默认了啊~",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			expression = 1,
			nameColor = "#A9F548FF",
			bgName = "star_level_bg_650",
			side = 2,
			dir = 1,
			actor = 11300020,
			say = "有点道理……？",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			side = 2,
			actorName = "？？？",
			bgName = "star_level_bg_650",
			nameColor = "#FF9B93",
			dir = 1,
			say = "…………",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			},
			movableNode = {
				{
					time = 1000,
					name = "weixu_baojian_2",
					spine = {
						action = "normal",
						scale = 1
					},
					path = {
						{
							0,
							-100
						},
						{
							0,
							-100
						}
					}
				}
			}
		},
		{
			actor = 201390,
			side = 2,
			bgName = "star_level_bg_650",
			nameColor = "#A9F548FF",
			dir = 1,
			say = "啸啸（吹哨声）——大家注意，敌人向我们冲过来了！",
			soundeffect = "event:/ui/koushao",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			expression = 1,
			nameColor = "#A9F548FF",
			bgName = "star_level_bg_650",
			side = 2,
			dir = 1,
			actor = 9600100,
			say = "快点解决遗迹守护者，然后开始寻宝吧~",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			expression = 3,
			nameColor = "#A9F548FF",
			bgName = "star_level_bg_650",
			side = 2,
			dir = 1,
			actor = 11300010,
			say = "大家小心——！",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		}
	}
}
