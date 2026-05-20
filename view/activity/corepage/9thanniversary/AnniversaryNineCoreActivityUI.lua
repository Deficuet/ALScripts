local var_0_0 = class("AnniversaryNineCoreActivityUI", import("view.activity.CorePage.CoreAdaptActivityMainScene"))

function var_0_0.getUIName(arg_1_0)
	return "AnniversaryNineCoreActivityUI"
end

var_0_0.optionsPath = {
	"adapt/TopPage/top/btn_home"
}

function var_0_0.init(arg_2_0, ...)
	var_0_0.super.init(arg_2_0, ...)

	arg_2_0.topPage = arg_2_0._tf:Find("adapt/TopPage")

	setText(arg_2_0._tf:Find("adapt/TopPage/top/deco/Text"), i18n("HelenaCoreActivity_title"))
	setText(arg_2_0._tf:Find("adapt/TopPage/top/deco/Text/Text_1"), i18n("HelenaCoreActivity_title2"))

	local var_2_0

	arg_2_0.tabsList:make(function(arg_3_0, arg_3_1, arg_3_2)
		if arg_3_0 == UIItemList.EventUpdate then
			local var_3_0 = underscore.detect(arg_2_0.activities, function(arg_4_0)
				return tostring(arg_4_0:getConfig("is_show")) == arg_3_2.name
			end)

			if not var_3_0 or var_3_0:isEnd() then
				setActive(arg_3_2, false)
			elseif not arg_2_0.pageDic[var_3_0.id] then
				warning(string.format("without page in act:", var_3_0.id))
			else
				setText(arg_3_2:Find("off/name"), arg_2_0:GetButtonNameText(var_3_0))
				setText(arg_3_2:Find("on/name"), arg_2_0:GetButtonNameText(var_3_0))

				if arg_2_0.pageDic[var_3_0.id] ~= nil then
					local var_3_1 = arg_2_0.pageDic[var_3_0.id]
					local var_3_2 = arg_3_2:Find("tip")
					local var_3_3 = var_3_1:IsShowReminder()

					setActive(var_3_2, var_3_0:readyToAchieve())
					onToggle(arg_2_0, arg_3_2, function(arg_5_0)
						if arg_5_0 then
							arg_2_0:selectActivity(var_3_0)

							if var_2_0 ~= var_3_0.id then
								arg_2_0:OnClickBtn(arg_3_2, var_3_0.id)
							end

							var_2_0 = var_3_0.id
						end
					end, SFX_PANEL)
				end
			end
		end
	end)
end

function var_0_0.GetButtonNameText(arg_6_0, arg_6_1)
	return i18n(string.format(arg_6_1:getConfig("title_res_tag")))
end

return var_0_0
