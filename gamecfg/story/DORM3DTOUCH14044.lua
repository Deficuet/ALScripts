return {
	fadeOut = 1.5,
	dialogbox = 2,
	hideRecord = true,
	mode = 2,
	alpha = 0,
	id = "DORM3DTOUCH14044",
	hideSkip = true,
	hideAuto = true,
	placeholder = {
		"dorm3d"
	},
	scripts = {
		{
			side = 2,
			actorName = 49905,
			nameColor = "#FFFFFF",
			hidePaintObj = true,
			dir = 1,
			say = "呵呵，看来你也逐渐熟练起来了呢？",
			voice = "event:/dorm/drom3d_aegir_ik_gfit4_tone5/drom3d_aegir_ik_gfit4_tone5",
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
							name = "IK_sp01_idle02_fb02",
							time = 0,
							type = "action",
							skip = true
						},
						{
							param = "IK_sp01_idle02_fb02_item",
							name = "furniture/Item/Aje_Cup_01/pre_db_aje_cup_02",
							time = 0,
							type = "extra_item_action",
							skip = true
						},
						{
							skip = true,
							name = "Face_shy_start 0",
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
		}
	}
}
