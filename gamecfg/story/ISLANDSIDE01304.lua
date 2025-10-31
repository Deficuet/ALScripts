return {
	id = "ISLANDSIDE01304",
	mode = 10,
	map = {
		{
			100200,
			10020009
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
			say = "Hey, Patrick. If I ordered some lavender fertilizer right now, about how long would it take to arrive?",
			animation = "talk",
			face2Face = {
				{
					0,
					100200
				}
			},
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			animation = "talk",
			characterId = 100200,
			subName = "Manager of Requests",
			say = "Lavender fertilizer, eh? I'll have a look.",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			subName = "Manager of Requests",
			characterId = 100200,
			say = "Uh-oh. Um...",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			say = "Unfortunately, the lavender fertilizer is all out of stock. You'd have to wait over a month.",
			characterId = 100200,
			subName = "Manager of Requests",
			animation = "embarrass",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			characterId = 0,
			say = "That's too long...",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			subName = "Manager of Requests",
			characterId = 100200,
			say = "Well, if you need it on short notice...",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			animation = "idea",
			characterId = 100200,
			subName = "Manager of Requests",
			say = "I know a place where you can find some fertilizer!",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			subName = "Manager of Requests",
			characterId = 100200,
			say = "There are tons of unclaimed goods lying at the cargo pier. Some of it might be fertilizer!",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			characterId = 0,
			say = "Then that's our last hope. I'll check it out.",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			animation = "bye",
			characterId = 100200,
			subName = "Manager of Requests",
			say = "If you do find any, stop by here on your way back! I'll need to log it. You know the drill!",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		}
	}
}
