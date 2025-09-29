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
			characterId = 0,
			animation = "talk",
			say = "帕特莉……就这些了对吧？确认无误了？",
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
			say = "嗯，数量和质量都没问题，辛苦指挥官了~",
			characterId = 100200,
			subName = "订单管理员",
			animation = "nod",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			characterId = 0,
			say = "没问题就好，顺便打听一下，你知道{namecode:98:明石}在哪里么？",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			say = "{namecode:98:明石}？指挥官看见那边的啾咖啡了吗？我经常在那附近看到她，指挥官可以去碰碰运气。",
			characterId = 100200,
			subName = "订单管理员",
			animation = "think",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			characterId = 0,
			say = "啾咖啡附近么……那我过去看看！",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			say = "呵呵，那指挥官，拜拜~",
			characterId = 100200,
			subName = "订单管理员",
			animation = "bye",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		}
	}
}
