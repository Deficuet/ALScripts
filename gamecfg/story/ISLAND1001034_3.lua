return {
	id = "ISLAND1001034_3",
	mode = 10,
	map = {
		{
			101000,
			10030008
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
			say = "Elizabeth, I'm back.",
			face2Face = {
				{
					0,
					101000
				}
			},
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			say = "Outstanding work, Commander. Did you find all the materials?",
			characterId = 101000,
			subName = "Get-Together Island Receptionist",
			animation = "clap",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			animation = "nod",
			characterId = 0,
			say = "Yep. Everything on your list is right here.",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			say = "Let's see... You're right. All is in order.",
			characterId = 101000,
			animation = "talk",
			subName = "Get-Together Island Receptionist",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			subName = "Get-Together Island Receptionist",
			characterId = 101000,
			say = "Then all we need to do is let the expert do her work.",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			characterId = 0,
			say = "Well? Where is she?",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			say = "Um, well... She's waiting for you at Get-Together Island's harbor. Please go and see her.",
			characterId = 101000,
			animation = "talk",
			subName = "Get-Together Island Receptionist",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		}
	}
}
