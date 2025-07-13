return {
	hideRecord = true,
	dialogbox = 2,
	mode = 2,
	id = "DORM3DGIFTFEEDBACK205",
	alpha = 0,
	hideSkip = true,
	hideAuto = true,
	placeholder = {
		"dorm3d"
	},
	scripts = {
		{
			actorName = 30221,
			nameColor = "#FFFFFF",
			say = "ふふ、これを贈ってくれるなんて、きっとじっくり考えて選んでくれたのね？",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			},
			dispatcher = {
				name = STORY_EVENT.TEST,
				data = {
					op_list = {
						{
							skip = true,
							name = "shuohua_gandong",
							type = "action"
						},
						{
							skip = true,
							name = "Face_kaixing",
							type = "action"
						},
						{
							skip = false,
							time = 2,
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
			actorName = 30221,
			nameColor = "#FFFFFF",
			say = "でも私にばかり気を使ってはダメよ。{dorm3d}こそ、休息と仕事のバランスを取るように気をつけてくださいね？",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		}
	}
}
