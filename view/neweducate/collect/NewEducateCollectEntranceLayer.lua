local var_0_0 = class("NewEducateCollectEntranceLayer", import("view.base.BaseUI"))

function var_0_0.getUIName(arg_1_0)
	return "NewEducateCollectEntranceUI"
end

function var_0_0.getGroupName(arg_2_0)
	return "NewEducateBaseUI"
end

function var_0_0.init(arg_3_0)
	arg_3_0.anim = arg_3_0._tf:Find("anim_root"):GetComponent(typeof(Animation))
	arg_3_0.animEvent = arg_3_0._tf:Find("anim_root"):GetComponent(typeof(DftAniEvent))

	arg_3_0.animEvent:SetEndEvent(function()
		arg_3_0:emit(var_0_0.ON_CLOSE)
	end)

	arg_3_0.contentTF = arg_3_0._tf:Find("anim_root/content")
	arg_3_0.contentTF.offsetMin = Vector2(arg_3_0.contextData.isSelect and 208 or 0, 0)
	arg_3_0.contentTF.offsetMax = Vector2(0, 0)
	arg_3_0.memoryBtn = arg_3_0.contentTF:Find("memory_btn")
	arg_3_0.polaroidBtn = arg_3_0.contentTF:Find("polaroid_btn")
	arg_3_0.endingBtn = arg_3_0.contentTF:Find("ending_btn")
	arg_3_0.reviewBtn = arg_3_0.contentTF:Find("review_btn")
	arg_3_0.leftTF = arg_3_0._tf:Find("anim_root/left")
	arg_3_0.togglesTF = arg_3_0.leftTF:Find("toggles")
	arg_3_0.ids = {
		0
	}
	arg_3_0.ids = table.mergeArray(arg_3_0.ids, pg.child2_data.all)
	arg_3_0.toggleList = UIItemList.New(arg_3_0.togglesTF, arg_3_0.togglesTF:Find("tpl"))
end

function var_0_0.didEnter(arg_5_0)
	arg_5_0:BlurPanel(arg_5_0._tf)
	onButton(arg_5_0, arg_5_0._tf, function()
		arg_5_0:_close()
	end, SFX_PANEL)
	onButton(arg_5_0, arg_5_0.memoryBtn, function()
		if arg_5_0.contextData.id == 0 then
			arg_5_0:emit(NewEducateCollectEntranceMediator.GO_SUBLAYER, Context.New({
				mediator = EducateCollectMediatorTemplate,
				viewComponent = EducateMemoryLayer
			}))
		else
			arg_5_0:emit(NewEducateCollectEntranceMediator.GO_SUBLAYER, Context.New({
				mediator = NewEducateCollectMediatorTemplate,
				viewComponent = NewEducateMemoryLayer,
				data = {
					permanentData = arg_5_0.permanentData
				}
			}))
		end
	end, SFX_PANEL)
	onButton(arg_5_0, arg_5_0.polaroidBtn, function()
		if arg_5_0.contextData.id == 0 then
			if isActive(arg_5_0.polaroidBtn:Find("lock")) then
				return
			end

			arg_5_0:emit(NewEducateCollectEntranceMediator.GO_SUBLAYER, Context.New({
				mediator = EducateCollectMediatorTemplate,
				viewComponent = EducatePolaroidLayer
			}))
			setActive(arg_5_0.polaroidBtn:Find("new"), false)
		else
			arg_5_0:emit(NewEducateCollectEntranceMediator.GO_SUBLAYER, Context.New({
				mediator = NewEducateCollectMediatorTemplate,
				viewComponent = NewEducatePolaroidLayer,
				data = {
					permanentData = arg_5_0.permanentData
				}
			}))
		end
	end, SFX_PANEL)
	onButton(arg_5_0, arg_5_0.endingBtn:Find("unlock"), function()
		if arg_5_0.contextData.id == 0 then
			if isActive(arg_5_0.endingBtn:Find("lock")) then
				return
			end

			arg_5_0:emit(NewEducateCollectEntranceMediator.GO_SUBLAYER, Context.New({
				mediator = EducateCollectMediatorTemplate,
				viewComponent = EducateEndingLayer
			}))
		else
			arg_5_0:emit(NewEducateCollectEntranceMediator.GO_SUBLAYER, Context.New({
				mediator = NewEducateCollectMediatorTemplate,
				viewComponent = NewEducateEndingLayer,
				data = {
					permanentData = arg_5_0.permanentData
				}
			}))
		end
	end, SFX_PANEL)
	onButton(arg_5_0, arg_5_0.reviewBtn, function()
		if arg_5_0.contextData.id == 0 then
			arg_5_0:emit(var_0_0.ON_CLOSE)
			pg.m02:sendNotification(GAME.GO_SCENE, SCENE.WORLD_COLLECTION, {
				page = WorldMediaCollectionScene.PAGE_MEMORTY,
				memoryGroup = EducateConst.REVIEW_GROUP_ID
			})
		else
			local var_10_0 = pg.child2_data[arg_5_0.contextData.id].memory_group

			arg_5_0:emit(var_0_0.ON_CLOSE)
			pg.m02:sendNotification(GAME.GO_SCENE, SCENE.WORLD_COLLECTION, {
				page = WorldMediaCollectionScene.PAGE_MEMORTY,
				memoryGroup = var_10_0
			})
		end
	end, SFX_PANEL)
	arg_5_0.toggleList:make(function(arg_11_0, arg_11_1, arg_11_2)
		if arg_11_0 == UIItemList.EventInit then
			local var_11_0 = arg_5_0.ids[arg_11_1 + 1]

			arg_11_2.name = var_11_0

			local var_11_1 = var_11_0 == 0 and "linghangyuan1_1" or pg.child2_data[var_11_0].head

			LoadImageSpriteAsync("qicon/" .. var_11_1, arg_11_2:Find("icon"))
			onToggle(arg_5_0, arg_11_2, function(arg_12_0)
				if arg_12_0 then
					arg_5_0.contextData.id = var_11_0

					if arg_5_0.contextData.id == 0 then
						arg_5_0:FlushTBView()
					else
						arg_5_0:FlushView(arg_5_0.contextData.id)
					end
				end
			end, SFX_PANEL)
		end
	end)
	arg_5_0.toggleList:align(#arg_5_0.ids)
	setActive(arg_5_0.leftTF, arg_5_0.contextData.isSelect)

	if arg_5_0.contextData.isSelect then
		triggerToggle(arg_5_0.togglesTF:Find(tostring(arg_5_0.contextData.id)), true)
	else
		arg_5_0:FlushView(arg_5_0.contextData.id)
	end
end

function var_0_0.FlushView(arg_13_0, arg_13_1)
	arg_13_0.permanentData = getProxy(NewEducateProxy):GetChar(arg_13_1):GetPermanentData()

	local var_13_0 = #arg_13_0.permanentData:GetUnlockMemoryIds()
	local var_13_1 = #arg_13_0.permanentData:GetAllMemoryIds()

	setText(arg_13_0.memoryBtn:Find("Text"), var_13_0 .. "/" .. var_13_1)
	setActive(arg_13_0.memoryBtn:Find("new"), false)

	local var_13_2 = #arg_13_0.permanentData:GetUnlockPolaroidGroups()
	local var_13_3 = #arg_13_0.permanentData:GetAllPolaroidGroups()

	setActive(arg_13_0.polaroidBtn:Find("lock"), false)
	setText(arg_13_0.polaroidBtn:Find("Text"), var_13_2 .. "/" .. var_13_3)
	setActive(arg_13_0.polaroidBtn:Find("new"), false)

	local var_13_4 = #arg_13_0.permanentData:GetActivatedEndings()
	local var_13_5 = #arg_13_0.permanentData:GetAllEndingIds()

	setText(arg_13_0.endingBtn:Find("unlock/Text"), var_13_4 .. "/" .. var_13_5)

	local var_13_6 = NewEducateConst.LOCK_ENDING and arg_13_0.permanentData:GetGameCnt()

	setActive(arg_13_0.endingBtn:Find("unlock"), not var_13_6)
	setActive(arg_13_0.endingBtn:Find("lock"), var_13_6)
end

function var_0_0.FlushTBView(arg_14_0)
	local var_14_0 = getProxy(EducateProxy)
	local var_14_1 = var_14_0:GetMemories()
	local var_14_2 = var_14_0:GetFinishEndings()
	local var_14_3 = #pg.child_memory.all

	setText(arg_14_0.memoryBtn:Find("Text"), #var_14_1 .. "/" .. var_14_3)
	arg_14_0:UpdateMemoryTip()

	local var_14_4, var_14_5 = var_14_0:GetPolaroidGroupCnt()

	setText(arg_14_0.polaroidBtn:Find("Text"), var_14_4 .. "/" .. var_14_5)
	setActive(arg_14_0.polaroidBtn:Find("lock"), not EducateHelper.IsSystemUnlock(EducateConst.SYSTEM_POLAROID))
	setActive(arg_14_0.polaroidBtn:Find("new"), EducateTipHelper.IsShowNewTip(EducateTipHelper.NEW_POLAROID))

	local var_14_6 = #pg.child_ending.all

	setText(arg_14_0.endingBtn:Find("unlock/Text"), #var_14_2 .. "/" .. var_14_6)

	local var_14_7 = EducateHelper.IsSystemUnlock(EducateConst.SYSTEM_ENDING) or #var_14_2 > 0

	setActive(arg_14_0.endingBtn:Find("unlock"), var_14_7)
	setActive(arg_14_0.endingBtn:Find("lock"), not var_14_7)
end

function var_0_0.UpdateMemoryTip(arg_15_0)
	local var_15_0 = underscore.any(pg.child_memory.all, function(arg_16_0)
		return EducateTipHelper.IsShowNewTip(EducateTipHelper.NEW_MEMORY, arg_16_0)
	end)

	setActive(arg_15_0.memoryBtn:Find("new"), var_15_0)
end

function var_0_0._close(arg_17_0)
	arg_17_0.anim:Play("anim_educate_collectentrance_out")
end

function var_0_0.onBackPressed(arg_18_0)
	arg_18_0:_close()
end

function var_0_0.willExit(arg_19_0)
	arg_19_0.animEvent:SetEndEvent(nil)
	arg_19_0:UnOverlayPanel(arg_19_0._tf)
end

return var_0_0
