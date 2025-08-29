return {
	id = "ISLANDDAILYTASK6",
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
			say = "指挥官……您带来了我需要的食材呢。",
			animation = "talk",
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
			animation = "think",
			characterId = 101200,
			subName = "啾咖啡店员",
			say = "嗯……色泽、新鲜度、香味……都很完美。",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			animation = "nod",
			characterId = 101200,
			subName = "啾咖啡店员",
			say = "这样就能为客人们做出更美味的点心和饮品了……指挥官，非常感谢。",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			subName = "啾咖啡店员",
			characterId = 101200,
			say = "我会用心制作的。",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		}
	}
}
