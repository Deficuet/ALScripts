local var_0_0 = class("NewEducateNodePanel", import("view.base.BaseSubView"))

var_0_0.NODE_TYPE = {
	MAIN_OPTION = 104,
	EVENT_TEXT = 100,
	DROP = 102,
	STORY_BRANCH = 2,
	EVENT_OPTION = 101,
	MAIN_TEXT = 103,
	PERFORMANCE = 1
}
var_0_0.NEXT_TYPE = {
	OPTION = 2,
	NOMARL = 1,
	STORY_FLAG = 4,
	PROBABILITY = 3
}
var_0_0.DROP_TYPE = {
	WORD_PERFORMANCE = 1,
	POLAROID = 4,
	EVENT = 3,
	MAIN_TIP = 2,
	DROP_LAYER = 5
}

function var_0_0.getUIName(arg_1_0)
	return "NewEducateNodeUI"
end

function var_0_0.OnLoaded(arg_2_0)
	warning("onloaded")
	eachChild(arg_2_0._tf, function(arg_3_0)
		setActive(arg_3_0, false)
	end)

	arg_2_0.loopCpkTF = arg_2_0._tf:Find("cpk_bg")
	arg_2_0.loopCpkTF:GetComponent(typeof(Image)).enabled = false
	arg_2_0.loopCpkPlayer = arg_2_0.loopCpkTF:Find("cpk/usm"):GetComponent(typeof(CriManaCpkUI))

	arg_2_0.loopCpkPlayer:SetMaxFrameDrop(CriWare.CriManaMovieMaterialBase.MaxFrameDrop.Infinite)

	arg_2_0.cpkHandler = NewEducateCpkHandler.New(arg_2_0._tf:Find("cpk"))
	arg_2_0.pictureHandler = NewEducatePictureHandler.New(arg_2_0._tf:Find("picture"))
	arg_2_0.wordHandler = NewEducateWordHandler.New(arg_2_0._tf:Find("dialogue"))
	arg_2_0.dropHandler = NewEducateDropHandler.New(arg_2_0._tf:Find("drop"))
	arg_2_0.siteHandler = NewEducateSiteHandler.New(arg_2_0._tf:Find("site"))
	arg_2_0.optionsHandler = NewEducateOptionsHandler.New(arg_2_0._tf:Find("options"))
	arg_2_0.scheduleTF = arg_2_0._tf:Find("scheduleBg")

	setText(arg_2_0.scheduleTF:Find("root/window/left/title/Text"), i18n("child_plan_perform_title"))

	local var_2_0 = arg_2_0.scheduleTF:Find("root/window/left/content")

	arg_2_0.planUIList = UIItemList.New(var_2_0, var_2_0:Find("tpl"))
end

function var_0_0.OnInit(arg_4_0)
	arg_4_0.siteHandler:BindEndBtn(function()
		arg_4_0:Hide()
	end, arg_4_0.contextData.onSiteEnd, arg_4_0.contextData.onNormal)
	arg_4_0.planUIList:make(function(arg_6_0, arg_6_1, arg_6_2)
		if arg_6_0 == UIItemList.EventInit then
			local var_6_0 = arg_4_0.plans[arg_6_1 + 1]

			setActive(arg_6_2:Find("icon"), var_6_0)

			if var_6_0 then
				local var_6_1 = "plan_type" .. pg.child2_plan[var_6_0].replace_type_show

				LoadImageSpriteAtlasAsync("ui/neweducatecommonui_atlas", var_6_1, arg_6_2:Find("icon"))
			end
		elseif arg_6_0 == UIItemList.EventUpdate then
			arg_6_1 = arg_6_1 + 1

			local var_6_2 = arg_4_0.plans[arg_6_1]

			if var_6_2 then
				setText(arg_6_2:Find("Text"), shortenString(pg.child2_plan[var_6_2].name_2, 4))

				local var_6_3 = arg_6_1 > arg_4_0.curPlanIdx and "808182" or "ffffff"

				if arg_6_1 == arg_4_0.curPlanIdx then
					var_6_3 = "29bfff"
				end

				setTextColor(arg_6_2:Find("Text"), Color.NewHex(var_6_3))
				setActive(arg_6_2:Find("selected"), arg_6_1 == arg_4_0.curPlanIdx)
			else
				setText(arg_6_2:Find("Text"), i18n("child2_empty_plan"))
				setActive(arg_6_2:Find("selected"), false)
			end
		end
	end)
	arg_4_0:OverlayPanel(arg_4_0._tf, {
		groupDelta = 2
	})
end

function var_0_0.PlayLoopCpk(arg_7_0, arg_7_1)
	arg_7_0.loopCpkPlayer.cpkPath = string.lower("OriginSource/cpk/" .. arg_7_1 .. ".cpk")
	arg_7_0.loopCpkPlayer.movieName = string.lower(arg_7_1 .. ".bytes")

	arg_7_0.loopCpkPlayer:StopCpk()
	arg_7_0.loopCpkPlayer:SetCpkTotalTimeCallback(function(arg_8_0)
		arg_7_0.loopCpkTF:GetComponent(typeof(Image)).enabled = true
	end)
	setActive(arg_7_0.loopCpkTF, true)
	arg_7_0.loopCpkPlayer:PlayCpk()
end

function var_0_0.StopLoopCpk(arg_9_0)
	setActive(arg_9_0.loopCpkTF, false)

	arg_9_0.loopCpkTF:GetComponent(typeof(Image)).enabled = false
end

function var_0_0.StartNode(arg_10_0, arg_10_1)
	warning("startnode")
	arg_10_0:Show()

	arg_10_0.stystemNo = arg_10_0.contextData.char:GetFSM():GetStystemNo()

	setActive(arg_10_0.scheduleTF, arg_10_0.stystemNo == NewEducateFSM.STYSTEM.PLAN)

	if arg_10_0.stystemNo == NewEducateFSM.STYSTEM.MAP then
		local var_10_0 = arg_10_0.contextData.char:GetFSM():GetState(NewEducateFSM.STYSTEM.MAP):GetCurSiteId()

		arg_10_0.siteHandler:SetSite(var_10_0)

		local var_10_1 = pg.child2_site_display[var_10_0].type
		local var_10_2 = 0

		if var_10_1 == NewEducateConst.SITE_TYPE.WORK then
			var_10_2 = arg_10_0.contextData.char:GetNormalIdByType(NewEducateConst.SITE_NORMAL_TYPE.WORK)
		elseif var_10_1 == NewEducateConst.SITE_TYPE.TRAVEL then
			var_10_2 = arg_10_0.contextData.char:GetNormalIdByType(NewEducateConst.SITE_NORMAL_TYPE.TRAVEL)
		end

		if var_10_2 ~= 0 then
			local var_10_3 = arg_10_0.contextData.char:GetRoundData():getConfig("stage")

			arg_10_0:PlayLoopCpk(pg.child2_site_normal[var_10_2].cpk[var_10_3])
		end
	end

	arg_10_0:ProceedNode(arg_10_1)
end

function var_0_0.OnNodeChainEnd(arg_11_0)
	setActive(arg_11_0.loopCpkTF, false)

	if arg_11_0.stystemNo == NewEducateFSM.STYSTEM.MAP then
		arg_11_0.cpkHandler:Reset()
		arg_11_0.pictureHandler:Reset()
		arg_11_0.wordHandler:Reset()
		arg_11_0.dropHandler:Reset()
		arg_11_0.siteHandler:OnEventEnd()
	elseif arg_11_0.stystemNo == NewEducateFSM.STYSTEM.PLAN then
		if arg_11_0.contextData.char:GetFSM():GetState(NewEducateFSM.STYSTEM.PLAN):IsFinish() then
			arg_11_0:Hide()
		end
	else
		arg_11_0:Hide()
	end
end

function var_0_0.InitCallback(arg_12_0, arg_12_1)
	arg_12_0.callback = nil

	switch(arg_12_1, {
		[var_0_0.NEXT_TYPE.NOMARL] = function()
			function arg_12_0.callback()
				pg.m02:sendNotification(GAME.NEW_EDUCATE_TRIGGER_NODE, {
					id = arg_12_0.contextData.char.id
				})
			end
		end,
		[var_0_0.NEXT_TYPE.PROBABILITY] = function()
			function arg_12_0.callback()
				pg.m02:sendNotification(GAME.NEW_EDUCATE_TRIGGER_NODE, {
					id = arg_12_0.contextData.char.id
				})
			end
		end,
		[var_0_0.NEXT_TYPE.OPTION] = function()
			function arg_12_0.callback(arg_18_0, arg_18_1)
				pg.m02:sendNotification(GAME.NEW_EDUCATE_TRIGGER_NODE, {
					id = arg_12_0.contextData.char.id,
					branch = arg_18_0,
					costs = arg_18_1
				})
			end
		end,
		[var_0_0.NEXT_TYPE.STORY_FLAG] = function()
			function arg_12_0.callback(arg_20_0)
				pg.m02:sendNotification(GAME.NEW_EDUCATE_TRIGGER_NODE, {
					id = arg_12_0.contextData.char.id,
					branch = arg_20_0
				})
			end
		end
	}, function()
		assert(false, "node表非法next_type: " .. arg_12_1)
	end)
end

function var_0_0.CheckSchedule(arg_22_0)
	if arg_22_0.stystemNo == NewEducateFSM.STYSTEM.PLAN then
		local var_22_0 = arg_22_0.contextData.char:GetFSM():GetState(NewEducateFSM.STYSTEM.PLAN)

		arg_22_0.unlockPlanNum = arg_22_0.contextData.char:GetRoundData():getConfig("plan_num")
		arg_22_0.plans = var_22_0:GetPlans()
		arg_22_0.curPlanIdx = var_22_0:GetCurIdx()

		arg_22_0.planUIList:align(arg_22_0.unlockPlanNum)
	end
end

function var_0_0.CheckLastDrops(arg_23_0, arg_23_1, arg_23_2)
	if not arg_23_0.curNodeId or not arg_23_1 or #arg_23_1 == 0 then
		arg_23_2()
	else
		local var_23_0 = pg.child2_node[arg_23_0.curNodeId]
		local var_23_1 = var_23_0.drop_type_client

		switch(var_23_1, {
			[var_0_0.DROP_TYPE.WORD_PERFORMANCE] = function()
				if arg_23_0.stystemNo == NewEducateFSM.STYSTEM.PLAN then
					arg_23_0.contextData.char:GetFSM():GetState(NewEducateFSM.STYSTEM.PLAN):AddDrops(arg_23_1)
				end

				arg_23_0.wordHandler:Play(var_23_0.performance_param[1], arg_23_2, arg_23_1, false)
			end,
			[var_0_0.DROP_TYPE.MAIN_TIP] = function()
				arg_23_0.dropHandler:Play(arg_23_1, arg_23_2)
				arg_23_0.wordHandler:Reset()
			end,
			[var_0_0.DROP_TYPE.EVENT] = function()
				seriesAsync({
					function(arg_27_0)
						local var_27_0 = underscore.select(arg_23_1, function(arg_28_0)
							return arg_28_0.type == NewEducateConst.DROP_TYPE.BUFF
						end)

						if #var_27_0 > 0 then
							arg_23_0:emit(NewEducateBaseUI.ON_DROP, {
								items = var_27_0,
								removeFunc = arg_27_0
							})
						else
							arg_27_0()
						end
					end
				}, function()
					arg_23_0.siteHandler:Play(arg_23_0.curNodeId, arg_23_2, arg_23_1)
				end)
			end,
			[var_0_0.DROP_TYPE.POLAROID] = function()
				arg_23_0:StopLoopCpk()
				arg_23_0.cpkHandler:Reset()
				arg_23_0.wordHandler:Reset()

				local var_30_0 = {}

				for iter_30_0, iter_30_1 in ipairs(arg_23_1) do
					assert(iter_30_1.type == NewEducateConst.DROP_TYPE.POLAROID, "drop_type_client4的掉落必须为大头贴")
					table.insert(var_30_0, function(arg_31_0)
						arg_23_0.dropHandler:PlayPolaroid(iter_30_1, arg_31_0)
					end)
					table.insert(var_30_0, function(arg_32_0)
						local var_32_0 = pg.child2_polaroid[iter_30_1.id].desc

						if #var_32_0 > 0 then
							arg_23_0.wordHandler:PlayWordIds(var_32_0, arg_32_0)
						else
							arg_32_0()
						end
					end)
				end

				seriesAsync(var_30_0, function()
					existCall(arg_23_2)

					if #arg_23_1 > 0 then
						pg.TipsMgr.GetInstance():ShowTips(i18n("child_polaroid_get_tip"))
					end
				end)
			end,
			[var_0_0.DROP_TYPE.DROP_LAYER] = function()
				arg_23_0:emit(NewEducateBaseUI.ON_DROP, {
					items = arg_23_1,
					removeFunc = arg_23_2
				})
			end
		}, function()
			assert(false, "node表非法drop_type_client: " .. var_23_1 .. ",node:" .. arg_23_0.curNodeId)
		end)

		if arg_23_0.stystemNo == NewEducateFSM.STYSTEM.MAP and var_23_1 == var_0_0.DROP_TYPE.WORD_PERFORMANCE then
			arg_23_0.siteHandler:AddDropRecords(arg_23_1)
		end
	end
end

function var_0_0.ProceedNode(arg_36_0, arg_36_1, arg_36_2, arg_36_3)
	seriesAsync({
		function(arg_37_0)
			arg_36_0:CheckLastDrops(arg_36_2, arg_37_0)
		end
	}, function()
		arg_36_0:_ProceedNode(arg_36_1, arg_36_2, arg_36_3)
	end)
end

function var_0_0._ProceedNode(arg_39_0, arg_39_1, arg_39_2, arg_39_3)
	arg_39_0.curNodeId = arg_39_1

	if arg_39_0.curNodeId == 0 then
		existCall(arg_39_3)
		arg_39_0:OnNodeChainEnd()

		return
	end

	arg_39_0:CheckSchedule()

	local var_39_0 = pg.child2_node[arg_39_1]

	arg_39_0:InitCallback(var_39_0.next_type)
	originalPrint("ProceedNode", arg_39_1)
	switch(var_39_0.type, {
		[var_0_0.NODE_TYPE.PERFORMANCE] = function()
			arg_39_0:PlayPerformances(var_39_0.performance_type, var_39_0.performance_param, arg_39_0.callback)
		end,
		[var_0_0.NODE_TYPE.DROP] = function()
			arg_39_0.callback()
		end,
		[var_0_0.NODE_TYPE.STORY_BRANCH] = function()
			arg_39_0:PlayStoryBranch(var_39_0.performance_param, function(arg_43_0)
				arg_39_0.callback(arg_43_0)
			end)
		end,
		[var_0_0.NODE_TYPE.EVENT_TEXT] = function()
			arg_39_0.siteHandler:Play(arg_39_1, arg_39_0.callback)
		end,
		[var_0_0.NODE_TYPE.EVENT_OPTION] = function()
			arg_39_0.siteHandler:Play(arg_39_1, arg_39_0.callback)
		end,
		[var_0_0.NODE_TYPE.MAIN_TEXT] = function()
			local var_46_0 = arg_39_0:_IsShowNextInMainText(var_39_0)

			if var_39_0.next_type == var_0_0.NEXT_TYPE.OPTION then
				local function var_46_1()
					arg_39_0.optionsHandler:Play(var_39_0.next, arg_39_0.callback)
				end

				arg_39_0.wordHandler:Play(tonumber(var_39_0.text), var_46_1, nil, var_46_0, true)
			else
				arg_39_0.wordHandler:Play(tonumber(var_39_0.text), arg_39_0.callback, nil, var_46_0, true)
			end
		end,
		[var_0_0.NODE_TYPE.MAIN_OPTION] = function()
			arg_39_0.callback()
		end
	}, function()
		assert(false, "node表非法type: " .. var_39_0.type)
	end)
end

function var_0_0._IsShowNextInMainText(arg_50_0, arg_50_1)
	if arg_50_1.next == "" then
		return false
	end

	if arg_50_1.next_type == var_0_0.NEXT_TYPE.NOMARL then
		local var_50_0 = tonumber(arg_50_1.next)

		return pg.child2_node[var_50_0].type ~= var_0_0.NODE_TYPE.DROP
	end

	return true
end

function var_0_0.PlayPerformances(arg_51_0, arg_51_1, arg_51_2, arg_51_3)
	switch(arg_51_1, {
		[NewEducateConst.PERFORM_TYPE.CPK] = function()
			arg_51_0.wordHandler:Reset()

			local var_52_0 = arg_51_0.contextData.char:GetRoundData():getConfig("stage")
			local var_52_1 = ""

			if arg_51_0.stystemNo == NewEducateFSM.STYSTEM.PLAN then
				local var_52_2 = arg_51_0.plans[arg_51_0.curPlanIdx]

				var_52_1 = pg.child2_plan[var_52_2].name
			end

			arg_51_0.cpkHandler:SetUIParam(arg_51_0.stystemNo == NewEducateFSM.STYSTEM.PLAN)
			arg_51_0.cpkHandler:Play(arg_51_2[var_52_0], arg_51_3, var_52_1)
		end,
		[NewEducateConst.PERFORM_TYPE.PICTURE] = function()
			arg_51_0.wordHandler:Reset()
			arg_51_0.pictureHandler:Play(arg_51_2, arg_51_3)
		end,
		[NewEducateConst.PERFORM_TYPE.WORD] = function()
			local var_54_0 = pg.child2_node[arg_51_0.curNodeId].next == ""

			arg_51_0.wordHandler:Play(arg_51_2[1], arg_51_3, nil, not var_54_0, true)
		end,
		[NewEducateConst.PERFORM_TYPE.STORY] = function()
			NewEducateHelper.PlaySpecialStory(arg_51_2, function(arg_56_0, arg_56_1)
				arg_51_3(arg_56_1)
			end, true)
		end
	}, function()
		assert(false, "node表非法performance_type: " .. arg_51_1)
	end)
end

function var_0_0.PlayStoryBranch(arg_58_0, arg_58_1, arg_58_2)
	NewEducateHelper.PlaySpecialStory(arg_58_1, function(arg_59_0, arg_59_1)
		arg_58_2(arg_59_1)
	end, true)
end

function var_0_0.PlayWordIds(arg_60_0, arg_60_1, arg_60_2)
	arg_60_0:Show()
	arg_60_0.wordHandler:PlayWordIds(arg_60_1, function()
		arg_60_0.wordHandler:Reset()
		arg_60_0.super.Hide(arg_60_0)
		existCall(arg_60_2)
	end)
end

function var_0_0.UpdateCallName(arg_62_0)
	arg_62_0.wordHandler:UpdateCallName()
	arg_62_0.siteHandler:UpdateCallName()
	arg_62_0.optionsHandler:UpdateCallName()
end

function var_0_0.Hide(arg_63_0)
	existCall(arg_63_0.contextData.onHide)
	arg_63_0:StopLoopCpk()
	arg_63_0.cpkHandler:Reset()
	arg_63_0.pictureHandler:Reset()
	arg_63_0.wordHandler:Reset()
	arg_63_0.dropHandler:Reset()
	arg_63_0.siteHandler:Reset()
	arg_63_0.optionsHandler:Reset()
	arg_63_0.super.Hide(arg_63_0)
end

function var_0_0.OnDestroy(arg_64_0)
	arg_64_0:UnOverlayPanel(arg_64_0._tf, arg_64_0._parentTf)

	if arg_64_0.cpkHandler then
		arg_64_0.cpkHandler:Destroy()
	else
		warning("not exist self.cpkHandler")
	end

	if arg_64_0.pictureHandler then
		arg_64_0.pictureHandler:Destroy()
	else
		warning("not exist self.pictureHandler")
	end

	if arg_64_0.wordHandler then
		arg_64_0.wordHandler:Destroy()
	else
		warning("not exist self.wordHandler")
	end

	if arg_64_0.dropHandler then
		arg_64_0.dropHandler:Destroy()
	else
		warning("not exist self.dropHandler")
	end

	if arg_64_0.siteHandler then
		arg_64_0.siteHandler:Destroy()
	else
		warning("not exist self.siteHandler")
	end

	if arg_64_0.optionsHandler then
		arg_64_0.optionsHandler:Destroy()
	else
		warning("not exist self.optionsHandler")
	end
end

return var_0_0
