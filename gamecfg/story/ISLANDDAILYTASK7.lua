return {
	id = "ISLANDDAILYTASK7",
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
			animation = "doubt",
			characterId = 100200,
			subName = "订单管理员",
			say = "嗯？指挥官这么快就把我要的东西都准备好了吗？",
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
			subName = "订单管理员",
			characterId = 100200,
			say = "我看看……数量上没有问题！指挥官的效率真的很高呢~",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			subName = "订单管理员",
			characterId = 100200,
			say = "还好有你在，不然港口这么忙，都不知道该怎么办才好。",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			animation = "talk",
			characterId = 100200,
			subName = "订单管理员",
			say = "真是辛苦你了呢~",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		}
	}
}
