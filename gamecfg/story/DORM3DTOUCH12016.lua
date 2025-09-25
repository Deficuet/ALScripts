return {
	fadeOut = 1.5,
	dialogbox = 2,
	hideRecord = true,
	mode = 2,
	alpha = 0,
	id = "DORM3DTOUCH12016",
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
			say = "这样的话……{namecode:97}又要变得奇怪了……{dorm3d}要负责哦？",
			voice = "event:/dorm/drom3d_Taiho_ik_furniture3_tone8/drom3d_Taiho_ik_furniture3_tone8",
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
							name = "IK_bed02_idle01_fb02",
							time = 0,
							type = "action",
							skip = true
						},
						{
							param = "IK_bed02_idle01_fb02_SK",
							name = "furniture/Item/Df_Handcuffs_01/pre_db_df_handcuffs_01",
							time = 0,
							type = "extra_item_action",
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
		}
	}
}
