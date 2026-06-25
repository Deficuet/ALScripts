return {
	fadeOut = 1.5,
	dialogbox = 2,
	hideRecord = true,
	mode = 2,
	alpha = 0,
	id = "DORM3DTOUCH21021",
	hideSkip = true,
	hideAuto = true,
	placeholder = {
		"dorm3d"
	},
	scripts = {
		{
			side = 2,
			actorName = 79902,
			nameColor = "#FFFFFF",
			hidePaintObj = true,
			dir = 1,
			say = "唔唔，震动好强烈……",
			voice = "event:/dorm/drom3d_nakhimov_ik_furniture1_tone2/drom3d_nakhimov_ik_furniture1_tone2",
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
							name = "IK_desk02_idle01_fb01-1",
							time = 0,
							type = "action",
							skip = true
						},
						{
							skip = true,
							name = "Face_amazed_start",
							type = "action"
						},
						{
							id = 3004,
							name = "IK_desk02_idle01_fb01-1_MFJC",
							type = "item_action"
						},
						{
							id = 3005,
							name = "vfx_desk02_idle01_fb01-1",
							type = "item_action"
						},
						{
							skip = false,
							time = 4,
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
