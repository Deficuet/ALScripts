local var_0_0 = {
	"Close the rewards menu.",
	"This is the batch disassemble menu. We're not going to disassemble anything right now, so just go back to the previous screen.",
	"Tap to return.",
	"Return to the main menu."
}

return {
	id = "S014",
	events = {
		{
			alpha = 0,
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
			alpha = 0.367,
			style = {
				dir = -1,
				mode = 2,
				posY = 223.26,
				posX = -136.21,
				text = var_0_0[2]
			},
			ui = {
				path = "OverlayCamera/Overlay/UIMain/ResolveEquipmentUI(Clone)/main/cancel_btn",
				pathIndex = -1,
				triggerType = {
					1
				},
				fingerPos = {
					posY = 0,
					posX = 0
				}
			}
		},
		{
			alpha = 0.367,
			style = {
				dir = -1,
				mode = 2,
				posY = 339,
				posX = 179,
				text = var_0_0[3]
			},
			ui = {
				path = "OverlayCamera/Overlay/UIMain/Msgbox(Clone)/window/button_container/custom_button_1(Clone)",
				pathIndex = -1,
				triggerType = {
					1
				},
				fingerPos = {
					posY = 0,
					posX = 0
				}
			}
		},
		{
			alpha = 0.367,
			style = {
				dir = -1,
				mode = 2,
				posY = 223.26,
				posX = -136.21,
				text = var_0_0[4]
			},
			ui = {
				path = "OverlayCamera/Overlay/UIMain/blur_panel/adapt/top/back_btn",
				pathIndex = -1,
				triggerType = {
					1
				},
				fingerPos = {
					posY = 0,
					posX = 0
				}
			}
		}
	}
}
