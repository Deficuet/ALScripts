return {
	id = "ISLANDDAILYTASK4",
	mode = 10,
	map = {
		{
			100400,
			10010040
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
			animation = "talk",
			characterId = 100400,
			subName = "Manager of the Farm",
			say = "Thank you kindly for this, Commander. I'll do my best to manage the farm well.",
			face2Face = {
				{
					0,
					100400
				}
			},
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			subName = "Manager of the Farm",
			characterId = 100400,
			say = "I'll strive to quickly provide a wide array of fresh vegetables for all the islanders to eat.",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			subName = "Manager of the Farm",
			characterId = 100400,
			say = "It's the one thing I can do to help you.",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		}
	}
}
