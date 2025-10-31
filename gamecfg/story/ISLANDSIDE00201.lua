return {
	id = "ISLANDSIDE00201",
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
			say = "Patrick, got any decorative paintings in your collection?",
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
			animation = "curious",
			characterId = 100200,
			subName = "Manager of Requests",
			say = "Oh, Commander! Why the sudden interest? I didn't take you for an art aficionado.",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			subName = "Manager of Requests",
			characterId = 100200,
			say = "Did word get out that I make sketches or something?",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			animation = "shakehead",
			characterId = 0,
			say = "No, I'm just asking because I want to add some artistic flair to the harbor.",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			characterId = 0,
			say = "Anyway, did you just say you make sketches?",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			animation = "shakehead",
			characterId = 100200,
			subName = "Manager of Requests",
			say = "Not really! I just doodle in my spare time. I wouldn't go so far as to call them sketches!",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			characterId = 0,
			say = "But you do draw them yourself? That's even better.",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			animation = "talk",
			characterId = 0,
			say = "I wanna see you draw. Think you could make a picture for me?",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			animation = "clap",
			characterId = 100200,
			subName = "Manager of Requests",
			say = "Um... Okay, since you seem pretty keen on this, I could make something just for you.",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			subName = "Manager of Requests",
			characterId = 100200,
			say = "What do you want me to draw?",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			characterId = 0,
			say = "Hmm. Tough question. Maybe a landscape or a portrait.",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			animation = "idea",
			characterId = 100200,
			subName = "Manager of Requests",
			say = "Heh. Sounds like you could use some inspiration.",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			subName = "Manager of Requests",
			characterId = 100200,
			say = "You should take a stroll around the harbor. The view's great and there's loads to see.",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			animation = "talk",
			characterId = 100200,
			subName = "Manager of Requests",
			say = "You might come across a scene that makes you think, \"I want this on my wall.\" Want me to accompany you?",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			characterId = 0,
			say = "Sure. Lead the way.",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		}
	}
}
