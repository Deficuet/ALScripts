return {
	id = "ISLAND1001022",
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
			say = "(Patrick looks awfully busy.)",
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
			characterId = 0,
			say = "I guess being busy is a good thing, given how much work there is to be done.",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			animation = "doubt",
			characterId = 100200,
			subName = "Manager of Requests",
			say = "Commander? What's the matter? Are you still worrying yourself over everyone's duties?",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			say = "Not just that. I've inherited all of the debt taken on by this island and its development project.",
			characterId = 0,
			animation = "shakehead",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			characterId = 0,
			say = "And it's astronomical, I'll have you know.",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			animation = "sad",
			characterId = 100200,
			subName = "Manager of Requests",
			say = "Hahaha... Akashi was so busy building farms, expanding the harbor, and establishing a commercial area that she never stopped to question if she should.",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			subName = "Manager of Requests",
			characterId = 100200,
			say = "I just assumed you were funding her efforts.",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			say = "Funding her? Well, you're not wrong now, I guess... Either way, we're in debt.",
			characterId = 0,
			animation = "talk",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			characterId = 0,
			say = "I need to do something, or else this place is going bankrupt the instant the repayment deadline comes.",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			animation = "scare",
			characterId = 100200,
			subName = "Manager of Requests",
			say = "Oh, my. I'm sorry to say, but I can't really solve that problem.",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			say = "Ahem... I'm not trying to make the loan everyone's problem, or anything.",
			characterId = 0,
			animation = "shakehead",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			characterId = 0,
			say = "But since you're in charge of managing requests, I thought maybe you'd know a way or two to get rich quick.",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			animation = "think",
			characterId = 100200,
			subName = "Manager of Requests",
			say = "The simplest and most reliable way would probably be completing transport jobs.",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			subName = "Manager of Requests",
			characterId = 100200,
			say = "Transporting the island's assets to where they're needed most is a good way to earn money. Unfortunately, the development area isn't exactly overstocked.",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			subName = "Manager of Requests",
			characterId = 100200,
			say = "Whether we can make money quickly depends on your actions.",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			say = "Okay, moving on... Any more efficient methods that would involve more complexity or risk?",
			characterId = 0,
			animation = "talk",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			say = "Heheh, someone's getting greedy...",
			characterId = 100200,
			subName = "Manager of Requests",
			animation = "elation",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			subName = "Manager of Requests",
			characterId = 100200,
			say = "Since you asked, though, there have been some rumors circulating about...",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			subName = "Manager of Requests",
			characterId = 100200,
			say = "Have you heard of the legend of Treasure Island?",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			characterId = 0,
			say = "Treasure Island?",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			animation = "talk",
			characterId = 100200,
			subName = "Manager of Requests",
			say = "It's just a rumor, but apparently, there's this island that sometimes appears like a mirage in the seas near the development.",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			subName = "Manager of Requests",
			characterId = 100200,
			say = "They say there's tons of treasure there, from precious metals and jewels to even lost technology.",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			characterId = 100200,
			subName = "Manager of Requests",
			say = "Interested yet?",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			},
			options = {
				{
					content = "You know, I think I'd prefer transport jobs.",
					flag = 1
				},
				{
					content = "This calls to my treasure hunter nature...",
					flag = 2
				}
			}
		},
		{
			say = "Hah! I knew you wouldn't be impressed by hearsay.",
			subName = "Manager of Requests",
			characterId = 100200,
			optionFlag = 1,
			animation = "clap",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			characterId = 100200,
			optionFlag = 1,
			subName = "Manager of Requests",
			say = "But Stephen, the person in charge of transport jobs, says she's seen it with her own two eyes.",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			characterId = 0,
			optionFlag = 2,
			say = "It sounds a little fake, though.",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			say = "Don't take my word for it. Go ask Stephen for yourself.",
			subName = "Manager of Requests",
			characterId = 100200,
			optionFlag = 2,
			animation = "talk",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			characterId = 100200,
			optionFlag = 2,
			subName = "Manager of Requests",
			say = "She's in charge of transport jobs, so I think she'll know a lot more about it.",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			animation = "clap",
			characterId = 100200,
			subName = "Manager of Requests",
			say = "You might just win big!",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		}
	}
}
