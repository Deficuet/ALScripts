return {
	fadeOut = 1.5,
	dialogbox = 2,
	hideRecord = true,
	mode = 2,
	alpha = 0,
	id = "DORM3DTOUCH3072",
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
			say = "呵呵~{dorm3d}这是在试探{namecode:97}吗？……",
			voice = "event:/dorm/drom3d_Taiho_ik_furniture1_tone3/drom3d_Taiho_ik_furniture1_tone3",
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
							name = "IK_bed02_idle01_fb03",
							time = 0,
							type = "action",
							skip = true
						},
						{
							param = "IK_bed02_idle01_fb03_SK",
							name = "furniture/Item/Df_Handcuffs_01/pre_db_df_handcuffs_01",
							time = 0,
							type = "extra_item_action",
							skip = true
						},
						{
							skip = true,
							name = "Face_amazed_start",
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
