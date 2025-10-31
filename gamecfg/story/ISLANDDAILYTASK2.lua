return {
	id = "ISLANDDAILYTASK2",
	mode = 10,
	map = {
		{
			100600,
			10040022
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
			characterId = 100600,
			subName = "Manager of the Mine",
			say = "Oh, Commander! Perfect timing!",
			face2Face = {
				{
					0,
					100600
				}
			},
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			subName = "Manager of the Mine",
			characterId = 100600,
			say = "Let's see... Yep, that'll do! Appreciate it!",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			subName = "Manager of the Mine",
			characterId = 100600,
			say = "This'll let us take on mine-related commissions!",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		}
	}
}
