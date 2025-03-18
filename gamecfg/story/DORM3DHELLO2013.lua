return {
	hideRecord = true,
	dialogbox = 2,
	mode = 2,
	id = "DORM3DHELLO2013",
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
			say = "工作的时候感到疲惫的话，一定要及时休息呢。当然，也可以像现在这样，随时来找我哦？至少让我帮你放松一下，养精蓄锐。",
			voice = "event:/dorm/drom3d_noshiro_other/drom3d_Noshiro_hello13",
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
