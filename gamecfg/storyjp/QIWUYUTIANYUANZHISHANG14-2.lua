return {
	fadeOut = 1.5,
	mode = 2,
	id = "QIWUYUTIANYUANZHISHANG14-2",
	placeholder = {
		"playername"
	},
	scripts = {
		{
			side = 2,
			nameColor = "#A9F548FF",
			bgName = "star_level_bg_491",
			hidePaintObj = true,
			bgm = "battle-unknown-approaching",
			say = "―――――！",
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
			bgName = "star_level_bg_491",
			hidePaintObj = true,
			say = "夢界の泡影、形なき穢れ、侵食具現体……異なる姿だが、本質は同じ。",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			nameColor = "#A9F548FF",
			side = 2,
			bgName = "star_level_bg_491",
			hidePaintObj = true,
			say = "漆黒の雲海の上で、黒い波をかき分け、精一杯進路を拓く。",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			nameColor = "#A9F548FF",
			side = 2,
			bgName = "star_level_bg_491",
			hidePaintObj = true,
			say = "数が多い以外は脅威ではない。",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			nameColor = "#A9F548FF",
			side = 2,
			bgName = "star_level_bg_491",
			hidePaintObj = true,
			say = "しかし、その数こそが手に余る。",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			nameColor = "#A9F548FF",
			side = 2,
			bgName = "star_level_bg_491",
			hidePaintObj = true,
			say = "次から次へと……いくら倒しても再び集まり、再び襲いかかってくる。",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			spacing = 30,
			mode = 1,
			asideType = 4,
			blackBg = true,
			rectOffset = {
				700,
				700,
				700,
				700
			},
			sequence = {
				{
					"「――闇に生まれし恐怖のように」",
					0
				}
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
			expression = 4,
			side = 2,
			bgName = "star_level_bg_491",
			hidePaintObj = true,
			dir = 1,
			nameColor = "#A9F548FF",
			actor = 307160,
			say = "雲仙さん……これが「穢れ」ですか？こうも無尽蔵に出てきては私たちでは到底倒しきれませんわ",
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
			actor = 303190,
			side = 2,
			bgName = "star_level_bg_491",
			hidePaintObj = true,
			dir = 1,
			nameColor = "#A9F548FF",
			say = "倒したのはただの影です。根源を除かない限り、影が無限に湧いて来ます。",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			expression = 5,
			side = 2,
			bgName = "star_level_bg_491",
			hidePaintObj = true,
			dir = 1,
			nameColor = "#A9F548FF",
			actor = 303190,
			say = "殲滅ではなく道を切り開くことに専念してください。一刻も早くアマハラ城へ戻らなければなりません",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			expression = 4,
			side = 2,
			bgName = "star_level_bg_491",
			hidePaintObj = true,
			dir = 1,
			nameColor = "#A9F548FF",
			actor = 307160,
			say = "はい！",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			expression = 4,
			side = 2,
			bgName = "star_level_bg_491",
			hidePaintObj = true,
			dir = 1,
			nameColor = "#A9F548FF",
			actor = 307010,
			say = "みんな気をつけて。もっと大きいやつが来ますわ",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			side = 2,
			actorName = "？？？",
			bgName = "star_level_bg_491",
			hidePaintObj = true,
			dir = 1,
			nameColor = "#BDBDBD",
			say = "▂▃▆▂▃▆▇▂▃▇█▆▆▇▇▆▇",
			fontsize = 60,
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			},
			effects = {
				{
					active = true,
					name = "speed"
				}
			},
			dialogShake = {
				speed = 0.08,
				x = 15,
				number = 2
			},
			movableNode = {
				{
					time = 1000,
					name = "chongying_u_boss02",
					spine = {
						action = "",
						scale = 1
					},
					path = {
						{
							300,
							-400
						},
						{
							0,
							-400
						}
					}
				}
			}
		},
		{
			expression = 4,
			side = 2,
			bgName = "star_level_bg_491",
			hidePaintObj = true,
			dir = 1,
			nameColor = "#A9F548FF",
			actor = 303200,
			say = "黒い……竜？",
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
			expression = 5,
			side = 2,
			bgName = "star_level_bg_491",
			hidePaintObj = true,
			dir = 1,
			nameColor = "#A9F548FF",
			actor = 303190,
			say = "斯様な妖邪がこうも早く出てきたとは……",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			actor = 303190,
			side = 2,
			bgName = "star_level_bg_491",
			hidePaintObj = true,
			dir = 1,
			nameColor = "#A9F548FF",
			say = "下がってください…！今までの敵とは違います。ここは私が斬ります…！",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			portrait = 317020,
			side = 2,
			bgName = "star_level_bg_491",
			hidePaintObj = true,
			dir = 1,
			nameColor = "#A9F548FF",
			actorName = "伊404",
			say = "雲仙さん！伊404、水無瀬と妙風とともに馳せ参じた！",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			},
			flashout = {
				black = true,
				dur = 0.25,
				alpha = {
					0,
					1
				}
			},
			flashin = {
				delay = 0.25,
				dur = 0.25,
				black = true,
				alpha = {
					1,
					0
				}
			}
		},
		{
			portrait = 317020,
			side = 2,
			bgName = "star_level_bg_491",
			hidePaintObj = true,
			dir = 1,
			nameColor = "#A9F548FF",
			actorName = "伊404",
			say = "ここはわたしたちに任せて、このまま指揮官をアマハラ城まで連れて行って！",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			expression = 1,
			side = 2,
			bgName = "star_level_bg_491",
			hidePaintObj = true,
			dir = 1,
			nameColor = "#A9F548FF",
			actor = 303190,
			say = "伊404、水竜を用いて彼奴を絞り殺すのです",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			portrait = 317020,
			side = 2,
			bgName = "star_level_bg_491",
			hidePaintObj = true,
			dir = 1,
			nameColor = "#A9F548FF",
			actorName = "伊404",
			say = "ふん。わかったわ！",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			expression = 5,
			side = 2,
			bgName = "star_level_bg_491",
			hidePaintObj = true,
			dir = 1,
			nameColor = "#A9F548FF",
			actor = 303190,
			say = "さて、こっちは引き続き前へ進みましょう",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		}
	}
}
