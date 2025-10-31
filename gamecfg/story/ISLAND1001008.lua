return {
	id = "ISLAND1001008",
	mode = 10,
	map = {
		{
			100600,
			10040032
		},
		{
			100700,
			10040031
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
			say = "Reckon this will do?",
			animation = "hi",
			face2Face = {
				{
					0,
					100600
				}
			},
			turnto = {
				{
					100700,
					0
				}
			},
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			say = "Yep! It's finally done!",
			characterId = 100600,
			subName = "Manager of the Mine",
			animation = "rest",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			subName = "Manager of the Mine",
			characterId = 100600,
			say = "Man, it took a lot of work to fully repair the station, huh?",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			say = "Will we be able to deliver our packages before nightfall now?",
			characterId = 100700,
			subName = "Manager of the Forest",
			animation = "rest",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			say = "Yeah, no problem! And we couldn't have achieved this without the Commander.",
			characterId = 100600,
			subName = "Manager of the Mine",
			animation = "nod",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			subName = "Manager of the Mine",
			characterId = 100600,
			say = "You deserve a reward. Let's see... Here it is!",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			characterId = 100600,
			subName = "Manager of the Mine",
			say = "I found this while mining. Pretty, isn't it?",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			},
			options = {
				{
					content = "Sure does. That's some beautiful ore.",
					flag = 1
				}
			}
		},
		{
			subName = "Manager of the Mine",
			characterId = 100600,
			say = "Right? It glitters, and looks so beautiful!",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			say = "Y-you can also have this...",
			characterId = 100700,
			subName = "Manager of the Forest",
			animation = "shy",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			subName = "Manager of the Forest",
			characterId = 100700,
			say = "It's... some wood I processed in a special way. Doesn't the texture remind you of a star?",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			animation = "nod",
			characterId = 0,
			say = "You're right, it does. Thanks.",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			say = "The bus is he– Oh, it looks like it's already full of cargo.",
			characterId = 100700,
			subName = "Manager of the Forest",
			animation = "embarrass",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			say = "Yup. Urgent packages really piled up 'cause of the bus stop being destroyed.",
			characterId = 100600,
			subName = "Manager of the Mine",
			animation = "talk",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			subName = "Manager of the Mine",
			characterId = 100600,
			say = "Commander, if you're not in a rush, do you mind waiting for the next one?",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			animation = "shakehead",
			characterId = 0,
			say = "No worries. I'll just carry the cargo to the harbor myself.",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			characterId = 0,
			say = "Besides, I'm curious to see how this place operates.",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			say = "Alright, thanks! Here's the cargo list. Give it to Patrick when you get to the harbor!",
			characterId = 100600,
			subName = "Manager of the Mine",
			animation = "clap",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			characterId = 100600,
			subName = "Manager of the Mine",
			say = "You're bound to find her standing guard there.",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			},
			options = {
				{
					content = "Patrick? Okay, I'll do that.",
					flag = 1
				}
			}
		},
		{
			say = "Best of luck to you, Commander.",
			characterId = 100700,
			subName = "Manager of the Forest",
			animation = "bye",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			say = "See you, Commander! Stop by and ride a minecart sometime!",
			characterId = 100600,
			subName = "Manager of the Mine",
			animation = "bye",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		}
	}
}
