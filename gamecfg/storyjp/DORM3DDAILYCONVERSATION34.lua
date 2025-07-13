return {
	fadeOut = 1.5,
	dialogbox = 2,
	hideRecord = true,
	mode = 2,
	alpha = 0,
	id = "DORM3DDAILYCONVERSATION34",
	hideSkip = true,
	hideAuto = true,
	placeholder = {
		"dorm3d"
	},
	scripts = {
		{
			actor = 0,
			side = 0,
			say = "――少し外に出かけない？",
			hidePaintObj = true
		},
		{
			side = 2,
			actorName = 20220,
			nameColor = "#FFFFFF",
			hidePaintObj = true,
			dir = 1,
			say = "誇らしき{dorm3d}、喜んでお付き合いします！ええと…もしかして少々退屈に感じていらっしゃいますか…？",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			},
			options = {
				{
					content = "――いや、一緒にお出かけしたいだけだ",
					flag = 1
				},
				{
					content = "――どこか遊びに出かけたいだけだ",
					flag = 2
				}
			},
			dispatcher = {
				name = STORY_EVENT.TEST,
				data = {
					op_list = {
						{
							param = "Play",
							name = "dianshouzhi",
							time = 0,
							type = "action",
							skip = true
						},
						{
							skip = false,
							time = 1,
							type = "wait"
						}
					}
				},
				callbackData = {
					hideUI = false,
					name = STORY_EVENT.TEST_DONE
				}
			}
		},
		{
			side = 2,
			actorName = 20220,
			nameColor = "#FFFFFF",
			hidePaintObj = true,
			dir = 1,
			say = "では{dorm3d}のご所望は……で、デート？！分かりました。{dorm3d}が完全に満足されるまで精一杯ご奉仕いたします❤",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		}
	}
}
