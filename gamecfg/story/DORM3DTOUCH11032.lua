return {
	fadeOut = 1.5,
	dialogbox = 2,
	hideRecord = true,
	mode = 2,
	alpha = 0,
	id = "DORM3DTOUCH11032",
	hideSkip = true,
	hideAuto = true,
	placeholder = {
		"dorm3d"
	},
	scripts = {
		{
			side = 2,
			actorName = 10517,
			nameColor = "#FFFFFF",
			hidePaintObj = true,
			dir = 1,
			say = "呼……要稍微冷静一下才行……///",
			voice = "event:/dorm/drom3d_NewJersey_other/drom3d_NewJersey_ik_gfit3_tone6",
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
							param = "Play",
							name = "face_happy_start",
							time = 0,
							type = "action",
							skip = true
						},
						{
							id = 2010,
							name = "IK_sp01_idle02_fb02_DC",
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
