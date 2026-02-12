return {
	fadeOut = 1.5,
	dialogbox = 2,
	hideRecord = true,
	mode = 2,
	alpha = 0,
	id = "DORM3DTOUCH3075",
	hideSkip = true,
	hideAuto = true,
	placeholder = {
		"dorm3d"
	},
	scripts = {
		{
			side = 2,
			actorName = 19903,
			nameColor = "#FFFFFF",
			hidePaintObj = true,
			dir = 1,
			say = "老师，看……安克雷奇！",
			voice = "event:/dorm/drom3d_Anchorage_other/drom3d_Anchorage_ik_furniture3_tone6",
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
							name = "ab_FF_shafa_idle01_fb03",
							time = 0,
							type = "action",
							skip = true
						},
						{
							id = 2012,
							name = "ab_FF_shafa_idle01_fb03_SF",
							type = "item_action"
						},
						{
							param = "ab_FF_shafa_idle01_fb03_M",
							name = "furniture/Item/Aklq_Drink01/pre_db_aklq_drink01",
							time = 0,
							type = "extra_item_action",
							skip = true
						},
						{
							skip = true,
							name = "Face_weixiao",
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
