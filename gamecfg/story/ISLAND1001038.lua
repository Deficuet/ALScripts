return {
	id = "ISLAND1001038",
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
			say = "Laconia? Are these the beehives you made?",
			characterId = 0,
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
			say = "Whoa! You really did bring back the hives! And yes, these are the beehives she made. Let those bees come into their new homes!",
			characterId = 101100,
			subName = "Manager of the Orchard",
			animation = "hi",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			say = "Hm? You've got nests from the wild!",
			characterId = 101400,
			subName = "Manager of the Plantation",
			animation = "doubt",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			subName = "Manager of the Plantation",
			characterId = 101400,
			say = "Aww, they look so healthy. Nice work, Commander.",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			animation = "nod",
			characterId = 0,
			say = "Got lucky and found them in a forest nearby. They were very friendly, thankfully.",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			characterId = 0,
			say = "They'll make the perfect residents for your beehives.",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			say = "These new friends of ours deserve the best home.",
			characterId = 101400,
			subName = "Manager of the Plantation",
			animation = "shy",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			animation = "clap",
			characterId = 101400,
			subName = "Manager of the Plantation",
			say = "Be careful when you put them in, Commander.",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			style = 2,
			sequence = {
				{
					"<size=45>Working together, we carefully transfer the bees from their nests into the large beehives.</size>",
					2
				},
				{
					"<size=45>Although a small handful of cautious bees fly off, they don't attack us.</size>",
					4
				},
				{
					"<size=45>Still, they're clearly flapping their wings much louder than before as they adapt to their new environment.</size>",
					6
				}
			}
		},
		{
			characterId = 0,
			say = "Something wrong?",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			say = "Shh. They're afraid.",
			characterId = 101400,
			subName = "Manager of the Plantation",
			animation = "think",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			subName = "Manager of the Plantation",
			characterId = 101400,
			say = "It's a scary, new environment for them. I think giving them a sweet treat would help calm them down.",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			say = "A sweet treat? Like what?",
			characterId = 101100,
			subName = "Manager of the Orchard",
			animation = "doubt",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			say = "Like honey. Just a little bit.",
			characterId = 101400,
			subName = "Manager of the Plantation",
			animation = "talk",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			characterId = 0,
			say = "Alright, I'll head off and look for some. Hope they settle down before then.",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			subName = "Manager of the Plantation",
			characterId = 101400,
			say = "Let's hope so. Take care, Commander.",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		}
	}
}
