return {
	hideRecord = true,
	dialogbox = 2,
	mode = 2,
	id = "DORM3TIMELINE201",
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
							sceneRoot = "Nengdai_DB/Noshirohostel",
							name = "Qihe_mengyanjingxi",
							time = 0,
							type = "timeline",
							skip = false,
							scene = "map_noshirohostel_01",
							options = {
								{
									{
										content = "能代？"
									}
								},
								{
									{
										content = "イタズラする能代も可愛いよ"
									},
									{
										content = "能代は何をしたって可愛いから"
									}
								}
							},
							touchs = {
								{
									{
										pos = {
											0,
											50
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
