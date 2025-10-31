return {
	id = "ISLANDDAILYTASK5",
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
			animation = "nod",
			characterId = 100500,
			subName = "Manager of the Ranch",
			say = "Whoa! It's you! Here to feed the animals?",
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
			subName = "Manager of the Ranch",
			characterId = 100500,
			say = "If not, that's fine, too! I love everything you give to me!",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			subName = "Manager of the Ranch",
			characterId = 100500,
			say = "Same goes for the animals! The ranch gets more lively whenever you're around!",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		}
	}
}
