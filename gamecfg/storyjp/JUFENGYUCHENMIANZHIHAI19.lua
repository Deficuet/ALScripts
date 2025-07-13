return {
	id = "JUFENGYUCHENMIANZHIHAI19",
	mode = 2,
	fadeOut = 1.5,
	scripts = {
		{
			blackBg = true,
			mode = 8,
			nextBgName = "bg_underwater",
			close = 0,
			blurTimeFactor = {
				0.7,
				1
			}
		},
		{
			nameColor = "#A9F548FF",
			side = 2,
			bgName = "bg_underwater",
			hidePaintObj = true,
			say = "？？？·？？？",
			bgm = "story-mirrorheart-mystic",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			nameColor = "#A9F548FF",
			side = 2,
			bgName = "bg_underwater",
			hidePaintObj = true,
			say = "目を開けると、そこにはどこまでも青い世界が広がっていた。",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			nameColor = "#A9F548FF",
			side = 2,
			bgName = "bg_underwater",
			hidePaintObj = true,
			say = "コンパスから発せられた儚い光が、とある方向を指し示していた。",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			actor = 0,
			nameColor = "#A9F548FF",
			bgName = "bg_underwater",
			hidePaintObj = true,
			side = 2,
			portrait = "zhihuiguan",
			say = "――コンパスの……光……",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			actor = 0,
			nameColor = "#A9F548FF",
			bgName = "bg_underwater",
			hidePaintObj = true,
			side = 2,
			portrait = "zhihuiguan",
			say = "――そうか…そろそろ帰る時か……",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			nameColor = "#A9F548FF",
			side = 2,
			bgName = "star_level_bg_1104",
			hidePaintObj = true,
			say = "光がどんどん強くなっていき、やがて目の前の全てを飲み込んだ――",
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
			portrait = "zhihuiguan",
			side = 2,
			bgName = "bg_story_task_3",
			hidePaintObj = true,
			nameColor = "#A9F548FF",
			actor = 0,
			say = "目を開けると、懐かしい我が家の天井がそこにあった。",
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
			nameColor = "#A9F548FF",
			side = 2,
			bgName = "bg_story_task_3",
			hidePaintObj = true,
			say = "枕側の目覚まし時計を見ると、床に就いた時からそう経っていない。",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			nameColor = "#A9F548FF",
			side = 2,
			bgName = "bg_story_task_3",
			hidePaintObj = true,
			say = "だが、テンペスタの仲間たちとの出来事は夢ではなかったと信じている。",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			nameColor = "#A9F548FF",
			side = 2,
			bgName = "bg_story_task_3",
			hidePaintObj = true,
			say = "なぜなら、自分の手にはその証拠となるものがある。",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			nameColor = "#A9F548FF",
			side = 2,
			bgName = "bg_story_task_3",
			hidePaintObj = true,
			say = "……金色の輝きを放っている「黄金コンパス」",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			nameColor = "#A9F548FF",
			side = 2,
			bgName = "bg_story_task_3",
			hidePaintObj = true,
			say = "夢ではない、ホンモノの冒険。",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			nameColor = "#A9F548FF",
			side = 2,
			bgName = "bg_story_task_3",
			hidePaintObj = true,
			say = "テンペスタの物語はまだまだ続く――",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			mode = 1,
			stopbgm = true,
			asideType = 1,
			blackBg = true,
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
					"――「テンペスタと眠りし海」・完……？",
					1
				}
			}
		}
	}
}
