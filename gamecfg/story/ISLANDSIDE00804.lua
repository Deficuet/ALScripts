return {
	id = "ISLANDSIDE00804",
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
			say = "I've got the coal, Stephen. Have a look and see if it's enough.",
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
			animation = "nod",
			characterId = 100300,
			subName = "Manager of Logistics",
			say = "Whoa! You work so fast, Commander!",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			subName = "Manager of Logistics",
			characterId = 100300,
			say = "Let's see... Yep, that's more than enough!",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			animation = "talk",
			characterId = 100300,
			subName = "Manager of Logistics",
			say = "Heehee – now there'll be no problems delivering all of today's orders.",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			subName = "Manager of Logistics",
			characterId = 100300,
			say = "And it's all thanks to you! Thank you so much!",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			characterId = 0,
			say = "Alright, then seeing as we've dealt with the problem, can I leave if there's nothing else?",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			animation = "nod",
			characterId = 100300,
			subName = "Manager of Logistics",
			say = "Just one thing! Remember to tell Patrick you completed my request!",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		}
	}
}
