return {
	hideRecord = true,
	dialogbox = 2,
	mode = 2,
	id = "DORM3DHELLO13",
	alpha = 0,
	hideSkip = true,
	hideAuto = true,
	placeholder = {
		"dorm3d"
	},
	scripts = {
		{
			nameColor = "#FFFFFF",
			actorName = 20220,
			say = "我骄傲的{dorm3d}，能够侍奉您、陪伴在您身边，对天狼星而言是至高无上的幸福。您的每一个动作都牵动着天狼星的内心……",
			voice = "event:/dorm/Tianlangxing_dorm3d_tone1/drom3d_sirus_hello13",
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
							name = "Bow",
							type = "action"
						},
						{
							param = "Play",
							name = "Face_weixiao",
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
		}
	}
}
