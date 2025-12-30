return {
	hideRecord = true,
	dialogbox = 2,
	mode = 2,
	alpha = 0,
	id = "DORM3DPAIDGIFTFEEDBACK2",
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
							name = "FFliwu_cadiban",
							time = 0,
							type = "timeline",
							skip = false,
							scene = "map_siriushostel_01",
							options = {},
							touchs = {
								[0] = {
									{
										pos = {
											0,
											-350
										}
									}
								},
								{
									{
										pos = {
											150,
											-50
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
