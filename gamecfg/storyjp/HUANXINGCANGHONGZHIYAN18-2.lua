return {
	id = "HUANXINGCANGHONGZHIYAN18-2",
	mode = 2,
	fadeOut = 1.5,
	scripts = {
		{
			bgm = "story-commander-up",
			side = 2,
			bgName = "bg_canghongzhiyan_3",
			hidePaintObj = true,
			nameColor = "#A9F548FF",
			say = "―――――！！",
			soundeffect = "event:/battle/boom2",
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
			expression = 4,
			side = 2,
			bgName = "bg_canghongzhiyan_3",
			hidePaintObj = true,
			dir = 1,
			nameColor = "#A9F548FF",
			actor = 307010,
			say = "ふん、塵になりなさいっ！",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			actor = 307010,
			side = 2,
			bgName = "bg_canghongzhiyan_3",
			hidePaintObj = true,
			dir = 1,
			nameColor = "#A9F548FF",
			say = "残りは南の群れのみ…形なき穢れなど敵ではありませんわ",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			expression = 2,
			side = 2,
			bgName = "bg_canghongzhiyan_3",
			portrait = 302140,
			dir = 1,
			hidePainting = true,
			actor = 302140,
			nameColor = "#A9F548FF",
			hidePaintObj = true,
			say = "赤城さん……なんかかっこいいです！",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			portrait = 301310,
			side = 2,
			bgName = "bg_canghongzhiyan_3",
			hidePainting = true,
			dir = 1,
			actor = 301310,
			nameColor = "#A9F548FF",
			hidePaintObj = true,
			say = "ふむ、確かに急に人が変わったように感じるのう",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			expression = 8,
			side = 2,
			bgName = "bg_canghongzhiyan_3",
			portrait = 301850,
			dir = 1,
			hidePainting = true,
			actor = 301850,
			nameColor = "#A9F548FF",
			hidePaintObj = true,
			say = "空母の力、よもやここまでとは……",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			nameColor = "#A9F548FF",
			side = 2,
			bgName = "bg_canghongzhiyan_3",
			hidePaintObj = true,
			say = "しばらくして、海域に侵入してきた穢れの化生は全て掃討された。",
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
			bgName = "bg_canghongzhiyan_3",
			hidePaintObj = true,
			say = "さっきまでと打って変わり、赤城は笑みを浮かべてこちらに走ってきた。",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			nameColor = "#A9F548FF",
			side = 2,
			bgName = "bg_canghongzhiyan_3",
			hidePaintObj = true,
			say = "しかし、その時悲劇が起きた――",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			expression = 4,
			side = 2,
			bgName = "bg_canghongzhiyan_3",
			portrait = 102050,
			dir = 1,
			hidePainting = true,
			paintingNoise = true,
			actor = 102050,
			nameColor = "#A9F548FF",
			hidePaintObj = true,
			say = "奇襲…！？みんな、気を付けて！",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			},
			effects = {
				{
					active = true,
					name = "meifujuqing_fenmu"
				}
			},
			dialogShake = {
				speed = 0.08,
				x = 15,
				number = 2
			}
		},
		{
			actor = 0,
			side = 2,
			bgName = "bg_canghongzhiyan_3",
			hidePaintObj = true,
			nameColor = "#A9F548FF",
			paintingNoise = true,
			say = "――いきなりどこから…！？",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			side = 2,
			nameColor = "#A9F548FF",
			bgName = "bg_canghongzhiyan_3",
			hidePaintObj = true,
			say = "海域の彼方から赤黒い輝きがこっちの乗艦に向けて一直線で飛んで来た。",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			},
			effects = {
				{
					active = true,
					name = "meifujuqing_fenmu"
				}
			}
		},
		{
			expression = 2,
			side = 2,
			bgName = "bg_canghongzhiyan_3",
			hidePaintObj = true,
			dir = 1,
			nameColor = "#A9F548FF",
			actor = 102160,
			say = "指揮官！！",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			},
			action = {
				{
					type = "shake",
					y = 45,
					delay = 0,
					dur = 0.15,
					x = 0,
					number = 2
				}
			}
		},
		{
			side = 2,
			nameColor = "#A9F548FF",
			bgName = "bg_canghongzhiyan_3",
			hidePaintObj = true,
			say = "仲間がすぐ飛び出し、乗艦へと進む赤黒い光の進路を塞いだ。",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			},
			effects = {
				{
					active = true,
					name = "meifujuqing_fenmu"
				}
			}
		},
		{
			actor = 307010,
			side = 2,
			bgName = "bg_canghongzhiyan_3",
			hidePaintObj = true,
			dir = 1,
			nameColor = "#A9F548FF",
			say = "この気配……まさか……",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			side = 2,
			nameColor = "#A9F548FF",
			bgName = "bg_canghongzhiyan_3",
			hidePaintObj = true,
			say = "―――――！！",
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
			expression = 2,
			side = 2,
			bgName = "bg_canghongzhiyan_3",
			hidePaintObj = true,
			nameColor = "#A9F548FF",
			actor = 305070,
			say = "卑怯な奴め！騙し討ちをする気か！？",
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
			nameColor = "#A9F548FF",
			bgName = "bg_canghongzhiyan_3",
			hidePaintObj = true,
			say = "加賀は砲口を向けて一斉射を放つも、赤黒い光は進路を変えてそれを避けた。",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			},
			effects = {
				{
					active = true,
					name = "meifujuqing_fenmu"
				}
			}
		},
		{
			nameColor = "#A9F548FF",
			side = 2,
			bgName = "bg_canghongzhiyan_3",
			hidePaintObj = true,
			say = "そして、今度は天城に向けて急加速し――",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			actor = 307010,
			side = 2,
			bgName = "bg_canghongzhiyan_3",
			hidePaintObj = true,
			dir = 1,
			nameColor = "#A9F548FF",
			say = "やはりあなたね……させませんわ！！",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			side = 2,
			nameColor = "#A9F548FF",
			bgName = "bg_canghongzhiyan_3",
			hidePaintObj = true,
			say = "姉に向かって真っ直ぐ襲う光を防ごうと、赤城はその身を盾にした。",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			},
			effects = {
				{
					active = true,
					name = "meifujuqing_fenmu"
				}
			}
		},
		{
			nameColor = "#A9F548FF",
			side = 2,
			say = "彼女に呼びかけるよりも早く、仮初の世界は一瞬にして闇に包まれた。",
			hidePaintObj = true,
			blackBg = true,
			bgm = "theme-akagi-meta",
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
			hidePaintObj = true,
			blackBg = true,
			say = "ただ、耳元でうっすらと声が響く。",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			expression = 3,
			side = 2,
			hidePainting = true,
			portrait = 307010,
			dir = 1,
			blackBg = true,
			actor = 307010,
			portraitNoise = true,
			nameColor = "#A9F548FF",
			hidePaintObj = true,
			say = "ごめんなさい…指揮官様",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			expression = 3,
			side = 2,
			hidePainting = true,
			portrait = 307010,
			dir = 1,
			blackBg = true,
			actor = 307010,
			portraitNoise = true,
			nameColor = "#A9F548FF",
			hidePaintObj = true,
			say = "大罪を犯し、妄執に取り込まれた私には、こんな結末がふさわしいですわ",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			expression = 1,
			side = 2,
			hidePainting = true,
			portrait = 307010,
			dir = 1,
			blackBg = true,
			actor = 307010,
			portraitNoise = true,
			nameColor = "#A9F548FF",
			hidePaintObj = true,
			say = "最後まで私に優しくしてくれて…本当に…ありがとうございます……",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			expression = 1,
			side = 2,
			hidePainting = true,
			portrait = 307010,
			dir = 1,
			blackBg = true,
			actor = 307010,
			portraitNoise = true,
			nameColor = "#A9F548FF",
			hidePaintObj = true,
			say = "天城姉さまを…加賀を…重桜の皆を………",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			expression = 1,
			side = 2,
			hidePainting = true,
			portrait = 307010,
			dir = 1,
			blackBg = true,
			actor = 307010,
			portraitNoise = true,
			nameColor = "#A9F548FF",
			hidePaintObj = true,
			say = "助けて………",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			nameColor = "#A9F548FF",
			side = 2,
			bgName = "bg_canghongzhiyan_3",
			hidePaintObj = true,
			say = "視界に光が戻ったあと、赤城の姿はどこにも見当たらなかった――",
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
		}
	}
}
