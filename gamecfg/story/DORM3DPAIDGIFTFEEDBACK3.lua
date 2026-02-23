return {
	hideRecord = true,
	dialogbox = 2,
	mode = 2,
	id = "DORM3DPAIDGIFTFEEDBACK3",
	alpha = 0,
	hideSkip = true,
	hideAuto = true,
	placeholder = {
		"dorm3d"
	},
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
							name = "FFliwu_20220_03",
							scene = "map_siriushostel_01",
							type = "timeline",
							skip = false,
							options = {
								[2] = {
									{
										content = "They all feel pretty nice. You went to bed early last night, didn't you?"
									}
								}
							},
							touchs = {
								{
									{
										pos = {
											-50,
											-250
										}
									}
								}
							}
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
