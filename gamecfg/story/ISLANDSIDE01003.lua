return {
	id = "ISLANDSIDE01003",
	mode = 10,
	map = {
		{
			100300,
			10020004
		}
	},
	look_weight = {
		{
			0.7,
			0
		},
		{
			0.3,
			0
		}
	},
	scripts = {
		{
			characterId = 100300,
			subName = "货运管理员",
			say = "指挥官，需要斯蒂芬妮为您做些什么吗？",
			face2Face = {
				{
					0,
					100300
				}
			},
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			say = "向斯蒂芬妮介绍了前情……",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			animation = "curious",
			characterId = 100300,
			subName = "货运管理员",
			say = "……哦，哦~原来是这样！",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			subName = "货运管理员",
			characterId = 100300,
			say = "想要支持帕特莉的话……就给她更多订单吧！",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			animation = "clap",
			characterId = 100300,
			subName = "货运管理员",
			say = "这样保证能让她感受到，您对她能力的绝对信任哦~",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			animation = "talk",
			characterId = 0,
			say = "我会当真的哦。",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			animation = "scare",
			characterId = 100300,
			subName = "货运管理员",
			say = "咦——我是开玩笑的啦！",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			subName = "货运管理员",
			characterId = 100300,
			say = "不过这种事情，指挥官问我也没用啦~",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			subName = "货运管理员",
			characterId = 100300,
			say = "帕特莉本人才最清楚自己需要什么呀。",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			animation = "nod",
			characterId = 0,
			say = "说的有道理，谢了，斯蒂芬妮。",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			subName = "货运管理员",
			characterId = 100300,
			say = "我又没做什么啦~期待您的好消息哦~",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		}
	}
}
