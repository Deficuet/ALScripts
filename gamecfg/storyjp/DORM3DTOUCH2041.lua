return {
	hideRecord = true,
	dialogbox = 2,
	mode = 2,
	id = "DORM3DTOUCH2041",
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
			say = "あなたの前だと……少し色々試してみたくなりますね",
			voice = "event:/dorm/Tianlangxing_dorm3d_tone1/drom3d_Noshiro_ik_furniture3_tone1",
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
							name = "ND_TD_beilu_dafu_01-start",
							time = 0,
							type = "action",
							skip = true
						},
						{
							id = 2002,
							name = "ND_TD_beilu_dafu_01_item-start",
							type = "item_action"
						},
						{
							param = "Play",
							name = "Face_weixiao",
							time = 0,
							type = "action",
							skip = true
						},
						{
							skip = false,
							time = 2.5,
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
