return {
	id = "ISLANDSIDESTORY2004002_1",
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
			subName = "啾咖啡店员",
			characterId = 101200,
			say = "指挥官，最近我在收拾桌面的时候注意到了一件事……",
			animation = "think",
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
			animation = "talk",
			characterId = 101200,
			subName = "啾咖啡店员",
			say = "有好几位常来的客人都反复翻阅着菜单，迟迟无法确定呢。",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			say = "看来需要为大家提供更多的选择了。",
			characterId = 0,
			animation = "nod",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			animation = "think",
			characterId = 101200,
			subName = "啾咖啡店员",
			say = "嗯，今天正好有一批新的原料刚送到仓库。",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			animation = "doubt",
			characterId = 101200,
			subName = "啾咖啡店员",
			say = "适当地做些新的尝试怎么样？",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		}
	}
}
