return {
	fadeOut = 1.5,
	mode = 2,
	id = "QIWUYUTIANYUANZHISHANG14-1",
	placeholder = {
		"playername"
	},
	scripts = {
		{
			actor = 900520,
			side = 2,
			nameColor = "#FEF15E",
			hidePaintObj = true,
			say = "アマハラに入ってはならない……",
			blackBg = true,
			bgm = "story-darkplan",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			},
			effects = {
				{
					active = true,
					name = "juqing_mengjing"
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
			actor = 900520,
			side = 2,
			nameColor = "#FEF15E",
			hidePaintObj = true,
			blackBg = true,
			say = "ここは墓場……嘘偽りで築かれた墓場よ……",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			actor = 900520,
			side = 2,
			nameColor = "#FEF15E",
			hidePaintObj = true,
			blackBg = true,
			say = "牢獄は完全に閉じている……",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			actor = 900520,
			side = 2,
			nameColor = "#FEF15E",
			hidePaintObj = true,
			blackBg = true,
			say = "誰も逃げられない……",
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
					"「――誰も逃げられないわ」",
					0
				}
			},
			effects = {
				{
					active = false,
					name = "juqing_mengjing"
				}
			}
		},
		{
			expression = 2,
			side = 2,
			bgName = "star_level_bg_491",
			dir = 1,
			bgm = "story-temepest-2",
			actor = 307160,
			nameColor = "#A9F548FF",
			hidePaintObj = true,
			say = "……浅間、雲仙さん！",
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
			expression = 4,
			side = 2,
			bgName = "star_level_bg_491",
			hidePaintObj = true,
			dir = 1,
			nameColor = "#A9F548FF",
			actor = 307160,
			say = "……アマハラ大陣から警告ですわ！天域内に侵入者が現れました！",
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
			actor = 303200,
			say = "天域内に侵入者……？",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			expression = 3,
			side = 2,
			bgName = "star_level_bg_491",
			hidePaintObj = true,
			dir = 1,
			nameColor = "#A9F548FF",
			actor = 303200,
			say = "どうやってアマハラ大陣をすり抜けて入ってきたのですか",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			actor = 307010,
			side = 2,
			bgName = "star_level_bg_491",
			hidePaintObj = true,
			dir = 1,
			nameColor = "#A9F548FF",
			say = "今はその原因を追求している場合ではありませんわ。ここは危険です。今すぐアマハラ御殿に戻らないと",
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
			say = "……「穢れ」です",
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
			say = "もうじきここに……",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			expression = 2,
			side = 2,
			bgName = "star_level_bg_491",
			hidePaintObj = true,
			dir = 1,
			nameColor = "#A9F548FF",
			actor = 307160,
			say = "……なっ！？もう？",
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
			say = "ちっ……迎撃しますわ！敵を接近させないで！",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			actor = 102059,
			side = 2,
			bgName = "star_level_bg_491",
			hidePaintObj = true,
			nameColor = "#A9F548FF",
			say = "いますぐ量産艦を一隻展開するわ。指揮官、早く乗って",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			expression = 3,
			nameColor = "#A9F548FF",
			bgName = "star_level_bg_491",
			hidePaintObj = true,
			actor = 102059,
			side = 2,
			say = "……指揮官？",
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
					"「――誰も逃げられないわ」",
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
			actor = 102059,
			side = 2,
			nameColor = "#A9F548FF",
			hidePaintObj = true,
			blackBg = true,
			say = "……指揮官！大丈夫？",
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
			portrait = "zhihuiguan",
			side = 2,
			bgName = "star_level_bg_491",
			hidePaintObj = true,
			nameColor = "#A9F548FF",
			blackBg = true,
			actor = 0,
			say = "自分は……",
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
			portrait = "zhihuiguan",
			side = 2,
			bgName = "star_level_bg_491",
			hidePaintObj = true,
			nameColor = "#A9F548FF",
			blackBg = true,
			actor = 0,
			say = "大丈夫だ。乗ろう",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		}
	}
}
