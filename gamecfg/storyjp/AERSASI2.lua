return {
	id = "AERSASI2",
	mode = 2,
	fadeOut = 1.5,
	scripts = {
		{
			stopbgm = true,
			mode = 1,
			sequence = {
				{
					"アルザス、オーバーヒート！\n\n<size=45>二 秘書艦だから大丈夫……？</size>",
					1
				}
			}
		},
		{
			fontsize = 39,
			side = 2,
			bgName = "bg_story_task_2",
			hidePaintObj = true,
			nameColor = "#A9F548FF",
			say = "秘書艦になったアルザスに、今日の仕事について簡単に説明した。",
			bgm = "story-richang-5",
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
			expression = 5,
			side = 2,
			bgName = "bg_story_task_2",
			dir = 1,
			fontsize = 39,
			actor = 805030,
			nameColor = "#A9F548FF",
			hidePaintObj = true,
			say = "アルザス、了解した。指揮官は安心してアルザスに仕事をお任せあれ",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			expression = 3,
			side = 2,
			bgName = "bg_story_task_2",
			dir = 1,
			fontsize = 39,
			actor = 805030,
			nameColor = "#A9F548FF",
			hidePaintObj = true,
			say = "～♪～♪",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			side = 2,
			nameColor = "#A9F548FF",
			bgName = "bg_story_task_2",
			hidePaintObj = true,
			say = "オリジナルの鼻歌を口ずさみながら、アルザスは席に座って仕事を始めた。",
			fontsize = 39,
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			nameColor = "#A9F548FF",
			side = 2,
			bgName = "bg_story_task_2",
			hidePaintObj = true,
			say = "しばらくして――",
			fontsize = 39,
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
			side = 2,
			nameColor = "#A9F548FF",
			bgName = "bg_story_task_2",
			hidePaintObj = true,
			say = "アルザスがバラバラだった書類を綺麗にまとめてくれたおかげで、作業効率は大幅に向上した。",
			fontsize = 39,
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			actor = 0,
			nameColor = "#A9F548FF",
			bgName = "bg_story_task_2",
			hidePaintObj = true,
			side = 2,
			say = "（アルザスを秘書艦に任命したのは、我ながら見事な采配だったな）",
			fontsize = 39,
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			actor = 0,
			nameColor = "#A9F548FF",
			bgName = "bg_story_task_2",
			hidePaintObj = true,
			side = 2,
			say = "（熱が入って頑張り過ぎるのも大変だし…一旦休憩を取らせよう）",
			fontsize = 39,
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			actor = 0,
			side = 2,
			bgName = "bg_story_task_2",
			hidePaintObj = true,
			nameColor = "#A9F548FF",
			say = "――アルザス、そろそろ休もうか",
			fontsize = 39,
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
			bgName = "bg_story_task_2",
			dir = 1,
			fontsize = 39,
			actor = 805030,
			nameColor = "#A9F548FF",
			hidePaintObj = true,
			say = "休む？アルザス、現在テキパキ秘書艦モードフル作動中につき、疲労解消の休息は不要と認む！",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			actor = 0,
			nameColor = "#A9F548FF",
			bgName = "bg_story_task_2",
			hidePaintObj = true,
			side = 2,
			say = "――午前中の仕事は見事にこなしてくれた。ずっと根を詰めているのは疲れちゃうし、メリハリをつけるのも大事だよ？",
			fontsize = 39,
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			expression = 2,
			side = 2,
			bgName = "bg_story_task_2",
			dir = 1,
			fontsize = 39,
			actor = 805030,
			nameColor = "#A9F548FF",
			hidePaintObj = true,
			say = "理解した。で、でもし……指揮官、これって……ア、アルザスを褒めてくれてるの……？",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			expression = 8,
			side = 2,
			bgName = "bg_story_task_2",
			dir = 1,
			fontsize = 39,
			actor = 805030,
			nameColor = "#A9F548FF",
			hidePaintObj = true,
			say = "そんなにアルザスを褒めてくれては……感情モジュールが……ああっ……！",
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
			bgName = "bg_story_task_2",
			hidePaintObj = true,
			say = "アルザスの言葉とともに、執務室の室温がなぜか急に上がり始めた！",
			fontsize = 39,
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			actor = 0,
			nameColor = "#A9F548FF",
			bgName = "bg_story_task_2",
			hidePaintObj = true,
			side = 2,
			say = "――アルザス…まずは落ち着くんだ！",
			fontsize = 39,
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			expression = 7,
			side = 2,
			bgName = "bg_story_task_2",
			dir = 1,
			fontsize = 39,
			actor = 805030,
			nameColor = "#A9F548FF",
			hidePaintObj = true,
			say = "ご、ごめんなさい！アルザス、視覚とセンサーモジュールを一時停止してから……",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			nameColor = "#A9F548FF",
			side = 2,
			bgName = "bg_story_task_2",
			hidePaintObj = true,
			say = "アルザスが俯いて言葉を発さなくなると、執務室の温度も下がり始めた。",
			fontsize = 39,
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
			side = 2,
			nameColor = "#A9F548FF",
			bgName = "bg_story_task_2",
			hidePaintObj = true,
			say = "しばらくして、彼女が再び顔を上げた時、その声は既に元の落ち着きを取り戻していた。",
			fontsize = 39,
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			expression = 6,
			side = 2,
			bgName = "bg_story_task_2",
			dir = 1,
			fontsize = 39,
			actor = 805030,
			nameColor = "#A9F548FF",
			hidePaintObj = true,
			say = "先ほどは取り乱してしまい、申し訳ない。指揮官",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			expression = 1,
			side = 2,
			bgName = "bg_story_task_2",
			dir = 1,
			fontsize = 39,
			actor = 805030,
			nameColor = "#A9F548FF",
			hidePaintObj = true,
			say = "お詫びにアルザス、今すぐ冷えたソーダを持ってくる！",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			side = 2,
			nameColor = "#A9F548FF",
			bgName = "bg_story_task_2",
			hidePaintObj = true,
			say = "言うなり彼女は立ち上がり、そそくさと執務室を後にし、すぐさまソーダを持って戻ってきた。",
			fontsize = 39,
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			actor = 0,
			nameColor = "#A9F548FF",
			bgName = "bg_story_task_2",
			hidePaintObj = true,
			side = 2,
			say = "――ありがとう",
			fontsize = 39,
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			side = 2,
			nameColor = "#A9F548FF",
			bgName = "bg_story_task_2",
			hidePaintObj = true,
			say = "アルザスからソーダを受け取ったものの、なぜか期待に満ちた視線が向けられている気がした。",
			fontsize = 39,
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			actor = 0,
			nameColor = "#A9F548FF",
			bgName = "bg_story_task_2",
			hidePaintObj = true,
			side = 2,
			say = "（ん……？仮面越しなのにアルザスの視線を感じた、だと……？）",
			fontsize = 39,
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			side = 2,
			nameColor = "#A9F548FF",
			bgName = "bg_story_task_2",
			hidePaintObj = true,
			say = "妙な感覚が気になってアルザスに向き直ると、思わず彼女に見入ってしまった。",
			fontsize = 39,
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			expression = 7,
			side = 2,
			bgName = "bg_story_task_2",
			dir = 1,
			fontsize = 39,
			actor = 805030,
			nameColor = "#A9F548FF",
			hidePaintObj = true,
			say = "し、指揮官が……アルザスを凝視して……16秒……17秒……",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			actor = 0,
			nameColor = "#A9F548FF",
			bgName = "bg_story_task_2",
			hidePaintObj = true,
			side = 2,
			say = "――アルザス……？",
			fontsize = 39,
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			expression = 8,
			side = 2,
			bgName = "bg_story_task_2",
			dir = 1,
			fontsize = 39,
			actor = 805030,
			nameColor = "#A9F548FF",
			hidePaintObj = true,
			say = "だめだめだめだめ……この距離でそんな……アルザス…もう耐えられない……！？",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			},
			dialogShake = {
				speed = 0.08,
				x = 15,
				number = 2
			}
		}
	}
}
