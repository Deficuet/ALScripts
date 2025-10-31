return {
	id = "ISLAND1001012",
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
			animation = "talk",
			say = "Patrick, this should be everything, right? Is everything in order?",
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
			say = "Yep. They're the right quantity and quality. Well done.",
			characterId = 100200,
			subName = "Manager of Requests",
			animation = "nod",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			characterId = 0,
			say = "Good to hear. While I'm here, do you happen to know where Akashi is?",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			say = "Akashi? Ah, well, see Café Manjuu over there? She often hangs out around there, so that's where I'd check first.",
			characterId = 100200,
			subName = "Manager of Requests",
			animation = "think",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			characterId = 0,
			say = "Near Café Manjuu, huh? I'll go have a look!",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			say = "Heheh, you do that. See you, Commander!",
			characterId = 100200,
			subName = "Manager of Requests",
			animation = "bye",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		}
	}
}
