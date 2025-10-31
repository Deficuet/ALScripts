return {
	id = "ISLANDSIDE00507",
	mode = 10,
	map = {
		{
			100500,
			10010003
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
			say = "Amerigo, I figured out the gist of what's happening.",
			face2Face = {
				{
					0,
					100500
				}
			},
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			animation = "doubt",
			characterId = 100500,
			subName = "Manager of the Ranch",
			say = "Huh?! Y-you did? What's causing it?",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			say = "The noises you've been hearing were someone chopping firewood.",
			characterId = 0,
			animation = "talk",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			characterId = 0,
			say = "There's actually a sizable pile of it lying in the shed.",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			animation = "amaze",
			characterId = 100500,
			subName = "Manager of the Ranch",
			say = "You're telling me someone goes out, late at night, sneaks into my shed, and just... chops firewood?",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			subName = "Manager of the Ranch",
			characterId = 100500,
			say = "That's the strangest thing I've ever heard. It being a ghost would make more sense.",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			characterId = 0,
			say = "Yeah, it's weird, but the evidence was there.",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			animation = "talk",
			characterId = 100500,
			subName = "Manager of the Ranch",
			say = "Come to think of it, when I chop firewood, the sound DOES sound pretty similar!",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			subName = "Manager of the Ranch",
			characterId = 100500,
			say = "But who the heck's doing it?",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			animation = "shakehead",
			characterId = 0,
			say = "I haven't figured that part out yet. At least we can rule out ghosts now.",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			subName = "Manager of the Ranch",
			characterId = 100500,
			say = "True. That's a relief. Now I'm just wondering who'd do such a thing.",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			characterId = 0,
			say = "I've got a theory on that, actually. Although nobody in their right mind would do this, what if they were sleepwalking?",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			animation = "amaze",
			characterId = 100500,
			subName = "Manager of the Ranch",
			say = "Now hang on, are you saying Olympic did this?",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			characterId = 0,
			say = "Could be. We should ask her. Maybe the reason she takes all those naps in the noon is because she does hard labor at night.",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			animation = "bye",
			characterId = 100500,
			subName = "Manager of the Ranch",
			say = "When you put it like that, yeah, I could see that! Let's go find her right now!",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		}
	}
}
