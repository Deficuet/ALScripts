return {
	id = "ZHANFANGYUHUIGUANGZHICHENG13",
	mode = 2,
	fadeOut = 1.5,
	scripts = {
		{
			nameColor = "#5CE6FF",
			side = 2,
			bgName = "bg_huiguangzhicheng_1",
			hidePaintObj = true,
			say = "「余燼」と別れた後、艦船たちと引き続きクジラに接近していく。",
			bgm = "story-lightheven-up",
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
			nameColor = "#5CE6FF",
			side = 2,
			bgName = "bg_huiguangzhicheng_1",
			hidePaintObj = true,
			say = "しかし、こちらや「余燼」よりも早くクジラに接触する存在があった。",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			side = 2,
			nameColor = "#5CE6FF",
			bgName = "bg_huiguangzhicheng_1",
			hidePaintObj = true,
			say = "――――！！！",
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
			expression = 6,
			side = 2,
			bgName = "bg_huiguangzhicheng_1",
			hidePaintObj = true,
			dir = 1,
			nameColor = "#5CE6FF",
			actor = 805030,
			say = "クジラ、ドローンのような飛行体に攻撃されている！",
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
			actor = 803020,
			side = 2,
			bgName = "bg_huiguangzhicheng_1",
			hidePaintObj = true,
			dir = 1,
			nameColor = "#5CE6FF",
			say = "結構な数…しかも網の形を取ってクジラを捕えようとしている",
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
			bgName = "bg_huiguangzhicheng_1",
			hidePaintObj = true,
			dir = 1,
			nameColor = "#5CE6FF",
			actor = 901070,
			say = "見覚えのある形……あぁ！デビルのドローンね！",
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
			bgName = "bg_huiguangzhicheng_1",
			hidePaintObj = true,
			dir = 1,
			nameColor = "#5CE6FF",
			actor = 900430,
			say = "ああああ！デビルのバカ！加減しろ！あたしのクジラを落とすな！",
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
			expression = 10,
			side = 2,
			bgName = "bg_huiguangzhicheng_1",
			hidePaintObj = true,
			dir = 1,
			nameColor = "#5CE6FF",
			actor = 900430,
			say = "…ってこのままじゃクジラが逃げてしまう！",
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
			expression = 7,
			side = 2,
			bgName = "bg_huiguangzhicheng_1",
			hidePaintObj = true,
			dir = 1,
			nameColor = "#5CE6FF",
			actor = 900430,
			say = "ほら！もう準備始めてる！",
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
			bgName = "bg_huiguangzhicheng_1",
			hidePaintObj = true,
			dir = 1,
			nameColor = "#5CE6FF",
			actor = 900430,
			say = "くっ！？あのニセモノ、また新たな兵装の制御を手に入れやがったか！？",
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
			bgName = "bg_huiguangzhicheng_1",
			hidePaintObj = true,
			say = "ドローンに囲まれたクジラだが、突如その巨体から青い光が放たれた。",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			nameColor = "#5CE6FF",
			side = 2,
			bgName = "bg_huiguangzhicheng_1",
			hidePaintObj = true,
			say = "光が触れたドローンが続々制御を失い落ちていく――その隙にクジラは加速してマルティリウムの中央へと泳ぎ始めた。",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			nameColor = "#5CE6FF",
			side = 2,
			bgName = "bg_huiguangzhicheng_1",
			hidePaintObj = true,
			say = "マルティリウムの円環状の町の境界に触れようとしたその瞬間、空間振動とともにクジラは再び別空間へと逃げ込んだ。",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			actor = 0,
			side = 2,
			bgName = "bg_huiguangzhicheng_1",
			hidePaintObj = true,
			nameColor = "#5CE6FF",
			say = "――しまった。また別空間に逃げられたか",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			expression = 3,
			side = 2,
			bgName = "bg_huiguangzhicheng_1",
			hidePaintObj = true,
			dir = 1,
			nameColor = "#5CE6FF",
			actor = 900430,
			say = "聞こえてるかエリザベス！エリザベス！",
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
			expression = 7,
			side = 2,
			bgName = "bg_huiguangzhicheng_1",
			hidePaintObj = true,
			dir = 1,
			nameColor = "#5CE6FF",
			actor = 900430,
			say = "エリザベス！「車両」を使ってマルティリウムを広げろ！クジラをこっちに引きずり込め！",
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
			bgName = "bg_huiguangzhicheng_1",
			paintingNoise = true,
			dir = 1,
			actor = 9705040,
			nameColor = "#FFC960",
			hidePaintObj = true,
			say = "はあ……………………",
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
			bgName = "bg_huiguangzhicheng_1",
			paintingNoise = true,
			dir = 1,
			actor = 9705040,
			nameColor = "#FFC960",
			hidePaintObj = true,
			say = "概念変換。6号車。「死」を展延させ、不可視を具現化しその姿を見せなさい！",
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
			side = 2,
			nameColor = "#5CE6FF",
			bgName = "bg_huiguangzhicheng_2",
			hidePaintObj = true,
			say = "再び虚空から光が輝き出した。",
			bgm = "theme-underheaven",
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
			side = 2,
			nameColor = "#5CE6FF",
			bgName = "bg_huiguangzhicheng_2",
			hidePaintObj = true,
			say = "白金色の建物のアーチ、その先にも神聖なるマルティリウムの都市が現れ、二つ目の円環となって鏡面海域の「概念」を強化した。",
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
			side = 2,
			nameColor = "#5CE6FF",
			bgName = "bg_huiguangzhicheng_2",
			hidePaintObj = true,
			say = "そして二つ目の円環都市のその上空に、クジラもまた姿を現した。",
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
			expression = 1,
			side = 2,
			bgName = "bg_huiguangzhicheng_2",
			hidePaintObj = true,
			dir = 1,
			nameColor = "#5CE6FF",
			actor = 901060,
			say = "マルティリウムが……広がったね。きれい…！",
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
			bgName = "bg_huiguangzhicheng_2",
			hidePaintObj = true,
			dir = 1,
			nameColor = "#5CE6FF",
			actor = 901050,
			say = "えへへ、これじゃもう逃げられないね～",
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
			bgName = "bg_huiguangzhicheng_2",
			paintingNoise = true,
			dir = 1,
			actor = 9705040,
			nameColor = "#FFC960",
			hidePaintObj = true,
			say = "驚いたわね。ここまでしたのに、まだ全部の空間を引っ張ってこれないなんて…",
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
			bgName = "bg_huiguangzhicheng_2",
			paintingNoise = true,
			dir = 1,
			actor = 9705040,
			nameColor = "#FFC960",
			hidePaintObj = true,
			say = "「空間震動現象」を引き起こしたやつは一体どんな恐ろしい存在なのかしら…",
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
			bgName = "bg_huiguangzhicheng_2",
			hidePaintObj = true,
			dir = 1,
			nameColor = "#5CE6FF",
			actor = 900430,
			say = "とにかく今回は絶対にクジラを捕まえるぞ！",
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
			expression = 1,
			side = 2,
			bgName = "bg_huiguangzhicheng_2",
			hidePaintObj = true,
			dir = 1,
			nameColor = "#5CE6FF",
			actor = 900430,
			say = "うう、もしまた逃げられたら…",
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
			bgName = "bg_huiguangzhicheng_2",
			paintingNoise = true,
			dir = 1,
			actor = 9705040,
			nameColor = "#FFC960",
			hidePaintObj = true,
			say = "とことん付き合うって言ったでしょ？それぐらい信じなさいよ",
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
			bgName = "bg_huiguangzhicheng_2",
			hidePaintObj = true,
			dir = 1,
			nameColor = "#5CE6FF",
			actor = 900430,
			say = "エリザベス、いい人！",
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
			expression = 9,
			side = 2,
			bgName = "bg_huiguangzhicheng_2",
			hidePaintObj = true,
			dir = 1,
			nameColor = "#5CE6FF",
			actor = 900430,
			say = "助手、あたしたちも早くクジラ狩りを続けよう！",
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
			bgName = "bg_huiguangzhicheng_2",
			hidePaintObj = true,
			dir = 1,
			nameColor = "#5CE6FF",
			actor = 805030,
			say = "新たに現れた円環は今航行しているところとつながっていない…どうやって行けばいいの？",
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
			bgName = "bg_huiguangzhicheng_2",
			hidePaintObj = true,
			dir = 1,
			nameColor = "#5CE6FF",
			actor = 805030,
			say = "さすがに島伝いみたいな形で間を通れたりは……？",
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
			bgName = "bg_huiguangzhicheng_2",
			paintingNoise = true,
			dir = 1,
			actor = 9705040,
			nameColor = "#FFC960",
			hidePaintObj = true,
			say = "たとえ「概念」がつながっていても「車両」それぞれが違う空間をなしているから、それは無理ね",
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
			bgName = "bg_huiguangzhicheng_2",
			paintingNoise = true,
			dir = 1,
			actor = 9705040,
			nameColor = "#FFC960",
			hidePaintObj = true,
			say = "要するに鏡面海域が2つあることと同じよ。侵入するためのルールが違うわ",
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
			bgName = "bg_huiguangzhicheng_2",
			hidePaintObj = true,
			dir = 1,
			nameColor = "#FFC960",
			actor = 9705040,
			say = "セイレーンの鏡面海域だって、ものによって全然方法が違うでしょ？",
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
			bgName = "bg_huiguangzhicheng_2",
			hidePaintObj = true,
			dir = 1,
			nameColor = "#5CE6FF",
			actor = 900430,
			say = "大丈夫！「車両」がつながってるから、さっきの方法できっと行ける！",
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
			expression = 3,
			side = 2,
			bgName = "bg_huiguangzhicheng_2",
			hidePaintObj = true,
			dir = 1,
			nameColor = "#5CE6FF",
			actor = 900430,
			say = "今まで通りあたしについて来ればいい！空間の「概念」なんて守らなくてもヘーキだ！",
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
			bgName = "bg_huiguangzhicheng_2",
			hidePaintObj = true,
			nameColor = "#5CE6FF",
			say = "――まさか、あの鏡面海域の「概念」って……",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			expression = 8,
			side = 2,
			bgName = "bg_huiguangzhicheng_2",
			hidePaintObj = true,
			dir = 1,
			nameColor = "#5CE6FF",
			actor = 900430,
			say = "「死」に決まってるじゃない！だってここは「死」を具現化した場所だから！",
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
			bgName = "bg_huiguangzhicheng_2",
			hidePaintObj = true,
			dir = 1,
			nameColor = "#5CE6FF",
			actor = 900430,
			say = "そんなのどうだっていいでしょ！早く早く早く！",
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
			expression = 9,
			side = 2,
			bgName = "bg_huiguangzhicheng_2",
			hidePaintObj = true,
			dir = 1,
			nameColor = "#5CE6FF",
			actor = 900430,
			say = "クジラ狩りだー！",
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
		}
	}
}
