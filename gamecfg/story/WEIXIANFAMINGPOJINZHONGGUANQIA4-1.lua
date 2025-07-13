return {
	id = "WEIXIANFAMINGPOJINZHONGGUANQIA4-1",
	mode = 2,
	fadeOut = 1.5,
	scripts = {
		{
			actor = 11100020,
			side = 2,
			bgName = "bg_tolove_1",
			nameColor = "#A9F548FF",
			dir = 1,
			say = "Whoa! Lala, watch out!",
			bgm = "story-richang-refreshing",
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
			bgName = "bg_tolove_1",
			say = "Lala was too focused on tinkering with Questy MacGuffin to realize that she was under attack, but Nana and Momo managed to push her out of the way in time.",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			nameColor = "#A9F548FF",
			side = 2,
			bgName = "bg_tolove_1",
			say = "KABOOOOM!",
			soundeffect = "event:/battle/boom2",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			},
			flashN = {
				color = {
					1,
					1,
					1,
					1
				},
				alpha = {
					{
						0,
						1,
						0.2,
						0
					},
					{
						1,
						0,
						0.2,
						0.2
					},
					{
						0,
						1,
						0.2,
						0.4
					},
					{
						1,
						0,
						0.2,
						0.6
					}
				}
			},
			dialogShake = {
				speed = 0.09,
				x = 8.5,
				number = 2
			}
		},
		{
			nameColor = "#A9F548FF",
			side = 2,
			bgName = "bg_tolove_1",
			say = "The attack grazed her rigging before striking the water, making a big splash.",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			actor = 11100030,
			side = 2,
			bgName = "bg_tolove_1",
			nameColor = "#A9F548FF",
			dir = 1,
			say = "Is everyone okay?!",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			},
			dialogShake = {
				speed = 0.08,
				x = 15,
				number = 2
			}
		},
		{
			actor = 11100010,
			side = 2,
			bgName = "bg_tolove_1",
			nameColor = "#A9F548FF",
			dir = 1,
			say = "That was close~ Thanks, Nana and Momo! I look away for one second, and I end up almost getting hurt~",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			actor = 11100060,
			side = 2,
			bgName = "bg_tolove_1",
			nameColor = "#A9F548FF",
			dir = 1,
			say = "This thing is strong... It's nothing like the enemies from before!",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			actor = 11100040,
			side = 2,
			bgName = "bg_tolove_1",
			nameColor = "#A9F548FF",
			dir = 1,
			say = "...I'll take care of this.",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			expression = 2,
			nameColor = "#A9F548FF",
			bgName = "bg_tolove_1",
			side = 2,
			dir = 1,
			actor = 11100050,
			say = "This one's movements and attacks are totally different from the others.",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			expression = 3,
			nameColor = "#A9F548FF",
			bgName = "bg_tolove_1",
			side = 2,
			dir = 1,
			actor = 11100050,
			say = "Yami, I don't think it's safe even for you to approach it alone.",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			nameColor = "#A9F548FF",
			side = 2,
			bgName = "bg_tolove_1",
			say = "While everyone argued over how to defeat this one, Lala had a moment of inspiration and spoke up.",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			expression = 2,
			nameColor = "#A9F548FF",
			bgName = "bg_tolove_1",
			side = 2,
			dir = 1,
			actor = 11100010,
			say = "Everyone, wait just a sec!",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			expression = 4,
			nameColor = "#A9F548FF",
			bgName = "bg_tolove_1",
			side = 2,
			dir = 1,
			actor = 11100010,
			say = "If I do this... Okay. This should work~",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			nameColor = "#A9F548FF",
			side = 2,
			bgName = "bg_tolove_1",
			say = "By Lala's hands and her newfound power, the broken Questy MacGuffin was born anew.",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			side = 2,
			actorName = "Questy MacGuffin",
			bgName = "bg_tolove_1",
			nameColor = "#A9F548FF",
			say = "ANALYZING TARGET.",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			side = 2,
			actorName = "Questy MacGuffin",
			bgName = "bg_tolove_1",
			nameColor = "#A9F548FF",
			say = "THREAT LEVEL: HIGH. FRONTAL ASSAULT ILL ADVISED. FIGHT PRUDENTLY.",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			expression = 2,
			nameColor = "#A9F548FF",
			bgName = "bg_tolove_1",
			side = 2,
			dir = 1,
			actor = 11100010,
			say = "So we can't fight it head-on...?",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			expression = 10,
			nameColor = "#A9F548FF",
			bgName = "bg_tolove_1",
			side = 2,
			dir = 1,
			actor = 11100030,
			say = "Do you have a plan?",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			expression = 3,
			nameColor = "#A9F548FF",
			bgName = "bg_tolove_1",
			side = 2,
			dir = 1,
			actor = 11100010,
			say = "If Questy's analysis and my own deductions are right...",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			actor = 11100010,
			side = 2,
			bgName = "bg_tolove_1",
			nameColor = "#A9F548FF",
			dir = 1,
			say = "Everyone cover me! I think I've figured out its weakness!",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		}
	}
}
