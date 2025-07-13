return {
	fadeOut = 1.5,
	dialogbox = 2,
	hideRecord = true,
	mode = 2,
	alpha = 0,
	id = "DORM3DTOUCH3050",
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
			say = "ここ……ヘン？うん……？ヘンじゃない？アンカレッジ、わかんない……！",
			voice = "event:/dorm/drom3d_Anchorage_other/drom3d_Anchorage_ik_gift5_tone1",
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
							name = "ab_IK_swim_2_xiong_01",
							time = 0,
							type = "action",
							skip = true
						},
						{
							id = 2004,
							name = "ab_IK_swim_2_xiong_01_HJ",
							type = "item_action"
						},
						{
							skip = true,
							name = "Face_kaixin",
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
