return {
	fadeOut = 1.5,
	dialogbox = 2,
	hideRecord = true,
	mode = 2,
	alpha = 0,
	id = "DORM3DTOUCH3082",
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
			say = "アンカレッジ……ぽかぽか……！",
			voice = "event:/dorm/drom3d_Anchorage_other/drom3d_Anchorage_ik_gift4_tone4",
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
							name = "ab_TD_bed_idle01_fb02",
							time = 0,
							type = "action",
							skip = true
						},
						{
							id = 2020,
							name = "ab_TD_bed_idle01_fb02_1chuang",
							type = "item_action"
						},
						{
							id = 2021,
							name = "ab_TD_bed_idle01_fb02_2xiong",
							type = "item_action"
						},
						{
							id = 2022,
							name = "ab_TD_bed_idle01_fb02_3caiqiu",
							type = "item_action"
						},
						{
							skip = true,
							name = "Face_kaixin",
							type = "action"
						},
						{
							skip = false,
							time = 3,
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
