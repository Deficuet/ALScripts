return {
	id = "ISLAND_GUIDE_12",
	events = {
		{
			delay = 0.3,
			is3dDorm = false,
			alpha = 0,
			style = {
				text = "点击下方按钮可查看角色详情",
				mode = 2,
				dir = 1,
				char = 1,
				posY = 0,
				posX = 0,
				uiset = {}
			},
			ui = {
				path = "/UICamera/Canvas/UIMain/UIIsland/layer1/ui/IslandGetShipUI(Clone)/main/go",
				pathIndex = -1
			}
		},
		{
			is3dDorm = false,
			alpha = 0,
			style = {
				text = "在开发区中，角色拥有新的生产能力和生产技能，消耗能力指南和技能指南可提升能力值和技能等级",
				mode = 2,
				dir = 1,
				char = 1,
				posY = 0,
				posX = -200,
				uiset = {
					{
						lineMode = 2,
						path = "/UICamera/Canvas/UIMain/UIIsland/layer1/page/IslandShipInfoUI(Clone)/adapt/main_panel",
						pathIndex = -1
					}
				}
			}
		},
		{
			is3dDorm = false,
			alpha = 0,
			style = {
				text = "点击装扮按钮可更换角色装扮",
				mode = 2,
				dir = 1,
				char = 1,
				posY = 0,
				posX = 0,
				uiset = {}
			},
			ui = {
				path = "/UICamera/Canvas/UIMain/UIIsland/layer1/ui/IslandShipMainUI(Clone)/top/toggles/dress",
				pathIndex = -1,
				triggerType = {
					2,
					true
				}
			}
		},
		{
			is3dDorm = false,
			alpha = 0,
			style = {
				text = "角色装扮分为服装和三种不同的配饰",
				mode = 2,
				dir = 1,
				char = 1,
				posY = 0,
				posX = 0,
				uiset = {
					{
						lineMode = 2,
						path = "/UICamera/Canvas/UIMain/UIIsland/layer1/page/IslandShipDressUI(Clone)/adapt/right_panel/toggles",
						pathIndex = -1
					}
				}
			}
		},
		{
			is3dDorm = false,
			alpha = 0,
			style = {
				text = "点击关闭角色界面",
				mode = 2,
				dir = 1,
				char = 1,
				posY = 0,
				posX = 0,
				uiset = {}
			},
			ui = {
				path = "/UICamera/Canvas/UIMain/UIIsland/layer1/ui/IslandShipMainUI(Clone)/top/back",
				pathIndex = -1
			}
		},
		{
			is3dDorm = false,
			alpha = 0,
			style = {
				text = "点击退出岛屿权限认证界面",
				mode = 2,
				dir = 1,
				char = 1,
				posY = 0,
				posX = 0,
				uiset = {}
			},
			ui = {
				path = "/UICamera/Canvas/UIMain/UIIsland/layer1/ui/IslandInviteUI(Clone)/top/back",
				pathIndex = -1
			}
		},
		{
			alpha = 0,
			doFunc = function()
				if _IslandCore then
					_IslandCore:GetView():NotifiyIsland(ISLAND_EX_EVT.PLAY_PERFORMANCE, {
						name = "ISLANDPERFORMANCE9"
					})
				end
			end
		}
	}
}
