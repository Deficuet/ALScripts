return {
	id = "HUANYINLAIDAOTONGXINXUEYUAN7-1",
	mode = 2,
	fadeOut = 1.5,
	scripts = {
		{
			nameColor = "#A9F548FF",
			side = 2,
			bgName = "star_level_bg_169",
			hidePaintObj = true,
			say = "しばらく遊んでいると、職員室にいる石膏オフニャたちがほとんどただの石膏像に戻った。",
			bgm = "story-richang-6",
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
			bgName = "star_level_bg_169",
			hidePaintObj = true,
			say = "しかし未だに数匹のオフニャが板を高く掲げている……",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			actor = 0,
			side = 2,
			bgName = "star_level_bg_169",
			hidePaintObj = true,
			nameColor = "#A9F548FF",
			say = "（「キラキラリトルスター」はもう十分遊んだはずなのに、まだ石膏オフニャがいる…何か見落としているのだろうか）",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			side = 2,
			actorName = "座学勉強・石膏オフニャ",
			bgName = "star_level_bg_169",
			hidePaintObj = true,
			nameColor = "#FF9B93",
			say = "にゃ……にゃ……！",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			},
			movableNode = {
				{
					time = 3,
					name = "youeryuan_boss05",
					spine = {
						action = "move",
						scale = 1.3
					},
					path = {
						{
							-1500,
							-200
						},
						{
							1800,
							-200
						}
					}
				},
				{
					delay = 0.4,
					name = "youeryuan_boss05",
					time = 3,
					spine = {
						action = "move",
						scale = 1.3
					},
					path = {
						{
							-1600,
							0
						},
						{
							1800,
							0
						}
					}
				},
				{
					delay = 0.8,
					name = "youeryuan_boss05",
					time = 3,
					spine = {
						action = "move",
						scale = 1.3
					},
					path = {
						{
							-1700,
							-400
						},
						{
							1800,
							-400
						}
					}
				},
				{
					delay = 1.2,
					name = "youeryuan_boss05",
					time = 3,
					spine = {
						action = "move",
						scale = 1.3
					},
					path = {
						{
							-1800,
							-100
						},
						{
							1800,
							-100
						}
					}
				},
				{
					delay = 1.6,
					name = "youeryuan_boss05",
					time = 3,
					spine = {
						action = "move",
						scale = 1.3
					},
					path = {
						{
							-1550,
							-200
						},
						{
							1800,
							-200
						}
					}
				},
				{
					delay = 2,
					name = "youeryuan_boss05",
					time = 3,
					spine = {
						action = "move",
						scale = 1.3
					},
					path = {
						{
							-1650,
							-20
						},
						{
							1800,
							-200
						}
					}
				},
				{
					delay = 2.4,
					name = "youeryuan_boss05",
					time = 3,
					spine = {
						action = "move",
						scale = 1.3
					},
					path = {
						{
							-1750,
							-350
						},
						{
							1800,
							-350
						}
					}
				},
				{
					delay = 2.6,
					name = "youeryuan_boss05",
					time = 3,
					spine = {
						action = "move",
						scale = 1.3
					},
					path = {
						{
							-1500,
							-100
						},
						{
							1800,
							0
						}
					}
				},
				{
					delay = 3,
					name = "youeryuan_boss05",
					time = 3,
					spine = {
						action = "move",
						scale = 1.3
					},
					path = {
						{
							-1650,
							-300
						},
						{
							1800,
							-300
						}
					}
				},
				{
					delay = 3.4,
					name = "youeryuan_boss05",
					time = 3,
					spine = {
						action = "move",
						scale = 1.3
					},
					path = {
						{
							-1750,
							-400
						},
						{
							1800,
							-400
						}
					}
				},
				{
					delay = 3.6,
					name = "youeryuan_boss05",
					time = 3,
					spine = {
						action = "move",
						scale = 1.3
					},
					path = {
						{
							-1350,
							-200
						},
						{
							1800,
							-200
						}
					}
				}
			}
		},
		{
			expression = 4,
			side = 2,
			bgName = "star_level_bg_169",
			hidePaintObj = true,
			dir = 1,
			nameColor = "#A9F548FF",
			actor = 307130,
			say = "もう本当に面倒なコ。もしかして怒ってるの？",
			painting = {
				alpha = 0.3,
				time = 1
			},
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			expression = 0,
			side = 2,
			bgName = "star_level_bg_169",
			hidePaintObj = true,
			dir = 1,
			nameColor = "#A9F548FF",
			actor = 401431,
			say = "えぇ…またクイズを解かせるつもり…？",
			painting = {
				alpha = 0.3,
				time = 1
			},
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			},
			action = {
				{
					type = "shake",
					y = 30,
					delay = 0,
					dur = 0.15,
					x = 0,
					number = 2
				}
			}
		},
		{
			expression = 7,
			side = 2,
			bgName = "star_level_bg_169",
			hidePaintObj = true,
			dir = 1,
			nameColor = "#A9F548FF",
			actor = 404061,
			say = "勉強は「ほどほど」でいいけど、遊んでばかりいるのもダメってことよ",
			painting = {
				alpha = 0.3,
				time = 1
			},
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			expression = 1,
			side = 2,
			bgName = "star_level_bg_169",
			hidePaintObj = true,
			dir = 1,
			nameColor = "#A9F548FF",
			actor = 205074,
			say = "しかしクイズを解くのを再開すると、石膏オフニャたちの数がまた増えてしまう。これまでの努力が水の泡になるわ",
			painting = {
				alpha = 0.3,
				time = 1
			},
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			paintingNoise = true,
			side = 2,
			bgName = "star_level_bg_169",
			hidePaintObj = true,
			dir = 1,
			nameColor = "#A9F548FF",
			actor = 107060,
			say = "もっと単純な方法でどうだろうか。これまでの異変はいずれも石膏オフニャが主体じゃなかったり、隠れたりしていた",
			painting = {
				alpha = 0.3,
				time = 1
			},
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			expression = 1,
			side = 2,
			bgName = "star_level_bg_169",
			paintingNoise = true,
			dir = 1,
			actor = 107060,
			nameColor = "#A9F548FF",
			hidePaintObj = true,
			say = "対して職員室での異変は石膏オフニャが最初から姿を現している。となれば、直接取っ組み合いで異変を解決できるかもしれない",
			painting = {
				alpha = 0.3,
				time = 1
			},
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			paintingNoise = true,
			side = 2,
			bgName = "star_level_bg_169",
			hidePaintObj = true,
			dir = 1,
			nameColor = "#A9F548FF",
			actor = 107060,
			say = "特殊装備なら石膏オフニャを無力化することも可能だ",
			painting = {
				alpha = 0.3,
				time = 1
			},
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			paintingNoise = true,
			side = 2,
			bgName = "star_level_bg_169",
			hidePaintObj = true,
			dir = 1,
			nameColor = "#A9F548FF",
			actor = 107070,
			say = "エンプラ姉…本当に言ってるの？あの石膏オフニャたち、意外と可愛いと思うんだけど…",
			painting = {
				alpha = 0.3,
				time = 1
			},
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			expression = 3,
			side = 2,
			bgName = "star_level_bg_169",
			paintingNoise = true,
			dir = 1,
			actor = 312010,
			nameColor = "#A9F548FF",
			hidePaintObj = true,
			say = "それに…研究価値も高いにゃ！",
			painting = {
				alpha = 0.3,
				time = 1
			},
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			paintingNoise = true,
			side = 2,
			bgName = "star_level_bg_169",
			hidePaintObj = true,
			dir = 1,
			nameColor = "#A9F548FF",
			actor = 107060,
			say = "閉じ込められた仲間の救助活動が最優先だ。指揮官、早めに決断を",
			painting = {
				alpha = 0.3,
				time = 1
			},
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			actor = 0,
			side = 2,
			bgName = "star_level_bg_169",
			factiontag = "通信モード",
			nameColor = "#A9F548FF",
			hidePaintObj = true,
			say = "――ふむ…",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			},
			options = {
				{
					content = "仕方ない、戦いごっこだ",
					flag = 1
				},
				{
					content = "もうちょっと考えさせてくれ",
					flag = 2
				}
			}
		},
		{
			paintingNoise = true,
			side = 2,
			bgName = "star_level_bg_169",
			dir = 1,
			optionFlag = 1,
			actor = 501020,
			nameColor = "#A9F548FF",
			hidePaintObj = true,
			say = "やったぁ！戦いだぁ！「キラキラリトルスター」、行けー！",
			painting = {
				alpha = 0.3,
				time = 1
			},
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			actor = 0,
			side = 2,
			bgName = "star_level_bg_169",
			factiontag = "通信モード",
			nameColor = "#A9F548FF",
			optionFlag = 2,
			hidePaintObj = true,
			say = "――アルヴィト、デューク・オブ・ヨーク。管理棟に「童心」や「楽しさ」に関係しそうなほかの手がかりはないか？",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			expression = 7,
			side = 2,
			bgName = "star_level_bg_169",
			dir = 1,
			optionFlag = 2,
			actor = 404061,
			nameColor = "#A9F548FF",
			hidePaintObj = true,
			say = "それならあるわ。ちょっと待って",
			painting = {
				alpha = 0.3,
				time = 1
			},
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			nameColor = "#A9F548FF",
			side = 2,
			bgName = "star_level_bg_169",
			hidePaintObj = true,
			optionFlag = 2,
			say = "アルヴィトは校内新聞を取り出して、2つの大見出しをカメラの画面を通して見せてくれた――",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			expression = 1,
			side = 2,
			bgName = "star_level_bg_169",
			paintingNoise = true,
			dir = 1,
			optionFlag = 2,
			actor = 101490,
			nameColor = "#A9F548FF",
			hidePaintObj = true,
			say = "「深夜に行方不明になったオフニャ　喋れるとの噂」",
			painting = {
				alpha = 0.3,
				time = 1
			},
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			expression = 2,
			side = 2,
			bgName = "star_level_bg_169",
			paintingNoise = true,
			dir = 1,
			optionFlag = 2,
			actor = 101490,
			nameColor = "#A9F548FF",
			hidePaintObj = true,
			say = "「童心を大事に　みんなにわんぱくで楽しいリトルパラダイスを」",
			painting = {
				alpha = 0.3,
				time = 1
			},
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			expression = 3,
			side = 2,
			bgName = "star_level_bg_169",
			dir = 1,
			optionFlag = 2,
			actor = 102210,
			nameColor = "#A9F548FF",
			hidePaintObj = true,
			say = "え？「うまく収容されなかったせいで、深夜に行方不明になった謎の生物」じゃなかったの？",
			painting = {
				alpha = 0.3,
				time = 1
			},
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			expression = 4,
			side = 2,
			bgName = "star_level_bg_169",
			dir = 1,
			optionFlag = 2,
			actor = 401431,
			nameColor = "#A9F548FF",
			hidePaintObj = true,
			say = "「行方不明だった運命の堕天使は実は、光を守るがために終わりなき深夜に堕ちた」でもない！",
			painting = {
				alpha = 0.3,
				time = 1
			},
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			expression = 4,
			side = 2,
			bgName = "star_level_bg_169",
			dir = 1,
			optionFlag = 2,
			actor = 408131,
			nameColor = "#A9F548FF",
			hidePaintObj = true,
			say = "どっちもヘンテコ過ぎるってば！",
			painting = {
				alpha = 0.3,
				time = 1
			},
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			actor = 0,
			side = 2,
			bgName = "star_level_bg_169",
			hidePaintObj = true,
			nameColor = "#A9F548FF",
			optionFlag = 2,
			say = "（「童心を大事に　みんなにわんぱくで楽しいリトルパラダイスを」……ふむ、「みんなに」か）",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			actor = 0,
			side = 2,
			bgName = "star_level_bg_169",
			factiontag = "通信モード",
			nameColor = "#A9F548FF",
			optionFlag = 2,
			hidePaintObj = true,
			say = "――わかった。「キラキラリトルスター」だけでなく、先生のみんなも一緒に楽しまないと",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			expression = 3,
			side = 2,
			bgName = "star_level_bg_169",
			dir = 1,
			optionFlag = 2,
			actor = 205074,
			nameColor = "#A9F548FF",
			hidePaintObj = true,
			say = "私たちも？",
			painting = {
				alpha = 0.3,
				time = 1
			},
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			actor = 0,
			side = 2,
			bgName = "star_level_bg_169",
			factiontag = "通信モード",
			nameColor = "#A9F548FF",
			optionFlag = 2,
			hidePaintObj = true,
			say = "――ああ。ここは「みんな」が楽しむ世界だから、「みんな」で参加しないとね",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			nameColor = "#A9F548FF",
			side = 2,
			bgName = "star_level_bg_169",
			hidePaintObj = true,
			optionFlag = 2,
			say = "アルヴィトとデューク・オブ・ヨークは頷き、仲間たちのゲームに加わった。",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			side = 2,
			actorName = "学園放送",
			bgName = "star_level_bg_169",
			hidePaintObj = true,
			nameColor = "#FF9B93",
			say = "ザーザー…ベンキョウトキュウケイ…ミンナデメリハリ…ザーザー…",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			side = 2,
			actorName = "座学勉強・石膏オフニャ",
			bgName = "star_level_bg_169",
			hidePaintObj = true,
			nameColor = "#FF9B93",
			say = "――――！～～～！！にゃ！",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			},
			icon = {
				scale = 1,
				image = "Props/shigaomiao_lixingsiwei",
				pos = {
					0,
					0
				}
			}
		}
	}
}
