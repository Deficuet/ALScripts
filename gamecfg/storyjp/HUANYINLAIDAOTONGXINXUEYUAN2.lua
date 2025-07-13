return {
	id = "HUANYINLAIDAOTONGXINXUEYUAN2",
	mode = 2,
	fadeOut = 1.5,
	scripts = {
		{
			nameColor = "#A9F548FF",
			side = 2,
			bgName = "bg_story_task",
			hidePaintObj = true,
			say = "リトル学園・芸術棟",
			bgm = "story-darkplan",
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
			bgName = "bg_story_task",
			hidePaintObj = true,
			say = "がらんとした廊下では、風の音以外は何も聞こえず、壁に飾られた音符の装飾品がただ風と共に軽く揺れている――",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			nameColor = "#A9F548FF",
			side = 2,
			bgName = "bg_story_task",
			hidePaintObj = true,
			say = "ギシッ――",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			expression = 6,
			side = 2,
			bgName = "bg_story_task",
			hidePaintObj = true,
			dir = 1,
			nameColor = "#A9F548FF",
			actor = 401431,
			say = "うわあ！ななななんの音？！罠でも踏んじゃったの？！し、指揮官、たたた助けてー！",
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
			bgName = "bg_story_task",
			hidePaintObj = true,
			dir = 1,
			nameColor = "#A9F548FF",
			actor = 102210,
			say = "壊れた床を踏んだだけだよ！",
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
			bgName = "bg_story_task",
			hidePaintObj = true,
			dir = 1,
			nameColor = "#A9F548FF",
			actor = 101266,
			say = "……エルドリッジ、床に、発見",
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
			bgName = "bg_story_task",
			hidePaintObj = true,
			dir = 1,
			nameColor = "#A9F548FF",
			actor = 408131,
			say = "本当だ～。指揮官見えてる？カメラの角度、調整した方がいい～？",
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
			bgName = "bg_story_task",
			hidePaintObj = true,
			dir = 1,
			nameColor = "#A9F548FF",
			actor = 408131,
			say = "それとも、指揮官はかわいいU-31のことだけ見ていたい？",
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
			bgName = "bg_story_task",
			hidePaintObj = true,
			dir = 1,
			nameColor = "#A9F548FF",
			actor = 307130,
			say = "あなた…さっさと本題に入りなさいっ！",
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
			bgName = "bg_story_task",
			hidePaintObj = true,
			dir = 1,
			nameColor = "#A9F548FF",
			actor = 408131,
			say = "ふふ～ん、大鳳ちゃん焦ってる焦ってる～",
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
			bgName = "bg_story_task",
			factiontag = "通信モード",
			hidePaintObj = true,
			nameColor = "#A9F548FF",
			say = "――「…U-31、カメラを床に向けて落ちているものを見せてくれ」",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			actor = 408131,
			side = 2,
			bgName = "bg_story_task",
			hidePaintObj = true,
			dir = 1,
			nameColor = "#A9F548FF",
			say = "はーい",
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
			bgName = "bg_story_task",
			hidePaintObj = true,
			say = "カメラ越しで見えたのは――新聞紙のタイトルの文字から切り取られた「収容」、「深夜」、「行方不明」の文字が書かれている紙だ。",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			expression = 4,
			side = 2,
			bgName = "bg_story_task",
			hidePaintObj = true,
			dir = 1,
			nameColor = "#A9F548FF",
			actor = 102210,
			say = "これってまさか、出発前にブリストルが教えてくれた――「うまく収容されなかったせいで、深夜に行方不明になった謎の生物」の話？！",
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
			bgName = "bg_story_task",
			hidePaintObj = true,
			dir = 1,
			nameColor = "#A9F548FF",
			actor = 401431,
			say = "クックックッ、違う！「行方不明だった運命の堕天使は実は、光を守るがために終わりなき闇……深夜に堕ちた」に違いない！",
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
			bgName = "bg_story_task",
			hidePaintObj = true,
			dir = 1,
			nameColor = "#A9F548FF",
			actor = 408131,
			say = "……どっちもヘンテコ過ぎない？",
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
			actor = 101266,
			side = 2,
			bgName = "bg_story_task",
			hidePaintObj = true,
			dir = 1,
			nameColor = "#A9F548FF",
			say = "……しー。音楽、聞こえる",
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
			bgName = "bg_story_task",
			hidePaintObj = true,
			say = "ガヤガヤしていたその場が静まり、みんなが精神を集中して耳を澄ませると――軽快ながらも不気味なメロディが本当に聞こえてきた。",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			expression = 4,
			side = 2,
			bgName = "bg_story_task",
			paintingNoise = true,
			dir = 1,
			actor = 102160,
			nameColor = "#A9F548FF",
			hidePaintObj = true,
			say = "「指揮官、間取図を見た限り、音の発生源の部屋は突き当たりにある音楽室みたいね」",
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
			bgName = "bg_story_task",
			factiontag = "通信モード",
			hidePaintObj = true,
			nameColor = "#A9F548FF",
			say = "――「つまり芸術棟の異常を解決する鍵は、そこにあるってことだな」",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			actor = 0,
			side = 2,
			bgName = "bg_story_task",
			factiontag = "通信モード",
			hidePaintObj = true,
			nameColor = "#A9F548FF",
			say = "――「『キラキラリトルスター』、そこに向かって調査せよ。くれぐれも気をつけて」",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			side = 2,
			actorName = "みんな",
			bgName = "bg_story_task",
			hidePaintObj = true,
			nameColor = "#A9F548FF",
			say = "了解――",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			nameColor = "#A9F548FF",
			side = 2,
			bgName = "star_level_bg_599",
			hidePaintObj = true,
			say = "芸術棟・音楽室",
			bgm = "story-richang-11",
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
			nameColor = "#A9F548FF",
			side = 2,
			bgName = "star_level_bg_599",
			hidePaintObj = true,
			say = "――――！",
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
			nameColor = "#A9F548FF",
			side = 2,
			bgName = "star_level_bg_599",
			hidePaintObj = true,
			say = "ドアを開けて中に侵入した艦船たち。目に飛び込んできたのは、あまりにも不思議な光景だった――",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			expression = 1,
			side = 2,
			bgName = "star_level_bg_599",
			hidePaintObj = true,
			dir = 1,
			nameColor = "#A9F548FF",
			actor = 307140,
			say = "ん～？皆来たの～？妾に付き合ってほしく申す～。今が元気溢るるところなり～！",
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
			bgName = "star_level_bg_599",
			hidePaintObj = true,
			dir = 1,
			nameColor = "#A9F548FF",
			actor = 403120,
			say = "つまらないわ……やる気が出ない……おやつも食べたくないし……本も読みたくない……",
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
			bgName = "star_level_bg_599",
			hidePaintObj = true,
			dir = 1,
			nameColor = "#A9F548FF",
			actor = 102190,
			say = "髪型なんてどうだっていいじゃない。このままでも……",
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
			bgName = "star_level_bg_599",
			hidePaintObj = true,
			dir = 1,
			nameColor = "#A9F548FF",
			actor = 405060,
			say = "楽章……奏でたくない……ふふ……むしろ音楽なんていらないわ",
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
			bgName = "star_level_bg_599",
			hidePaintObj = true,
			say = "奇妙な音楽が流れている音楽室。信濃ちゃんがはしゃいでて、それ以外は全員だらしなくうずくまっていた。",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			expression = 4,
			side = 2,
			bgName = "star_level_bg_599",
			paintingNoise = true,
			dir = 1,
			actor = 102050,
			nameColor = "#A9F548FF",
			hidePaintObj = true,
			say = "「指揮官、この教室には精神に干渉する『なにか』があるみたいよ。そこにいる子たちはその影響を受けているわ」",
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
			bgName = "star_level_bg_599",
			hidePaintObj = true,
			dir = 1,
			nameColor = "#A9F548FF",
			actor = 408131,
			say = "影響なんてないよぉ……指揮官を守るとか面倒くさいし、ここで休憩しようっと……",
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
			bgName = "star_level_bg_599",
			hidePaintObj = true,
			dir = 1,
			nameColor = "#A9F548FF",
			actor = 102210,
			say = "キラキラなんてやーめた！……指揮官の役に立てたからってなんてことないよ……",
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
			bgName = "star_level_bg_599",
			hidePaintObj = true,
			say = "エルドリッジに至っては無言のままダウシング棒を下ろし、膝を抱えて隅に佇んでいた。",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			expression = 2,
			side = 2,
			bgName = "star_level_bg_599",
			hidePaintObj = true,
			dir = 1,
			nameColor = "#A9F548FF",
			actor = 401431,
			say = "……え！？し、指揮官、今の見た？！みんなの様子がおかしいって！",
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
			paintingNoise = true,
			side = 2,
			bgName = "star_level_bg_599",
			hidePaintObj = true,
			dir = 1,
			nameColor = "#A9F548FF",
			actor = 112010,
			say = "「精神干渉が思いのほか強力ですね…みんなやられてしまってます…」",
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
			bgName = "star_level_bg_599",
			hidePaintObj = true,
			dir = 1,
			nameColor = "#A9F548FF",
			actor = 112010,
			say = "「まだ影響を受けていないメンバーを今すぐ撤退させて、救援要員を派遣することをお勧めします」",
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
			bgName = "star_level_bg_599",
			paintingNoise = true,
			dir = 1,
			actor = 405010,
			nameColor = "#A9F548FF",
			hidePaintObj = true,
			say = "「それでは間に合わないわ。早く精神干渉の源を叩いたほうがいい」",
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
			bgName = "star_level_bg_599",
			factiontag = "通信モード",
			hidePaintObj = true,
			nameColor = "#A9F548FF",
			say = "――「精神干渉の源か……あれ、Z43はなんで影響を受けていないの？心当たりはある？」",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			expression = 1,
			side = 2,
			bgName = "star_level_bg_599",
			hidePaintObj = true,
			dir = 1,
			nameColor = "#A9F548FF",
			actor = 401431,
			say = "わ、私だけ耳を塞いでいたから…？部屋に入るときに悪しき呪いを警戒したから……？",
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
			bgName = "star_level_bg_599",
			hidePaintObj = true,
			nameColor = "#A9F548FF",
			say = "（なるほど。どうやらこの音楽が原因らしいな）",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			actor = 0,
			side = 2,
			bgName = "star_level_bg_599",
			factiontag = "通信モード",
			hidePaintObj = true,
			nameColor = "#A9F548FF",
			say = "――「Z43、耳を塞いだまま周りをよく見て。音楽が流れていそうな何かを見つけられるか？」",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			expression = 4,
			side = 2,
			bgName = "star_level_bg_599",
			hidePaintObj = true,
			dir = 1,
			nameColor = "#A9F548FF",
			actor = 401431,
			say = "あ、スピーカーを何台か見つけた！まさかそれが「邪悪な力」の源なのか？",
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
			bgName = "star_level_bg_599",
			hidePaintObj = true,
			dir = 1,
			nameColor = "#A9F548FF",
			actor = 401431,
			say = "宿命の人よ、これらを壊せばいいのか？！",
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
			bgName = "star_level_bg_599",
			factiontag = "通信モード",
			hidePaintObj = true,
			nameColor = "#A9F548FF",
			say = "――「そうだ。音楽さえ止めれば皆がもとに戻るはず！」",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			expression = 6,
			side = 2,
			bgName = "star_level_bg_599",
			hidePaintObj = true,
			dir = 1,
			nameColor = "#A9F548FF",
			actor = 401431,
			say = "ぐぬぬぬ……高くて手が届かない……教室の中で砲撃を放つわけには……",
			painting = {
				alpha = 0.3,
				time = 1
			},
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
			expression = 6,
			side = 2,
			bgName = "star_level_bg_599",
			paintingNoise = true,
			dir = 1,
			actor = 608020,
			nameColor = "#A9F548FF",
			hidePaintObj = true,
			say = "「あ！スピーカーを壊さなくても解決できるかもよ！」",
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
			expression = 8,
			side = 2,
			bgName = "star_level_bg_599",
			paintingNoise = true,
			dir = 1,
			actor = 608020,
			nameColor = "#A9F548FF",
			hidePaintObj = true,
			say = "「ほら、みんなあのメロディを聞いたから影響を受けたんでしょ？ならメロディを乱せばいいのよ！」",
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
			bgName = "star_level_bg_599",
			hidePaintObj = true,
			nameColor = "#A9F548FF",
			say = "（メロディーを乱す…そうか！音楽室の楽器をうまく使えば！）",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			actor = 0,
			side = 2,
			bgName = "star_level_bg_599",
			factiontag = "通信モード",
			hidePaintObj = true,
			nameColor = "#A9F548FF",
			say = "――「Z43、楽器の演奏はできるか？」",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			expression = 6,
			side = 2,
			bgName = "star_level_bg_599",
			hidePaintObj = true,
			dir = 1,
			nameColor = "#A9F548FF",
			actor = 401431,
			say = "そんなの無理だよーーってわあああ！？信濃ちゃん、いきなり飛びかかってこないで！転んだら痛いよ！",
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
			expression = 8,
			side = 2,
			bgName = "star_level_bg_599",
			hidePaintObj = true,
			dir = 1,
			nameColor = "#A9F548FF",
			actor = 307140,
			say = "指揮官の声が聞こえた！妾と一緒に遊ぼう！",
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
			bgName = "star_level_bg_599",
			hidePaintObj = true,
			dir = 1,
			nameColor = "#A9F548FF",
			actor = 401431,
			say = "ちょ、ちょっとタンマ！信濃ちゃんはここに座ってて！すぐ指揮官が来てくれるから！",
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
			bgName = "star_level_bg_599",
			hidePaintObj = true,
			dir = 1,
			nameColor = "#A9F548FF",
			actor = 401431,
			say = "とにかく！このメロディを乱せばいいよね！？",
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
			expression = 4,
			side = 2,
			bgName = "star_level_bg_599",
			hidePaintObj = true,
			dir = 1,
			nameColor = "#A9F548FF",
			actor = 401431,
			say = "……スピーカーとマイクなら…ふん、宿命の人よ安心せよ！深淵に堕ちた仲間たちは、私が救ってみせる！",
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
			bgName = "star_level_bg_599",
			hidePaintObj = true,
			dir = 1,
			nameColor = "#A9F548FF",
			actor = 401431,
			say = "コホン――！",
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
			bgName = "star_level_bg_599",
			hidePaintObj = true,
			say = "Z43は咳払いをして、スピーカーにつながっているマイクを手に取った！",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			expression = 6,
			side = 2,
			bgName = "star_level_bg_599",
			hidePaintObj = true,
			dir = 1,
			nameColor = "#A9F548FF",
			actor = 401431,
			say = "「燃えさかる闇キ翼♪契りを交わす時♪封印の力が解き放たれる♪ららら～♪」",
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
