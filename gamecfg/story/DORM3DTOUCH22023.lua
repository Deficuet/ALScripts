return {
	fadeOut = 1.5,
	dialogbox = 2,
	hideRecord = true,
	mode = 2,
	alpha = 0,
	id = "DORM3DTOUCH22023",
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
			say = "呀……弄洒了呢……真是的~",
			voice = "event:/dorm/drom3d_implacable_ik_furniture3_tone4/drom3d_implacable_ik_furniture3_tone4",
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
							name = "IK_desk02_idle02_fb01",
							time = 0,
							type = "action",
							skip = true
						},
						{
							id = 4002,
							name = "IK_desk02_idle02_fb01_MYZ",
							type = "item_action"
						},
						{
							id = 4005,
							name = "vfx_desk02_idle02_fb01-MYZ_shuizi",
							type = "item_action"
						},
						{
							id = 4007,
							name = "vfx_desk02_idle02_fb01-MYZ",
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
