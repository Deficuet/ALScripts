return {
	fadeOut = 1.5,
	dialogbox = 2,
	hideRecord = true,
	mode = 2,
	alpha = 0,
	id = "DORM3DTOUCH14015",
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
			say = "要是继续下去的话，今晚就别想睡了哦？",
			voice = "event:/dorm/drom3d_aegir_ik_furniture2_tone6/drom3d_aegir_ik_furniture2_tone6",
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
							name = "IK_bed02_idle01_fb02",
							time = 0,
							type = "action",
							skip = true
						},
						{
							id = 2016,
							name = "IK_bed02_idle01_fb02_C",
							type = "item_action"
						},
						{
							skip = true,
							name = "Face_smile_start",
							type = "action"
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
