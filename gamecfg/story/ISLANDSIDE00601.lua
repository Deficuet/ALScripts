return {
	id = "ISLANDSIDE00601",
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
			characterId = 0,
			say = "What's the matter, Amerigo?",
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
			animation = "weep",
			characterId = 100500,
			subName = "Manager of the Ranch",
			say = "This is awful, Commander! My Baa Baa Sheep have gone missing!",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			characterId = 0,
			say = "Gone missing? When did that happen?",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			subName = "Manager of the Ranch",
			characterId = 100500,
			say = "Like, a minute ago! I just went to get their feed, like I always do...",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			say = "Then, when I got back, they were all gone! Every last one!",
			characterId = 100500,
			subName = "Manager of the Ranch",
			animation = "sad",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			subName = "Manager of the Ranch",
			characterId = 100500,
			say = "All that was left was a broken fence...",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			animation = "talk",
			characterId = 0,
			say = "Calm down, Amerigo. They might've just gone a little farther.",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			characterId = 0,
			say = "Where do you usually bring them?",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			animation = "think",
			characterId = 100500,
			subName = "Manager of the Ranch",
			say = "To the hill by the ranch! They love going there!",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			animation = "nod",
			characterId = 0,
			say = "Okay, let's go check that place together. We might find some clues.",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		}
	}
}
