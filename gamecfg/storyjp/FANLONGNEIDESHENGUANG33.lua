return {
	id = "FANLONGNEIDESHENGUANG33",
	mode = 2,
	fadeOut = 1.5,
	scripts = {
		{
			stopbgm = true,
			mode = 1,
			asideType = 3,
			blackBg = true,
			say = "？？？·？？？",
			sequence = {
				{
					"？？？·？？？",
					1
				},
				{
					"？？？？",
					2
				}
			}
		},
		{
			nameColor = "#A9F548FF",
			side = 2,
			bgName = "star_level_bg_499",
			hidePaintObj = true,
			say = "果てしない純白で、時間も空間も意味をなさない空間。そんな空間の中をマルコ・ポーロは彷徨っていた。",
			bgm = "theme-underheaven",
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
			expression = 1,
			side = 2,
			bgName = "star_level_bg_499",
			hidePaintObj = true,
			dir = 1,
			nameColor = "#A9F548FF",
			actor = 699010,
			say = "はあ⋯⋯最悪⋯！",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			actor = 699010,
			side = 2,
			bgName = "star_level_bg_499",
			hidePaintObj = true,
			dir = 1,
			nameColor = "#A9F548FF",
			say = "どこもかしこも同じ景色⋯⋯どこに行けば帰れるのよ",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			expression = 1,
			side = 2,
			bgName = "star_level_bg_499",
			hidePaintObj = true,
			dir = 1,
			nameColor = "#A9F548FF",
			actor = 699010,
			say = "⋯⋯疲れたわ。法聖の玉座が恋しい⋯⋯",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			eventDelay = 1,
			nameColor = "#A9F548FF",
			bgName = "star_level_bg_499",
			hidePaintObj = true,
			side = 2,
			say = "そう呟いて、マルコ・ポーロは玉座へと腰を下ろした。",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			},
			movableNode = {
				{
					time = 1000,
					name = "makeboluo_wangzuo",
					spine = {
						action = "",
						scale = 1
					},
					path = {
						{
							0,
							-200
						},
						{
							0,
							-200
						}
					}
				}
			}
		},
		{
			expression = 5,
			side = 2,
			bgName = "star_level_bg_499",
			hidePaintObj = true,
			dir = 1,
			nameColor = "#A9F548FF",
			actor = 699010,
			say = "……？！！",
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
			expression = 6,
			side = 2,
			bgName = "star_level_bg_499",
			hidePaintObj = true,
			dir = 1,
			nameColor = "#A9F548FF",
			actor = 699010,
			say = "もっとカッコいい玉座がほしいかも！",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			},
			effects = {
				{
					active = false,
					name = "speed"
				}
			}
		},
		{
			eventDelay = 1,
			nameColor = "#A9F548FF",
			bgName = "star_level_bg_499",
			hidePaintObj = true,
			side = 2,
			say = "そう呟くと、マルコ・ポーロはさっきよりももっとカッコいい玉座に座っていた。",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			},
			movableNode = {
				{
					time = 1000,
					name = "makeboluo_jiaohuang",
					spine = {
						action = "",
						scale = 1
					},
					path = {
						{
							0,
							-200
						},
						{
							0,
							-200
						}
					}
				}
			}
		},
		{
			expression = 6,
			side = 2,
			bgName = "star_level_bg_499",
			hidePaintObj = true,
			dir = 1,
			nameColor = "#A9F548FF",
			actor = 699010,
			say = "こ、これはいったい⋯⋯？！",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			actor = 605080,
			side = 2,
			bgName = "star_level_bg_499",
			hidePaintObj = true,
			dir = 1,
			nameColor = "#A9F548FF",
			say = "うわー！マルコ・ポーロのそれ、すごくかっこいい玉座じゃない～！",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			expression = 6,
			side = 2,
			bgName = "star_level_bg_499",
			hidePaintObj = true,
			dir = 1,
			nameColor = "#A9F548FF",
			actor = 699010,
			say = "⋯⋯ラファエロ？！なんで君がここにいるのよ⋯⋯？！",
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
			expression = 2,
			side = 2,
			bgName = "star_level_bg_499",
			hidePaintObj = true,
			dir = 1,
			nameColor = "#A9F548FF",
			actor = 605080,
			say = "えっと⋯⋯祝勝パーティーでちょっと飲みすぎちゃって、それで⋯⋯",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			expression = 3,
			side = 2,
			bgName = "star_level_bg_499",
			hidePaintObj = true,
			dir = 1,
			nameColor = "#A9F548FF",
			actor = 605080,
			say = "ちなみに、ここって⋯⋯どこ？",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			actor = 699010,
			side = 2,
			bgName = "star_level_bg_499",
			hidePaintObj = true,
			dir = 1,
			nameColor = "#A9F548FF",
			say = "うーん⋯⋯",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			expression = 1,
			side = 2,
			bgName = "star_level_bg_499",
			hidePaintObj = true,
			dir = 1,
			nameColor = "#A9F548FF",
			actor = 699010,
			say = "そのことだけど⋯⋯",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			expression = 5,
			side = 2,
			bgName = "star_level_bg_499",
			dir = 1,
			fontsize = 60,
			actor = 699010,
			nameColor = "#A9F548FF",
			hidePaintObj = true,
			say = "――私も全然わからないわ！",
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
		}
	}
}
