return {
	id = "ISLANDSIDE01003",
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
			characterId = 100300,
			subName = "Manager of Logistics",
			say = "Need anything from me, Commander?",
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
			say = "I explain the lead-up to this point to her.",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			animation = "curious",
			characterId = 100300,
			subName = "Manager of Logistics",
			say = "Ahh, I see. So that's what!",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			subName = "Manager of Logistics",
			characterId = 100300,
			say = "If you want to support Patrick, all you have to do is issue more requests!",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			animation = "clap",
			characterId = 100300,
			subName = "Manager of Logistics",
			say = "That'll tell her that you have faith in her ability!",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			animation = "talk",
			characterId = 0,
			say = "Come on. I'm serious.",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			animation = "scare",
			characterId = 100300,
			subName = "Manager of Logistics",
			say = "Wh– Hey, I was just kidding!",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			subName = "Manager of Logistics",
			characterId = 100300,
			say = "FYI, though, there's no point in asking me about this.",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			subName = "Manager of Logistics",
			characterId = 100300,
			say = "She herself would know better than anyone else what you could.",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			animation = "nod",
			characterId = 0,
			say = "That's a good point. Thanks, Stephen.",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			subName = "Manager of Logistics",
			characterId = 100300,
			say = "Don't thank me, I didn't even do anything! Still, hope it goes well!",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		}
	}
}
