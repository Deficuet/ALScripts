return {
	fadeOut = 1.5,
	mode = 2,
	id = "XIANGCHEYUTIANQIONGZHIYIN37-5",
	placeholder = {
		"playername"
	},
	scripts = {
		{
			actor = 900191,
			side = 2,
			bgName = "bg_tianqiong_3",
			nameColor = "#A9F548FF",
			dir = 1,
			say = "This is good. The load on the Veil is rapidly diminishing.",
			bgm = "story-antix-past",
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
			},
			location = {
				"Test Site Theta - Star Veil",
				3
			}
		},
		{
			actor = 900191,
			side = 2,
			bgName = "bg_tianqiong_3",
			nameColor = "#A9F548FF",
			dir = 1,
			say = "Temperance, Hermit, assist Star with resetting the Star Barrier.",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			paintingNoise = true,
			side = 0,
			bgName = "bg_tianqiong_3",
			hideOther = true,
			dir = 1,
			actorName = "Arbiter: Temperance XIV & Arbiter: The Hermit IX",
			actor = 900286,
			nameColor = "#A9F548FF",
			say = "- Okay.  - Got it.",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			},
			subActors = {
				{
					paintingNoise = true,
					actor = 900287,
					dir = 1,
					hidePaintObj = false,
					pos = {
						x = 1125,
						y = 0
					}
				}
			}
		},
		{
			actor = 900191,
			side = 2,
			bgName = "bg_tianqiong_3",
			nameColor = "#A9F548FF",
			dir = 1,
			say = "Magician, start preparing on your end as well.",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			actor = 900490,
			side = 2,
			bgName = "bg_tianqiong_3",
			nameColor = "#A9F548FF",
			dir = 1,
			paintingNoise = true,
			say = "Understood. Rediverting performance now.",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			actor = 900191,
			side = 2,
			bgName = "bg_tianqiong_3",
			nameColor = "#A9F548FF",
			dir = 1,
			say = "And next...",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			actor = 900191,
			side = 2,
			bgName = "bg_tianqiong_3",
			nameColor = "#A9F548FF",
			dir = 1,
			say = "Moon, use the War Protocol Moon vessel to contact {playername}. Say the time is ripe to go to the Anchorage National Observatory.",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			actor = 900191,
			side = 2,
			bgName = "bg_tianqiong_3",
			nameColor = "#A9F548FF",
			dir = 1,
			say = "Also, that you'd better get ready if you're going to meet Helena again.",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		}
	}
}
