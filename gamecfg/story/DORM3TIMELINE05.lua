return {
	hideRecord = true,
	dialogbox = 2,
	mode = 2,
	alpha = 0,
	id = "DORM3TIMELINE05",
	hideSkip = true,
	hideAuto = true,
	scripts = {
		{
			bgm = "theme-room-rosy",
			stopbgm = true,
			dispatcher = {
				nextOne = true,
				name = STORY_EVENT.TEST,
				data = {
					op_list = {
						{
							name = "Qihe_gongwuyiqu",
							time = 0,
							type = "timeline",
							options = {
								{
									{
										content = "Invite Sirius to a dance"
									}
								}
							},
							touchs = {}
						},
						skip = false
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
