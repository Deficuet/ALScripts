return {
	id = "ZHANFANGYUHUIGUANGZHICHENG29",
	mode = 2,
	fadeOut = 1.5,
	scripts = {
		{
			nameColor = "#5CE6FF",
			side = 2,
			bgName = "bg_huiguangzhicheng_5",
			say = "マルティリウム中心部・聖像の前――",
			bgm = "theme-thehierophantv",
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
			bgName = "bg_huiguangzhicheng_5",
			actor = 805030,
			dir = 1,
			nameColor = "#5CE6FF",
			say = "アルザス、クリスタルへの針路を確保！",
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
			nameColor = "#5CE6FF",
			side = 2,
			bgName = "bg_huiguangzhicheng_5",
			say = "――――！！",
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
			expression = 7,
			side = 2,
			bgName = "bg_huiguangzhicheng_5",
			actor = 9701030,
			dir = 1,
			nameColor = "#BDBDBD",
			say = "そこまでだ小僧。先は進ませない",
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
			bgName = "bg_huiguangzhicheng_5",
			actor = 901070,
			dir = 1,
			nameColor = "#5CE6FF",
			say = "「META」の旗風……",
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
			bgName = "bg_huiguangzhicheng_5",
			actor = 805030,
			dir = 1,
			nameColor = "#5CE6FF",
			say = "指揮官、「旗風」を発見した！対処の指示を求む！",
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
			bgName = "bg_huiguangzhicheng_5",
			nameColor = "#5CE6FF",
			say = "――やはりあそこが制御中枢か。…「ロドニー」はすでに無力化した！あなたも早く投降しろ！",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			expression = 3,
			side = 2,
			bgName = "bg_huiguangzhicheng_5",
			actor = 9701030,
			dir = 1,
			nameColor = "#BDBDBD",
			say = "ふふ、ふふふ……お主は本当に驚かせてくれる",
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
			expression = 6,
			side = 2,
			bgName = "bg_huiguangzhicheng_5",
			actor = 9701030,
			dir = 1,
			nameColor = "#BDBDBD",
			say = "だが忘れるでないぞ。このマルティリウムの制御はまだこの手にあることを",
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
			expression = 5,
			side = 2,
			bgName = "bg_huiguangzhicheng_5",
			actor = 9705040,
			dir = 1,
			nameColor = "#FFC960",
			say = "それはどうかしら？",
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
			nameColor = "#5CE6FF",
			side = 2,
			bgName = "bg_camelot_15",
			say = "光が輝いたあと、聖像の上空には別の構造物――「アヴァロンの扉」がそこに現れた。",
			bgm = "theme-elizabeth-andmeta",
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
			expression = 8,
			side = 2,
			bgName = "bg_camelot_15",
			actor = 9701030,
			dir = 1,
			nameColor = "#BDBDBD",
			say = "…なっ！？",
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
			bgName = "bg_camelot_15",
			actor = 9705040,
			dir = 1,
			nameColor = "#FFC960",
			say = "私の「列車」はまだ「キャメロットに停泊」しているわ。鏡面海域にされたからって、一両の車両の情報量が「列車」に勝てると思って？",
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
			bgName = "bg_camelot_15",
			actor = 9705040,
			dir = 1,
			nameColor = "#FFC960",
			say = "この手を使わなかったのは車両に損傷を与えるのを避けたかっただけよ",
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
			expression = 5,
			side = 2,
			bgName = "bg_camelot_15",
			actor = 9705040,
			dir = 1,
			nameColor = "#FFC960",
			say = "あんたの本体は現れたけど、鏡面海域の侵食は下僕が片付けてるわ",
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
			actor = 9705040,
			side = 2,
			bgName = "bg_camelot_15",
			nameColor = "#FFC960",
			dir = 1,
			say = "さて、それであんたはここの制御権をうまく握れるのかしらね？",
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
			bgName = "bg_camelot_15",
			actor = 9705040,
			dir = 1,
			nameColor = "#FFC960",
			say = "「栄光ある天球軌道、車列は一つ」――私の列車から出ていきなさい！",
			painting = {
				alpha = 0.3,
				time = 1
			},
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			},
			effects = {
				{
					active = true,
					name = "jinguang"
				}
			}
		},
		{
			expression = 8,
			side = 2,
			bgName = "bg_huiguangzhicheng_5",
			actor = 9701030,
			dir = 1,
			nameColor = "#BDBDBD",
			say = "くっ……！",
			painting = {
				alpha = 0.3,
				time = 1
			},
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			},
			flashout = {
				black = false,
				dur = 0.5,
				alpha = {
					0,
					1
				}
			},
			flashin = {
				delay = 0.5,
				dur = 0.5,
				black = false,
				alpha = {
					1,
					0
				}
			},
			effects = {
				{
					active = false,
					name = "jinguang"
				},
				{
					active = false,
					name = "memoryFog"
				}
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
			expression = 8,
			side = 2,
			bgName = "bg_huiguangzhicheng_5",
			actor = 9701030,
			dir = 1,
			nameColor = "#BDBDBD",
			say = "実験場β……覚えたぞ……！",
			painting = {
				alpha = 0.3,
				time = 1
			},
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			},
			effects = {
				{
					active = true,
					name = "jinguang"
				}
			}
		},
		{
			expression = 6,
			side = 2,
			bgName = "bg_huiguangzhicheng_4",
			actor = 9701030,
			dir = 1,
			nameColor = "#BDBDBD",
			say = "あと一歩のところでしくじるとはな…",
			painting = {
				alpha = 0.3,
				time = 1
			},
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			},
			effects = {
				{
					active = false,
					name = "jinguang"
				},
				{
					active = false,
					name = "memoryFog"
				}
			}
		},
		{
			expression = 2,
			side = 2,
			bgName = "bg_huiguangzhicheng_4",
			actor = 9701030,
			dir = 1,
			nameColor = "#BDBDBD",
			say = "私の負けだ。だがお主たちも決して勝ってはおらん！",
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
			bgName = "bg_huiguangzhicheng_3",
			hidePaintObj = true,
			dir = 1,
			nameColor = "#FFC960",
			actor = 9705040,
			say = "こいつ、減らず口を！",
			painting = {
				alpha = 0.3,
				time = 1
			},
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			},
			effects = {
				{
					active = true,
					name = "jinguang"
				}
			}
		},
		{
			expression = 5,
			side = 2,
			bgName = "bg_huiguangzhicheng_3",
			hidePaintObj = true,
			dir = 1,
			nameColor = "#FFC960",
			actor = 9705040,
			say = "さてと、あとちょっと清掃すれば侵食も解決できるわ♪",
			painting = {
				alpha = 0.3,
				time = 1
			},
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			},
			effects = {
				{
					active = false,
					name = "jinguang"
				},
				{
					active = false,
					name = "memoryFog"
				}
			}
		},
		{
			nameColor = "#5CE6FF",
			side = 2,
			bgName = "bg_huiguangzhicheng_6",
			hidePaintObj = true,
			say = "マルティリウムの中心にある聖像の翼が再び広がった。",
			bgm = "theme-lightheven",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			},
			flashout = {
				black = false,
				dur = 1,
				alpha = {
					0,
					1
				}
			},
			flashin = {
				delay = 1,
				dur = 1,
				black = false,
				alpha = {
					1,
					0
				}
			}
		},
		{
			nameColor = "#5CE6FF",
			side = 2,
			bgName = "bg_huiguangzhicheng_6",
			hidePaintObj = true,
			say = "先程の妖しい光ではなく、巨大なクリスタルは今度こそ神聖な光を放ち、町を輝かせた。",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			nameColor = "#5CE6FF",
			side = 2,
			bgName = "bg_huiguangzhicheng_6",
			hidePaintObj = true,
			say = "アイリスの威光の中で、侵食の源を失った錯体が灰へと変わり、しばらくすると鏡面海域全体の浄化が完了した。",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			actor = 9705040,
			side = 2,
			bgName = "bg_huiguangzhicheng_6",
			hidePaintObj = true,
			dir = 1,
			nameColor = "#FFC960",
			say = "ふぅ…これで完璧ね",
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
			expression = 5,
			side = 2,
			bgName = "bg_huiguangzhicheng_6",
			hidePaintObj = true,
			dir = 1,
			nameColor = "#FFC960",
			actor = 9705040,
			say = "あとはクジラさえ回収できれば――",
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
			side = 2,
			actorName = "謎の響き",
			bgName = "bg_huiguangzhicheng_6",
			hidePaintObj = true,
			shakeTime = 5,
			nameColor = "#5CE6FF",
			say = "――――！！",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			},
			movableNode = {
				{
					time = 4,
					name = "unknownV_boss_death_1",
					spine = {
						action = "move",
						scale = 1
					},
					path = {
						{
							-1500,
							-500
						},
						{
							2500,
							-300
						}
					}
				}
			}
		},
		{
			expression = 1,
			side = 2,
			bgName = "bg_huiguangzhicheng_6",
			hidePaintObj = true,
			dir = 1,
			nameColor = "#5CE6FF",
			actor = 900430,
			say = "この声…クジラだ！",
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
			expression = 10,
			side = 2,
			bgName = "bg_huiguangzhicheng_6",
			hidePaintObj = true,
			dir = 1,
			nameColor = "#5CE6FF",
			actor = 900430,
			say = "うわあああああ！クジラ！クジラが飛んで逃げるよ！！",
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
			nameColor = "#5CE6FF",
			side = 2,
			bgName = "bg_huiguangzhicheng_6",
			hidePaintObj = true,
			say = "轟音とともに、クジラはマルティリウムの上空へと飛んでいく。",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			expression = 8,
			side = 2,
			bgName = "bg_huiguangzhicheng_6",
			hidePaintObj = true,
			dir = 1,
			nameColor = "#5CE6FF",
			actor = 805030,
			say = "「デスシャドウ」は倒したし、制御権が「ミスD」に戻ってないなら誰にも握られていない状態のはず…",
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
			bgName = "bg_huiguangzhicheng_6",
			hidePaintObj = true,
			nameColor = "#5CE6FF",
			say = "――……しまった！「デビル」か！",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			actor = 0,
			side = 2,
			bgName = "bg_huiguangzhicheng_6",
			hidePaintObj = true,
			nameColor = "#5CE6FF",
			say = "――やつが最後まで姿を見せなかったのは、「旗風」に戦わせてる間に、クジラを奪う気だったのか…！？",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			actor = 0,
			side = 2,
			bgName = "bg_huiguangzhicheng_6",
			hidePaintObj = true,
			nameColor = "#5CE6FF",
			say = "――……まんまとやられたな……",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			expression = 1,
			side = 2,
			bgName = "bg_huiguangzhicheng_6",
			hidePaintObj = true,
			dir = 1,
			nameColor = "#FFC960",
			actor = 900432,
			say = "ああ。相変わらずずる賢い奴め…こっちもまんまとやつに乗せられちまった",
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
			bgName = "bg_huiguangzhicheng_6",
			hidePaintObj = true,
			dir = 1,
			nameColor = "#FFC960",
			actor = 900315,
			say = "……私も。ごめんなさい",
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
			bgName = "bg_huiguangzhicheng_6",
			hidePaintObj = true,
			dir = 1,
			nameColor = "#5CE6FF",
			actor = 900430,
			say = "いやいや謝罪してる場合じゃないでしょ！",
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
			expression = 10,
			side = 2,
			bgName = "bg_huiguangzhicheng_6",
			hidePaintObj = true,
			dir = 1,
			nameColor = "#5CE6FF",
			actor = 900430,
			say = "クジラだー！早くクジラを追って――ー！！",
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
			expression = 5,
			side = 2,
			bgName = "bg_huiguangzhicheng_6",
			hidePaintObj = true,
			dir = 1,
			nameColor = "#FFC960",
			actor = 9705040,
			say = "待って！車両の回収が先よ！",
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
			bgName = "bg_huiguangzhicheng_6",
			hidePaintObj = true,
			dir = 1,
			nameColor = "#5CE6FF",
			actor = 900430,
			say = "「列車」のことはいいって！クジラクジラクジラ！",
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
			expression = 10,
			side = 2,
			bgName = "bg_huiguangzhicheng_6",
			hidePaintObj = true,
			dir = 1,
			nameColor = "#5CE6FF",
			actor = 900430,
			say = "あたしのクジラーーーーー！！！！",
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
			expression = 2,
			side = 2,
			bgName = "bg_huiguangzhicheng_6",
			hidePaintObj = true,
			dir = 1,
			nameColor = "#FFC960",
			actor = 9705040,
			say = "………………………………………………………………………んもぉ！",
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
			bgName = "bg_huiguangzhicheng_6",
			hidePaintObj = true,
			nameColor = "#5CE6FF",
			say = "――「クイーンズライト号」にまず戻ろう",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			expression = 1,
			side = 2,
			bgName = "bg_huiguangzhicheng_6",
			hidePaintObj = true,
			dir = 1,
			nameColor = "#FFC960",
			actor = 900315,
			say = "待って。指揮官は行かせない",
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
			bgName = "bg_huiguangzhicheng_6",
			hidePaintObj = true,
			nameColor = "#5CE6FF",
			say = "――「ヘレナ」？",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			expression = 5,
			side = 2,
			bgName = "bg_huiguangzhicheng_6",
			hidePaintObj = true,
			dir = 1,
			nameColor = "#FFC960",
			actor = 9705040,
			say = "分かったわ。ここからの追撃戦は危険そうだし、作戦には含まれないからね",
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
			actor = 9705040,
			side = 2,
			bgName = "bg_huiguangzhicheng_6",
			hidePaintObj = true,
			dir = 1,
			nameColor = "#FFC960",
			say = "指揮官はアイリスの艦船たちと帰還しなさい。道中気をつけて、お家に帰るまでが出征よ",
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
			nameColor = "#5CE6FF",
			side = 2,
			bgName = "bg_huiguangzhicheng_6",
			hidePaintObj = true,
			say = "「エリザベス」はきっぱりとこちらに帰還を告げ、そして小さい冊子を押し付けてきた。",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			expression = 5,
			side = 2,
			bgName = "bg_huiguangzhicheng_6",
			hidePaintObj = true,
			dir = 1,
			nameColor = "#FFC960",
			actor = 9705040,
			say = "「アヴァロンの扉」の操作方法のメモよ。書いてある通りにすれば実験場βに戻れるわ",
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
			actor = 900315,
			side = 2,
			bgName = "bg_huiguangzhicheng_6",
			hidePaintObj = true,
			dir = 1,
			nameColor = "#FFC960",
			say = "そんなもの必要ないわ。私が教えるから",
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
			bgName = "bg_huiguangzhicheng_6",
			hidePaintObj = true,
			dir = 1,
			nameColor = "#FFC960",
			actor = 9705040,
			say = "……なんでそこで突っかかってくるのよ…まぁ好きにすればいいわ",
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
			bgName = "bg_huiguangzhicheng_6",
			hidePaintObj = true,
			dir = 1,
			nameColor = "#FFC960",
			actor = 900315,
			say = "……",
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
			bgName = "bg_huiguangzhicheng_6",
			hidePaintObj = true,
			dir = 1,
			nameColor = "#FFC960",
			actor = 900315,
			say = "それとマルティリウムはこのままにしてはおけない",
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
			bgName = "bg_huiguangzhicheng_6",
			hidePaintObj = true,
			dir = 1,
			nameColor = "#FFC960",
			actor = 900315,
			say = "あんなに大きな「空間衝壊現象」があったから、別の勢力もじきここに集まってくるわ。今のうちに痕跡を消さないと",
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
			actor = 900315,
			side = 2,
			bgName = "bg_huiguangzhicheng_6",
			hidePaintObj = true,
			dir = 1,
			nameColor = "#FFC960",
			say = "……鏡面海域は車両に戻して実験場βに送っておく",
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
			expression = 5,
			side = 2,
			bgName = "bg_huiguangzhicheng_6",
			hidePaintObj = true,
			dir = 1,
			nameColor = "#FFC960",
			actor = 9705040,
			say = "助かるわ。じゃあ任せたわよ",
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
			bgName = "bg_huiguangzhicheng_6",
			hidePaintObj = true,
			dir = 1,
			nameColor = "#5CE6FF",
			actor = 900430,
			say = "謎の助手もバイバイ！また会おう！",
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
			nameColor = "#5CE6FF",
			side = 2,
			bgName = "bg_huiguangzhicheng_6",
			hidePaintObj = true,
			say = "車両をいくつか失った「クイーンズライト号」が空間から消えた頃、「余燼」も出発準備を終えた。",
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
			actor = 900432,
			side = 2,
			bgName = "bg_huiguangzhicheng_6",
			hidePaintObj = true,
			dir = 1,
			nameColor = "#FFC960",
			say = "あいつ…「再彫刻」された「META」のロドニーはすでに脅威性を失っている",
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
			bgName = "bg_huiguangzhicheng_6",
			hidePaintObj = true,
			dir = 1,
			nameColor = "#FFC960",
			actor = 900432,
			say = "こっちについて来ることはないだろうし、ヘレナに預けてもいいか？",
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
			bgName = "bg_huiguangzhicheng_6",
			hidePaintObj = true,
			dir = 1,
			nameColor = "#FFC960",
			actor = 900315,
			say = "うん。二人共もう行くの？",
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
			actor = 900432,
			side = 2,
			bgName = "bg_huiguangzhicheng_6",
			hidePaintObj = true,
			dir = 1,
			nameColor = "#FFC960",
			say = "そうだな。アビータをとっ捕まえるのはこっちの任務じゃない",
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
			bgName = "bg_huiguangzhicheng_6",
			hidePaintObj = true,
			dir = 1,
			nameColor = "#FFC960",
			actor = 900432,
			say = "「空間衝壊現象」を起こした存在を確認したし、こっちもそろそろ帰るとしよう",
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
			bgName = "bg_huiguangzhicheng_6",
			hidePaintObj = true,
			dir = 1,
			nameColor = "#FFC960",
			actor = 900432,
			say = "…共に戦えて嬉しかったよ。相変わらず頼りになるな。ヘレナ",
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
			bgName = "bg_huiguangzhicheng_6",
			hidePaintObj = true,
			dir = 1,
			nameColor = "#FFC960",
			actor = 900315,
			say = "何を言ってるのか分からないわ",
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
			expression = 6,
			side = 2,
			bgName = "bg_huiguangzhicheng_6",
			hidePaintObj = true,
			dir = 1,
			nameColor = "#FFC960",
			actor = 900432,
			say = "あははははは！それじゃあそろそろ行かないとな！",
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
			actor = 900432,
			side = 2,
			bgName = "bg_huiguangzhicheng_6",
			hidePaintObj = true,
			dir = 1,
			nameColor = "#FFC960",
			say = "ヘレナ、縁があればまた会おう",
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
			bgName = "bg_huiguangzhicheng_6",
			hidePaintObj = true,
			dir = 1,
			nameColor = "#FFC960",
			actor = 900432,
			say = "そして実験場βのみんな、二度と会わないことを願おう",
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
			bgName = "bg_huiguangzhicheng_6",
			hidePaintObj = true,
			nameColor = "#5CE6FF",
			say = "――さすがにその保証はできないな",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			actor = 0,
			side = 2,
			bgName = "bg_huiguangzhicheng_6",
			hidePaintObj = true,
			nameColor = "#5CE6FF",
			say = "――こっちも共に戦えて光栄だ。フリードリヒにもよろしく伝えておいてくれ",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			expression = 2,
			side = 2,
			bgName = "bg_huiguangzhicheng_6",
			hidePaintObj = true,
			dir = 1,
			nameColor = "#FFC960",
			actor = 900432,
			say = "ああ。もちろんだ",
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
			actor = 900315,
			side = 2,
			bgName = "bg_huiguangzhicheng_6",
			hidePaintObj = true,
			dir = 1,
			nameColor = "#FFC960",
			say = "指揮官、アルザスたちを連れて「キャメロット」に戻って。私は後から行く",
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
			blackbg = true,
			mode = 1,
			asideType = 1,
			bgm = "story-startravel",
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
					"そして、突如起きた輝きの城での狩りは一旦終わりを告げた。",
					2
				},
				{
					"「枝」からの旅人もまた、それぞれの「枝」へと帰っていく。",
					4
				},
				{
					"各々理想を抱えて、各々未来に思いを巡らせる。",
					6
				},
				{
					"星々の海に響く彼方の声を耳にしながら――",
					8
				}
			}
		}
	}
}
