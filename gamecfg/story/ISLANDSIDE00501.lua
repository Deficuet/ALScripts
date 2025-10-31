return {
	id = "ISLANDSIDE00501",
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
			say = "Bremen. Heard you were looking for me. What's up?",
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
			animation = "curious",
			characterId = 101200,
			subName = "Manager of the Café",
			say = "Thanks for coming, Commander. Are you, uh, familiar with the strange stuff that's been happening on the ranch?",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			characterId = 0,
			say = "Strange stuff on the ranch? Don't tell me Amerigo's animals ran off again.",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			subName = "Manager of the Café",
			characterId = 101200,
			say = "Nothing like that, no. It's something more... creepy.",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			animation = "talk",
			characterId = 101200,
			subName = "Manager of the Café",
			say = "There's just been some trouble there, apparently. People hearing weird noises and such... Whispers abound that the place is haunted.",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			characterId = 0,
			say = "Haunted, eh? Now that's something I can't ignore.",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			animation = "nod",
			characterId = 0,
			say = "I've got the gist. The farm is run by Homeric and Amerigo, right? I'll go ask them for details.",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			animation = "bye",
			characterId = 101200,
			subName = "Manager of the Café",
			say = "Be careful out there, Commander.",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		}
	}
}
