return {
	id = "ISLANDSIDE00101",
	mode = 10,
	map = {
		{
			100700,
			10040002
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
			say = "O'Brien, what are you doing?",
			face2Face = {
				{
					0,
					100700
				}
			},
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			animation = "scare",
			characterId = 100700,
			subName = "Manager of the Forest",
			say = "Whoa! C-Commander... You gave me a scare. How do you walk so silently?",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			characterId = 0,
			say = "Something the matter? You look on edge.",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			subName = "Manager of the Forest",
			characterId = 100700,
			say = "Well, do you know what's been going on?",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			animation = "talk",
			characterId = 100700,
			subName = "Manager of the Forest",
			say = "Lately, just before it starts raining, something in the distance starts howling all strangely!",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			characterId = 0,
			say = "Howling? You mean like an animal's cry?",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			animation = "think",
			characterId = 100700,
			subName = "Manager of the Forest",
			say = "Oh, I'm used to animal cries! These howls are something completely different. They're hollow, and long... Sometimes it sounds like it's crying, other times it's so sharp it makes my ears hurt.",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			subName = "Manager of the Forest",
			characterId = 100700,
			say = "It might not be raining right now, but just thinking about that howl sends chills up my spine... I think there's something dangerous creeping around in the woods.",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			characterId = 0,
			say = "Where does it come from, specifically?",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			animation = "talk",
			characterId = 100700,
			subName = "Manager of the Forest",
			say = "Umm... Right by the forest. Yeah, that's where they come from.",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			subName = "Manager of the Forest",
			characterId = 100700,
			say = "I've been too scared to go there to chop wood, despite all the work I need to do...",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			characterId = 0,
			say = "Alright. I'll go check it out.",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			animation = "clap",
			characterId = 100700,
			subName = "Manager of the Forest",
			say = "You will? Okay, just please be careful. I'm telling you, that sound is terrifying!",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			animation = "nod",
			characterId = 0,
			say = "Don't worry. I'm just gonna observe from a distance.",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		}
	}
}
