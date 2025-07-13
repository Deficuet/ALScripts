return {
	fadeOut = 1.5,
	mode = 2,
	defaultTb = 2002,
	id = "LINGYANGZHEXINZHIXUYU6",
	placeholder = {
		"tb"
	},
	scripts = {
		{
			expression = 3,
			side = 2,
			bgName = "bg_project_oceana_room2",
			actor = -2,
			actorName = "ナビィ",
			bgm = "qe-ova-3",
			dynamicBgType = -2,
			nameColor = "#A9F548FF",
			hidePaintObj = true,
			say = "クローゼットの中がごちゃごちゃ……",
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
			bgName = "bg_project_oceana_room2",
			actor = -2,
			actorName = "ナビィ",
			dynamicBgType = -2,
			nameColor = "#A9F548FF",
			hidePaintObj = true,
			say = "自分で整理しようにも、どこから手を付ければいいか分からないよ……",
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
			say = "{tb}はどうすればいいと思う？",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			},
			options = {
				{
					flag = 1,
					content = "種類ごとに分けて整理してみたら？",
					type = 1
				},
				{
					flag = 2,
					content = "適当に突っ込んでおけばいいんじゃない？",
					type = 2
				}
			}
		},
		{
			actor = -2,
			side = 2,
			bgName = "bg_project_oceana_room2",
			actorName = "ナビィ",
			optionFlag = 1,
			dynamicBgType = -2,
			nameColor = "#A9F548FF",
			hidePaintObj = true,
			say = "そうよね。その方が後で探すときに楽になるし……",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			expression = 6,
			side = 2,
			bgName = "bg_project_oceana_room2",
			actor = -2,
			actorName = "ナビィ",
			optionFlag = 1,
			dynamicBgType = -2,
			nameColor = "#A9F548FF",
			hidePaintObj = true,
			say = "頑張って慣れて、{tb}に心配をかけないようにしないと",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			actor = -2,
			side = 2,
			bgName = "bg_project_oceana_room2",
			actorName = "ナビィ",
			optionFlag = 2,
			dynamicBgType = -2,
			nameColor = "#A9F548FF",
			hidePaintObj = true,
			say = "{tb}がそう言うなら……なんだか気が楽になった♪",
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
			say = "次に服を探す時、ちょっとしたお宝探しみたいになりそうだね！",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		}
	}
}
