return {
	hideRecord = true,
	dialogbox = 2,
	mode = 2,
	id = "DORM3TIMELINE12001",
	alpha = 0,
	hideSkip = true,
	hideAuto = true,
	placeholder = {
		"dorm3d"
	},
	scripts = {
		{
			bgm = "story-room-taiho",
			stopbgm = true,
			dispatcher = {
				nextOne = true,
				name = STORY_EVENT.TEST,
				data = {
					op_list = {
						{
							sceneRoot = "Dafeng_DB/Dafenghostel",
							name = "Qihe_01",
							scene = "map_dafeng_01",
							type = "timeline",
							skip = false,
							options = {
								{
									{
										content = "{namecode:97}？门锁怎么了？"
									}
								}
							},
							touchs = {
								{
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
