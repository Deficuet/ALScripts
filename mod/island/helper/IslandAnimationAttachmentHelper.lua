local var_0_0 = class("IslandAnimationAttachmentHelper")

function var_0_0.ResolveId(arg_1_0, arg_1_1)
	local var_1_0 = pg.island_animation_attachments[arg_1_1]

	if not var_1_0 or not arg_1_0 then
		return arg_1_1
	end

	local var_1_1 = var_1_0.override

	if var_1_1 == "" or type(var_1_1) ~= "table" then
		return arg_1_1
	end

	local function var_1_2(arg_2_0)
		if not arg_2_0 or arg_2_0 == "" then
			return false
		end

		local var_2_0 = arg_1_0.runtimeAnimatorController

		if not var_2_0 then
			return false
		end

		return string.gsub(var_2_0.name, "%(Clone%)$", "") == arg_2_0
	end

	if type(var_1_1[1]) == "table" then
		for iter_1_0, iter_1_1 in ipairs(var_1_1) do
			if var_1_2(iter_1_1[1]) then
				return iter_1_1[2] or arg_1_1
			end
		end
	elseif var_1_2(var_1_1[1]) then
		return var_1_1[2] or arg_1_1
	end

	return arg_1_1
end

return var_0_0
