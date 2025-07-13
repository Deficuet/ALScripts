local var_0_0 = {
	"Now let's have a gander at your <color=#ff7d36>Commander Handbook</color>!",
	"Start by <color=#ff7d36>claiming the rewards</color>!",
	"Close the rewards menu.",
	"our <color=#ff7d36>Commander Handbook</color> contains all kinds of tutorials for the game.",
	"There are <color=#ff7d36>rookie missions</color>, designed to hasten your overall growth.",
	"<color=#ff7d36>Mechanic tutorials</color>, meanwhile, teach you about the game's mechanics and give you tips.",
	"If you ever wonder something, consult your Commander Handbook."
}

return {
	id = "NG004_1",
	events = {
		{
			alpha = 0.4,
			style = {
				dir = -1,
				mode = 2,
				posY = 172,
				posX = -337,
				text = var_0_0[1]
			}
		},
		{
			ui = {
				dynamicPath = function()
					if getProxy(SettingsProxy):IsMellowStyle() then
						return "/OverlayCamera/Overlay/UIMain/NewMainMellowTheme(Clone)/frame/left/list/MainUIRecruitBtn4Mellow(Clone)"
					else
						return "/OverlayCamera/Overlay/UIMain/NewMainClassicTheme(Clone)/frame/link_top/layout/MainUIRecruitBtn(Clone)"
					end
				end
			}
		},
		{
			alpha = 0.4,
			style = {
				dir = -1,
				mode = 2,
				posY = -102.33,
				posX = -29.1,
				text = var_0_0[2]
			},
			ui = {
				path = "/OverlayCamera/Overlay/UIMain/blur_panel/panel/pages/taskPage/page/scroll/Viewport/Content/tpl/normal/get_btn",
				triggerType = {
					1
				}
			}
		},
		{
			alpha = 0,
			waitScene = "AwardInfoLayer",
			style = {
				dir = -1,
				mode = 2,
				posY = -341,
				posX = 431,
				text = var_0_0[3]
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
				posY = -102.33,
				posX = -29.1,
				text = var_0_0[4]
			}
		},
		{
			alpha = 0.4,
			style = {
				dir = -1,
				mode = 2,
				posX = -29.1,
				posY = -102.33,
				lineMode = true,
				text = var_0_0[5],
				uiset = {
					{
						linemode = 1,
						path = "/OverlayCamera/Overlay/UIMain/blur_panel/panel/pageBtns/taskBtn"
					}
				}
			}
		},
		{
			alpha = 0.4,
			style = {
				dir = -1,
				mode = 2,
				posX = -29.1,
				posY = -102.33,
				lineMode = true,
				text = var_0_0[6],
				uiset = {
					{
						linemode = 1,
						path = "/OverlayCamera/Overlay/UIMain/blur_panel/panel/pageBtns/guideBtn"
					}
				}
			}
		},
		{
			alpha = 0.4,
			style = {
				dir = -1,
				mode = 2,
				posY = -102.33,
				posX = -29.1,
				text = var_0_0[7]
			}
		}
	}
}
