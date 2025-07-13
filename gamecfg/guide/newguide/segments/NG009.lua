local var_0_0 = {
	"Tap here to view the Meowfficer's Skills and Talents!",
	"Tap here to view the stat bonuses received from the Meowfficer!",
	"You can make the Meowfficer better by Enhancing them and leveling their Talents!"
}

return {
	id = "NG009",
	events = {
		{
			style = {
				dir = -1,
				mode = 1,
				posY = 100,
				posX = 200,
				text = var_0_0[1]
			},
			ui = {
				path = "/UICamera/Canvas/UIMain/CommanderCatUI(Clone)/blur_panel/pages/CommanderDetailUI(Clone)/info/skill_btn",
				triggerType = {
					2
				}
			}
		},
		{
			style = {
				dir = -1,
				mode = 1,
				posY = 100,
				posX = 100,
				text = var_0_0[2]
			},
			ui = {
				path = "/UICamera/Canvas/UIMain/CommanderCatUI(Clone)/blur_panel/pages/CommanderDetailUI(Clone)/info/addition_btn",
				triggerType = {
					2
				}
			}
		},
		{
			style = {
				dir = 1,
				mode = 1,
				posY = -110,
				posX = -500,
				text = var_0_0[3]
			}
		}
	}
}
