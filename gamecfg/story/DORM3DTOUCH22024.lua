return {
	fadeOut = 1.5,
	dialogbox = 2,
	hideRecord = true,
	mode = 2,
	alpha = 0,
	id = "DORM3DTOUCH22024",
	hideSkip = true,
	hideAuto = true,
	placeholder = {
		"dorm3d"
	},
	scripts = {
		{
			side = 2,
			actorName = 20707,
			nameColor = "#FFFFFF",
			hidePaintObj = true,
			dir = 1,
			say = "让我看看……你能做到什么程度吧~",
			voice = "event:/dorm/drom3d_implacable_ik_furniture3_tone8/drom3d_implacable_ik_furniture3_tone8",
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
							name = "IK_desk02_idle02_fb02",
							time = 0,
							type = "action",
							skip = true
						},
						{
							id = 4002,
							name = "IK_desk02_idle02_fb02_MYZ",
							type = "item_action"
						},
						{
							skip = true,
							name = "Face_shy_start_long2",
							type = "action"
						},
						{
							skip = false,
							time = 15,
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
