return {
	fadeOut = 1.5,
	dialogbox = 2,
	hideRecord = true,
	mode = 2,
	alpha = 0,
	id = "DORM3DTOUCH12025",
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
			say = "Oh, no. I think I'm losing control...♡",
			voice = "event:/dorm/drom3d_Taiho_ik_gfit1_tone4/drom3d_Taiho_ik_gfit1_tone4",
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
							name = "IK_sp01_idle01_fb02",
							time = 5,
							type = "action",
							skip = true
						},
						{
							param = "IK_sp01_idle01_fb02_PP",
							name = "furniture/Prefabs/Pay_Dafenghostel/pre_db_df_pipa01",
							time = 5,
							type = "extra_item_action",
							skip = true
						},
						{
							skip = true,
							name = "Face_helpless_start",
							type = "action"
						},
						{
							skip = false,
							time = 17.7,
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
