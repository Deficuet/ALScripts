return {
	id = "ISLANDDAILYTASK3",
	mode = 10,
	map = {
		{
			100300,
			10020004
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
			animation = "clap",
			characterId = 100300,
			subName = "Manager of Logistics",
			say = "Whew – you're finally here! Thanks a bunch!",
			face2Face = {
				{
					0,
					100300
				}
			},
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			subName = "Manager of Logistics",
			characterId = 100300,
			say = "Oh boy, it's about to get busy for me again... but I don't mind as long as I can be of service to you.",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			subName = "Manager of Logistics",
			characterId = 100300,
			say = "Heehee. Don't worry! I may get a little lazy sometimes, but I'll do my job!",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		}
	}
}
