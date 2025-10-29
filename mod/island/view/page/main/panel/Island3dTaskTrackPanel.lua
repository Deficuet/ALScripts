local var_0_0 = class("Island3dTaskTrackPanel", import("view.base.BaseSubView"))

function var_0_0.getUIName(arg_1_0)
	return "Island3dTaskTrackPanel"
end

function var_0_0.OnLoaded(arg_2_0)
	arg_2_0.uiAnim = arg_2_0._tf:GetComponent(typeof(Animation))
	arg_2_0.uiAnimEvent = arg_2_0._tf:GetComponent(typeof(DftAniEvent))

	arg_2_0.uiAnimEvent:SetEndEvent(function()
		arg_2_0:Hide()
	end)

	arg_2_0.contentTF = arg_2_0._tf:Find("content")
	arg_2_0.iconTF = arg_2_0.contentTF:Find("title/icon")
	arg_2_0.nameTF = arg_2_0.contentTF:Find("title/name")
	arg_2_0.finishedTF = arg_2_0.contentTF:Find("target/finished")
	arg_2_0.unFinishTF = arg_2_0.contentTF:Find("target/unfinish")
	arg_2_0.targetUIList = UIItemList.New(arg_2_0.unFinishTF, arg_2_0.unFinishTF:Find("tpl"))
end

function var_0_0.OnInit(arg_4_0)
	arg_4_0.targetUIList:make(function(arg_5_0, arg_5_1, arg_5_2)
		if arg_5_0 == UIItemList.EventUpdate then
			arg_4_0:UpdateTargetItem(arg_5_1, arg_5_2)
		end
	end)
	onButton(arg_4_0, arg_4_0.contentTF, function()
		if not getProxy(IslandProxy):GetIsland():GetTaskAgency():IsFinishTask(IslandGuideChecker.MOVE_TASK_ID) then
			return
		end

		arg_4_0:emit(IslandMediator.OPEN_PAGE, "Island3dTaskPage", {
			0,
			arg_4_0.task.id
		})
	end, SFX_PANEL)

	local var_4_0 = pg.island_set.main_page_function_unlock.key_value_varchar[2]

	arg_4_0.unlock = getProxy(IslandProxy):GetIsland():GetAblityAgency():HasAbility(var_4_0)
end

function var_0_0.UpdateTargetItem(arg_7_0, arg_7_1, arg_7_2)
	local var_7_0 = arg_7_0.task:GetTargetList()[arg_7_1 + 1]
	local var_7_1 = var_7_0:IsFinish()

	setActive(arg_7_2:Find("status/unfinish"), not var_7_1)
	setActive(arg_7_2:Find("status/finished"), var_7_1)

	if var_7_1 then
		arg_7_2:GetComponent(typeof(Animation)):Play("Island3dTaskTrackPanel_tpl_finish_in")
	else
		arg_7_2:GetComponent(typeof(Animation)):Play("Island3dTaskTrackPanel_tpl_unfinished_in")
	end

	GetOrAddComponent(arg_7_2:Find("content"), "CanvasGroup").alpha = var_7_1 and 0.5 or 1

	local var_7_2 = arg_7_0:GetMapTip(tonumber(var_7_0:GetTrackParma()))

	if var_7_2 and not var_7_1 then
		setText(arg_7_2:Find("content/Text"), var_7_2)
		setText(arg_7_2:Find("content/num"), "")
	else
		setText(arg_7_2:Find("content/Text"), HXSet.hxLan(var_7_0:getConfig("name")))

		local var_7_3 = var_7_0:GetProgress()
		local var_7_4 = var_7_0:GetTargetNum()

		setText(arg_7_2:Find("content/num"), string.format("(%d/%d)", var_7_3, var_7_4))
	end
end

function var_0_0.Show(arg_8_0)
	setActive(arg_8_0._tf, arg_8_0.unlock)
	arg_8_0:ShowOrHideResUI(true)
	arg_8_0:PlayBGM()
	arg_8_0:UpdateTask()
end

function var_0_0.PlayShowAnim(arg_9_0)
	arg_9_0.uiAnim:Play("Island3dTaskTrackPanel_in")
end

function var_0_0.UpdateTask(arg_10_0)
	arg_10_0.task = getProxy(IslandProxy):GetIsland():GetTaskAgency():GetTraceTask()

	if not arg_10_0.task then
		return
	end

	local var_10_0 = arg_10_0.task:GetShowType()

	GetImageSpriteFromAtlasAsync("island/islandtasktype", IslandTaskType.ShowTypeFields[var_10_0], arg_10_0.iconTF)
	setImageColor(arg_10_0.contentTF:Find("title/bg"), Color.NewHex(IslandTaskType.ShowTypeColors[var_10_0]))
	setText(arg_10_0.nameTF, HXSet.hxLan(arg_10_0.task:GetName()))
	arg_10_0:UpdateTarget()
	arg_10_0:TrackUI()

	if arg_10_0.unlock then
		arg_10_0:PlayShowAnim()
	end
end

function var_0_0.UpdateTarget(arg_11_0)
	local var_11_0 = not arg_11_0.task:IsSubmitImmediately() and arg_11_0.task:IsFinish()

	arg_11_0.targetUIList:align(#arg_11_0.task:GetTargetList())
	setActive(arg_11_0.finishedTF, var_11_0)

	if var_11_0 then
		local var_11_1 = arg_11_0:GetMapTip(tonumber(arg_11_0.task:GetTraceParam()))

		if var_11_1 then
			setText(arg_11_0.finishedTF:Find("Text"), var_11_1)
		else
			setText(arg_11_0.finishedTF:Find("Text"), HXSet.hxLan(arg_11_0.task:GetFinishedDesc()))
		end
	end
end

function var_0_0.UpdateProgress(arg_12_0)
	arg_12_0.task = getProxy(IslandProxy):GetIsland():GetTaskAgency():GetTraceTask()

	if not arg_12_0.task then
		return
	end

	arg_12_0:UpdateTarget()
	arg_12_0:TrackUI()
end

function var_0_0.TrackUI(arg_13_0)
	if not arg_13_0.unlock then
		return
	end

	local var_13_0 = arg_13_0.task:GetTraceParam()
	local var_13_1 = tonumber(var_13_0)

	if var_13_1 then
		if _IslandCore then
			_IslandCore:GetController():NotifiyCore(ISLAND_EVT.TRACKING, {
				id = var_13_1,
				typ = arg_13_0.task:GetType()
			})
		end
	else
		arg_13_0:UnTrackUI()
	end
end

function var_0_0.GetMapTip(arg_14_0, arg_14_1)
	if not arg_14_1 then
		return nil
	end

	local var_14_0 = pg.island_world_objects[arg_14_1]

	if not var_14_0 then
		return nil
	end

	if getProxy(IslandProxy):GetIsland():GetMapId() == var_14_0.mapId then
		return nil
	end

	return i18n("island_word_go") .. pg.island_map[var_14_0.mapId].name
end

function var_0_0.UnTrackUI(arg_15_0)
	if not arg_15_0.unlock then
		return
	end

	if _IslandCore then
		_IslandCore:GetController():NotifiyCore(ISLAND_EVT.UNTRACKING)
	end
end

function var_0_0.RemoveTask(arg_16_0)
	arg_16_0:emit(IslandMediator.ON_SET_TRACE_ID, 0)
	arg_16_0:UnTrackUI()
	arg_16_0.uiAnim:Play("Island3dTaskTrackPanel_out")
end

function var_0_0.SetUnlock(arg_17_0)
	arg_17_0.unlock = true

	if arg_17_0.task then
		arg_17_0:UpdateTask()
	end
end

function var_0_0.Hide(arg_18_0)
	var_0_0.super.Hide(arg_18_0)
	arg_18_0:UnTrackUI()
end

function var_0_0.OnDestroy(arg_19_0)
	arg_19_0.uiAnimEvent:SetEndEvent(nil)
end

return var_0_0
