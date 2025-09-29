return {
	id = "ISLANDSIDE00203",
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
			characterId = 0,
			animation = "hi",
			say = "斯蒂芬妮，还在忙么？",
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
			animation = "doubt",
			characterId = 100300,
			subName = "货运管理员",
			say = "指挥官？是……是订单有什么问题吗？",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			characterId = 0,
			say = "不是订单的事，别紧张。",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			animation = "talk",
			characterId = 0,
			say = "其实是这样……",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			animation = "think",
			characterId = 100300,
			subName = "货运管理员",
			say = "欸？写生？绘画相关的事……",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			subName = "货运管理员",
			characterId = 100300,
			say = "其实我不太懂这些艺术的东西……我的世界就是委托、货物和货船……",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			characterId = 0,
			say = "不是找你要专业的绘画建议。",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			characterId = 0,
			say = "只是还没有明确的想法，所以到处转转，看看能不能碰到什么能触动我的场景或事物。",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			animation = "doubt",
			characterId = 100300,
			subName = "货运管理员",
			say = "灵感么……那或许可以去找布莱梅问问？她懂得很多的，看事情的角度也很独特~感觉应该能帮到指挥官！",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			animation = "nod",
			characterId = 0,
			say = "布莱梅么……嗯，去啾咖啡看看也好。",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		}
	}
}
