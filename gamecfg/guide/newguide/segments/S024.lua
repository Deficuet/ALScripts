local var_0_0 = {
	"<color=#ff7d36>出撃</color>をタップしてね",
	"今の艦隊ならきっとホーネットを倒せる！",
	"また待ち伏せ！でも私たちの艦隊の<color=#ff7d36>回避値が上がってるわ</color>！無駄な戦闘を回避するのよ！",
	"<color=#ff7d36>回避</color>で待ち伏せから迂回して！"
}

return {
	id = "S024",
	events = {
		{
			alpha = 0.422,
			code = 2,
			style = {
				dir = 1,
				mode = 2,
				posY = -42,
				posX = 243,
				text = var_0_0[1]
			},
			ui = {
				pathIndex = -1,
				dynamicPath = function()
					if getProxy(SettingsProxy):IsMellowStyle() then
						return "/OverlayCamera/Overlay/UIMain/NewMainMellowTheme(Clone)/frame/right/1/battle"
					else
						return "/OverlayCamera/Overlay/UIMain/NewMainClassicTheme(Clone)/frame/right/combatBtn"
					end
				end,
				triggerType = {
					1
				},
				fingerPos = {
					posY = -18.1,
					posX = 68.35
				}
			}
		},
		{
			alpha = 0.277,
			code = 2,
			waitScene = "LevelScene",
			style = {
				dir = 1,
				mode = 2,
				posY = -200,
				posX = -190,
				text = var_0_0[2]
			},
			ui = {
				path = "/OverlayCamera/Overlay/UIMain/top/LevelStageView(Clone)/bottom_stage/Normal/func_button",
				pathIndex = -1,
				triggerType = {
					1
				},
				fingerPos = {
					posY = -29.71,
					posX = 25.08
				}
			}
		},
		{
			alpha = 0.297,
			code = 1,
			baseui = {
				path = "OverlayCamera/Overlay/UIMain/top/LevelAmbushView(Clone)/window/dodge_button"
			},
			style = {
				dir = 1,
				mode = 2,
				posY = -304,
				posX = -190,
				text = var_0_0[3]
			}
		},
		{
			alpha = 0.297,
			code = 1,
			style = {
				dir = 1,
				mode = 2,
				posY = 167.08,
				posX = 23.41,
				text = var_0_0[4]
			}
		},
		{
			alpha = 0.303,
			ui = {
				path = "OverlayCamera/Overlay/UIMain/top/LevelAmbushView(Clone)/window/dodge_button",
				pathIndex = -1,
				triggerType = {
					1
				},
				fingerPos = {
					posY = -23.85,
					posX = 23.79
				}
			}
		}
	}
}
