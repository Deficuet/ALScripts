local var_0_0 = class("IslandAchievementCard")

function var_0_0.Ctor(arg_1_0, arg_1_1)
	arg_1_0._go = arg_1_1
	arg_1_0._tf = arg_1_1.transform
	arg_1_0.nameTF = arg_1_0._tf:Find("name")
	arg_1_0.descTF = arg_1_0._tf:Find("desc")
	arg_1_0.goTF = arg_1_0._tf:Find("status/go")
	arg_1_0.getBtn = arg_1_0._tf:Find("status/get")
	arg_1_0.gotTF = arg_1_0._tf:Find("status/got")
	arg_1_0.lockTF = arg_1_0._tf:Find("lock")

	local var_1_0 = arg_1_0._tf:Find("stages")

	arg_1_0.stageUIList = UIItemList.New(var_1_0, var_1_0:Find("tpl"))

	arg_1_0.stageUIList:make(function(arg_2_0, arg_2_1, arg_2_2)
		if arg_2_0 == UIItemList.EventUpdate then
			arg_1_0:UpdateStageItem(arg_2_1, arg_2_2)
		end
	end)

	local var_1_1 = arg_1_0._tf:Find("awards")

	arg_1_0.awardUIList = UIItemList.New(var_1_1, var_1_1:Find("tpl"))

	arg_1_0.awardUIList:make(function(arg_3_0, arg_3_1, arg_3_2)
		if arg_3_0 == UIItemList.EventUpdate then
			arg_1_0:UpdateAwardItem(arg_3_1, arg_3_2)
		end
	end)
end

function var_0_0.UpdateStageItem(arg_4_0, arg_4_1, arg_4_2)
	arg_4_2:GetComponent(typeof(Animation)):Stop()

	local var_4_0 = arg_4_1 + 1

	GetImageSpriteFromAtlasAsync("islandachievement", "achv_stage_" .. var_4_0, arg_4_2:Find("icon"))

	local var_4_1 = var_4_0 == 1
	local var_4_2 = arg_4_0.stageAchvs[var_4_0]

	arg_4_2.name = var_4_2.id

	setActive(arg_4_2:Find("line"), not var_4_1)

	local var_4_3 = var_4_2:GetStatus() == IslandAchievement.STATUS.GOT

	setActive(arg_4_2:Find("line/got"), var_4_3)
	setActive(arg_4_2:Find("circle/got"), var_4_3)
end

function var_0_0.UpdateAwardItem(arg_5_0, arg_5_1, arg_5_2)
	local var_5_0 = arg_5_0.awards[arg_5_1 + 1]

	GetImageSpriteFromAtlasAsync(var_5_0:getIcon(), "", arg_5_2:Find("icon"))
	setText(arg_5_2:Find("count"), var_5_0.count)
end

function var_0_0.UpdataData(arg_6_0)
	setText(arg_6_0.nameTF, arg_6_0.achv:getConfig("name"))

	local var_6_0 = arg_6_0.achvAgency:GetCurProgress(arg_6_0.achv)
	local var_6_1 = arg_6_0.achv:GetNum()
	local var_6_2 = string.gsub(arg_6_0.achv:getConfig("desc"), "$1", var_6_0)
	local var_6_3 = string.gsub(var_6_2, "$2", var_6_1)

	setText(arg_6_0.descTF, var_6_3)

	local var_6_4 = arg_6_0.achv:GetStatus()

	setActive(arg_6_0.gotTF, var_6_4 == IslandAchievement.STATUS.GOT)
	setActive(arg_6_0.getBtn, var_6_4 == IslandAchievement.STATUS.GET)

	local var_6_5 = var_6_4 == IslandAchievement.STATUS.NORMAL

	setActive(arg_6_0.goTF, var_6_5)

	if var_6_5 then
		setText(arg_6_0.goTF:Find("Text"), var_6_0 .. "/" .. var_6_1)
	end

	arg_6_0.awards = arg_6_0.achv:GetAwards()

	arg_6_0.awardUIList:align(#arg_6_0.awards)
end

function var_0_0.Update(arg_7_0, arg_7_1)
	arg_7_0.achv = arg_7_1
	arg_7_0.achvAgency = getProxy(IslandProxy):GetIsland():GetAchievementAgency()

	arg_7_0:UpdataData()

	local var_7_0 = arg_7_0.achv:getConfig("group")
	local var_7_1 = arg_7_0.achvAgency:GetGroup(var_7_0)

	arg_7_0.stageAchvs = underscore.select(var_7_1:GetSortAchvList(), function(arg_8_0)
		return not arg_8_0:IsHideType() or arg_8_0:GetStatus() == IslandAchievement.STATUS.GET
	end)

	arg_7_0.stageUIList:align(#arg_7_0.stageAchvs)
end

function var_0_0.PlayStageAnim(arg_9_0, arg_9_1, arg_9_2)
	local var_9_0 = arg_9_0.stageUIList.container:Find(tostring(arg_9_1))
	local var_9_1 = var_9_0:GetComponent(typeof(DftAniEvent))

	var_9_1:SetEndEvent(function()
		existCall(arg_9_2)
		var_9_1:SetEndEvent(nil)
	end)
	var_9_0:GetComponent(typeof(Animation)):Play()
end

function var_0_0.Dispose(arg_11_0)
	return
end

return var_0_0
