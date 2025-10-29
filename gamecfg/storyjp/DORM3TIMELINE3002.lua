return {
	hideRecord = true,
	dialogbox = 2,
	mode = 2,
	id = "DORM3TIMELINE3002",
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
							name = "Qihe_zhuomicang",
							scene = "map_anchoragehostel_01",
							type = "timeline",
							skip = false,
							options = {
								{
									{
										content = "アンカレッジ？"
									}
								}
							},
							touchs = {
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
