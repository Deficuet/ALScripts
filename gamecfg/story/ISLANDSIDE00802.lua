return {
	id = "ISLANDSIDE00802",
	mode = 10,
	map = {
		{
			100300,
			10020004
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
			say = "Stephen, did you drop an urgent request on Patrick?",
			animation = "hi",
			face2Face = {
				{
					0,
					100300
				}
			},
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			characterId = 0,
			say = "It ended up in my hands, so I'm just wondering: What's the matter?",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			animation = "clap",
			characterId = 100300,
			subName = "Manager of Logistics",
			say = "Oh! You accepted my request? Great! That means I'll make it in time.",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			subName = "Manager of Logistics",
			characterId = 100300,
			say = "Heheh – see, there was a little accident today.",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			subName = "Manager of Logistics",
			characterId = 100300,
			say = "I've been busy processing the recent surge in orders and haven't kept up with the cargo situation at the harbor, and, well...",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			say = "There was this big bang, so I ran over to see what'd happened, and that's when I saw the containers used for packages in transit were broken!",
			characterId = 100300,
			subName = "Manager of Logistics",
			animation = "sad",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			subName = "Manager of Logistics",
			characterId = 100300,
			say = "Worse yet, I don't have any spares... I can order new ones, but it'd take quite a while before they arrive.",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			say = "So, as a stopgap, I'm thinking we could make a few large wooden boxes. The problem is, I don't have the wood for it, and I can't just leave the harbor, either.",
			characterId = 100300,
			subName = "Manager of Logistics",
			animation = "talk",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			subName = "Manager of Logistics",
			characterId = 100300,
			say = "That's why I issued that urgent request to Patrick, hoping someone could go and collect the wood.",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			animation = "talk",
			characterId = 0,
			say = "Alright, I've got it. Where should I go to find the wood?",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			animation = "nod",
			characterId = 100300,
			subName = "Manager of Logistics",
			say = "Great! Go to the logging site. All the wood should be right there!",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			subName = "Manager of Logistics",
			characterId = 100300,
			say = "Thanks for the help, Commander!",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		}
	}
}
