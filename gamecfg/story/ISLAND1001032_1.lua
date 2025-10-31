return {
	id = "ISLAND1001032_1",
	mode = 10,
	map = {
		{
			101300,
			10030006
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
			say = "Is this the device you were telling me about?",
			face2Face = {
				{
					0,
					101300
				}
			},
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			say = "Yep. Try using it like I told you.",
			characterId = 101300,
			animation = "elation",
			subName = "Get-Together Island Guide",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			subName = "Get-Together Island Guide",
			characterId = 101300,
			say = "Press the button, and all sorts of stuff will come out. It's the best!",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			animation = "nod",
			characterId = 0,
			say = "Hmm... Sounds fun.",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			characterId = 0,
			say = "I'll give it a try.",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		}
	}
}
