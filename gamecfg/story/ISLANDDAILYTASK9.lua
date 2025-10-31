return {
	id = "ISLANDDAILYTASK9",
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
			animation = "doubt",
			characterId = 101000,
			subName = "Get-Together Island Receptionist",
			say = "Ah, Commander. Were you able to find what I requested?",
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
			subName = "Get-Together Island Receptionist",
			characterId = 101000,
			say = "Excellent. All the items on the list are here.",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			animation = "nod",
			characterId = 101000,
			subName = "Get-Together Island Receptionist",
			say = "Delivered at just the right time as well. Now maintenance work may begin on the island's buildings.",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			subName = "Get-Together Island Receptionist",
			characterId = 101000,
			say = "I shall use these to make our activity area an even more pleasant place.",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		}
	}
}
