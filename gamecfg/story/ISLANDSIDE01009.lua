return {
	id = "ISLANDSIDE01009",
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
			animation = "hi",
			say = "Bremen, I found the carrots you wanted.",
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
			subName = "Manager of the Café",
			characterId = 101200,
			say = "Thanks, Commander!",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			animation = "nod",
			characterId = 101200,
			subName = "Manager of the Café",
			say = "The carrots Homeric grows really are a cut above the rest.",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			subName = "Manager of the Café",
			characterId = 101200,
			say = "Okay, we've got all the ingredients, so let's see if we can work a miracle!",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			say = "Fresh carrot juice, a dash of honey, and then...",
			characterId = 101200,
			subName = "Manager of the Café",
			animation = "think",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			subName = "Manager of the Café",
			characterId = 101200,
			say = "Hmm. Should probably adjust this ratio a little more...",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			subName = "Manager of the Café",
			characterId = 101200,
			say = "Now we mix everything together, aaand...",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			animation = "nod",
			characterId = 101200,
			subName = "Manager of the Café",
			say = "Done!",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			animation = "nod",
			characterId = 0,
			say = "Looks good.",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			characterId = 0,
			say = "Before I give this to Patrick, I want to see if it works by giving it to someone else who needs energy.",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		}
	}
}
