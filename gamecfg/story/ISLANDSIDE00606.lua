return {
	id = "ISLANDSIDE00606",
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
			say = "Amerigo, look.",
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
			animation = "nod",
			characterId = 100500,
			subName = "Manager of the Ranch",
			say = "Thanks, Commander! You really saved my day!",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			subName = "Manager of the Ranch",
			characterId = 100500,
			say = "You really gave me a fright, little sheep! You can't go off all on your own like that again!",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			animation = "talk",
			characterId = 0,
			say = "I'm just glad it was okay. This sheep isn't the only missing one, though, is it? You said there were more.",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			animation = "idea",
			characterId = 100500,
			subName = "Manager of the Ranch",
			say = "Oh, yeah! There are more! They all went missing!",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			characterId = 0,
			say = "A big herd of sheep is hard to miss. Someone should've seen them.",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			animation = "talk",
			characterId = 100500,
			subName = "Manager of the Ranch",
			say = "By someone, you mean... Olympic and Homeric?",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			animation = "nod",
			characterId = 0,
			say = "Yep. The fields are not far from here, and Homeric often watches the animals in the fields.",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			characterId = 0,
			say = "I'll go ask if she's happened to see any sheep.",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		}
	}
}
