return {
	id = "ISLANDSIDE01206",
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
			animation = "curious",
			characterId = 101100,
			subName = "果园管理员",
			say = "很好嘛~指挥官，施的肥铺撒得很均匀，也没有一处多一处少的情况……",
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
			say = "没想到指挥官原来也非常懂行呢！",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			animation = "think",
			characterId = 101100,
			subName = "果园管理员",
			say = "然后的话……我看看……",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			subName = "果园管理员",
			characterId = 101100,
			say = "既然土地肥力没问题了，指挥官可以给我一些柑橘吗？可以就在这些地里种哦！",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			characterId = 0,
			say = "没问题，我这就去。",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		}
	}
}
