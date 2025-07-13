return {
	fadeOut = 1.5,
	dialogbox = 2,
	hideRecord = true,
	mode = 2,
	alpha = 0,
	id = "DORM3DDAILYCONVERSATION11027",
	hideSkip = true,
	hideAuto = true,
	placeholder = {
		"dorm3d"
	},
	scripts = {
		{
			actor = 0,
			side = 2,
			nameColor = "#FFFFFF",
			hidePaintObj = true,
			say = "ニュージャージー？",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			side = 2,
			actorName = 10517,
			nameColor = "#FFFFFF",
			hidePaintObj = true,
			dir = 1,
			say = "あれ？ハニー⋯⋯来てくれたんだ",
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
							name = "hello_01-start",
							time = 0,
							type = "action",
							skip = true
						},
						{
							skip = true,
							name = "face_happy_start",
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
			side = 2,
			actorName = 10517,
			nameColor = "#FFFFFF",
			hidePaintObj = true,
			dir = 1,
			say = "あたし⋯⋯よだれを垂らして寝てたの？！",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			side = 2,
			actorName = 10517,
			nameColor = "#FFFFFF",
			hidePaintObj = true,
			dir = 1,
			say = "期間限定のアイスクリームを食べる夢を見てたら、音が聞こえて⋯⋯",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			side = 2,
			actorName = 10517,
			nameColor = "#FFFFFF",
			hidePaintObj = true,
			dir = 1,
			say = "どうして目が覚めたかって？そりゃアイスよりハニーのほうがずっと大事だからよ！",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		}
	}
}
