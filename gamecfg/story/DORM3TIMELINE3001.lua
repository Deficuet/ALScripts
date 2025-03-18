return {
	hideRecord = true,
	dialogbox = 2,
	mode = 2,
	id = "DORM3TIMELINE3001",
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
							name = "Qihe_yiqiwan",
							scene = "map_anchoragehostel_02",
							type = "timeline",
							skip = false,
							options = {
								{
									{
										content = "想好要画什么了？"
									}
								},
								{
									{
										content = "没关系，我来收拾"
									},
									{
										content = "安克雷奇不用担心"
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
