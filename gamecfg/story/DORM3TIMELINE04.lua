return {
	hideRecord = true,
	dialogbox = 2,
	mode = 2,
	alpha = 0,
	id = "DORM3TIMELINE04",
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
							skip = false,
							name = "Qihe_chakanqinkuang",
							time = 0,
							type = "timeline",
							options = {
								{
									{
										content = "Let me see if you burnt yourself."
									}
								}
							},
							touchs = {
								[2] = {
									{
										pos = {
											0,
											0
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
