return {
	id = "ISLANDSIDE01304",
	mode = 10,
	map = {
		{
			100200,
			10020009
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
			characterId = 0,
			say = "帕特莉，如果现在订购薰衣草肥料的话，大概要多久可以到货？",
			animation = "talk",
			face2Face = {
				{
					0,
					100200
				}
			},
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			animation = "talk",
			characterId = 100200,
			subName = "订单管理员",
			say = "薰衣草肥料对吧……帕特莉这就帮指挥官查一查~",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			subName = "订单管理员",
			characterId = 100200,
			say = "唔，糟糕……",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			say = "最近薰衣草肥料缺货了，可能得等上一个月才行……",
			characterId = 100200,
			subName = "订单管理员",
			animation = "embarrass",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			characterId = 0,
			say = "那样的话完全来不及……",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			subName = "订单管理员",
			characterId = 100200,
			say = "不过，如果指挥官你着急需要的话……",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			animation = "idea",
			characterId = 100200,
			subName = "订单管理员",
			say = "我倒是知道一个地方可能会有薰衣草肥料哦！",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			subName = "订单管理员",
			characterId = 100200,
			say = "货运中心那边里，堆放了许多无人认领的货物……在哪里说不定能找到肥料！",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			characterId = 0,
			say = "这是最后的机会么……我马上就去。",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			animation = "bye",
			characterId = 100200,
			subName = "订单管理员",
			say = "要是找到了的话，记得要回来帕特莉这边登记哦~",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		}
	}
}
