return {
	id = "ISLAND1001037",
	mode = 10,
	map = {
		{
			101100,
			10050000
		},
		{
			101400,
			10050003
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
			say = "Lusitania and Laconia? Hey. How are you two doing?",
			animation = "hi",
			face2Face = {
				{
					0,
					101100
				}
			},
			turnto = {
				{
					101400,
					0
				}
			},
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			say = "Oh, Commander! Heehee – welcome to Prosperous Plantation!",
			characterId = 101100,
			subName = "Manager of the Orchard",
			animation = "hi",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			say = "Commander... Hello.",
			characterId = 101400,
			subName = "Manager of the Plantation",
			animation = "amaze",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			characterId = 0,
			say = "Why the long faces? Something the matter?",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			say = "Umm... It's the apple trees. The orchard was completed quite some time ago, but most of the trees haven't even blossomed, let alone produced fruit.",
			characterId = 101100,
			subName = "Manager of the Orchard",
			animation = "sad",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			say = "Yeah... Even the ones that have bloomed haven't produced fruit.",
			characterId = 101400,
			subName = "Manager of the Plantation",
			animation = "doubt",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			animation = "talk",
			characterId = 0,
			say = "I see. I was hoping you'd have new ingredients ready to deliver to the stores in the harbor.",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			characterId = 0,
			say = "Sounds like the orchard's not doing too well, though.",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			say = "Sadly not. We HAVE been doing our best, so it's not that!",
			characterId = 101100,
			subName = "Manager of the Orchard",
			animation = "doubt",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			subName = "Manager of the Orchard",
			characterId = 101100,
			say = "We've been watering on time, and making sure they get plenty of sunlight, but while the leaves are lush and green, there just aren't any flowers growing, much less fruit!",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			characterId = 0,
			say = "Little blooming, and no fruit... Lusitania, have you been pollinating them?",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			say = "Sorry? Polli-what?",
			characterId = 101100,
			subName = "Manager of the Orchard",
			animation = "amaze",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			characterId = 0,
			say = "Then there's your problem. See all the bees flying around outside?",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			characterId = 0,
			say = "They fly from flower to flower, carrying pollen from one to the other. That's what pollination is.",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			animation = "talk",
			characterId = 0,
			say = "Fruit trees – especially apple and mandarin trees – don't grow fruit unless they're pollinated. Just giving them water and sunlight won't cut it.",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			say = "That's why?! Gosh, what a fool I was for going out of my way to chase them away...",
			characterId = 101100,
			subName = "Manager of the Orchard",
			animation = "clap",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			characterId = 0,
			say = "What's done is done. What matters is that the solution's easy now that we know the cause.",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			say = "Bees? Wait, are we going to start raising bees?",
			characterId = 101400,
			subName = "Manager of the Plantation",
			animation = "doubt",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			characterId = 0,
			say = "Uhh... Yeah, basically. You'll need some nests and their inhabitants.",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			say = "I'll go look for some in the wild, and bring them back to the orchard once I find some. I'll leave them somewhere around...",
			characterId = 0,
			animation = "talk",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			characterId = 0,
			say = "Ah, I'm getting carried away. You'll need some beehives, too.",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			say = "Right, beehives! Can't raise bees without a place for them to live.",
			characterId = 101400,
			subName = "Manager of the Plantation",
			animation = "nod",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			subName = "Manager of the Plantation",
			characterId = 101400,
			say = "I'll get some set up right away!",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			characterId = 0,
			say = "You sound... really hyped about it. Are you a bee enthusiast?",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			say = "Yeah, she is. She gets really excited whenever the subject of bees comes up!",
			characterId = 101100,
			subName = "Manager of the Orchard",
			animation = "nod",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			animation = "nod",
			characterId = 0,
			say = "That's reassuring. Anyway, I'll go look for those nests. Laconia, I trust you to make some big and sturdy boxes.",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		}
	}
}
