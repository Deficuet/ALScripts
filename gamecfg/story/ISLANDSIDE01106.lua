return {
	id = "ISLANDSIDE01106",
	mode = 10,
	map = {
		{
			100800,
			10060002
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
			say = "Am-Mer-Mar, I've got milk, seasonal veggies, meat, and more. It's all here.",
			animation = "talk",
			face2Face = {
				{
					0,
					100800
				}
			},
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			animation = "nod",
			characterId = 100800,
			subName = "Commercial Area Supervisor",
			say = "Wonderful. Their quality is excellent as well. I couldn't ask for better.",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			subName = "Commercial Area Supervisor",
			characterId = 100800,
			say = "Have a look, Commander – the construction on all the new stores is finished.",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			animation = "nod",
			characterId = 0,
			say = "Ooh. They're brightly decorated and give off a clean impression while still feeling just homely enough. Looks great to me.",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			animation = "clap",
			characterId = 100800,
			subName = "Commercial Area Supervisor",
			say = "This area used to have only a single store. Now it has a milk tea shop, a healthy eatery, and a barbecue place... It's getting livelier and livelier here!",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			characterId = 0,
			say = "And it's all thanks to you.",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			animation = "shakehead",
			characterId = 100800,
			subName = "Commercial Area Supervisor",
			say = "Please, you're exaggerating. This couldn't have been done without help from you and our companions.",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			subName = "Commercial Area Supervisor",
			characterId = 100800,
			say = "Thank you... Commander.",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		}
	}
}
