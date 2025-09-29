return {
	id = "ISLANDSIDE01207",
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
			subName = "果园管理员",
			characterId = 101100,
			animation = "elation",
			say = "看着这些圆润透亮的柑橘，突然就感觉这些劳累都值得了……",
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
			say = "指挥官要尝尝吗？",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			characterId = 0,
			say = "等事情都解决完，我们再一起吃吧。",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			say = "嗯嗯！那就听指挥官的！",
			characterId = 101100,
			subName = "果园管理员",
			animation = "nod",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			say = "对了，布莱梅刚刚发消息说她的柑橘储备不够了。",
			characterId = 101100,
			subName = "果园管理员",
			animation = "clap",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			subName = "果园管理员",
			characterId = 101100,
			say = "可以麻烦指挥官把这筐柑橘送过去吗？",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		}
	}
}
