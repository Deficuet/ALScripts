return {
	id = "ISLANDSIDE00710",
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
			characterId = 0,
			say = "布莱梅，给你配方——",
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
			animation = "nod",
			characterId = 101200,
			subName = "啾咖啡店员",
			say = "啊，就是这个配方表。",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			subName = "啾咖啡店员",
			characterId = 101200,
			say = "仿佛已经能回忆起那美味的口感了……",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			animation = "clap",
			characterId = 101200,
			subName = "啾咖啡店员",
			say = "真想让指挥官现在就尝尝看呢。",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			subName = "啾咖啡店员",
			characterId = 101200,
			say = "不过……新鲜柠檬、蜂蜜和迷迭香……",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			animation = "embarrass",
			characterId = 101200,
			subName = "啾咖啡店员",
			say = "这张配料要用到的食材，正好店里没有存货……",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			animation = "nod",
			characterId = 0,
			say = "嗯，这些食材好像都能在开发区找到……",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			animation = "talk",
			characterId = 101200,
			subName = "啾咖啡店员",
			say = "如果不行的话可以去商区问问阿莫玛，她应该知道哪里会有的。",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		}
	}
}
