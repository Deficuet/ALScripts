return {
	id = "ISLANDDAILYTASK16",
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
			animation = "talk",
			characterId = 100800,
			subName = "Commercial Area Supervisor",
			say = "Apologies, Commander, but I'm a bit overwhelmed by the flood of orders today...",
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
			characterId = 0,
			say = "You've got it rough. Want me to help with some deliveries?",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			subName = "Commercial Area Supervisor",
			characterId = 100800,
			say = "Yes, please. The destination of each order is written on its label.",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			characterId = 0,
			say = "I've got you. I'll get these deliveries done before the food goes cold.",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		}
	}
}
