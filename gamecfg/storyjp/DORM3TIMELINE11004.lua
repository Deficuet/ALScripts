return {
	hideRecord = true,
	dialogbox = 2,
	mode = 2,
	id = "DORM3TIMELINE11004",
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
							sceneRoot = "Xinzexi_DB/Newjerseyhostel",
							name = "FFliwu_01",
							scene = "map_newjerseyhostel_02",
							type = "timeline",
							skip = false,
							options = {
								{
									{
										content = "もう一個あげるよ"
									}
								}
							},
							touchs = {
								{
									{
										pos = {
											-100,
											100
										}
									}
								},
								{
									{
										pos = {
											-30,
											80
										}
									}
								},
								{
									{
										pos = {
											-150,
											-260
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
