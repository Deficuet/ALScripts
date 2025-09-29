return {
	id = "ISLANDSIDE00805",
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
			animation = "hi",
			say = "帕特莉，斯蒂芬妮的订单完成了。",
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
			animation = "clap",
			characterId = 100200,
			subName = "订单管理员",
			say = "呀，大救星回来啦，斯蒂芬妮那边的问题都处理好了吗？",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			characterId = 0,
			say = "嗯，她还临时加了需求，让我跑了两趟原野。",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			animation = "nod",
			characterId = 100200,
			subName = "订单管理员",
			say = "哇哦，不愧是指挥官，刚上手处理订单就这么快！",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			characterId = 0,
			say = "哦对，斯蒂芬妮还说要给我双倍报酬来着。",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			animation = "note",
			characterId = 100200,
			subName = "订单管理员",
			say = "嗯嗯，指挥官放心，我这里已经记下啦~",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			subName = "订单管理员",
			characterId = 100200,
			say = "订单完成，现在就可以给你结算奖励了~",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		}
	}
}
