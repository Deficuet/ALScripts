return {
	hideRecord = true,
	dialogbox = 2,
	mode = 2,
	id = "DORM3DGIFTFEEDBACK1104",
	alpha = 0,
	hideSkip = true,
	hideAuto = true,
	placeholder = {
		"dorm3d"
	},
	scripts = {
		{
			actorName = 10517,
			nameColor = "#FFFFFF",
			say = "ワオ！あたしの大好きなシュワシュワフルーツキャンディじゃない！",
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
							name = "happy_01-start",
							type = "action"
						},
						{
							skip = true,
							name = "face_happy_start",
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
			actorName = 10517,
			nameColor = "#FFFFFF",
			say = "わざわざ選んでくれたの？パッケージまで可愛い！サンキュー！",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		}
	}
}
