return {
	id = "JIARIXINTIAODAYOULUN26",
	mode = 2,
	fadeOut = 1.5,
	scripts = {
		{
			nameColor = "#A9F548FF",
			side = 2,
			bgName = "star_level_bg_173",
			hidePaintObj = true,
			say = "I decide to have a tour of the onboard aquarium.",
			bgm = "story-niceship-soft",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			},
			flashout = {
				black = true,
				dur = 1,
				alpha = {
					0,
					1
				}
			},
			flashin = {
				delay = 1,
				dur = 1,
				black = true,
				alpha = {
					1,
					0
				}
			}
		},
		{
			actor = 0,
			side = 2,
			bgName = "star_level_bg_173",
			hidePaintObj = true,
			nameColor = "#A9F548FF",
			say = "(It's funny when you think about it. There's a sea not just outside the ship, but inside it, too. Sort of.)",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			actor = 108080,
			side = 2,
			bgName = "star_level_bg_173",
			hidePaintObj = true,
			dir = 1,
			nameColor = "#A9F548FF",
			say = "C-Commander? Did you come to look at the fish?",
			painting = {
				alpha = 0.3,
				time = 1
			},
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			},
			action = {
				{
					type = "shake",
					y = 30,
					delay = 0,
					dur = 0.15,
					x = 0,
					number = 2
				}
			}
		},
		{
			expression = 4,
			side = 2,
			bgName = "star_level_bg_173",
			hidePaintObj = true,
			dir = 1,
			nameColor = "#A9F548FF",
			actor = 107300,
			say = "Well, hello! Good morning, Commander.",
			painting = {
				alpha = 0.3,
				time = 1
			},
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			actor = 101401,
			side = 2,
			bgName = "star_level_bg_173",
			hidePaintObj = true,
			dir = 1,
			nameColor = "#A9F548FF",
			say = "Oh! Would you like to go in the aquarium with us?",
			painting = {
				alpha = 0.3,
				time = 1
			},
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			nameColor = "#A9F548FF",
			side = 2,
			bgName = "star_level_bg_173",
			hidePaintObj = true,
			say = "I was only planning to have a casual look around. Now I've run into an unexpected trio.",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			nameColor = "#A9F548FF",
			side = 2,
			bgName = "star_level_bg_173",
			hidePaintObj = true,
			say = "I accept their offer and follow them, leisurely walking through the aquarium.",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			actor = 107300,
			side = 2,
			bgName = "star_level_bg_173",
			hidePaintObj = true,
			dir = 1,
			nameColor = "#A9F548FF",
			say = "Do you know why they put an aquarium of all things aboard the ship?",
			painting = {
				alpha = 0.3,
				time = 1
			},
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			expression = 7,
			side = 2,
			bgName = "star_level_bg_173",
			hidePaintObj = true,
			dir = 1,
			nameColor = "#A9F548FF",
			actor = 107300,
			say = "Hint: it's not just because Flasher suggested it!",
			painting = {
				alpha = 0.3,
				time = 1
			},
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			actor = 0,
			side = 2,
			bgName = "star_level_bg_173",
			hidePaintObj = true,
			nameColor = "#A9F548FF",
			say = "I mean, what more is there to it?",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			expression = 2,
			side = 2,
			bgName = "star_level_bg_173",
			hidePaintObj = true,
			dir = 1,
			nameColor = "#A9F548FF",
			actor = 101401,
			say = "Is it that we don't get to see fish often? I've heard not even the submarines see them much.",
			painting = {
				alpha = 0.3,
				time = 1
			},
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			expression = 6,
			side = 2,
			bgName = "star_level_bg_173",
			hidePaintObj = true,
			dir = 1,
			nameColor = "#A9F548FF",
			actor = 108080,
			say = "Umm... Is it because we all agree that fishies are cute?",
			painting = {
				alpha = 0.3,
				time = 1
			},
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			expression = 7,
			side = 2,
			bgName = "star_level_bg_173",
			hidePaintObj = true,
			dir = 1,
			nameColor = "#A9F548FF",
			actor = 107300,
			say = "Bzzzt. Wrong-o.",
			painting = {
				alpha = 0.3,
				time = 1
			},
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			expression = 1,
			side = 2,
			bgName = "star_level_bg_173",
			hidePaintObj = true,
			dir = 1,
			nameColor = "#A9F548FF",
			actor = 107300,
			say = "It's because aquariums are popular dating spots! They're nice and quiet, and the lighting is all romantic.",
			painting = {
				alpha = 0.3,
				time = 1
			},
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			expression = 4,
			side = 2,
			bgName = "star_level_bg_173",
			hidePaintObj = true,
			dir = 1,
			nameColor = "#A9F548FF",
			actor = 107300,
			say = "When you go vacationing, you need at least ONE place to go on a date.",
			painting = {
				alpha = 0.3,
				time = 1
			},
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			expression = 2,
			side = 2,
			bgName = "star_level_bg_173",
			hidePaintObj = true,
			dir = 1,
			nameColor = "#A9F548FF",
			actor = 108080,
			say = "That's why? Then it's no wonder they okayed my idea right away.",
			painting = {
				alpha = 0.3,
				time = 1
			},
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			expression = 2,
			side = 2,
			bgName = "star_level_bg_173",
			hidePaintObj = true,
			dir = 1,
			nameColor = "#A9F548FF",
			actor = 101401,
			say = "That can't be the only reason. You're just teasing us, aren't you, Jacinto?",
			painting = {
				alpha = 0.3,
				time = 1
			},
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			expression = 1,
			side = 2,
			bgName = "star_level_bg_173",
			hidePaintObj = true,
			dir = 1,
			nameColor = "#A9F548FF",
			actor = 107300,
			say = "Dang. Foiled again, and so quickly!",
			painting = {
				alpha = 0.3,
				time = 1
			},
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			nameColor = "#A9F548FF",
			side = 2,
			bgName = "star_level_bg_173",
			hidePaintObj = true,
			say = "While the girls chat away, I gaze up at a big fish tank.",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			nameColor = "#A9F548FF",
			side = 2,
			bgName = "star_level_bg_173",
			hidePaintObj = true,
			say = "The fish are swimming around a coral reef... with the occasional shark or whale passing by.",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			actor = 0,
			side = 2,
			bgName = "star_level_bg_173",
			hidePaintObj = true,
			nameColor = "#A9F548FF",
			say = "(It IS a pretty sight, but what's going to happen with these fish when we get back to the port?)",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			actor = 0,
			side = 2,
			bgName = "star_level_bg_173",
			hidePaintObj = true,
			nameColor = "#A9F548FF",
			say = "(You can't just set them free in the ocean. One option is to transfer them to our on-land aquarium.)",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			actor = 0,
			side = 2,
			bgName = "star_level_bg_173",
			hidePaintObj = true,
			nameColor = "#A9F548FF",
			say = "Hmm...",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			expression = 1,
			side = 2,
			bgName = "star_level_bg_173",
			hidePaintObj = true,
			dir = 1,
			nameColor = "#A9F548FF",
			actor = 107300,
			say = "Something on your mind, Commander? Are you thinking about what to do with the fish when we're back home?",
			painting = {
				alpha = 0.3,
				time = 1
			},
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			actor = 107300,
			side = 2,
			bgName = "star_level_bg_173",
			hidePaintObj = true,
			dir = 1,
			nameColor = "#A9F548FF",
			say = "Then I have good news. Flasher has already thought about that!",
			painting = {
				alpha = 0.3,
				time = 1
			},
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			expression = 5,
			side = 2,
			bgName = "star_level_bg_173",
			hidePaintObj = true,
			dir = 1,
			nameColor = "#A9F548FF",
			actor = 108080,
			say = "I-I have! I'll take them in and look after them. I don't want anything to happen to the fishies!",
			painting = {
				alpha = 0.3,
				time = 1
			},
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			actor = 101401,
			side = 2,
			bgName = "star_level_bg_173",
			hidePaintObj = true,
			dir = 1,
			nameColor = "#A9F548FF",
			say = "If you'll look after them, I'd like to help.",
			painting = {
				alpha = 0.3,
				time = 1
			},
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			expression = 6,
			side = 2,
			bgName = "star_level_bg_173",
			hidePaintObj = true,
			dir = 1,
			nameColor = "#A9F548FF",
			actor = 108080,
			say = "Y-you will? *sniffle*... Sorry, I can't... I'm just so, so happy...",
			painting = {
				alpha = 0.3,
				time = 1
			},
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			},
			action = {
				{
					type = "shake",
					y = 30,
					delay = 0,
					dur = 0.15,
					x = 0,
					number = 2
				}
			},
			options = {
				{
					content = "(Wipe away Flasher's tears.)",
					flag = 1
				},
				{
					content = "(Give Flasher a pat on the back.)",
					flag = 2
				}
			}
		},
		{
			expression = 3,
			side = 2,
			bgName = "star_level_bg_173",
			dir = 1,
			optionFlag = 1,
			actor = 108080,
			nameColor = "#A9F548FF",
			hidePaintObj = true,
			say = "*sniffle*... Thanks... Thank you, Commander!",
			painting = {
				alpha = 0.3,
				time = 1
			},
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			},
			action = {
				{
					type = "shake",
					y = 30,
					delay = 0,
					dur = 0.15,
					x = 0,
					number = 2
				}
			}
		},
		{
			expression = 6,
			side = 2,
			bgName = "star_level_bg_173",
			dir = 1,
			optionFlag = 2,
			actor = 108080,
			nameColor = "#A9F548FF",
			hidePaintObj = true,
			say = "Heehee... I appreciate it, Commander... *sniffle*...",
			painting = {
				alpha = 0.3,
				time = 1
			},
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			},
			action = {
				{
					type = "shake",
					y = 30,
					delay = 0,
					dur = 0.15,
					x = 0,
					number = 2
				}
			}
		},
		{
			expression = 7,
			side = 2,
			bgName = "star_level_bg_173",
			hidePaintObj = true,
			dir = 1,
			nameColor = "#A9F548FF",
			actor = 107300,
			say = "You really are a nice person, Commander.",
			painting = {
				alpha = 0.3,
				time = 1
			},
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			expression = 1,
			side = 2,
			bgName = "star_level_bg_173",
			hidePaintObj = true,
			dir = 1,
			nameColor = "#A9F548FF",
			actor = 107300,
			say = "I was joking about the aquarium as a date spot thing, but you know...",
			painting = {
				alpha = 0.3,
				time = 1
			},
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			nameColor = "#A9F548FF",
			side = 2,
			bgName = "star_level_bg_173",
			hidePaintObj = true,
			say = "San Jacinto grabs my hand.",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			nameColor = "#A9F548FF",
			side = 2,
			bgName = "star_level_bg_173",
			hidePaintObj = true,
			say = "She runs her slim fingers around in my palm, then locks them between mine.",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			actor = 107300,
			side = 2,
			bgName = "star_level_bg_173",
			hidePaintObj = true,
			dir = 1,
			nameColor = "#A9F548FF",
			say = "The mood here IS perfect for a date. Let's go on one, Commander.",
			painting = {
				alpha = 0.3,
				time = 1
			},
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			nameColor = "#A9F548FF",
			side = 2,
			bgName = "star_level_bg_173",
			hidePaintObj = true,
			say = "I casually toured the aquarium with the three girls.",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			},
			flashout = {
				black = true,
				dur = 1,
				alpha = {
					0,
					1
				}
			},
			flashin = {
				delay = 1,
				dur = 1,
				black = true,
				alpha = {
					1,
					0
				}
			}
		},
		{
			nameColor = "#A9F548FF",
			side = 2,
			bgName = "star_level_bg_173",
			hidePaintObj = true,
			say = "When I return outside, the sun has started to set. It's too early for bedtime, though, so I should check out someplace else.",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		}
	}
}
