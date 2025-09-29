return {
	id = "ISLANDDAILYTASK12",
	mode = 10,
	map = {
		{
			101100,
			10050002
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
			animation = "nod",
			characterId = 0,
			subName = "果园管理员",
			say = "哇——辛苦指挥官了！",
			face2Face = {
				{
					0,
					101100
				}
			},
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			subName = "果园管理员",
			characterId = 101100,
			say = "果园的事就交放心给我吧！",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			subName = "果园管理员",
			characterId = 101100,
			say = "我会照顾好它们的！",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		}
	}
}
