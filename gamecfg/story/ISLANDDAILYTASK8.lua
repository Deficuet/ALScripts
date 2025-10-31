return {
	id = "ISLANDDAILYTASK8",
	mode = 10,
	map = {
		{
			101300,
			10030003
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
			characterId = 101300,
			subName = "Get-Together Island Guide",
			say = "Ah! Commander! You actually found the stuff I wanted!",
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
			subName = "Get-Together Island Guide",
			characterId = 101300,
			say = "Let me see what you got!",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			subName = "Get-Together Island Guide",
			characterId = 101300,
			say = "Wow! It looks so tasty! Thanks!",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			animation = "clap",
			characterId = 101300,
			subName = "Get-Together Island Guide",
			say = "Heehee – batteries back at full charge! Now I can get back to excitedly showing people around the island!",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		}
	}
}
