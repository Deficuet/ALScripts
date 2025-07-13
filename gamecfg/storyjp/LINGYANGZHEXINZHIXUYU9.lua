return {
	fadeOut = 1.5,
	mode = 2,
	defaultTb = 2100,
	id = "LINGYANGZHEXINZHIXUYU9",
	placeholder = {
		"tb"
	},
	scripts = {
		{
			actor = -2,
			side = 2,
			bgName = "bg_project_oceana_room3",
			actorName = "ナビィ",
			bgm = "qe-ova-3",
			dynamicBgType = -2,
			nameColor = "#A9F548FF",
			hidePaintObj = true,
			say = "今日ね、ペーパークラフトの作り方を見てたんだ。試してみたいな～",
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
			bgName = "bg_project_oceana_room3",
			actor = -2,
			actorName = "ナビィ",
			dynamicBgType = -2,
			nameColor = "#A9F548FF",
			important = true,
			hidePaintObj = true,
			say = "んーでも、ちょっと複雑そうで……",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			},
			options = {
				{
					flag = 1,
					content = "作り方を見ながらゆっくり作ろ？",
					type = 1
				},
				{
					flag = 2,
					content = "自分で新しいのを考えてみるのはどう？",
					type = 2
				}
			}
		},
		{
			actor = -2,
			side = 2,
			bgName = "bg_project_oceana_room3",
			actorName = "ナビィ",
			optionFlag = 1,
			dynamicBgType = -2,
			nameColor = "#A9F548FF",
			hidePaintObj = true,
			say = "うん、手順通りにやればきっと大丈夫だよね！",
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
			optionFlag = 1,
			dynamicBgType = -2,
			nameColor = "#A9F548FF",
			hidePaintObj = true,
			say = "しかも{tb}が一緒にやってくれるなら、心強いよ～",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			expression = 6,
			side = 2,
			bgName = "bg_project_oceana_room3",
			actor = -2,
			actorName = "ナビィ",
			optionFlag = 2,
			dynamicBgType = -2,
			nameColor = "#A9F548FF",
			hidePaintObj = true,
			say = "自分で新しいのを考える……悪くないかも！",
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
			say = "{tb}のために特別なペーパークラフトが作れるかも。なんだかワクワクしてきた～！",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		}
	}
}
