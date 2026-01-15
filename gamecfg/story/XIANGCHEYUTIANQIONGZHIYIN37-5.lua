return {
	fadeOut = 1.5,
	mode = 2,
	id = "XIANGCHEYUTIANQIONGZHIYIN37-5",
	placeholder = {
		"playername"
	},
	scripts = {
		{
			actor = 900191,
			side = 2,
			bgName = "bg_tianqiong_3",
			nameColor = "#A9F548FF",
			dir = 1,
			say = "——很好，帷幕的承载压力正在迅速下降。",
			bgm = "story-antix-past",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			},
			flashin = {
				delay = 0,
				dur = 1,
				black = true,
				alpha = {
					1,
					0
				}
			},
			location = {
				"实验场θ·星空帷幕",
				3
			}
		},
		{
			actor = 900191,
			side = 2,
			bgName = "bg_tianqiong_3",
			nameColor = "#A9F548FF",
			dir = 1,
			say = "天帕岚斯，赫米忒，准备协助司答重置星空帷幕。",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			paintingNoise = true,
			side = 0,
			bgName = "bg_tianqiong_3",
			hideOther = true,
			dir = 1,
			actorName = "仲裁者·天帕岚斯·XIV&仲裁者·赫米忒·IX",
			actor = 900286,
			nameColor = "#A9F548FF",
			say = "是。\n收到。",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			},
			subActors = {
				{
					paintingNoise = true,
					actor = 900287,
					dir = 1,
					hidePaintObj = false,
					pos = {
						x = 1125,
						y = 0
					}
				}
			}
		},
		{
			actor = 900191,
			side = 2,
			bgName = "bg_tianqiong_3",
			nameColor = "#A9F548FF",
			dir = 1,
			say = "麦纪莎，你那边也开始准备吧。",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			actor = 900490,
			side = 2,
			bgName = "bg_tianqiong_3",
			nameColor = "#A9F548FF",
			dir = 1,
			paintingNoise = true,
			say = "好——正在重新分配性能。",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			actor = 900191,
			side = 2,
			bgName = "bg_tianqiong_3",
			nameColor = "#A9F548FF",
			dir = 1,
			say = "然后……",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			actor = 900191,
			side = 2,
			bgName = "bg_tianqiong_3",
			nameColor = "#A9F548FF",
			dir = 1,
			say = "沐恩，用玉轮型机体通知{playername}，可以转移去安克雷奇国立天文台了。",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			actor = 900191,
			side = 2,
			bgName = "bg_tianqiong_3",
			nameColor = "#A9F548FF",
			dir = 1,
			say = "如果要去再见一下海伦娜的话——就去做好准备吧。",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		}
	}
}
