return {
	id = "ISLANDSIDE01601",
	mode = 10,
	map = {
		{
			101600,
			10020025
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
			say = "Peary, I heard you're making material plans for the development area. That true?",
			face2Face = {
				{
					0,
					101600
				}
			},
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			animation = "talk",
			characterId = 101600,
			subName = "Seasonal Director",
			say = "Yes, it is... Here's the list of products in the development area.",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			characterId = 0,
			say = "What's the issue?",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			animation = "think",
			characterId = 101600,
			subName = "Seasonal Director",
			say = "While the quantity of products has increased from last year, the variety of products is essentially unchanged. Our bread and butter remains wood and ore from the plains.",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			subName = "Seasonal Director",
			characterId = 101600,
			say = "Although the development area's infrastructure has progressed considerably, there's been close to no diversification of our resources.",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			animation = "nod",
			characterId = 0,
			say = "So we've got a solid foundation.",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			animation = "nod",
			characterId = 101600,
			subName = "Seasonal Director",
			say = "Huh? Well, yes, that's true.",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			characterId = 0,
			say = "And with a solid foundation, we can now enter a period of extensive development. Good job, Peary.",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			animation = "talk",
			characterId = 0,
			say = "On another note, you've received notices of all the various islanders' needs, right?",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			animation = "note",
			characterId = 101600,
			subName = "Seasonal Director",
			say = "Yes. I've organized them already. For now, we should start with the place with the most abundant resources.",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			subName = "Seasonal Director",
			characterId = 101600,
			say = "For instance, I've been hearing good things about the forest. It produces a steady flow of lots of high-quality lumber, and should cover all our current wood needs.",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			subName = "Seasonal Director",
			characterId = 101600,
			say = "If we gradually increase the variety of products, we'll be able to meet broader needs.",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			animation = "embarrass",
			characterId = 101600,
			subName = "Seasonal Director",
			say = "All that being said, that's just a proposal. What are your thoughts, Commander?",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			characterId = 0,
			say = "I like the sound of that plan. Move ahead with it.",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			animation = "talk",
			characterId = 0,
			say = "Is there any work that needs my help or coordination?",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			animation = "clap",
			characterId = 101600,
			subName = "Seasonal Director",
			say = "There is. I've laid it all out for you. It's mostly specialty products that are in season right now, so please have a look.",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		}
	}
}
