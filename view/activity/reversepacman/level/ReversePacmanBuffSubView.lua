local var_0_0 = class("ReversePacmanBuffSubView", import("view.base.BaseSubView"))

var_0_0.LOCAL_SAVE_KEY = "ReversePacmanBuff"

function var_0_0.getUIName(arg_1_0)
	return "ReversePacmanBuffPanel"
end

function var_0_0.OnLoaded(arg_2_0)
	return
end

function var_0_0.OnInit(arg_3_0)
	onButton(arg_3_0, arg_3_0.uiMaskTF, function()
		arg_3_0:Hide()
	end, SOUND_BACK)
	onButton(arg_3_0, arg_3_0.uiCloseBtn, function()
		arg_3_0:Hide()
	end, SOUND_BACK)

	arg_3_0.buffUIList = UIItemList.New(arg_3_0.uiContentTF, arg_3_0.uiContentTF:Find("tpl"))

	arg_3_0.buffUIList:make(function(arg_6_0, arg_6_1, arg_6_2)
		if arg_6_0 == UIItemList.EventInit then
			arg_3_0:InitBuffTpl(arg_6_1, arg_6_2)
		elseif arg_6_0 == UIItemList.EventUpdate then
			arg_3_0:UpdateBuffTpl(arg_6_1, arg_6_2)
		end
	end)

	arg_3_0.slotUIList = UIItemList.New(arg_3_0.uiSlotsTF, arg_3_0.uiSlotsTF:Find("tpl"))

	arg_3_0.slotUIList:make(function(arg_7_0, arg_7_1, arg_7_2)
		if arg_7_0 == UIItemList.EventUpdate then
			arg_3_0:UpdateSlotTpl(arg_7_1, arg_7_2)
		end
	end)
end

function var_0_0.Show(arg_8_0, arg_8_1, arg_8_2)
	var_0_0.super.Show(arg_8_0)
	pg.UIMgr.GetInstance():BlurPanel(arg_8_0._tf)

	arg_8_0.activity = getProxy(ActivityProxy):getActivityByType(ActivityConst.ACTIVITY_TYPE_REVERSE_PACMAN)
	arg_8_0.slotCnt = arg_8_1
	arg_8_0.selSlot = 1
	arg_8_0.owndBuffIds, arg_8_0.owndBuffCnts = arg_8_0:GetOwndBuffs()
	arg_8_0.selBuffIds = var_0_0.GetSelBuffIds(arg_8_0.slotCnt)

	arg_8_0.buffUIList:align(#arg_8_0.owndBuffIds)
	arg_8_0.slotUIList:align(arg_8_0.slotCnt)

	arg_8_0.hideCallback = arg_8_2
end

function var_0_0.GetOwndBuffs(arg_9_0)
	local var_9_0 = {}
	local var_9_1 = {}

	for iter_9_0, iter_9_1 in pairs(ReversePacmanConst.BUFF) do
		local var_9_2 = pg.activity_chasing_skill[iter_9_1].item_id
		local var_9_3 = arg_9_0.activity:GetVitemNumber(var_9_2)

		if var_9_3 > 0 then
			table.insert(var_9_0, iter_9_1)
			table.insert(var_9_1, var_9_3)
		end
	end

	return var_9_0, var_9_1
end

function var_0_0.UpdateSlotTpl(arg_10_0, arg_10_1, arg_10_2)
	local var_10_0 = arg_10_1 + 1
	local var_10_1 = arg_10_0.selBuffIds[var_10_0]
	local var_10_2 = var_10_1 == 0

	setActive(arg_10_2:Find("empty"), var_10_2)
	setActive(arg_10_2:Find("icon"), not var_10_2)
	setActive(arg_10_2:Find("Text"), false)

	if not var_10_2 then
		LoadImageSpriteAsync(pg.activity_chasing_skill[var_10_1].icon, arg_10_2:Find("icon"))
	end
end

function var_0_0.InitBuffTpl(arg_11_0, arg_11_1, arg_11_2)
	local var_11_0 = arg_11_0.owndBuffIds[arg_11_1 + 1]
	local var_11_1 = arg_11_0.owndBuffCnts[arg_11_1 + 1]
	local var_11_2 = pg.activity_chasing_skill[var_11_0]

	arg_11_2.name = tostring(var_11_0)

	setText(arg_11_2:Find("content/name"), var_11_2.name)

	local var_11_3 = string.gsub(var_11_2.desc, "$1", var_11_2.param)

	setText(arg_11_2:Find("content/desc"), var_11_3)
	setText(arg_11_2:Find("content/count"), var_11_1)
	LoadImageSpriteAsync(var_11_2.icon, arg_11_2:Find("icon"))
end

function var_0_0.UpdateBuffTpl(arg_12_0, arg_12_1, arg_12_2)
	local var_12_0 = arg_12_0.owndBuffIds[arg_12_1 + 1]
	local var_12_1 = table.contains(arg_12_0.selBuffIds, var_12_0)

	setActive(arg_12_2:Find("toggle/sel"), var_12_1)

	local var_12_2 = underscore.all(arg_12_0.selBuffIds, function(arg_13_0)
		return arg_13_0 ~= 0
	end)
	local var_12_3 = not var_12_1 and var_12_2

	setGray(arg_12_2:Find("toggle"), var_12_3)
	onButton(arg_12_0, arg_12_2:Find("toggle"), function()
		if var_12_3 then
			return
		end

		if var_12_1 then
			local var_14_0 = table.indexof(arg_12_0.selBuffIds, var_12_0)

			arg_12_0.selBuffIds[var_14_0] = 0
		else
			local var_14_1 = (function()
				for iter_15_0, iter_15_1 in ipairs(arg_12_0.selBuffIds) do
					if iter_15_1 == 0 then
						return iter_15_0
					end
				end
			end)()

			arg_12_0.selBuffIds[var_14_1] = var_12_0
		end

		arg_12_0:SortAndSaveSelIds()
		arg_12_0.slotUIList:align(arg_12_0.slotCnt)
		arg_12_0.buffUIList:align(#arg_12_0.owndBuffIds)
	end, SFX_PANEL)
end

function var_0_0.SortAndSaveSelIds(arg_16_0)
	local var_16_0 = {}

	for iter_16_0, iter_16_1 in ipairs(arg_16_0.selBuffIds) do
		if iter_16_1 ~= 0 then
			table.insert(var_16_0, iter_16_1)
		end
	end

	for iter_16_2 = 1, arg_16_0.slotCnt do
		if var_16_0[iter_16_2] == nil then
			var_16_0[iter_16_2] = 0
		end

		var_0_0.SetLocalBuffData(iter_16_2, var_16_0[iter_16_2])
	end

	arg_16_0.selBuffIds = var_16_0
end

function var_0_0.Hide(arg_17_0)
	var_0_0.super.Hide(arg_17_0)
	existCall(arg_17_0.hideCallback)
	pg.UIMgr.GetInstance():UnOverlayPanel(arg_17_0._tf)
end

function var_0_0.OnDestroy(arg_18_0)
	return
end

function var_0_0.GetLocalBuffData(arg_19_0)
	local var_19_0 = getProxy(PlayerProxy):getRawData().id

	return PlayerPrefs.GetInt(var_0_0.LOCAL_SAVE_KEY .. "_" .. var_19_0 .. "_" .. arg_19_0) or 0
end

function var_0_0.SetLocalBuffData(arg_20_0, arg_20_1)
	local var_20_0 = getProxy(PlayerProxy):getRawData().id

	PlayerPrefs.SetInt(var_0_0.LOCAL_SAVE_KEY .. "_" .. var_20_0 .. "_" .. arg_20_0, arg_20_1)
	PlayerPrefs.Save()
end

function var_0_0.GetSelBuffIds(arg_21_0)
	local var_21_0 = {}

	for iter_21_0 = 1, arg_21_0 do
		table.insert(var_21_0, var_0_0.GetLocalBuffData(iter_21_0))
	end

	return var_21_0
end

return var_0_0
