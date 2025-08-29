return {
	id = "ISLANDSIDESTORY2004002_2",
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
			say = "指挥官，根据您设计的配方……",
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
			subName = "啾咖啡店员",
			characterId = 101200,
			say = "我会尽快制作出符合要求的新餐品。",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			characterId = 0,
			say = "嗯，不着急，你慢慢调试就好。",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			animation = "nod",
			characterId = 101200,
			subName = "啾咖啡店员",
			say = "制作完成后记得请我尝尝哦。",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			animation = "shy",
			characterId = 101200,
			subName = "啾咖啡店员",
			say = "嗯，我会努力的……",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		}
	}
}
