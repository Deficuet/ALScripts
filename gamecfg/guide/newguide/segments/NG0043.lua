return {
	id = "NG0043",
	events = {
		{
			alpha = 0.6,
			style = {
				text = "「！」がついている施設をタップして様子を見てみよう！",
				mode = 1,
				posY = 250,
				dir = -1,
				posX = -92,
				uiFunc = function()
					local var_1_0 = {}

					if not pg.NewStoryMgr.GetInstance():IsPlayed(VoteStoryUtil.GetStoryNameByType(VoteStoryUtil.ENTER_MAIN_STAGE)) then
						table.insert(var_1_0, {
							path = "/UICamera/Canvas/UIMain/VoteEntranceUI(Clone)/bg/main/title"
						})
						table.insert(var_1_0, {
							path = "/UICamera/Canvas/UIMain/VoteEntranceUI(Clone)/bg/main/tip"
						})
					end

					if not pg.NewStoryMgr.GetInstance():IsPlayed(VoteStoryUtil.GetStoryNameByType(VoteStoryUtil.ENTER_SUB_STAGE)) then
						table.insert(var_1_0, {
							path = "/UICamera/Canvas/UIMain/VoteEntranceUI(Clone)/bg/sub/title"
						})
						table.insert(var_1_0, {
							path = "/UICamera/Canvas/UIMain/VoteEntranceUI(Clone)/bg/sub/tip"
						})
					end

					if not pg.NewStoryMgr.GetInstance():IsPlayed(VoteStoryUtil.GetStoryNameByType(VoteStoryUtil.ENTER_EXCHANGE)) then
						table.insert(var_1_0, {
							path = "/UICamera/Canvas/UIMain/VoteEntranceUI(Clone)/bg/exchange/title"
						})
						table.insert(var_1_0, {
							path = "/UICamera/Canvas/UIMain/VoteEntranceUI(Clone)/bg/exchange/tip"
						})
					end

					if not pg.NewStoryMgr.GetInstance():IsPlayed(VoteStoryUtil.GetStoryNameByType(VoteStoryUtil.ENTER_SCHEDULE)) then
						table.insert(var_1_0, {
							path = "/UICamera/Canvas/UIMain/VoteEntranceUI(Clone)/bg/billboard/title"
						})
						table.insert(var_1_0, {
							path = "/UICamera/Canvas/UIMain/VoteEntranceUI(Clone)/bg/billboard/tip"
						})
					end

					if not pg.NewStoryMgr.GetInstance():IsPlayed(VoteStoryUtil.GetStoryNameByType(VoteStoryUtil.ENTER_HALL)) then
						table.insert(var_1_0, {
							path = "/UICamera/Canvas/UIMain/VoteEntranceUI(Clone)/bg/honor/title"
						})
						table.insert(var_1_0, {
							path = "/UICamera/Canvas/UIMain/VoteEntranceUI(Clone)/bg/honor/tip"
						})
					end

					return var_1_0
				end
			}
		}
	}
}
