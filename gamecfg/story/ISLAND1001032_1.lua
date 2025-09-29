return {
	id = "ISLAND1001032_1",
	mode = 10,
	map = {
		{
			101300,
			10030006
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
			say = "这就是你说的那个装置？",
			face2Face = {
				{
					0,
					101300
				}
			},
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			say = "没错哦……指挥官可以试试看。",
			characterId = 101300,
			animation = "elation",
			subName = "集会岛向导",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			subName = "集会岛向导",
			characterId = 101300,
			say = "按下去后很快就会有各种物资落下来了，超棒的！",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			animation = "nod",
			characterId = 0,
			say = "嗯……听起来确实不错。",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			characterId = 0,
			say = "那我来试试看。",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		}
	}
}
