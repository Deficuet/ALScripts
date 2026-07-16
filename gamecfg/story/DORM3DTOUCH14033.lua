return {
	fadeOut = 1.5,
	dialogbox = 2,
	hideRecord = true,
	mode = 2,
	alpha = 0,
	id = "DORM3DTOUCH14033",
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
			say = "继续下去的话……你猜谁会先撑不住呢？",
			voice = "event:/dorm/drom3d_aegir_ik_gfit3_tone1/drom3d_aegir_ik_gfit3_tone1",
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
							name = "IK_living02_idle01_fb02",
							time = 0,
							type = "action",
							skip = true
						},
						{
							id = 2024,
							name = "IK_living02_idle01_fb02_SF",
							type = "item_action"
						},
						{
							param = "IK_living02_idle01_fb02_shu",
							name = "furniture/Item/Book_01/pre_db_book_01_IK600610",
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
