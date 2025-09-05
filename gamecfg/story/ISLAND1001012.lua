return {
	id = "ISLAND1001012",
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
			subName = "订单管理员",
			characterId = 100200,
			animation = "nod",
			say = "嗯，数量和质量都没问题，辛苦指挥官了~",
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
			characterId = 0,
			say = "没问题就好。对了，你知道{namecode:98:明石}在哪里吗？",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			say = "{namecode:98:明石}么……指挥官看见那边的咖啡馆了吗？我经常在那附近遇到她的。",
			characterId = 100200,
			subName = "订单管理员",
			animation = "doubt",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			characterId = 0,
			say = "咖啡馆附近么……那我过去看看！",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			say = "呵呵，那指挥官可要小心些，别被她跑了哦~拜拜~",
			characterId = 100200,
			subName = "订单管理员",
			animation = "hi",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		}
	}
}
