return {
	id = "ISLANDSIDE00401",
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
			animation = "hi",
			say = "Something on your mind, Am-Mer-Mar?",
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
			animation = "talk",
			characterId = 100800,
			subName = "Commercial Area Supervisor",
			say = "Commander... There's something I'd like to discuss.",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			characterId = 0,
			say = "Is it about the plans for the commercial area? Or is one of the stores having issues?",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			animation = "sad",
			characterId = 100800,
			subName = "Commercial Area Supervisor",
			say = "The former. The commercial area is meant to be a place to relax, yet it has little food on offer and lacks dishes that can draw people in.",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			subName = "Commercial Area Supervisor",
			characterId = 100800,
			say = "If we don't improve this, it will negatively impact the vibrancy of the whole area.",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			characterId = 0,
			say = "I hear you. So we gotta expand the menu. I like the sound of that. You're good at planning and could come up with some new dishes, right?",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			animation = "nod",
			characterId = 100800,
			subName = "Commercial Area Supervisor",
			say = "Planning I can do, yes, but my expertise lies in management. To expand into a new field, I'll need to consult a professional.",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			subName = "Commercial Area Supervisor",
			characterId = 100800,
			say = "Bremen at Café Manjuu is our local expert on the matter. If you could have a word with her...",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			animation = "nod",
			characterId = 0,
			say = "Right. You want me to ask her for some tips on developing new dishes, I'm guessing?",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			animation = "nod",
			characterId = 100800,
			subName = "Commercial Area Supervisor",
			say = "Correct. As an initial idea, we should develop a healthy, tasty, and visually appealing dish that utilizes high-quality carrots from the fields and fresh eggs from the farm.",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			subName = "Commercial Area Supervisor",
			characterId = 100800,
			say = "This will signal the availability of ingredients on the island and attract customers who desire freshness. However, we need to look further into precisely how we'll achieve this.",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			say = "But please, Commander, go speak to Bremen and ask her for some tips!",
			characterId = 100800,
			animation = "talk",
			subName = "Commercial Area Supervisor",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			animation = "talk",
			characterId = 0,
			say = "Got it. I'll see what I can do.",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		}
	}
}
