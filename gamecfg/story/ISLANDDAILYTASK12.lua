return {
	id = "ISLANDDAILYTASK12",
	mode = 10,
	map = {
		{
			101100,
			10050002
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
			animation = "nod",
			characterId = 0,
			subName = "Manager of the Orchard",
			say = "Bless your heart, Commander!",
			face2Face = {
				{
					0,
					101100
				}
			},
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			subName = "Manager of the Orchard",
			characterId = 101100,
			say = "You needn't worry about the orchard now!",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			subName = "Manager of the Orchard",
			characterId = 101100,
			say = "I'll take good care of it!",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		}
	}
}
