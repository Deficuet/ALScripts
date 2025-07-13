return {
	fadeOut = 1.5,
	mode = 2,
	defaultTb = 2001,
	id = "LINGYANGZHEXINZHIXUYU2",
	placeholder = {
		"tb"
	},
	scripts = {
		{
			actor = -2,
			side = 2,
			bgName = "bg_project_oceana_room3",
			actorName = "ナビィ",
			bgm = "qe-ova-4",
			dynamicBgType = -2,
			nameColor = "#A9F548FF",
			hidePaintObj = true,
			say = "天気予報で明日は晴れるって言ってたから、今夜の星空はすごく綺麗に見えるはずだよ～",
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
			bgName = "bg_project_oceana_room3",
			actor = -2,
			actorName = "ナビィ",
			dynamicBgType = -2,
			nameColor = "#A9F548FF",
			important = true,
			hidePaintObj = true,
			say = "ねえ、{tb}、屋上で星を一緒に見ようよ～？",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			},
			options = {
				{
					flag = 1,
					content = "安全な場所で星を見よう",
					type = 1
				},
				{
					flag = 2,
					content = "いい場所を知ってるよ",
					type = 2
				}
			}
		},
		{
			expression = 4,
			side = 2,
			bgName = "bg_project_oceana_room3",
			actor = -2,
			actorName = "ナビィ",
			optionFlag = 1,
			dynamicBgType = -2,
			nameColor = "#A9F548FF",
			hidePaintObj = true,
			say = "わぁ、びびり！全然冒険心がないんだ……",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			actor = 0,
			side = 2,
			bgName = "bg_project_oceana_room3",
			hidePaintObj = true,
			nameColor = "#A9F548FF",
			optionFlag = 1,
			dynamicBgType = -2,
			say = "――ベランダからでもたくさん星は見えるよ？",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			expression = 4,
			side = 2,
			bgName = "bg_project_oceana_room3",
			actor = -2,
			actorName = "ナビィ",
			optionFlag = 1,
			dynamicBgType = -2,
			nameColor = "#A9F548FF",
			hidePaintObj = true,
			say = "ふん！ほんっとにつまらないポンコツなんだから！",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			expression = 7,
			side = 2,
			bgName = "bg_project_oceana_room3",
			actor = -2,
			actorName = "ナビィ",
			optionFlag = 2,
			dynamicBgType = -2,
			nameColor = "#A9F548FF",
			hidePaintObj = true,
			say = "おお～？意外とポンコツ{tb}にも冒険心があるのね～",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			expression = 8,
			side = 2,
			bgName = "bg_project_oceana_room3",
			actor = -2,
			actorName = "ナビィ",
			optionFlag = 2,
			dynamicBgType = -2,
			nameColor = "#A9F548FF",
			hidePaintObj = true,
			say = "それじゃあ、任せたよ～♪",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		}
	}
}
