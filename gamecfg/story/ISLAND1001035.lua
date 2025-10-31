return {
	id = "ISLAND1001035",
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
			characterId = 0,
			say = "Patrick, you called?",
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
			say = "Have you heard about the new commercial area nearing completion near the harbor?",
			characterId = 100200,
			subName = "Manager of Requests",
			animation = "talk",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			animation = "nod",
			characterId = 0,
			say = "A commercial area, huh? I think I saw that on Akashi's blueprint.",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			characterId = 0,
			say = "Halted due to funding issues, I assume?",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			say = "That's right. But it's almost done, so it would be a real shame to leave it so close to completion.",
			characterId = 100200,
			subName = "Manager of Requests",
			animation = "nod",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			characterId = 0,
			say = "Hmm... Am-Mer-Mar was in charge of it, right?",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			say = "Yep! She's been organizing materials in the plaza lately. You should go check on her.",
			characterId = 100200,
			animation = "clap",
			subName = "Manager of Requests",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			characterId = 0,
			say = "I'll do just that. I don't like the thought of leaving our investment untouched, either.",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		}
	}
}
