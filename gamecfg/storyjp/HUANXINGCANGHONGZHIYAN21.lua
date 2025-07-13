return {
	id = "HUANXINGCANGHONGZHIYAN21",
	mode = 2,
	fadeOut = 1.5,
	scripts = {
		{
			stopbgm = true,
			mode = 1,
			asideType = 3,
			blackBg = true,
			sequence = {
				{
					"特異点「ナラク」",
					1
				},
				{
					"「混じり物」討滅艦隊",
					2
				},
				{
					"しばらく前――",
					3
				}
			}
		},
		{
			nameColor = "#A9F548FF",
			side = 2,
			bgName = "bg_canghongzhiyan_1",
			hidePaintObj = true,
			say = "特異点「ナラク」――その万物が煙に包まれている。",
			bgm = "story-nailuo-theme",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			expression = 5,
			side = 2,
			bgName = "bg_canghongzhiyan_1",
			hidePaintObj = true,
			dir = 1,
			nameColor = "#FFC960",
			actor = 9705060,
			say = "「ナラク」の風景は斯様なものであるか",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			actor = 9702050,
			side = 2,
			bgName = "bg_canghongzhiyan_1",
			hidePaintObj = true,
			dir = 1,
			nameColor = "#C3ABFF",
			say = "はい。艦隊はすでに中心区域に突入しました",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			actor = 9701060,
			side = 2,
			bgName = "bg_canghongzhiyan_1",
			hidePaintObj = true,
			dir = 1,
			nameColor = "#C3ABFF",
			say = "長門さま、具合は…？",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			expression = 6,
			side = 2,
			bgName = "bg_canghongzhiyan_1",
			hidePaintObj = true,
			dir = 1,
			nameColor = "#FFC960",
			actor = 9705060,
			say = "平気だ。…それより、ここに漂っている煙は余の存在に「感応」しているように感じる",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			expression = 8,
			side = 2,
			bgName = "bg_canghongzhiyan_1",
			hidePaintObj = true,
			dir = 1,
			nameColor = "#C3ABFF",
			actor = 9701060,
			say = "うん。ここはワタツミの経路にあるから、ワタツミに接続している長門さまがそう感じてもおかしくない",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			actor = 9701060,
			side = 2,
			bgName = "bg_canghongzhiyan_1",
			hidePaintObj = true,
			dir = 1,
			nameColor = "#C3ABFF",
			say = "どうか「感応」に従って、「混じり物」を探して",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			actor = 9705060,
			side = 2,
			bgName = "bg_canghongzhiyan_1",
			hidePaintObj = true,
			dir = 1,
			nameColor = "#FFC960",
			say = "うむ、わかった",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			nameColor = "#A9F548FF",
			side = 2,
			bgName = "bg_canghongzhiyan_1",
			hidePaintObj = true,
			say = "長門は精神を集中し、己の感覚を煙の奥へと伸ばした。",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			nameColor = "#A9F548FF",
			side = 2,
			bgName = "bg_canghongzhiyan_1",
			hidePaintObj = true,
			say = "そうしていると、ふと眼の前の世界が変わり始めた――",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			expression = 7,
			side = 2,
			bgName = "bg_canghongzhiyan_4",
			dir = 1,
			bgm = "theme-shallowoftheworld",
			actor = 9705060,
			nameColor = "#FFC960",
			hidePaintObj = true,
			say = "ここは……「ナラク」の最深部？",
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
			effects = {
				{
					active = true,
					name = "juqing_mengjing"
				}
			}
		},
		{
			expression = 7,
			side = 2,
			bgName = "bg_bianzhihua_2",
			hidePaintObj = true,
			dir = 1,
			nameColor = "#FFC960",
			actor = 9705060,
			say = "……「赤城」が儀式を行っていた場所か",
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
			}
		},
		{
			expression = 7,
			side = 2,
			bgName = "bg_canghongzhiyan_5",
			hidePaintObj = true,
			dir = 1,
			nameColor = "#FFC960",
			actor = 9705060,
			say = "……指揮官がいる「世界サンプル」か？",
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
			}
		},
		{
			expression = 7,
			side = 2,
			bgName = "bg_bianzhihua_3",
			hidePaintObj = true,
			dir = 1,
			nameColor = "#FFC960",
			actor = 9705060,
			say = "夢境の洞天……だったな",
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
			}
		},
		{
			expression = 7,
			side = 2,
			bgName = "bg_zhuiluo_2",
			hidePaintObj = true,
			dir = 1,
			nameColor = "#FFC960",
			actor = 9705060,
			say = "ここは……戦場？",
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
			}
		},
		{
			expression = 7,
			side = 2,
			bgName = "star_level_bg_499",
			hidePaintObj = true,
			dir = 1,
			nameColor = "#FFC960",
			actor = 9705060,
			say = "なにもない……虚無？",
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
			}
		},
		{
			expression = 7,
			side = 2,
			bgName = "star_level_bg_594",
			hidePaintObj = true,
			dir = 1,
			nameColor = "#FFC960",
			actor = 9705060,
			say = "そしてこの場所は……？",
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
			}
		},
		{
			expression = 7,
			side = 2,
			bgName = "star_level_bg_593",
			hidePaintObj = true,
			dir = 1,
			nameColor = "#FFC960",
			actor = 9705060,
			say = "………見つけた",
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
			}
		},
		{
			blackBg = true,
			mode = 1,
			asideType = 1,
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
			sequence = {
				{
					"「力こそ余が欲するもの」",
					2
				},
				{
					"「強きに越したことはない」",
					4
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
			expression = 7,
			side = 2,
			bgName = "bg_canghongzhiyan_1",
			actor = 9705060,
			dir = 1,
			nameColor = "#FFC960",
			say = "…「混じり物」の場所が分かったぞ",
			bgm = "theme-nagato-meta",
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
			expression = 3,
			nameColor = "#FFC960",
			bgName = "bg_canghongzhiyan_1",
			side = 2,
			dir = 1,
			actor = 9705060,
			say = "お主ら、何ゆえ余をそんな目で見ておる？",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			expression = 4,
			side = 2,
			bgName = "bg_canghongzhiyan_1",
			hidePaintObj = true,
			dir = 1,
			nameColor = "#C3ABFF",
			actor = 9701060,
			say = "長門さま……周りを見て…？",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			expression = 1,
			side = 2,
			bgName = "bg_canghongzhiyan_1",
			hidePaintObj = false,
			dir = 1,
			nameColor = "#FFC960",
			actor = 9705060,
			say = "心配ない。力は呼び起こしておらぬ。あくまで「元の持ち主」が進んで出てきたのだ",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			expression = 5,
			side = 2,
			bgName = "bg_canghongzhiyan_1",
			hidePaintObj = true,
			dir = 1,
			nameColor = "#C3ABFF",
			actor = 9701060,
			say = "お体を確認させてもらっても……？",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			expression = 10,
			side = 2,
			bgName = "bg_canghongzhiyan_1",
			hidePaintObj = false,
			dir = 1,
			nameColor = "#FFC960",
			actor = 9705060,
			say = "別に具合は悪くないが…心配なら確かめるといい",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			nameColor = "#A9F548FF",
			side = 2,
			bgName = "bg_canghongzhiyan_1",
			hidePaintObj = true,
			say = "青い炎が長門の額に飛び移り、そして音もなく消えてなくなった。",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			actor = 9701060,
			side = 2,
			bgName = "bg_canghongzhiyan_1",
			hidePaintObj = true,
			dir = 1,
			nameColor = "#C3ABFF",
			say = "「META」の侵食が安定していて、進んでもいない",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			expression = 1,
			side = 2,
			bgName = "bg_canghongzhiyan_1",
			hidePaintObj = true,
			dir = 1,
			nameColor = "#C3ABFF",
			actor = 9701060,
			say = "神通、この状況…見たことある？",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			expression = 3,
			side = 2,
			bgName = "bg_canghongzhiyan_1",
			hidePaintObj = true,
			dir = 1,
			nameColor = "#C3ABFF",
			actor = 9702050,
			say = "…異常がなければ、その力を使っても平気かと",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			expression = 5,
			side = 2,
			bgName = "bg_canghongzhiyan_1",
			hidePaintObj = true,
			dir = 1,
			nameColor = "#C3ABFF",
			actor = 9702050,
			say = "ただし、どうか無理をせず、臨機応変にお願いいたします",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			actor = 9705060,
			side = 2,
			bgName = "bg_canghongzhiyan_1",
			hidePaintObj = false,
			dir = 1,
			nameColor = "#FFC960",
			say = "もちろんだ。余にはまだすべきことがある",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			expression = 8,
			side = 2,
			bgName = "bg_canghongzhiyan_1",
			hidePaintObj = true,
			dir = 1,
			nameColor = "#C3ABFF",
			actor = 9702050,
			say = "（……あの体質、決戦兵器の核として最高ですね…）",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		}
	}
}
