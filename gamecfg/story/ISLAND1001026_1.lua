return {
	id = "ISLAND1001026_1",
	mode = 10,
	map = {
		{
			100400,
			10010040
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
			animation = "hi",
			say = "That's everything!",
			face2Face = {
				{
					0,
					100400
				}
			},
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			say = "Well, Commander? Did you notice anything different about those seeds?",
			characterId = 100400,
			subName = "Manager of the Farm",
			animation = "nod",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			},
			options = {
				{
					content = "I did.",
					flag = 1
				},
				{
					content = "Uhh...",
					flag = 2
				}
			}
		},
		{
			characterId = 0,
			optionFlag = 1,
			say = "Compared to regular wheat, they were shaped and sized completely differently. Weird stuff.",
			animation = "nod",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			characterId = 0,
			optionFlag = 2,
			say = "Come to think of it, yeah, they were different. Like, they were... Um...",
			animation = "talk",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			characterId = 100400,
			optionFlag = 2,
			subName = "Manager of the Farm",
			say = "*stares patiently*...",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			characterId = 0,
			optionFlag = 2,
			say = "They were bigger!",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			animation = "nod",
			characterId = 100400,
			subName = "Manager of the Farm",
			say = "That's right. I knew you'd notice it.",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			subName = "Manager of the Farm",
			characterId = 100400,
			say = "The island has a blessed environment, and all the crops grown here are of exceptional quality.",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			say = "Many of the crops have undergone changes visible even at a glance if you compare them to ones in an encyclopedia.",
			characterId = 100400,
			subName = "Manager of the Farm",
			animation = "talk",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			characterId = 0,
			say = "From what I've heard, there's still untapped potential lying in this field.",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			subName = "Manager of the Farm",
			characterId = 100400,
			say = "There is. Given a small time investment, this field on its own will be able to feed the entire development area.",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			say = "Sure, but what if we scale up a bit?",
			characterId = 0,
			animation = "talk",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			characterId = 0,
			say = "How about feeding the island AND increasing our exports at the same time?",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			animation = "think",
			characterId = 100400,
			subName = "Manager of the Farm",
			say = "If we were to scale up, our high yields and quick growth cycles would indeed be nice advantages...",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			subName = "Manager of the Farm",
			characterId = 100400,
			say = "However, it will also rapidly deplete the nutrients in the soil.",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			subName = "Manager of the Farm",
			characterId = 100400,
			say = "It won't be possible to outpace the nutrient depletion with our current crop rotation and basic compost.",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			subName = "Manager of the Farm",
			characterId = 100400,
			say = "Look at this. While the field may seem fine on the surface, the organic matter content deep in the soil has already begun to decline.",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			animation = "sad",
			characterId = 100400,
			subName = "Manager of the Farm",
			say = "If we don't replenish it, the harvest will drop in both quality and quantity next season. It isn't a sustainable process.",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			characterId = 0,
			say = "Soil fertility's the problem, huh? In that case...",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			characterId = 0,
			say = "Whenever we take from the field, we must also give something back.",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			say = "Ah, yes, that's a great idea!",
			characterId = 100400,
			subName = "Manager of the Farm",
			animation = "amaze",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			say = "We could try natural fertilizer, for instance. There's a ranch right next to us, after all.",
			characterId = 0,
			animation = "talk",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			animation = "think",
			characterId = 100400,
			subName = "Manager of the Farm",
			say = "Of course. It's a safe and efficient option.",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			subName = "Manager of the Farm",
			characterId = 100400,
			say = "Depending on how the field's doing, we can also use it in tandem with chemical fertilizer when appropriate.",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			subName = "Manager of the Farm",
			characterId = 100400,
			say = "Yes, then we should be able to keep the soil fertile and grow lots of quality crops at the same time!",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			say = "Great! Then the key to solving this problem lies in the ranch.",
			characterId = 0,
			animation = "clap",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			subName = "Manager of the Farm",
			characterId = 100400,
			say = "Well, it may solve the soil issue, but there's another...",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			subName = "Manager of the Farm",
			characterId = 100400,
			say = "The scale you're envisioning is too much for me to handle all by myself.",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			say = "So you need manpower? Not a problem. I'm not a tyrant – I'll get you some helpers.",
			characterId = 0,
			animation = "nod",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			characterId = 0,
			say = "Now, let's head to the ranch and look for some brown gold.",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		}
	}
}
