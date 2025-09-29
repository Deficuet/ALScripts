return {
	id = "ISLAND1001030_4",
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
			characterId = 0,
			say = "布莱梅，斯蒂芬妮的餐品已经送到了，不过她有个建议你要听听么？",
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
			say = "建议？",
			characterId = 101200,
			subName = "啾咖啡店员",
			animation = "doubt",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			say = "就像刚才的欧姆蛋一样，我们把开发区产出的食材做成美食上架出售怎么样？",
			characterId = 0,
			animation = "talk",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			subName = "啾咖啡店员",
			characterId = 101200,
			say = "不错的建议呢，只是……目前开发区的食材供给还不太稳定。",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			characterId = 0,
			say = "嗯……确实是个问题，不过食材的事情就交给我吧。",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			characterId = 0,
			say = "虽然现阶段能售卖的餐品数量有限，但随着开发区的发展，不管是种类还是数量都会慢慢增多的。",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			animation = "clap",
			characterId = 101200,
			subName = "啾咖啡店员",
			say = "嗯，那指挥官可以先把现有的食材做成餐品上架销售，我们慢慢来就好。",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			say = "好，我这就去把之前做的欧姆蛋统统上架。",
			characterId = 0,
			animation = "nod",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		}
	}
}
