return {
	id = "ISLAND1001039",
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
			say = "Laconia, I got some honey for you.",
			animation = "hi",
			face2Face = {
				{
					0,
					101400
				}
			},
			turnto = {
				{
					101100,
					0
				}
			},
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			say = "Golden and glittery... So pretty.",
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
			say = "It's sweet, and it smells wonderful. Thank you. The bees will love it.",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			say = "Wow! So now apples will start growing, right?",
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
			say = "Yeah. In theory, at least.",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			say = "Awesome! Here, have these as thanks, Commander!",
			characterId = 101100,
			subName = "Manager of the Orchard",
			animation = "nod",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			characterId = 0,
			say = "What are they?",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			subName = "Manager of the Orchard",
			characterId = 101100,
			say = "Why, apple tree seeds!",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			say = "I picked them out from our finest apples. Why don't you plant them and see what happens?",
			characterId = 101100,
			subName = "Manager of the Orchard",
			animation = "talk",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			characterId = 0,
			say = "You mean try to grow trees? Not my area of expertise, so...",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			subName = "Manager of the Orchard",
			characterId = 101100,
			say = "It's fiiine! I managed it, and I didn't even know what pollination was!",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			say = "Bees love apple flowers, so it'd be nice if you could...",
			characterId = 101400,
			subName = "Manager of the Plantation",
			animation = "nod",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			characterId = 0,
			say = "Alright, I'll try. Guess I'm an orchardist now!",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		}
	}
}
