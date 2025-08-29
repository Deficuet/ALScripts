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
										content = "{namecode:50}?"
									}
								},
								{
									{
										content = "恶作剧的{namecode:50}也很可爱"
									},
									{
										content = "{namecode:50}做什么都很可爱"
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
