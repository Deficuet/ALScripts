return {
	id = "ISLANDSIDE01011",
	mode = 10,
	map = {
		{
			101200,
			10090008
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
			animation = "sad",
			characterId = 101200,
			subName = "啾咖啡店员",
			say = "竟然起了反效果吗……",
			face2Face = {
				{
					0,
					101200
				}
			},
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			subName = "啾咖啡店员",
			characterId = 101200,
			say = "我来想想怎么改进配方吧。",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			say = "有可能是比例出了问题……或者……",
			characterId = 101200,
			subName = "啾咖啡店员",
			animation = "think",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			subName = "啾咖啡店员",
			characterId = 101200,
			say = "嗯，找到方向了——重新调整选材试试吧。",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			subName = "啾咖啡店员",
			characterId = 101200,
			say = "这样的话，新配方就需要一些新食材。",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			say = "指挥官，能帮我找一些新鲜鸡蛋吗？",
			characterId = 101200,
			subName = "啾咖啡店员",
			animation = "talk",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			subName = "啾咖啡店员",
			characterId = 101200,
			say = "我想要烤制一些口感轻盈可口，又能快速补充精力的蛋白霜。",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			say = "好，我去农场看看。",
			characterId = 0,
			animation = "nod",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		}
	}
}
