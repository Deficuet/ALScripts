return {
	id = "XIANGCHEYUTIANQIONGZHIYIN29",
	mode = 2,
	fadeOut = 1.5,
	scripts = {
		{
			nameColor = "#A9F548FF",
			side = 2,
			bgName = "bg_tianqiong_1",
			hidePaintObj = true,
			say = "On my way to the Anchorage City Defense Headquarters, I suddenly receive a strange call from Memphis META.",
			bgm = "story-weimu-link",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			},
			flashin = {
				delay = 0,
				dur = 1,
				black = true,
				alpha = {
					1,
					0
				}
			}
		},
		{
			expression = 6,
			side = 2,
			bgName = "bg_tianqiong_1",
			paintingNoise = true,
			dir = 1,
			actor = 900390,
			nameColor = "#C3ABFF",
			hidePaintObj = true,
			say = "Commander! Marco Polo has woken up and vanished from the Compiling Field!",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			paintingNoise = true,
			side = 2,
			bgName = "bg_tianqiong_1",
			hidePaintObj = true,
			dir = 1,
			nameColor = "#C3ABFF",
			actor = 900390,
			say = "Based on her positional data, I think she's heading toward... you.",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			actor = 0,
			nameColor = "#A9F548FF",
			bgName = "bg_tianqiong_1",
			hidePaintObj = true,
			side = 2,
			portrait = "zhihuiguan",
			say = "...What?",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			expression = 7,
			side = 2,
			bgName = "bg_tianqiong_1",
			dir = 1,
			bgm = "theme-marcopolo",
			actor = 107250,
			nameColor = "#A9F548FF",
			hidePaintObj = true,
			say = "Look up there! Someone is standing on that street light.",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			},
			flashout = {
				black = true,
				dur = 0.5,
				alpha = {
					0,
					1
				}
			},
			flashin = {
				delay = 0.5,
				dur = 0.5,
				black = true,
				alpha = {
					1,
					0
				}
			},
			location = {
				"Anchorage - Urban Area",
				3
			}
		},
		{
			expression = 1,
			side = 2,
			bgName = "bg_tianqiong_1",
			hidePaintObj = true,
			dir = 1,
			nameColor = "#FFC960",
			actor = 9707060,
			say = "What are you– Oh, you're not kidding. What's she doing up there?",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			actor = 0,
			nameColor = "#A9F548FF",
			bgName = "bg_tianqiong_1",
			hidePaintObj = true,
			side = 2,
			portrait = "zhihuiguan",
			say = "Wait, on a street light?",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			bgName = "bg_tianqiong_cg4",
			mode = 1,
			sequence = {
				{
					"",
					0
				}
			},
			flashout = {
				black = true,
				dur = 0.5,
				alpha = {
					0,
					1
				}
			},
			flashin = {
				delay = 0.5,
				dur = 0.5,
				black = true,
				alpha = {
					1,
					0
				}
			}
		},
		{
			portrait = 699010,
			side = 2,
			bgName = "bg_tianqiong_cg4",
			hidePaintObj = true,
			dir = 1,
			nameColor = "#A9F548FF",
			actorName = "Marco Polo",
			say = "Ohohoho! At long last, your Apostle has returned!",
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
			portrait = 699010,
			side = 2,
			bgName = "bg_tianqiong_cg4",
			hidePaintObj = true,
			dir = 1,
			nameColor = "#A9F548FF",
			actorName = "Marco Polo",
			say = "Kneel, feeble commoners, and tremble before my absolute power!",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			nameColor = "#A9F548FF",
			side = 2,
			bgName = "bg_tianqiong_cg4",
			hidePaintObj = true,
			say = "Standing on a street lamp a stone's throw away and draped in a cape, a woman shouted an introduction fit for a supervillain.",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			nameColor = "#A9F548FF",
			side = 2,
			bgName = "bg_tianqiong_cg4",
			hidePaintObj = true,
			say = "Dun-dun-dun! It is none other than Marco Polo!",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			},
			options = {
				{
					content = "Marco Polo?!",
					flag = 1
				},
				{
					content = "Who taught you these theatrics?",
					flag = 2
				}
			}
		},
		{
			portrait = 699010,
			side = 2,
			bgName = "bg_tianqiong_cg4",
			nameColor = "#A9F548FF",
			dir = 1,
			optionFlag = 1,
			actorName = "Marco Polo",
			hidePaintObj = true,
			say = "Why, yes! It is me, Marco Polo!",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			portrait = 699010,
			side = 2,
			bgName = "bg_tianqiong_cg4",
			nameColor = "#A9F548FF",
			dir = 1,
			optionFlag = 2,
			actorName = "Marco Polo",
			hidePaintObj = true,
			say = "It is from the brilliance of my own mind. The pressure I exude is palpable, is it not?",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			portrait = 101550,
			side = 2,
			bgName = "bg_tianqiong_cg4",
			hidePaintObj = true,
			dir = 1,
			nameColor = "#A9F548FF",
			actorName = "Clarence K. Bronson",
			say = "You know this weirdo, Commander?",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			portrait = 101550,
			side = 2,
			bgName = "bg_tianqiong_cg4",
			hidePaintObj = true,
			dir = 1,
			nameColor = "#A9F548FF",
			actorName = "Clarence K. Bronson",
			say = "Then... is she here to support us?",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			actor = 0,
			nameColor = "#A9F548FF",
			bgName = "bg_tianqiong_cg4",
			hidePaintObj = true,
			side = 2,
			portrait = "zhihuiguan",
			say = "Honestly, I wish I could say I didn't know her.",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			actor = 0,
			nameColor = "#A9F548FF",
			bgName = "bg_tianqiong_cg4",
			hidePaintObj = true,
			side = 2,
			portrait = "zhihuiguan",
			say = "And I'm not so sure she's come to help, either.",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			side = 2,
			actorName = "William D. Porter",
			bgName = "bg_tianqiong_cg4",
			hidePaintObj = true,
			dir = 1,
			nameColor = "#A9F548FF",
			say = "Whoooa! That looks so cool! I wanna do that!",
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
			side = 2,
			actorName = "Pasadena",
			bgName = "bg_tianqiong_cg4",
			hidePaintObj = true,
			nameColor = "#A9F548FF",
			say = "Same! If only to get everyone's attention immediately!",
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
			portrait = 699010,
			side = 2,
			bgName = "bg_tianqiong_cg4",
			hidePaintObj = true,
			dir = 1,
			nameColor = "#A9F548FF",
			actorName = "Marco Polo",
			say = "Do you hear that, Commander? There ARE people in the world who grasp my greatness!",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			portrait = 699010,
			side = 2,
			bgName = "bg_tianqiong_cg4",
			hidePaintObj = true,
			dir = 1,
			nameColor = "#A9F548FF",
			actorName = "Marco Polo",
			say = "You need no longer be afraid, for the magnificent Apostle Marco Polo is here to assist!",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			portrait = 699010,
			side = 2,
			bgName = "bg_tianqiong_cg4",
			hidePaintObj = true,
			dir = 1,
			nameColor = "#A9F548FF",
			actorName = "Marco Polo",
			say = "Now, behold!",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			bgName = "bg_tianqiong_cg5",
			mode = 1,
			sequence = {
				{
					"",
					0
				}
			},
			effects = {
				{
					active = true,
					name = "jinguang"
				}
			}
		},
		{
			nameColor = "#A9F548FF",
			side = 2,
			bgName = "bg_tianqiong_cg5",
			hidePaintObj = true,
			say = "The air trembles, and a giant, silver-white phantom comes into existence behind Marco Polo.",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			nameColor = "#A9F548FF",
			side = 2,
			bgName = "bg_tianqiong_cg5",
			hidePaintObj = true,
			say = "Along with it, a translucent silver wand appears at the same time.",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			side = 2,
			actorName = "William D. Porter",
			bgName = "bg_tianqiong_cg5",
			hidePaintObj = true,
			dir = 1,
			nameColor = "#A9F548FF",
			say = "Holy cow! What is THAT?!",
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
			side = 2,
			actorName = "Clarence K. Bronson",
			bgName = "bg_tianqiong_cg5",
			hidePaintObj = true,
			dir = 1,
			nameColor = "#A9F548FF",
			say = "Is that a 3D projection?",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			portrait = 699010,
			side = 2,
			bgName = "bg_tianqiong_cg5",
			hidePaintObj = true,
			dir = 1,
			nameColor = "#A9F548FF",
			actorName = "Marco Polo",
			say = "Wrooong!",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			portrait = 699010,
			side = 2,
			bgName = "bg_tianqiong_cg5",
			hidePaintObj = true,
			dir = 1,
			nameColor = "#A9F548FF",
			actorName = "Marco Polo",
			say = "This is power!",
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
			portrait = 699010,
			side = 2,
			bgName = "bg_tianqiong_cg5",
			hidePaintObj = true,
			dir = 1,
			nameColor = "#A9F548FF",
			actorName = "Marco Polo",
			say = "My power! A symbol of my power!",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			portrait = 699010,
			side = 2,
			bgName = "bg_tianqiong_cg5",
			hidePaintObj = true,
			dir = 1,
			nameColor = "#A9F548FF",
			actorName = "Marco Polo",
			say = "Oh, but that's not all!",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			bgName = "bg_tianqiong_cg6",
			mode = 1,
			sequence = {
				{
					"",
					0
				}
			},
			effects = {
				{
					active = true,
					name = "jinguang"
				}
			}
		},
		{
			nameColor = "#A9F548FF",
			side = 2,
			bgName = "bg_tianqiong_cg6",
			hidePaintObj = true,
			say = "As the trembling in the air grows bigger, a mighty-looking aircraft appears – then another, then another.",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			portrait = 699010,
			side = 2,
			bgName = "bg_tianqiong_cg6",
			hidePaintObj = true,
			dir = 1,
			nameColor = "#A9F548FF",
			actorName = "Marco Polo",
			say = "Ohohoho! Revel in the sight of my power!",
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
			portrait = 699010,
			side = 2,
			bgName = "bg_tianqiong_cg6",
			hidePaintObj = true,
			dir = 1,
			nameColor = "#A9F548FF",
			actorName = "Marco Polo",
			say = "Ahaha!",
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
			portrait = 699010,
			side = 2,
			bgName = "bg_tianqiong_cg6",
			hidePaintObj = true,
			dir = 1,
			nameColor = "#A9F548FF",
			actorName = "Marco Polo",
			say = "Ahahaha!",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			},
			dialogShake = {
				speed = 0.08,
				x = 15,
				number = 2
			},
			effects = {
				{
					active = true,
					name = "speed"
				}
			}
		},
		{
			portrait = 699010,
			side = 2,
			bgName = "bg_tianqiong_cg6",
			hidePaintObj = true,
			dir = 1,
			nameColor = "#A9F548FF",
			actorName = "Marco Polo",
			say = "Ahahaha... Wait...",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			},
			dialogShake = {
				speed = 0.08,
				x = 15,
				number = 2
			},
			effects = {
				{
					active = false,
					name = "speed"
				}
			}
		},
		{
			portrait = 699010,
			side = 2,
			bgName = "bg_tianqiong_cg6",
			hidePaintObj = true,
			dir = 1,
			nameColor = "#A9F548FF",
			actorName = "Marco Polo",
			say = "How do I get down from this street light?",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			actor = 0,
			nameColor = "#A9F548FF",
			bgName = "bg_tianqiong_cg6",
			hidePaintObj = true,
			side = 2,
			portrait = "zhihuiguan",
			say = "......",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			nameColor = "#A9F548FF",
			side = 2,
			bgName = "bg_tianqiong_cg6",
			hidePaintObj = true,
			say = "The first thing that appeared by Marco Polo's side was a projection of Hierophant, followed by Devil's aircraft.",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			nameColor = "#A9F548FF",
			side = 2,
			bgName = "bg_tianqiong_cg6",
			hidePaintObj = true,
			say = "I've always felt that something was weird about Hierophant. Could it be that she somehow caught a glimpse of the perfect future?",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			nameColor = "#A9F548FF",
			side = 2,
			bgName = "bg_tianqiong_cg6",
			hidePaintObj = true,
			say = "I suppose it doesn't matter now. The more people we have at our side, the greater our odds of victory.",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			nameColor = "#A9F548FF",
			side = 2,
			bgName = "bg_tianqiong_cg6",
			hidePaintObj = true,
			say = "Even if it's Marco Polo we're talking about, it's better than no one coming to our aid... right?",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		}
	}
}
