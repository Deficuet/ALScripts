return {
	id = "ISLANDSIDESTORY2001007_1",
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
			subName = "矿山管理员",
			characterId = 100600,
			say = "指挥官……为了感谢您今天对我无私的帮助，下工后我准备一些风味美食犒劳您可以吗？",
			animation = "doubt",
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
			characterId = 0,
			say = "栖风原野风味吗？",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			animation = "nod",
			characterId = 100600,
			subName = "矿山管理员",
			say = "没错！哼哼~我可以准备火塘，但是能拜托您帮我去找一个朋友吗？",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			characterId = 0,
			say = "……可以，朋友在哪里呢？",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			animation = "talk",
			characterId = 100600,
			subName = "矿山管理员",
			say = "您到河岸边，只要听到下工的歌曲，就证明我的朋友已经到了哦~",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		}
	}
}
