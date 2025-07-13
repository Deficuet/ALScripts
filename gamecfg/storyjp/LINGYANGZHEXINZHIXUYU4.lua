return {
	fadeOut = 1.5,
	mode = 2,
	defaultTb = 2200,
	id = "LINGYANGZHEXINZHIXUYU4",
	placeholder = {
		"tb"
	},
	scripts = {
		{
			expression = 5,
			side = 2,
			bgName = "bg_project_oceana_room2",
			actor = -2,
			actorName = "ナビィ",
			bgm = "qe-ova-4",
			dynamicBgType = -2,
			nameColor = "#A9F548FF",
			hidePaintObj = true,
			say = "ああ……めんどくさいなぁ",
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
			expression = 3,
			side = 2,
			bgName = "bg_project_oceana_room2",
			actor = -2,
			actorName = "ナビィ",
			dynamicBgType = -2,
			nameColor = "#A9F548FF",
			important = true,
			hidePaintObj = true,
			say = "部屋の片付けをサボっちゃダメ？",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			},
			options = {
				{
					flag = 1,
					content = "一緒にやろうよ",
					type = 1
				},
				{
					flag = 2,
					content = "今日は休んでもいいよ",
					type = 2
				}
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
			say = "なにそれ、ポンコツ{tb}のくせに隣で口出しするつもり？",
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
			say = "――そのほうが早く終わるだろう？",
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
			say = "……ふんっ！分かったわよ…別に{tb}が一緒にいるからとかじゃないんだからね！",
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
			say = "ふふん、ポンコツ{tb}もたまには話が分かるじゃない",
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
			say = "――でも明日はちゃんと片付けるんだぞ",
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
			say = "ふふーん、明日のことは明日考えるの～。どうせ{tb}はあたしを止められないんだから！",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		}
	}
}
