return {
	id = "ISLANDSIDE00607",
	mode = 10,
	map = {
		{
			100400,
			10010040
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
			say = "Homeric, got a moment?",
			face2Face = {
				{
					0,
					100400
				}
			},
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			animation = "doubt",
			characterId = 100400,
			subName = "Manager of the Farm",
			say = "Hi, Commander. How can I help you?",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			characterId = 0,
			say = "Amerigo's herd of sheep has gone missing, and it's quite a big herd. Did you see any sheep earlier this afternoon or hear anything?",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			animation = "amaze",
			characterId = 100400,
			subName = "Manager of the Farm",
			say = "Oh, the sheep have gone missing? That doesn't sound like them...",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			characterId = 0,
			say = "The clock's ticking, Homeric. Can you tell me if you remember seeing them or not?",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			animation = "think",
			characterId = 100400,
			subName = "Manager of the Farm",
			say = "Goodness, sorry... Yes, I think I might have.",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			subName = "Manager of the Farm",
			characterId = 100400,
			say = "I think it was around... two hours ago? That's when I was measuring soil humidity in the fields to the east.",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			subName = "Manager of the Farm",
			characterId = 100400,
			say = "I'm fairly sure I heard some \"baa's\" somewhere in the distance. There were a lot of them, and they seemed pretty lively. They were heading...",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			animation = "shakehead",
			characterId = 100400,
			subName = "Manager of the Farm",
			say = "Hmm. I can't remember exactly where it was, but I believe it came from the forest behind the farm.",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			animation = "nod",
			characterId = 0,
			say = "So, that's where they went... I'll figure it out now that I know their general location. I'll go have a look!",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			characterId = 0,
			say = "Thanks, Homeric.",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			animation = "bye",
			characterId = 100400,
			subName = "Manager of the Farm",
			say = "Of course. Take care!",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		}
	}
}
