return {
	hideRecord = true,
	dialogbox = 2,
	mode = 2,
	id = "DORM3TIMELINE12005",
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
							name = "FFliwu_30707_02",
							scene = "map_dafeng_01",
							type = "timeline",
							skip = false,
							options = {},
							touchs = {
								{
									{
										pos = {
											-50,
											150
										}
									}
								},
								{
									{
										pos = {
											0,
											50
										}
									}
								},
								{
									{
										pos = {
											0,
											40
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
