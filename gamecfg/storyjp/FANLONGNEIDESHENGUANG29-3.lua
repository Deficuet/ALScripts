return {
	id = "FANLONGNEIDESHENGUANG29-3",
	mode = 2,
	fadeOut = 1.5,
	scripts = {
		{
			eventDelay = 1,
			side = 2,
			bgName = "bg_underheaven_0",
			hidePaintObj = true,
			nameColor = "#A9F548FF",
			bgm = "theme-underheaven",
			say = "―――――！",
			soundeffect = "event:/battle/boom2",
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
			},
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
			},
			movableNode = {
				{
					time = 3,
					name = "jiaotang_white_qingxun",
					spine = {
						action = "move",
						scale = 1.3
					},
					path = {
						{
							-1500,
							0
						},
						{
							1600,
							0
						}
					}
				},
				{
					delay = 0.3,
					name = "jiaotang_white_qingxun",
					time = 3,
					spine = {
						action = "move",
						scale = 1.3
					},
					path = {
						{
							-1500,
							-250
						},
						{
							1600,
							0
						}
					}
				},
				{
					delay = 0.8,
					name = "jiaotang_white_quzhu",
					time = 3,
					spine = {
						action = "move",
						scale = 1.3
					},
					path = {
						{
							-1600,
							200
						},
						{
							1500,
							0
						}
					}
				},
				{
					delay = 1.6,
					name = "jiaotang_white_hangmu",
					time = 3,
					spine = {
						action = "move",
						scale = 1.3
					},
					path = {
						{
							-1700,
							100
						},
						{
							1600,
							0
						}
					}
				},
				{
					delay = 0.8,
					name = "jiaotang_white_zhanlie",
					time = 3,
					spine = {
						action = "move",
						scale = 1.3
					},
					path = {
						{
							-1800,
							-150
						},
						{
							1500,
							0
						}
					}
				}
			}
		},
		{
			expression = 1,
			side = 2,
			bgName = "bg_underheaven_0",
			factiontag = "サディア教国",
			dir = 1,
			actor = 608030,
			nameColor = "#A9F548FF",
			hidePaintObj = true,
			say = "法聖猊下、聖座近衛艦隊、支援に馳せ参じたわ",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			expression = 1,
			side = 2,
			bgName = "bg_underheaven_0",
			factiontag = "フィレンツェ共和国",
			actor = 601110,
			nameColor = "#A9F548FF",
			hidePaintObj = true,
			say = "法聖猊下、加勢するわ",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			expression = 6,
			side = 2,
			bgName = "bg_underheaven_0",
			factiontag = "サディア教国",
			dir = 1,
			actor = 699010,
			nameColor = "#A9F548FF",
			hidePaintObj = true,
			say = "ナイスタイミング！「神光の基底」の変換は終わったかしら？",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			expression = 2,
			side = 2,
			bgName = "bg_underheaven_0",
			factiontag = "フィレンツェ共和国",
			actor = 601110,
			nameColor = "#A9F548FF",
			hidePaintObj = true,
			say = "修復不可能なダメージを受けた結節点は約半数。それ以外は全て転換が完了し、「神光の織網」へ接続したわ",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			expression = 6,
			side = 2,
			bgName = "bg_underheaven_0",
			factiontag = "サディア教国",
			dir = 1,
			actor = 699010,
			nameColor = "#A9F548FF",
			hidePaintObj = true,
			say = "よろしい！⋯⋯では少しばかり、強化をかけてぇ⋯",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			actor = 699010,
			side = 2,
			bgName = "bg_underheaven_0",
			factiontag = "サディア教国",
			dir = 1,
			nameColor = "#A9F548FF",
			hidePaintObj = true,
			say = "さあ征け！完膚なきまでに叩きのめせ！",
			effects = {
				{
					active = true,
					name = "jinguang"
				}
			},
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		}
	}
}
