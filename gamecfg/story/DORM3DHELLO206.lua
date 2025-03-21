return {
	hideRecord = true,
	dialogbox = 2,
	mode = 2,
	id = "DORM3DHELLO206",
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
			say = "嗯……感觉最近{dorm3d}做事越来越有条理了呢，也许……会是我帮上忙了吗？如果有什么工作方面的事需要帮忙，也可以不用客气地告诉我哦。",
			voice = "event:/dorm/drom3d_noshiro_other/drom3d_Noshiro_hello6",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			},
			dispatcher = {
				name = STORY_EVENT.TEST,
				data = {
					op_list = {
						{
							skip = true,
							name = "shuohua_wenhou",
							type = "action"
						},
						{
							skip = true,
							name = "Face_weixiao",
							type = "action"
						},
						{
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
