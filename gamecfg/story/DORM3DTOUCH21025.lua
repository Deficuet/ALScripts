return {
	fadeOut = 1.5,
	dialogbox = 2,
	hideRecord = true,
	mode = 2,
	alpha = 0,
	id = "DORM3DTOUCH21025",
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
			say = "指挥官……我卡在这里动不了了，能拉我出去吗？",
			voice = "event:/dorm/drom3d_nakhimov_ik_furniture1_tone7/drom3d_nakhimov_ik_furniture1_tone7",
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
							name = "IK_desk02_idle02_fb01-3",
							time = 0,
							type = "action",
							skip = true
						},
						{
							id = 3004,
							name = "IK_desk02_idle02_fb01-3_MFJC",
							type = "item_action"
						},
						{
							id = 3005,
							name = "vfx_desk02_idle02_fb01-3",
							type = "item_action"
						},
						{
							skip = true,
							name = "Face_amazed_start",
							type = "action"
						},
						{
							skip = false,
							time = 13.4,
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
