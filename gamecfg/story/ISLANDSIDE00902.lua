return {
	id = "ISLANDSIDE00902",
	mode = 10,
	map = {
		{
			100600,
			10040022
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
			say = "John, you've been staring for five minutes now. Do you need something?",
			face2Face = {
				{
					0,
					100600
				}
			},
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			animation = "embarrass",
			characterId = 100600,
			subName = "Manager of the Mine",
			say = "It's... Um... I'm waiting for someone, and since you just happen to be here...",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			characterId = 0,
			say = "Are you the mysterious client?",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			animation = "amaze",
			characterId = 100600,
			subName = "Manager of the Mine",
			say = "Wait, YOU took on my request?!",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			subName = "Manager of the Mine",
			characterId = 100600,
			say = "Ah, of course... I should've figured.",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			characterId = 0,
			say = "What is it you want me to transport?",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			animation = "think",
			characterId = 100600,
			subName = "Manager of the Mine",
			say = "Well, I guess I can tell YOU at least.",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			subName = "Manager of the Mine",
			characterId = 100600,
			say = "Okay, so... A while ago, I found some rare ore. It's pretty precious, so I didn't tell people about it.",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			subName = "Manager of the Mine",
			characterId = 100600,
			say = "I was going to keep it a secret from the person transporting it, but I can trust you with this knowledge.",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			characterId = 0,
			say = "I see. So, who do you want me to deliver it to?",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			animation = "nod",
			characterId = 100600,
			subName = "Manager of the Mine",
			say = "Since it's so valuable, I want you to take it to O'Brien and have it wrapped up for me.",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			subName = "Manager of the Mine",
			characterId = 100600,
			say = "Full disclosure: This request is actually from her, so she'll probably tell you where to deliver it.",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			animation = "nod",
			characterId = 0,
			say = "Got it. I'll head to her now.",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		}
	}
}
