return {
	id = "ISLANDDAILYTASK15",
	mode = 10,
	map = {
		{
			100200,
			10020009
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
			animation = "hi",
			characterId = 100200,
			subName = "Manager of Requests",
			say = "Oh, Commander, you're here!",
			face2Face = {
				{
					0,
					100200
				}
			},
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			subName = "Manager of Requests",
			characterId = 100200,
			say = "That over there is cargo for the islanders. I should be the one to deliver it, but...",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			animation = "nod",
			characterId = 0,
			say = "But you have your hands full, I'm guessing.",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			animation = "clap",
			characterId = 100200,
			subName = "Manager of Requests",
			say = "Yeah. The cargo just arrived, and I'm checking all the quantities right now.",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			subName = "Manager of Requests",
			characterId = 100200,
			say = "If I wait to deliver them only after I'm done here, the packages will be late, so...",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			characterId = 0,
			say = "I've got you covered. I'll deliver them.",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			subName = "Manager of Requests",
			characterId = 100200,
			say = "I had a feeling you'd help! There's a package in there for you, too.",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			animation = "bye",
			characterId = 100200,
			subName = "Manager of Requests",
			say = "Open it once you've delivered the rest!",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		}
	}
}
