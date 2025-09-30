local var_0_0 = {
	"让我们打开<color=#ff7d36>任务日志</color>",
	"领取<color=#ff7d36>任务奖励</color>"
}

return {
	id = "S011",
	events = {
		{
			alpha = 0.325,
			style = {
				dir = 1,
				mode = 2,
				posY = -123,
				posX = 87.7,
				text = var_0_0[1]
			},
			ui = {
				pathIndex = -1,
				dynamicPath = function()
					if getProxy(SettingsProxy):IsMellowStyle() then
						return "/OverlayCamera/Overlay/UIMain/NewMainMellowTheme(Clone)/frame/bottom/frame/task"
					else
						return "/OverlayCamera/Overlay/UIMain/NewMainClassicTheme(Clone)/frame/bottom/taskButton"
					end
				end,
				triggerType = {
					1
				},
				fingerPos = {
					posY = -21.7,
					posX = 36.96
				}
			}
		},
		{
			alpha = 0.375,
			waitScene = "TaskScene",
			ui = {
				path = "/UICamera/Canvas/UIMain/TaskScene(Clone)/blur_panel/adapt/left_length/frame/tagRoot/scenario",
				pathIndex = -1,
				triggerType = {
					2
				},
				fingerPos = {
					posY = -50,
					posX = 40
				}
			}
		},
		{
			alpha = 0.375,
			waitScene = "TaskScene",
			style = {
				dir = 1,
				mode = 2,
				posY = 183,
				posX = 474,
				text = var_0_0[2]
			},
			ui = {
				delay = 1,
				path = "/UICamera/Canvas/UIMain/TaskScene(Clone)/pages/TaskListPage(Clone)/right_panel/content/0/frame/get_btn",
				pathIndex = -1,
				triggerType = {
					1
				}
			}
		}
	}
}
