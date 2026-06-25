return {
	fadeOut = 1.5,
	dialogbox = 2,
	hideRecord = true,
	mode = 2,
	alpha = 0,
	id = "DORM3DTOUCH21022",
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
			say = "欸，红灯警报，这是出什么故障了……",
			voice = "event:/dorm/drom3d_nakhimov_ik_furniture1_tone5/drom3d_nakhimov_ik_furniture1_tone5",
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
							name = "IK_desk02_idle01_fb01-2",
							time = 0,
							type = "action",
							skip = true
						},
						{
							id = 3004,
							name = "IK_desk02_idle01_fb01-2_MFJC",
							type = "item_action"
						},
						{
							id = 3005,
							name = "vfx_desk02_idle01_fb01_2",
							type = "item_action"
						},
						{
							skip = true,
							name = "Face_amazed_start",
							type = "action"
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
