return {
	fadeOut = 1.5,
	dialogbox = 2,
	hideRecord = true,
	mode = 2,
	alpha = 0,
	id = "DORM3DTOUCH14020",
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
			say = "どうしたの？私のキスが恋しくなった？",
			voice = "event:/dorm/drom3d_aegir_ik_gfit2_tone1/drom3d_aegir_ik_gfit2_tone1",
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
							name = "bunny_IK_cafe_idle01_fb02",
							time = 0,
							type = "action",
							skip = true
						},
						{
							id = 2017,
							name = "bunny_IK_cafe_idle01_fb02_YZ",
							type = "item_action"
						},
						{
							param = "bunny_IK_cafe_idle01_fb02_GJB",
							name = "furniture/Item/Glasscup_01/pre_db_glasscup_01a",
							time = 0,
							type = "extra_item_action",
							skip = true
						},
						{
							skip = true,
							name = "Face_happy_start",
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
