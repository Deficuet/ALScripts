return {
	fadeOut = 1.5,
	mode = 2,
	defaultTb = 2003,
	id = "LINGYANGZHEXINZHIXUYU3",
	placeholder = {
		"tb"
	},
	scripts = {
		{
			expression = 2,
			side = 2,
			bgName = "bg_project_oceana_room2",
			actor = -2,
			actorName = "ナビィ",
			bgm = "qe-ova-4",
			dynamicBgType = -2,
			nameColor = "#A9F548FF",
			hidePaintObj = true,
			say = "あ、あのね……{tb}……",
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
			expression = 2,
			side = 2,
			bgName = "bg_project_oceana_room2",
			actor = -2,
			actorName = "ナビィ",
			dynamicBgType = -2,
			nameColor = "#A9F548FF",
			hidePaintObj = true,
			say = "ちょっとだけ、ほんのちょっとだけお金を使いすぎちゃって……",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			expression = 3,
			side = 2,
			bgName = "bg_project_oceana_room2",
			actor = -2,
			actorName = "ナビィ",
			dynamicBgType = -2,
			nameColor = "#A9F548FF",
			important = true,
			hidePaintObj = true,
			say = "来月分のお小遣いを前借りできないかな？ちゃんといい子にするから～",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			},
			options = {
				{
					flag = 1,
					content = "一緒に記帳してみよう",
					type = 1
				},
				{
					flag = 2,
					content = "いくら必要か言ってみな",
					type = 2
				}
			}
		},
		{
			expression = 1,
			side = 2,
			bgName = "bg_project_oceana_room2",
			actor = -2,
			actorName = "ナビィ",
			optionFlag = 1,
			dynamicBgType = -2,
			nameColor = "#A9F548FF",
			hidePaintObj = true,
			say = "えっ？使ったお金を一緒に書くってこと……？",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			actor = 0,
			side = 2,
			bgName = "bg_project_oceana_room2",
			hidePaintObj = true,
			nameColor = "#A9F548FF",
			optionFlag = 1,
			dynamicBgType = -2,
			say = "――もちろん。そうすればお金の使い方がもっと上手くなるよ",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			expression = 4,
			side = 2,
			bgName = "bg_project_oceana_room2",
			actor = -2,
			actorName = "ナビィ",
			optionFlag = 1,
			dynamicBgType = -2,
			nameColor = "#A9F548FF",
			hidePaintObj = true,
			say = "めんどくさい……でもお小遣いのためなら仕方ないか……",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			expression = 7,
			side = 2,
			bgName = "bg_project_oceana_room2",
			actor = -2,
			actorName = "ナビィ",
			optionFlag = 2,
			dynamicBgType = -2,
			nameColor = "#A9F548FF",
			hidePaintObj = true,
			say = "えっ？即答？{tb}って意外と優しいね～",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			actor = 0,
			side = 2,
			bgName = "bg_project_oceana_room2",
			hidePaintObj = true,
			nameColor = "#A9F548FF",
			optionFlag = 2,
			dynamicBgType = -2,
			say = "――もちろん。ただし、ちゃんと計画的に使うって約束して",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			expression = 8,
			side = 2,
			bgName = "bg_project_oceana_room2",
			actor = -2,
			actorName = "ナビィ",
			optionFlag = 2,
			dynamicBgType = -2,
			nameColor = "#A9F548FF",
			hidePaintObj = true,
			say = "計画的にって……",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			expression = 8,
			side = 2,
			bgName = "bg_project_oceana_room2",
			actor = -2,
			actorName = "ナビィ",
			optionFlag = 2,
			dynamicBgType = -2,
			nameColor = "#A9F548FF",
			hidePaintObj = true,
			say = "あー、もういいから、とにかくお小遣いちょうだい！",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		}
	}
}
