return {
	fadeOut = 1.5,
	mode = 2,
	defaultTb = 2002,
	id = "LINGYANGZHEXINZHIXUYU5",
	placeholder = {
		"tb"
	},
	scripts = {
		{
			actor = -2,
			side = 2,
			bgName = "bg_project_oceana_room1",
			actorName = "ナビィ",
			bgm = "qe-ova-4",
			dynamicBgType = -2,
			nameColor = "#A9F548FF",
			hidePaintObj = true,
			say = "ちょっと、{tb}～",
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
			expression = 6,
			side = 2,
			bgName = "bg_project_oceana_room1",
			actor = -2,
			actorName = "ナビィ",
			dynamicBgType = -2,
			nameColor = "#A9F548FF",
			hidePaintObj = true,
			say = "冷蔵庫にまだイチゴのケーキが残ってるでしょ……？",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			expression = 8,
			side = 2,
			bgName = "bg_project_oceana_room1",
			actor = -2,
			actorName = "ナビィ",
			dynamicBgType = -2,
			nameColor = "#A9F548FF",
			important = true,
			hidePaintObj = true,
			say = "あれ、どうせあたしが食べるんだし、今食べても問題ないよね？えへへ～",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			},
			options = {
				{
					flag = 1,
					content = "まだおやつの時間じゃないよ",
					type = 1
				},
				{
					flag = 2,
					content = "一緒に食べよう！",
					type = 2
				}
			}
		},
		{
			expression = 4,
			side = 2,
			bgName = "bg_project_oceana_room1",
			actor = -2,
			actorName = "ナビィ",
			optionFlag = 1,
			dynamicBgType = -2,
			nameColor = "#A9F548FF",
			hidePaintObj = true,
			say = "ちぇっ、ケチ！",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			actor = 0,
			side = 2,
			bgName = "bg_project_oceana_room1",
			hidePaintObj = true,
			nameColor = "#A9F548FF",
			optionFlag = 1,
			dynamicBgType = -2,
			say = "――甘いものを食べすぎると歯に良くないから我慢だ",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			expression = 4,
			side = 2,
			bgName = "bg_project_oceana_room1",
			actor = -2,
			actorName = "ナビィ",
			optionFlag = 1,
			dynamicBgType = -2,
			nameColor = "#A9F548FF",
			hidePaintObj = true,
			say = "もう、{tb}ったら全然乙女心が分かってないんだから！",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			expression = 7,
			side = 2,
			bgName = "bg_project_oceana_room1",
			actor = -2,
			actorName = "ナビィ",
			optionFlag = 2,
			dynamicBgType = -2,
			nameColor = "#A9F548FF",
			hidePaintObj = true,
			say = "へえ～、意外な反応ね～",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			actor = 0,
			side = 2,
			bgName = "bg_project_oceana_room1",
			hidePaintObj = true,
			nameColor = "#A9F548FF",
			optionFlag = 2,
			dynamicBgType = -2,
			say = "――たまには好きなだけ食べてもいいさ",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			expression = 8,
			side = 2,
			bgName = "bg_project_oceana_room1",
			actor = -2,
			actorName = "ナビィ",
			optionFlag = 2,
			dynamicBgType = -2,
			nameColor = "#A9F548FF",
			hidePaintObj = true,
			say = "ふふん、{tb}も食いしん坊なのね♪",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		}
	}
}
