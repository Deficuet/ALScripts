local var_0_0 = {
	"報酬として<color=#ff7d36>Ptアイテム</color>をもらったわね！",
	"<color=#ff7d36>Ptアイテム</color>はショップで報酬と交換できるわ！次はショップに行くわよ！",
	"報酬が盛りたくさん！好きなものと交換してみて！先に母港に戻って待っているわ！"
}

return {
	id = "NG0037_1",
	events = {
		{
			alpha = 0.4,
			waitScene = "AwardInfoLayer",
			style = {
				dir = -1,
				mode = 2,
				posY = -341,
				posX = 431,
				text = var_0_0[1]
			},
			spriteui = {
				defaultName = "white_dot",
				path = "/OverlayCamera/Overlay/UIMain/AwardInfoUI(Clone)/items/items_scroll/content",
				childPath = "bg/icon_bg/icon",
				pathIndex = "#"
			},
			ui = {
				path = "OverlayCamera/Overlay/UIMain/AwardInfoUI(Clone)",
				pathIndex = -1,
				triggerType = {
					1
				},
				fingerPos = {
					posY = -172,
					posX = 520
				}
			}
		},
		{
			alpha = 0.4,
			style = {
				dir = -1,
				mode = 2,
				posY = -341,
				posX = 431,
				text = var_0_0[2]
			},
			ui = {
				path = "/UICamera/Canvas/UIMain/NewServerCarnivalUI(Clone)/left/frame/toggle_group/shop",
				triggerType = {
					2,
					true
				}
			}
		},
		{
			alpha = 0.4,
			style = {
				dir = -1,
				mode = 2,
				posX = 431,
				posY = -341,
				lineMode = true,
				text = var_0_0[3],
				uiset = {
					{
						path = "/UICamera/Canvas/UIMain/NewServerCarnivalUI(Clone)/main/shop_container",
						lineMode = 1
					}
				}
			}
		}
	}
}
