local var_0_0 = class("Dorm3dIconHelper")

var_0_0.CAMERA_VOLUME = 1
var_0_0.CAMERA_FRAME = 2
var_0_0.DORM_STORY = 3

function var_0_0.UpdateDorm3dIcon(arg_1_0, arg_1_1)
	local var_1_0 = var_0_0.Data2Config(arg_1_1)

	GetImageSpriteFromAtlasAsync("weaponframes", var_1_0.frame, arg_1_0)

	local var_1_1 = arg_1_0:Find("icon")

	GetImageSpriteFromAtlasAsync(var_1_0.icon, "", var_1_1)
	setText(arg_1_0:Find("count/Text"), "x" .. var_1_0.count)
	setText(arg_1_0:Find("name/Text"), var_1_0.name)
end

function var_0_0.Data2Config(arg_2_0)
	local var_2_0 = switch(arg_2_0[1], {
		[var_0_0.CAMERA_VOLUME] = function()
			local var_3_0 = pg.dorm3d_camera_volume_template[arg_2_0[2]]

			return {
				name = var_3_0.name,
				icon = var_3_0.icon,
				rarity = var_3_0.rarity,
				desc = var_3_0.desc
			}
		end,
		[var_0_0.CAMERA_FRAME] = function()
			local var_4_0 = pg.dorm3d_camera_photo_frame[arg_2_0[2]]

			return {
				name = var_4_0.name,
				icon = var_4_0.icon,
				rarity = var_4_0.rarity,
				desc = var_4_0.desc
			}
		end,
		[var_0_0.DORM_STORY] = function()
			local var_5_0 = pg.dorm3d_recall[arg_2_0[2]]

			return {
				name = var_5_0.name,
				icon = "dorm3dicon/" .. var_5_0.image .. "_icon",
				rarity = var_5_0.rarity,
				desc = var_5_0.desc
			}
		end
	})

	var_2_0.frame = "dorm3d_" .. (var_2_0.rarity and ItemRarity.Rarity2Print(var_2_0.rarity) or "2")
	var_2_0.count = arg_2_0[3]

	return var_2_0
end

function var_0_0.SplitStory(arg_6_0)
	local var_6_0 = {}
	local var_6_1

	for iter_6_0, iter_6_1 in pairs(arg_6_0) do
		if iter_6_1[1] ~= var_0_0.DORM_STORY then
			table.insert(var_6_0, iter_6_1)
		else
			var_6_1 = iter_6_1
		end
	end

	return var_6_0, var_6_1
end

return var_0_0
