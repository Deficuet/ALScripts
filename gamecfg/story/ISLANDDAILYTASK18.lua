return {
	id = "ISLANDDAILYTASK18",
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
			animation = "hi",
			characterId = 101200,
			subName = "啾咖啡店员",
			say = "指挥官，你来了……这次麻烦你了。",
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
			animation = "shakehead",
			characterId = 0,
			say = "不麻烦，这就是给它们准备的食物？",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			animation = "nod",
			characterId = 101200,
			subName = "啾咖啡店员",
			say = "嗯，是我特意准备的小鱼干，份量都分好了。",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			subName = "啾咖啡店员",
			characterId = 101200,
			say = "麻烦你帮忙投喂给经常在开发区活动的几只小猫就好。",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			animation = "nod",
			characterId = 0,
			say = "放心，还有什么需要注意的吗？",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			animation = "embarrass",
			characterId = 101200,
			subName = "啾咖啡店员",
			say = "嗯，还有就是它们的位置可能需要指挥官去找找，我也不太清楚它们去哪了……",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			characterId = 0,
			say = "没关系，我这就去找它们。",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			animation = "clap",
			characterId = 101200,
			subName = "啾咖啡店员",
			say = "辛苦你了，指挥官。",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		}
	}
}
