return {
	id = "ISLAND1001030",
	mode = 10,
	map = {
		{
			100400,
			10010040
		},
		{
			100500,
			10010063
		}
	},
	look_weight = {
		{
			0.9,
			0
		},
		{
			0.1,
			0
		}
	},
	scripts = {
		{
			say = "*pant*... You run way too fast, Amerigo.",
			characterId = 0,
			face2Face = {
				{
					0,
					100500
				}
			},
			turnto = {
				{
					100400,
					0
				}
			},
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			animation = "hi",
			characterId = 100500,
			subName = "Manager of the Ranch",
			say = "Oh, Commander! Come here! Homeric's been rambling about some stuff I don't understand!",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			characterId = 0,
			say = "Stuff you don't understand?",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			animation = "think",
			characterId = 100400,
			subName = "Manager of the Farm",
			say = "C-Commander, Amerigo told me about the situation on the ranch, so we chatted, and...",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			subName = "Manager of the Farm",
			characterId = 100400,
			say = "Well, it's about your ecological cycle idea. About using natural fertilizer from the ranch to replenish the farm's nutrients.",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			characterId = 0,
			say = "Ah, that. Did you reach a conclusion?",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			animation = "talk",
			characterId = 100400,
			subName = "Manager of the Farm",
			say = "Yes. Considering the ranch's and the farm's current states and needs, it's necessary to expand them both.",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			subName = "Manager of the Farm",
			characterId = 100400,
			say = "As you might expect, it's completely impossible for a single chicken to sustain a large farm.",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			animation = "doubt",
			characterId = 100500,
			subName = "Manager of the Ranch",
			say = "So basically, the ranch needs more animals? Sounds perfect!",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			characterId = 0,
			say = "We don't need them right this moment, though, right?",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			animation = "nod",
			characterId = 100400,
			subName = "Manager of the Farm",
			say = "Not yet, no. The farm's soil is still nice and fertile, so Amerigo doesn't need to rush to get more animals.",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			say = "Great! If we do it slow and steady, we can not only pay back our debts, but also greatly increase the island's output.",
			characterId = 0,
			animation = "nod",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			characterId = 0,
			say = "Granted, Amerigo will have to put in some work for it.",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			animation = "nod",
			characterId = 100500,
			subName = "Manager of the Ranch",
			say = "Then work I will! I'll raise all the animals by myself, just you wait and see!",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			say = "That's the spirit. Oh, geesh, look how late it is, and I've barely had a bite to eat the whole day. Is there any good food on the island?",
			characterId = 0,
			animation = "nod",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			animation = "elation",
			characterId = 100500,
			subName = "Manager of the Ranch",
			say = "Ah! You hungry? Then you'll definitely wanna check out Café Manjuu by the harbor!",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			say = "You're saying I should have coffee for dinner? I'm not sure I need something to put my brain into work mode this late.",
			characterId = 0,
			animation = "talk",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			subName = "Manager of the Ranch",
			characterId = 100500,
			say = "Hey, I'm not telling you to drink coffee! Remember the eggs you just got?",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			animation = "talk",
			characterId = 100500,
			subName = "Manager of the Ranch",
			say = "You can give those to the staff at the café, and they'll whip up a heavenly omelette for you!",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			animation = "nod",
			characterId = 100400,
			subName = "Manager of the Farm",
			say = "Ah, an omelette. That sounds lovely.",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			characterId = 0,
			say = "Okay, I'll go do that. I deserve a little treat after today.",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			characterId = 0,
			say = "You two should head to bed soon. The future of the farm and the ranch depends on you.",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			animation = "bye",
			characterId = 100500,
			subName = "Manager of the Ranch",
			say = "Yeah, we know! Come on, off you go! Go have yourself an omelette made with fresh eggs!",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			animation = "bye",
			characterId = 100400,
			subName = "Manager of the Farm",
			say = "See you later, Commander.",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		}
	}
}
