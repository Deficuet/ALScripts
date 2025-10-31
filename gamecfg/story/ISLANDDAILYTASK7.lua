return {
	id = "ISLANDDAILYTASK7",
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
			animation = "doubt",
			characterId = 100200,
			subName = "Manager of Requests",
			say = "Hm? You've already gotten everything I requested?",
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
			say = "Let's have a look-see... Yep, it's all here! You work fast!",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			subName = "Manager of Requests",
			characterId = 100200,
			say = "Thank gosh you're here. I would've never gotten this done on my own.",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			animation = "talk",
			characterId = 100200,
			subName = "Manager of Requests",
			say = "Great work! Keep it up!",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		}
	}
}
