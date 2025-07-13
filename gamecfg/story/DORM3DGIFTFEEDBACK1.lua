return {
	hideRecord = true,
	dialogbox = 2,
	mode = 2,
	alpha = 0,
	id = "DORM3DGIFTFEEDBACK1",
	hideSkip = true,
	hideAuto = true,
	scripts = {
		{
			say = "This tea set is for me? I'm so flattered. Oh, you're too generous, Master.",
			actorName = 20220,
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
							name = "ganjin",
							type = "action"
						},
						{
							skip = true,
							name = "Face_gaoxing",
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
			say = "I'll use it with care! I will do my best to brew delicious tea for you!",
			actorName = 20220,
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		}
	}
}
