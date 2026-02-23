return {
	id = "DATEALANEGUANQIA7",
	mode = 2,
	fadeOut = 1.5,
	scripts = {
		{
			nameColor = "#A9F548FF",
			side = 2,
			bgName = "star_level_bg_504",
			hidePaintObj = true,
			say = "Tohka Yatogami and the three adventurers spent a while searching through the imitation of Tengu City.",
			bgm = "theme-fushun-adventure",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			},
			location = {
				"Anomalous Area - Sector Two - Somewhere Else",
				3
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
			bgName = "star_level_bg_504",
			hidePaintObj = true,
			say = "They mapped out its entire structure, finding not just spots to rest and a location Fu Shun dubbed \"the Demon Castle,\" but also even learned of the wonder of something called kinako bread in the process.",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			nameColor = "#A9F548FF",
			side = 2,
			bgName = "star_level_bg_504",
			hidePaintObj = true,
			say = "Then, just as they were about to clear out the Demon Castle, a spaceship entered everyone's view.",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			expression = 1,
			side = 2,
			bgName = "star_level_bg_504",
			hidePaintObj = true,
			dir = 1,
			nameColor = "#A9F548FF",
			actor = 501090,
			say = "Look! What is that? Some kind of new Siren superweapon?!",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			expression = 5,
			nameColor = "#A9F548FF",
			bgName = "star_level_bg_504",
			side = 2,
			dir = 1,
			actor = 11500010,
			say = "Isn't that... Fraxinus?",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			expression = 2,
			nameColor = "#A9F548FF",
			bgName = "star_level_bg_504",
			side = 2,
			dir = 1,
			actor = 11500010,
			say = "That's Kotori's airship!",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			nameColor = "#A9F548FF",
			side = 2,
			bgName = "star_level_bg_211",
			hidePaintObj = true,
			say = "Possibly thanks to Fraxinus AL's relaying, the adventure squad's long-unresponsive communicators finally came back online.",
			bgm = "battle-eagleunion",
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
			expression = 6,
			side = 2,
			bgName = "star_level_bg_211",
			hidePaintObj = true,
			dir = 1,
			nameColor = "#A9F548FF",
			actor = 11500030,
			say = "Tohka and that patrol fleet look ready for a fight. Seems they've found the enemy's stronghold!",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			actor = 0,
			side = 2,
			bgName = "star_level_bg_211",
			hidePaintObj = true,
			nameColor = "#A9F548FF",
			say = "There's no time to waste. We must press on!",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		}
	}
}
