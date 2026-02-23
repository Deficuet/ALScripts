return {
	hideRecord = true,
	dialogbox = 2,
	mode = 2,
	alpha = 0,
	id = "DORM3DPAIDGIFTFEEDBACK1",
	hideSkip = true,
	hideAuto = true,
	scripts = {
		{
			bgm = "story-room-sirius",
			stopbgm = true,
			dispatcher = {
				nextOne = true,
				name = STORY_EVENT.TEST,
				data = {
					op_list = {
						{
							sceneRoot = "Tianlangxing_DB/SiriusHostel",
							name = "FFliwu_chahuaping",
							time = 0,
							type = "timeline",
							scene = "map_siriushostel_01"
						}
					}
				},
				callbackData = {
					hideUI = true,
					name = STORY_EVENT.TEST_DONE
				}
			}
		}
	}
}
