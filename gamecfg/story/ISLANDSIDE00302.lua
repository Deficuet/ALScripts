return {
	id = "ISLANDSIDE00302",
	mode = 10,
	map = {
		{
			101200,
			10090008
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
			say = "Bremen, we've got a problem.",
			face2Face = {
				{
					0,
					101200
				}
			},
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			animation = "talk",
			characterId = 101200,
			subName = "Manager of the Café",
			say = "Hey, Commander. Having issues with the island base? Settle down and tell me about it.",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			characterId = 0,
			say = "The base's central servers are down. Hell, they're not only not responding, they also smell like something's burned.",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			animation = "think",
			characterId = 101200,
			subName = "Manager of the Café",
			say = "Like something's burned? Sounds like the servers were pushed past their limit.",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			subName = "Manager of the Café",
			characterId = 101200,
			say = "We need to fix them, stat. Or else the base's research, material production, and even communications will come to a stop!",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			characterId = 0,
			say = "Okay, and how do we do that?",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			animation = "nod",
			characterId = 101200,
			subName = "Manager of the Café",
			say = "Don't panic. They broke once before, and John fixed them. Apparently, the cause was that the condenser unit had completely fried.",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			subName = "Manager of the Café",
			characterId = 101200,
			say = "Considering the recent calculation burden of doing research and how much it's been running, I think it's the same issue this time.",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			say = "John told me how she did it. To completely repair a condenser unit of this scale, you need to replace the core components.",
			characterId = 101200,
			subName = "Manager of the Café",
			animation = "talk",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			subName = "Manager of the Café",
			characterId = 101200,
			say = "And to make the internals needed for those components, you need high-purity bauxite. Quite a lot of it, too.",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			animation = "sad",
			characterId = 101200,
			subName = "Manager of the Café",
			say = "Even the mine can't produce that much bauxite on short notice.",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			characterId = 0,
			say = "Don't worry about the bauxite. I'll figure it out somehow.",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			subName = "Manager of the Café",
			characterId = 101200,
			say = "Do you have the time for that?",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			animation = "talk",
			characterId = 101200,
			subName = "Manager of the Café",
			say = "...Just be careful. Once you're done collecting, head right to the mine and find John. She'll have the tools and workspace to make the components.",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		}
	}
}
