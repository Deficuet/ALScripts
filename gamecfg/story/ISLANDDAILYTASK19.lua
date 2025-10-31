return {
	id = "ISLANDDAILYTASK19",
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
			animation = "amaze",
			characterId = 100500,
			subName = "Manager of the Ranch",
			say = "Oh! Commander! You got here at just the right time!",
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
			characterId = 0,
			say = "What's up? Did an animal escape again?",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			animation = "shakehead",
			characterId = 100500,
			subName = "Manager of the Ranch",
			say = "No, no, not this time!",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			subName = "Manager of the Ranch",
			characterId = 100500,
			say = "The animals have been on super good behavior lately, so I wanna let 'em play out in the meadows next to the farm!",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			characterId = 0,
			say = "You're bringing them all there? Will you be able to keep watch on them?",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			animation = "clap",
			characterId = 100500,
			subName = "Manager of the Ranch",
			say = "Not a snowball's chance in heck! That's why I want you to give me a hand with that! I'll handle the rest!",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			animation = "nod",
			characterId = 0,
			say = "Alright. Just don't go overboard.",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			animation = "nod",
			characterId = 100500,
			subName = "Manager of the Ranch",
			say = "Swell! Much appreciated, Commander!",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			subName = "Manager of the Ranch",
			characterId = 100500,
			say = "Now, don't worry, these little guys know how to behave! Just give 'em a pat and they'll follow you anywhere!",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		}
	}
}
