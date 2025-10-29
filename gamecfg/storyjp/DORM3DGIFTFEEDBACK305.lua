return {
	hideRecord = true,
	dialogbox = 2,
	mode = 2,
	id = "DORM3DGIFTFEEDBACK305",
	alpha = 0,
	hideSkip = true,
	hideAuto = true,
	placeholder = {
		"dorm3d"
	},
	scripts = {
		{
			actorName = 19903,
			nameColor = "#FFFFFF",
			say = "これは…？アンカレッジのえ……なかにいれる？よくわからない…",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			},
			dispatcher = {
				name = STORY_EVENT.TEST,
				data = {
					op_list = {
						{
							skip = true,
							name = "ab_shuohua_jingya_01",
							type = "action"
						},
						{
							skip = true,
							name = "Face_yihuo",
							type = "action"
						},
						{
							skip = false,
							time = 2,
							type = "wait"
						}
					}
				},
				callbackData = {
					hideUI = false,
					name = STORY_EVENT.TEST_DONE
				}
			}
		},
		{
			actorName = 19903,
			nameColor = "#FFFFFF",
			say = "{dorm3d}、アンカレッジに……おしえて！",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		}
	}
}
