return {
	fadeOut = 1.5,
	dialogbox = 2,
	hideRecord = true,
	mode = 2,
	alpha = 0,
	id = "DORM3DHELLO12001",
	hideSkip = true,
	hideAuto = true,
	placeholder = {
		"dorm3d"
	},
	scripts = {
		{
			side = 2,
			actorName = 30707,
			nameColor = "#FFFFFF",
			hidePaintObj = true,
			dir = 1,
			say = "您来看{namecode:97}，{namecode:97}每次都很开心，可是一想到您终究会离开，{namecode:97}又觉得很舍不得……所以这次来，可以不走了吗？让{namecode:97}陪你做什么事都可以！",
			voice = "event:/dorm/drom3d_Taiho_hello15/drom3d_Taiho_hello15",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			},
			dispatcher = {
				name = STORY_EVENT.TEST,
				data = {
					op_list = {
						{
							param = "Play",
							name = "hello_01-start",
							time = 0,
							type = "action",
							skip = true
						},
						{
							skip = true,
							name = "Face_happy_start",
							type = "action"
						},
						{
							skip = false,
							time = 1.5,
							type = "wait"
						}
					}
				},
				callbackData = {
					hideUI = false,
					name = STORY_EVENT.TEST_DONE
				}
			}
		}
	}
}
