local var_0_0 = class("BossRushVeritasAcademyFleetSelectView", import("view.activity.BossRush.BossRushFleetSelectView"))

function var_0_0.GetTextColor(arg_1_0)
	return Color.NewHex("272727"), Color.NewHex("FFFFFF")
end

function var_0_0.GetAutoInfoLayout(arg_2_0)
	return {
		["Title/Text"] = {
			{
				x = -325,
				y = -112
			},
			{
				x = -325,
				y = -70
			}
		},
		Description = {
			{
				x = -105,
				y = 207
			},
			{
				x = -105,
				y = 250
			}
		},
		Boss = {
			{
				x = -110,
				y = -82
			},
			{
				x = -110,
				y = 20
			}
		},
		Modes = {
			{
				x = -110,
				y = -182
			},
			{
				x = -110,
				y = -68
			}
		},
		Start = {
			{
				x = -110,
				y = -267
			},
			{
				x = -110,
				y = -300
			}
		}
	}
end

function var_0_0.getUIName(arg_3_0)
	return "BossRushVeritasAcademyFleetSelectUI"
end

function var_0_0.tempCache(arg_4_0)
	return true
end

return var_0_0
