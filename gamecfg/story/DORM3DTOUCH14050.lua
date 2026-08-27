return {
	fadeOut = 1.5,
	dialogbox = 2,
	hideRecord = true,
	mode = 2,
	alpha = 0,
	id = "DORM3DTOUCH14050",
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
			say = "现在才想到要讨好我？晚了~",
			voice = "event:/dorm/drom3d_aegir_ik_gfit2_tone6/drom3d_aegir_ik_gfit2_tone6",
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
							name = "IK_sp01_idle03_fb02-end",
							time = 0,
							type = "action",
							skip = true
						},
						{
							id = 2027,
							name = "IK_sp01_idle03_fb02_YG-end",
							type = "item_action"
						},
						{
							id = 2028,
							name = "IK_sp01_idle03_vfx",
							type = "item_action"
						},
						{
							param = "IK_sp01_idle03_fb02_item-end",
							name = "furniture/Item/Aje_Cup_01/pre_db_aje_cup_02",
							time = 0,
							type = "extra_item_action",
							skip = true
						},
						{
							skip = true,
							name = "Face_shame_start",
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
