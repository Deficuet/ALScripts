return {
	id = "ISLAND1001006",
	mode = 10,
	map = {
		{
			100700,
			10040060
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
			animation = "talk",
			say = "奥布莱恩……怎么样，这些木材够了么？",
			face2Face = {
				{
					0,
					100700
				}
			},
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			say = "嗯！辛苦指挥官了……这些木材足够了。",
			characterId = 100700,
			subName = "林场管理员",
			animation = "clap",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			characterId = 0,
			say = "那我们快去找乔安吧。",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			say = "好……乔安应该在通往港口的站台上等我们。",
			characterId = 100700,
			subName = "林场管理员",
			animation = "nod",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			subName = "林场管理员",
			characterId = 100700,
			say = "我们拿上木材一起过去吧……",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		}
	}
}
