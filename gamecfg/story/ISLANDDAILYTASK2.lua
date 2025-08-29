return {
	id = "ISLANDDAILYTASK2",
	mode = 10,
	map = {
		{
			100600,
			10040022
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
			animation = "think",
			characterId = 100600,
			subName = "矿山管理员",
			say = "啊！指挥官，这些东西送来得正是时候！",
			face2Face = {
				{
					0,
					100600
				}
			},
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			say = "嗯……分量也够足！干得漂亮！",
			characterId = 100600,
			animation = "nod",
			subName = "矿山管理员",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			subName = "矿山管理员",
			characterId = 100600,
			say = "有了它们，我就能继续采矿了。",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			animation = "elation",
			characterId = 100600,
			subName = "矿山管理员",
			say = "岛上的建设可离不开我挖的这些矿石！",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		}
	}
}
