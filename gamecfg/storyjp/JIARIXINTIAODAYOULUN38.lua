return {
	fadeOut = 1.5,
	mode = 2,
	id = "JIARIXINTIAODAYOULUN38",
	placeholder = {
		"playername"
	},
	scripts = {
		{
			stopbgm = true,
			mode = 1,
			sequence = {
				{
					"トキメク休日大航海\n\n<size=45>ファンシー・ナイトドリーム</size>",
					1
				}
			}
		},
		{
			nameColor = "#A9F548FF",
			side = 2,
			bgName = "star_level_bg_161",
			hidePaintObj = true,
			say = "テラスバーで軽く飲みながら、肌を撫でる潮風を感じていると――",
			bgm = "story-niceship-soft",
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
			bgName = "star_level_bg_161",
			hidePaintObj = true,
			say = "白いハトの群れが急にこちらに飛んできて、自分の目の前に着地した。",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			actor = 0,
			side = 2,
			bgName = "star_level_bg_161",
			hidePaintObj = true,
			nameColor = "#A9F548FF",
			say = "（ん…？どうしてここにハトが？）",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			nameColor = "#A9F548FF",
			side = 2,
			bgName = "star_level_bg_161",
			hidePaintObj = true,
			say = "どこから来たのかと首を傾げると、パンという音とともにハトたちが煙へと化してしまった。",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			nameColor = "#A9F548FF",
			side = 2,
			bgName = "star_level_bg_161",
			hidePaintObj = true,
			say = "煙の中から少女のシルエットが現れ、そして――こちらへと飛びついてきた。",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			expression = 1,
			side = 2,
			bgName = "star_level_bg_161",
			hidePaintObj = true,
			dir = 1,
			nameColor = "#A9F548FF",
			actor = 900433,
			say = "だ・ん・な・さま～！専属マジシャン・チェシャーが来たよー！えへへ、すりすり～♡",
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
					y = 45,
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
			bgName = "star_level_bg_161",
			hidePaintObj = true,
			dir = 1,
			nameColor = "#A9F548FF",
			actor = 900433,
			say = "登場の演出、すごかったでしょ？",
			painting = {
				alpha = 0.3,
				time = 1
			},
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			},
			options = {
				{
					content = "すごかった！",
					flag = 1
				},
				{
					content = "ちょっとニンジャっぽい？",
					flag = 2
				}
			}
		},
		{
			expression = 2,
			side = 2,
			bgName = "star_level_bg_161",
			actorName = "{playername}",
			optionFlag = 1,
			hideRecordIco = true,
			actor = 900433,
			nameColor = "#A9F548FF",
			hidePaintObj = true,
			say = "――でもこれを準備するのは大変そうだな…",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			expression = 3,
			side = 2,
			bgName = "star_level_bg_161",
			dir = 1,
			optionFlag = 1,
			actor = 900433,
			nameColor = "#A9F548FF",
			hidePaintObj = true,
			say = "えへへ…ダンナさまのためなら、チェシャーはにゃーんでもベンキョーしてみせるよ♡",
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
			bgName = "star_level_bg_161",
			actorName = "{playername}",
			optionFlag = 2,
			hideRecordIco = true,
			actor = 900433,
			nameColor = "#A9F548FF",
			hidePaintObj = true,
			say = "――マジシャンよりニンジャのほうがよく煙から登場するんじゃにゃかったっけ？",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			expression = 3,
			side = 2,
			bgName = "star_level_bg_161",
			dir = 1,
			optionFlag = 2,
			actor = 900433,
			nameColor = "#A9F548FF",
			hidePaintObj = true,
			say = "じゃあダンナさまの前で今度ニンジャっぽく登場するよ～",
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
			bgName = "star_level_bg_161",
			hidePaintObj = true,
			dir = 1,
			nameColor = "#A9F548FF",
			actor = 900433,
			say = "今のチェシャーのサプライズ、ダンナさまに見せたくてずっと我慢してたの！",
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
			bgName = "star_level_bg_161",
			actorName = "{playername}",
			hideRecordIco = true,
			actor = 900433,
			nameColor = "#A9F548FF",
			hidePaintObj = true,
			say = "――だから今日はずっと見なかったのか…",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			expression = 3,
			side = 2,
			bgName = "star_level_bg_161",
			hidePaintObj = true,
			dir = 1,
			nameColor = "#A9F548FF",
			actor = 900433,
			say = "えへへ♡ダンナさまは今日、ずっとチェシャーのことを探してくれてたんでしょ？チェシャーはとっても感動してるんだよ～",
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
			bgName = "star_level_bg_161",
			hidePaintObj = true,
			dir = 1,
			nameColor = "#A9F548FF",
			actor = 900433,
			say = "でもやっぱり登場はタイミングが大事！チェシャー、ダンナさまにすりすりぎゅうぎゅうしたいのをぐっと耐えた！",
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
			bgName = "star_level_bg_161",
			actorName = "{playername}",
			hideRecordIco = true,
			actor = 900433,
			nameColor = "#A9F548FF",
			hidePaintObj = true,
			say = "――タイミング？",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			expression = 2,
			side = 2,
			bgName = "star_level_bg_161",
			hidePaintObj = true,
			dir = 1,
			nameColor = "#A9F548FF",
			actor = 900433,
			say = "ふふ、もうちょっとしたらわかるよ♪",
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
			bgName = "star_level_bg_161",
			hidePaintObj = true,
			dir = 1,
			nameColor = "#A9F548FF",
			actor = 900433,
			say = "とにかくダンナさま、チェシャーとゲームしよ？マジシャン・チェシャーのすごいところ、見せてあげる♪",
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
					dur = 0.2,
					x = 0,
					number = 2
				}
			}
		},
		{
			expression = 1,
			side = 2,
			bgName = "star_level_bg_161",
			actorName = "{playername}",
			hideRecordIco = true,
			actor = 900433,
			nameColor = "#A9F548FF",
			hidePaintObj = true,
			say = "――ん？具体的にどうすればいい？",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			expression = 1,
			side = 2,
			bgName = "star_level_bg_161",
			withoutActorName = true,
			hideRecordIco = true,
			actor = 900433,
			nameColor = "#A9F548FF",
			hidePaintObj = true,
			say = "了承の返事をもらった途端、チェシャーはこちらの側までやってきた。",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			},
			action = {
				{
					type = "shake",
					y = 0,
					delay = 0,
					dur = 0.4,
					x = 30,
					number = 2
				}
			}
		},
		{
			expression = 1,
			side = 2,
			bgName = "star_level_bg_161",
			withoutActorName = true,
			hideRecordIco = true,
			actor = 900433,
			nameColor = "#A9F548FF",
			hidePaintObj = true,
			say = "さっきまでも近かったが、これでは密着とそう変わらない……",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			expression = 0,
			side = 2,
			bgName = "star_level_bg_161",
			hidePaintObj = true,
			dir = 1,
			nameColor = "#A9F548FF",
			actor = 900433,
			say = "まずはぁ…ダンナさま、ここからトランプを1枚引いて～",
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
			bgName = "star_level_bg_161",
			withoutActorName = true,
			hideRecordIco = true,
			actor = 900433,
			nameColor = "#A9F548FF",
			hidePaintObj = true,
			say = "耳元で囁くと、チェシャーはどこからともなくトランプを取り出して差し出してきた。",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			expression = 0,
			side = 2,
			bgName = "star_level_bg_161",
			withoutActorName = true,
			hideRecordIco = true,
			actor = 900433,
			nameColor = "#A9F548FF",
			hidePaintObj = true,
			say = "言われた通り中から1枚引くと――",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			expression = 2,
			side = 2,
			bgName = "star_level_bg_161",
			hidePaintObj = true,
			dir = 1,
			nameColor = "#A9F548FF",
			actor = 900433,
			say = "よ～し、じゃあ次はそのカードをチェシャーの帽子に入れて～",
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
			bgName = "star_level_bg_161",
			actorName = "{playername}",
			hideRecordIco = true,
			actor = 900433,
			nameColor = "#A9F548FF",
			hidePaintObj = true,
			say = "――ん…？",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			expression = 2,
			side = 2,
			bgName = "star_level_bg_161",
			actorName = "{playername}",
			hideRecordIco = true,
			actor = 900433,
			nameColor = "#A9F548FF",
			hidePaintObj = true,
			say = "――カードを隠させて数字を当てる手品じゃないのか？",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			expression = 0,
			side = 2,
			bgName = "star_level_bg_161",
			hidePaintObj = true,
			dir = 1,
			nameColor = "#A9F548FF",
			actor = 900433,
			say = "ダンナさま、それじゃあ普通すぎるよ～",
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
			bgName = "star_level_bg_161",
			hidePaintObj = true,
			dir = 1,
			nameColor = "#A9F548FF",
			actor = 900433,
			say = "チェシャーが見せるマジックは他と違うの♪",
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
			bgName = "star_level_bg_161",
			withoutActorName = true,
			hideRecordIco = true,
			actor = 900433,
			nameColor = "#A9F548FF",
			hidePaintObj = true,
			say = "頭の上のシルクハットを取ると、チェシャーはすかさずトランプを持っているこちらの手を取った。",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			expression = 1,
			side = 2,
			bgName = "star_level_bg_161",
			withoutActorName = true,
			hideRecordIco = true,
			actor = 900433,
			nameColor = "#A9F548FF",
			hidePaintObj = true,
			say = "練習の時涼しげな潮風を当てていたせいか、彼女の指先の温度も少し冷たいように感じた。",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			expression = 0,
			side = 2,
			bgName = "star_level_bg_161",
			hidePaintObj = true,
			dir = 1,
			nameColor = "#A9F548FF",
			actor = 900433,
			say = "えへへ…いい感じ！ダンナさま、早くカードを帽子に入れて♪",
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
			bgName = "star_level_bg_161",
			withoutActorName = true,
			hideRecordIco = true,
			actor = 900433,
			nameColor = "#A9F548FF",
			hidePaintObj = true,
			say = "チェシャーの手に「案内」されるままに、トランプをシルクハットに入れた。すると、今度は中からウサギが飛び出してきた。",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			expression = 0,
			side = 2,
			bgName = "star_level_bg_161",
			actorName = "{playername}",
			hideRecordIco = true,
			actor = 900433,
			nameColor = "#A9F548FF",
			hidePaintObj = true,
			say = "――ウサギ…？",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			expression = 2,
			side = 2,
			bgName = "star_level_bg_161",
			hidePaintObj = true,
			dir = 1,
			nameColor = "#A9F548FF",
			actor = 900433,
			say = "まだ終わりじゃにゃいよ♪ダンナさま、じっくり見ててね～",
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
			bgName = "star_level_bg_161",
			withoutActorName = true,
			hideRecordIco = true,
			actor = 900433,
			nameColor = "#A9F548FF",
			hidePaintObj = true,
			say = "パン！という音とともに、ウサギが先ほどのハトと同じように煙になると――",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			expression = 3,
			side = 2,
			bgName = "star_level_bg_161",
			withoutActorName = true,
			hideRecordIco = true,
			actor = 900433,
			nameColor = "#A9F548FF",
			hidePaintObj = true,
			say = "それに呼応するように、夜空に華が咲いた。",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			expression = 3,
			side = 2,
			bgName = "star_level_bg_161",
			withoutActorName = true,
			hideRecordIco = true,
			actor = 900433,
			nameColor = "#A9F548FF",
			hidePaintObj = true,
			say = "ハト…ウサギ…さっき引いたトランプのマーク。",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			expression = 1,
			side = 2,
			bgName = "star_level_bg_161",
			hidePaintObj = true,
			dir = 1,
			nameColor = "#A9F548FF",
			actor = 900433,
			say = "えへへ～、これがチェシャーがダンナさまに見せたかったマジックだよ♪",
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
					y = 45,
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
			bgName = "star_level_bg_161",
			actorName = "{playername}",
			hideRecordIco = true,
			actor = 900433,
			nameColor = "#A9F548FF",
			hidePaintObj = true,
			say = "――すごいな……どうやってるんだ…？",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			expression = 2,
			side = 2,
			bgName = "star_level_bg_161",
			hidePaintObj = true,
			dir = 1,
			nameColor = "#A9F548FF",
			actor = 900433,
			say = "種も仕掛けもありません、ってこと♪",
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
			bgName = "star_level_bg_161",
			hidePaintObj = true,
			dir = 1,
			nameColor = "#A9F548FF",
			actor = 900433,
			say = "ダンナさま、気に入った？",
			painting = {
				alpha = 0.3,
				time = 1
			},
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			},
			options = {
				{
					content = "気に入ったよ！",
					flag = 1
				},
				{
					content = "とっても気に入った！！",
					flag = 2
				}
			}
		},
		{
			expression = 0,
			side = 2,
			bgName = "star_level_bg_161",
			hidePaintObj = true,
			dir = 1,
			nameColor = "#A9F548FF",
			actor = 900433,
			say = "じゃあチェシャーの頑張りは無駄じゃにゃかったね～",
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
			bgName = "star_level_bg_161",
			hidePaintObj = true,
			dir = 1,
			nameColor = "#A9F548FF",
			actor = 900433,
			say = "ダンナさまのクルーズ旅の祝いにして、ダンナさまへのサプライズ…",
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
			bgName = "star_level_bg_161",
			hidePaintObj = true,
			dir = 1,
			nameColor = "#A9F548FF",
			actor = 900433,
			say = "海と花火の素敵なカップリングはまさにチェシャーとダンナさまと同じ！",
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
			bgName = "star_level_bg_161",
			withoutActorName = true,
			hideRecordIco = true,
			actor = 900433,
			nameColor = "#A9F548FF",
			hidePaintObj = true,
			say = "チェシャーの言葉に反応しているのか、花火もまたチェシャーを模しているようだ。",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			expression = 2,
			side = 2,
			bgName = "star_level_bg_161",
			hidePaintObj = true,
			dir = 1,
			nameColor = "#A9F548FF",
			actor = 900433,
			say = "えへへ、本当はトランプのマークでお開きにするつもりだったけど、チェシャー、自分のことも入れちゃった～",
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
			bgName = "star_level_bg_161",
			hidePaintObj = true,
			dir = 1,
			nameColor = "#A9F548FF",
			actor = 900433,
			say = "これで、ダンナさまの出航を祝うチェシャーがたくさん！",
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
			bgName = "star_level_bg_161",
			withoutActorName = true,
			hideRecordIco = true,
			actor = 900433,
			nameColor = "#A9F548FF",
			hidePaintObj = true,
			say = "咲いては消える花火の輝きだが、チェシャーの目の輝きはそれとは異なっていた。",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			expression = 11,
			side = 2,
			bgName = "star_level_bg_161",
			hidePaintObj = true,
			dir = 1,
			nameColor = "#A9F548FF",
			actor = 900433,
			say = "ダンナさまが楽しいクルーズを過ごせますようにー。そしてチェシャーと一緒に…",
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
			expression = 11,
			side = 2,
			bgName = "star_level_bg_161",
			hidePaintObj = true,
			dir = 1,
			nameColor = "#A9F548FF",
			actor = 900433,
			say = "素敵で、忘れられなくて、サプライズいっぱいのバカンスを過ごせますように…",
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
			bgName = "star_level_bg_161",
			hidePaintObj = true,
			dir = 1,
			nameColor = "#A9F548FF",
			actor = 900433,
			say = "えへへ、ダンナさま♡がんばったチェシャーにご褒美をくれるべきじゃにゃい？",
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
			bgName = "star_level_bg_161",
			actorName = "{playername}",
			hideRecordIco = true,
			actor = 900433,
			nameColor = "#A9F548FF",
			hidePaintObj = true,
			say = "――チェシャーはどんなご褒美が欲しいの？",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			expression = 9,
			side = 2,
			bgName = "star_level_bg_161",
			hidePaintObj = true,
			dir = 1,
			nameColor = "#A9F548FF",
			actor = 900433,
			say = "んー、チェシャーにちょっと考えさせてね？",
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
			expression = 11,
			side = 2,
			bgName = "star_level_bg_161",
			hidePaintObj = true,
			dir = 1,
			nameColor = "#A9F548FF",
			actor = 900433,
			say = "ダンナさまと一緒に星を眺めたり、一緒に潮風に当たったり、レストランでおいしいご飯を食べたり……",
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
			bgName = "star_level_bg_161",
			hidePaintObj = true,
			dir = 1,
			nameColor = "#A9F548FF",
			actor = 900433,
			say = "ううん！これじゃあ普通すぎるね！チェシャーによーくよーく考えさせて♪",
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
			bgName = "star_level_bg_161",
			hidePaintObj = true,
			nameColor = "#A9F548FF",
			say = "その声が、願いが潮風に遠く運ばれていく。",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			nameColor = "#A9F548FF",
			side = 2,
			bgName = "star_level_bg_161",
			hidePaintObj = true,
			say = "きっと、夢の中に届くだろう――",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		}
	}
}
