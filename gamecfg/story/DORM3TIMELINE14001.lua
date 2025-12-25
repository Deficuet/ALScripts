return {
	hideRecord = true,
	dialogbox = 2,
	mode = 2,
	id = "DORM3TIMELINE14001",
	alpha = 0,
	hideSkip = true,
	hideAuto = true,
	placeholder = {
		"dorm3d"
	},
	scripts = {
		{
			bgm = "story-room-agir",
			stopbgm = true,
			dispatcher = {
				nextOne = true,
				name = STORY_EVENT.TEST,
				data = {
					op_list = {
						{
							sceneRoot = "Aijier_DB/Aijierhostel",
							name = "Qihe_49905_01",
							scene = "map_aijier_01",
							type = "timeline",
							skip = false,
							options = {
								{
									{
										content = "这样睡会冷吗？我去给你拿毯子……"
									}
								}
							},
							touchs = {}
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
