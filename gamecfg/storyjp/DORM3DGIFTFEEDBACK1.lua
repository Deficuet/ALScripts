return {
	hideRecord = true,
	dialogbox = 2,
	mode = 2,
	id = "DORM3DGIFTFEEDBACK1",
	alpha = 0,
	hideSkip = true,
	hideAuto = true,
	placeholder = {
		"dorm3d"
	},
	scripts = {
		{
			say = "このティーセットをシリアスに…？シリアス、恐縮千万でございます…気前よきご主人様{dorm3d}",
			actorName = 20220,
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
							name = "jidong",
							type = "action"
						},
						{
							skip = true,
							name = "Face_gaoxing",
							type = "action"
						},
						{
							skip = false,
							time = 2,
							type = "wait"
						}
					}
				},
				callbackData = {
					hideUI = false,
					name = STORY_EVENT.TEST_DONE
				}
			}
		},
		{
			say = "大事に使わせていただきます！シリアス、美味しい紅茶でご奉仕できよう精進いたします！",
			actorName = 20220,
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		}
	}
}
