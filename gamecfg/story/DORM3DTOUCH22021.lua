return {
	fadeOut = 1.5,
	dialogbox = 2,
	hideRecord = true,
	mode = 2,
	alpha = 0,
	id = "DORM3DTOUCH22021",
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
			say = "这里……还不能碰呢~",
			voice = "event:/dorm/drom3d_implacable_ik_furniture3_tone2/drom3d_implacable_ik_furniture3_tone2",
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
							name = "IK_desk02_idle01_fb02",
							time = 0,
							type = "action",
							skip = true
						},
						{
							id = 4002,
							name = "IK_desk02_idle01_fb02_MYZ",
							type = "item_action"
						},
						{
							id = 4004,
							name = "vfx_IK_desk02_idle01_fb02",
							type = "item_action"
						},
						{
							id = 4006,
							name = "vfx_IK_desk02_idle01_fb02-MYZ",
							type = "item_action"
						},
						{
							skip = true,
							name = "Face_shy_start_long2",
							type = "action"
						},
						{
							skip = false,
							time = 10,
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
