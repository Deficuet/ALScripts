return {
	hideRecord = true,
	dialogbox = 2,
	mode = 2,
	id = "DORM3TIMELINE3003",
	alpha = 0,
	hideSkip = true,
	hideAuto = true,
	placeholder = {
		"dorm3d"
	},
	scripts = {
		{
			bgm = "Story-room-anchorage",
			stopbgm = true,
			dispatcher = {
				nextOne = true,
				name = STORY_EVENT.TEST,
				data = {
					op_list = {
						{
							sceneRoot = "Ankeleiqi_DB/Anchoragehostel",
							name = "Qihe_zaoanwen",
							scene = "map_anchoragehostel_02",
							type = "timeline",
							skip = false,
							options = {},
							touchs = {
								{
									{
										pos = {
											0,
											100
										}
									}
								},
								{
									{
										pos = {
											0,
											100
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
