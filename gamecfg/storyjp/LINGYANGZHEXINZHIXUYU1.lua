return {
	fadeOut = 1.5,
	mode = 2,
	defaultTb = 2200,
	id = "LINGYANGZHEXINZHIXUYU1",
	placeholder = {
		"tb"
	},
	scripts = {
		{
			expression = 6,
			side = 2,
			bgName = "bg_project_oceana_room3",
			actor = -2,
			actorName = "ナビィ",
			bgm = "qe-ova-4",
			dynamicBgType = -2,
			nameColor = "#A9F548FF",
			hidePaintObj = true,
			say = "{tb}は最近ちょっと頑張ってるみたいだから、特製フルーツジュースを作ってやったよ♪",
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
			bgName = "bg_project_oceana_room3",
			actor = -2,
			actorName = "ナビィ",
			dynamicBgType = -2,
			nameColor = "#A9F548FF",
			hidePaintObj = true,
			say = "見た目はちょっと変かもしれないけど……味は絶対おいしいから！",
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
			dynamicBgType = -2,
			nameColor = "#A9F548FF",
			hidePaintObj = true,
			say = "だってあたしのオリジナルレシピなんだもん♪",
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
			dynamicBgType = -2,
			nameColor = "#A9F548FF",
			important = true,
			hidePaintObj = true,
			say = "飲んでみて？一生忘れられない味だって保証するよ～",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			},
			options = {
				{
					flag = 1,
					content = "普通のジュースでいいかな",
					type = 1
				},
				{
					flag = 2,
					content = "ちょうど喉が渇いてたし、全部飲むよ！",
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
			say = "ええっ……{tb}ってほんとつまんない",
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
			say = "あら～、今日は面白いことになりそうね♪",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		}
	}
}
