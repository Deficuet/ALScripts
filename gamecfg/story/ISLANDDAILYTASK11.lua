return {
	id = "ISLANDDAILYTASK11",
	mode = 10,
	map = {
		{
			100100,
			10010041
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
			characterId = 100100,
			subName = "磨坊管理员",
			say = "Zzz……嗯？指挥官……这些是磨坊要的东西吗？",
			face2Face = {
				{
					0,
					100100
				}
			},
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			animation = "think",
			characterId = 100100,
			subName = "磨坊管理员",
			say = "……哦，放那边就好……谢谢……",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			subName = "磨坊管理员",
			characterId = 100100,
			say = "有了这些……又能多睡会了……",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			subName = "磨坊管理员",
			characterId = 100100,
			say = "呼……",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		}
	}
}
