return {
	id = "ISLANDSIDE01005",
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
			say = "Hey, Bremen. I'd like to ask for something.",
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
			say = "An iced coffee?",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			characterId = 0,
			say = "Yeah. With the usual.",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			animation = "shakehead",
			characterId = 0,
			say = "Wait, no – I do want an iced coffee, but I'm here for a different reason.",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			characterId = 0,
			say = "It's about Patrick. She wishes she could always be giving her work her all, but sometimes she just gets really sleepy.",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			characterId = 0,
			say = "What I wanted to ask is: Do you have any drinks that'll clear your head and fill you with energy? I'm guessing coffee.",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			say = "Hmm. She did try coffee before, but it didn't really do much for her.",
			characterId = 101200,
			subName = "Manager of the Café",
			animation = "sad",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			subName = "Manager of the Café",
			characterId = 101200,
			say = "Still felt sleepy when one of her bouts of drowsiness hit.",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			say = "Although, if we're talking \"filled with energy,\" that matches Amerigo's description pretty well.",
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
			say = "Maybe she'll have some nuggets of wisdom for you?",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			characterId = 0,
			say = "Got it. I'll see what she has to say.",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		}
	}
}
