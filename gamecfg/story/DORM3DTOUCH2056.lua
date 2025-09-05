return {
	hideRecord = true,
	dialogbox = 2,
	mode = 2,
	id = "DORM3DTOUCH2056",
	alpha = 0,
	hideSkip = true,
	hideAuto = true,
	placeholder = {
		"dorm3d"
	},
	scripts = {
		{
			side = 2,
			actorName = 30221,
			nameColor = "#FFFFFF",
			hidePaintObj = true,
			dir = 1,
			say = "There's something unique about this atmosphere... {dorm3d}...",
			voice = "event:/dorm/drom3d_noshiro_other/drom3d_Noshiro_ik_furniture2_tone5",
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
							name = "FF_IK_shafa_idle01_fb02",
							time = 0,
							type = "action",
							skip = true
						},
						{
							param = "Play",
							name = "Face_kaixing",
							time = 0,
							type = "action",
							skip = true
						},
						{
							id = 2008,
							name = "FF_IK_shafa_idle01_fb02_SF",
							type = "item_action"
						},
						{
							id = 2009,
							name = "FF_IK_shafa_idle01_fb02_SF_VFX",
							type = "item_action"
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
