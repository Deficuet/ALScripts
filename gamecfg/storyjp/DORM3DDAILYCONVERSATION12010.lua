return {
	fadeOut = 1.5,
	dialogbox = 2,
	hideRecord = true,
	mode = 2,
	alpha = 0,
	id = "DORM3DDAILYCONVERSATION12010",
	hideSkip = true,
	hideAuto = true,
	placeholder = {
		"dorm3d"
	},
	scripts = {
		{
			side = 2,
			actorName = 30707,
			nameColor = "#FFFFFF",
			hidePaintObj = true,
			dir = 1,
			say = "この前の作戦で破れたシャツを大鳳が直しておきましたわ",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			},
			dispatcher = {
				name = STORY_EVENT.TEST,
				data = {
					op_list = {
						{
							param = "Play",
							name = "happy_01-start",
							time = 0,
							type = "action",
							skip = true
						},
						{
							skip = true,
							name = "Face_shy_start",
							type = "action"
						},
						{
							skip = false,
							time = 1.5,
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
			actor = 0,
			side = 2,
			nameColor = "#FFFFFF",
			hidePaintObj = true,
			dir = 1,
			say = "どうしてそれを大鳳が持ってるの？",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			side = 2,
			actorName = 30707,
			nameColor = "#FFFFFF",
			hidePaintObj = true,
			dir = 1,
			say = "指揮官様にもっと寄り添うためなら、大鳳はいくらでも手を尽くしますもの~",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			side = 2,
			actorName = 30707,
			nameColor = "#FFFFFF",
			hidePaintObj = true,
			dir = 1,
			say = "シャツだけじゃありませんわ。大鳳、指揮官様のものを色々持っていますから……",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		}
	}
}
