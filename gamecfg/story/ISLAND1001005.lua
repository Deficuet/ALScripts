return {
	fadeOut = 1,
	mode = 10,
	id = "ISLAND1001005",
	map = {
		{
			100600,
			10040022
		},
		{
			100700,
			10040045
		}
	},
	look_weight = {
		{
			0,
			0
		},
		{
			0.3,
			0
		},
		{
			0.7,
			0
		}
	},
	scripts = {
		{
			characterId = 0,
			camera = "StoryCamera2",
			say = "John, reckon this is enough?",
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
			say = "Whoa! I knew you wouldn't let me down! You're so efficient!",
			characterId = 100600,
			subName = "Manager of the Mine",
			animation = "clap",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			speed = 3.5,
			style = 4,
			hide = false,
			characterId = 100700,
			delay = 0,
			wait_until_done = false,
			position = {
				71.59,
				3.98,
				70.66
			}
		},
		{
			characterId = 100600,
			subName = "Manager of the Mine",
			say = "Combining what I've got with what you mined, we've finally got all the coal to do the repairs! There's hope!",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			},
			options = {
				{
					content = "So we can repair the station now?",
					flag = 1
				}
			}
		},
		{
			say = "Almost. To fully repair it, we'll also need wood to reinforce the roof with.",
			characterId = 100600,
			subName = "Manager of the Mine",
			animation = "think",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			say = "W-wood, you say? I'm afraid we don't have that ready to go.",
			characterId = 100700,
			subName = "Manager of the Forest",
			animation = "amaze",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			animation = "talk",
			characterId = 0,
			say = "John, will we make it in time if we start now?",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			say = "Yeah! Easily!",
			characterId = 100600,
			subName = "Manager of the Mine",
			animation = "nod",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			subName = "Manager of the Mine",
			characterId = 100600,
			say = "You two go off and fix the wood, and I'll use the coal to repair the road surface!",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			subName = "Manager of the Mine",
			characterId = 100600,
			say = "We'll get it done in time if we split up! O'Brien, could you bring the Commander to the woods?",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			say = "Um, sure!",
			characterId = 100700,
			subName = "Manager of the Forest",
			animation = "nod",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			characterId = 100700,
			subName = "Manager of the Forest",
			say = "Let's go and quickly gather some wood, Commander.",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			},
			options = {
				{
					content = "Alright. After you.",
					flag = 1
				},
				{
					content = "I'm on it!",
					flag = 2
				}
			}
		}
	}
}
