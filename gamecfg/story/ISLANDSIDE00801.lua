return {
	id = "ISLANDSIDE00801",
	mode = 10,
	map = {
		{
			100200,
			10020009
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
			say = "What're you drawing, Patrick?",
			face2Face = {
				{
					0,
					100200
				}
			},
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			animation = "clap",
			characterId = 100200,
			subName = "Manager of Requests",
			say = "Oh, hey, Commander! You showed up at just the right time.",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			subName = "Manager of Requests",
			characterId = 100200,
			say = "I want to ask you for a favor. It's for a veeery important mission.",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			characterId = 0,
			say = "Let me guess – it's got to do with an island request, doesn't it?",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			animation = "amaze",
			characterId = 100200,
			subName = "Manager of Requests",
			say = "Whoa! How'd you guess that? Your intuition is off the charts!",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			characterId = 0,
			say = "Reading the notes in your hand gives you a pretty good idea, that's all.",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			animation = "talk",
			characterId = 0,
			say = "Anyway, where do I need to go and what do I need to do?",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			animation = "think",
			characterId = 100200,
			subName = "Manager of Requests",
			say = "You have to find Stephen. She came up to me in a huge rush just earlier to give me a request. It must be something pretty urgent.",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			subName = "Manager of Requests",
			characterId = 100200,
			say = "And, boy, I was just thinking, \"If only I had more manpower,\" and that was when you showed up! You're our savior!",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			animation = "clap",
			characterId = 100200,
			subName = "Manager of Requests",
			say = "Praise be to our savior! Now take care of this urgent request, pretty please.",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		}
	}
}
