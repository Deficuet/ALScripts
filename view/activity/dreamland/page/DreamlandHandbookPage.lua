local var_0_0 = class("DreamlandHandbookPage", import("view.base.BaseSubView"))
local var_0_1 = 1
local var_0_2 = 2

function var_0_0.getUIName(arg_1_0)
	return "DreamlandHandbookUI"
end

function var_0_0.OnLoaded(arg_2_0)
	arg_2_0.closeBtn = arg_2_0:findTF("bg/close")
	arg_2_0.tags = {
		[var_0_1] = arg_2_0:findTF("bg/tags/area"),
		[var_0_2] = arg_2_0:findTF("bg/tags/ex")
	}
	arg_2_0.tagTip = {}

	for iter_2_0, iter_2_1 in pairs(arg_2_0.tags) do
		arg_2_0.tagTip[iter_2_0] = iter_2_1:Find("tip")
	end

	arg_2_0.mapContent = arg_2_0:findTF("bg/area/content")
	arg_2_0.mapNameTxt = arg_2_0:findTF("bg/area/content/name"):GetComponent(typeof(Text))
	arg_2_0.mapDescTxt = arg_2_0:findTF("bg/area/content/scrollrect/desc"):GetComponent(typeof(Text))
	arg_2_0.mapGoBtn = arg_2_0:findTF("bg/area/content/btn_go")
	arg_2_0.mapGetBtn = arg_2_0:findTF("bg/area/content/btn_get")
	arg_2_0.mapGotBtn = arg_2_0:findTF("bg/area/content/btn_got")
	arg_2_0.mapAwardList = UIItemList.New(arg_2_0:findTF("bg/area/content/awards/list"), arg_2_0:findTF("bg/area/content/awards/list/award"))
	arg_2_0.lineUIList = UIItemList.New(arg_2_0:findTF("bg/area/content/scrollrect/desc/lines"), arg_2_0:findTF("bg/area/content/scrollrect/desc/lines/tpl"))
	arg_2_0.exGoBtn = arg_2_0:findTF("bg/ex/content/btn_go")
	arg_2_0.exGetBtn = arg_2_0:findTF("bg/ex/content/btn_get")
	arg_2_0.exGotBtn = arg_2_0:findTF("bg/ex/content/btn_got")
	arg_2_0.exAwardList = UIItemList.New(arg_2_0:findTF("bg/ex/content/awards/list"), arg_2_0:findTF("bg/ex/content/awards/list/award"))
	arg_2_0.exContentList = UIItemList.New(arg_2_0:findTF("bg/ex/content/scrollrect/content"), arg_2_0:findTF("bg/ex/content/scrollrect/content/tpl"))
	arg_2_0.exContent = arg_2_0:findTF("bg/ex/content")
	arg_2_0.areaList = UIItemList.New(arg_2_0:findTF("bg/area/list"), arg_2_0:findTF("bg/area/list/1"))
	arg_2_0.exploreList = UIItemList.New(arg_2_0:findTF("bg/ex/list"), arg_2_0:findTF("bg/ex/list/tpl"))

	setText(arg_2_0:findTF("bg/tags/area/Text"), i18n("dreamland_label_area"))
	setText(arg_2_0:findTF("bg/tags/ex/Text"), i18n("dreamland_label_explore"))
	setText(arg_2_0:findTF("bg/ex/content/award_desc"), i18n("dreamland_label_explore_award_tip"))

	arg_2_0.tipTr = arg_2_0:findTF("tip")
	arg_2_0.tipTxt = arg_2_0.tipTr:Find("Text"):GetComponent(typeof(Text))
end

function var_0_0.OnInit(arg_3_0)
	onButton(arg_3_0, arg_3_0.closeBtn, function()
		arg_3_0:Hide()
	end, SFX_PANEL)
	onButton(arg_3_0, arg_3_0._tf, function()
		arg_3_0:Hide()
	end, SFX_PANEL)

	local var_3_0 = Color.New(0.5843138, 0.5843138, 0.5843138, 1)
	local var_3_1 = Color.New(1, 1, 1, 1)

	local function var_3_2(arg_6_0, arg_6_1)
		local var_6_0 = arg_6_0:Find("icon"):GetComponent(typeof(Image))
		local var_6_1 = arg_6_0:Find("Text"):GetComponent(typeof(Text))

		var_6_0.color = arg_6_1 and var_3_1 or var_3_0
		var_6_1.color = arg_6_1 and var_3_1 or var_3_0
	end

	for iter_3_0, iter_3_1 in pairs(arg_3_0.tags) do
		onToggle(arg_3_0, iter_3_1, function(arg_7_0)
			arg_3_0:SwitchPage(iter_3_0)
			var_3_2(iter_3_1, arg_7_0)
		end, SFX_PANEL)
		var_3_2(iter_3_1, false)
	end

	arg_3_0:bind(DreamlandScene.ON_DATA_UPDATE, function(arg_8_0, arg_8_1)
		arg_3_0:OnDataUpdate(arg_8_1)
	end)
end

function var_0_0.OnDataUpdate(arg_9_0, arg_9_1)
	arg_9_0.gameData = arg_9_1.data

	if not arg_9_0:isShowing() then
		return
	end

	if arg_9_1.cmd == DreamlandData.OP_GET_MAP_AWARD then
		arg_9_0:UpdateAreaPage()
	elseif arg_9_1.cmd == DreamlandData.OP_GET_EXPLORE_AWARD then
		arg_9_0:UpdateExplorePage()
	end

	arg_9_0:UpdateTip()
end

function var_0_0.Show(arg_10_0, arg_10_1)
	var_0_0.super.Show(arg_10_0)

	arg_10_0.gameData = arg_10_1
	arg_10_0.selectedMapId = 1
	arg_10_0.selectedExploreId = 1

	arg_10_0:UpdateTip()
	triggerToggle(arg_10_0.tags[1], true)
	pg.UIMgr.GetInstance():BlurPanel(arg_10_0._tf)
end

function var_0_0.UpdateTip(arg_11_0)
	setActive(arg_11_0.tagTip[var_0_1], arg_11_0.gameData:ExistAnyMapAward())
	setActive(arg_11_0.tagTip[var_0_2], arg_11_0.gameData:ExistAnyExploreAward())
end

function var_0_0.Hide(arg_12_0)
	var_0_0.super.Hide(arg_12_0)
	arg_12_0:RemoveHideTimer()
	pg.UIMgr.GetInstance():UnblurPanel(arg_12_0._tf, arg_12_0._parentTf)
end

function var_0_0.SwitchPage(arg_13_0, arg_13_1)
	if arg_13_1 == var_0_1 then
		arg_13_0:UpdateAreaPage()
	elseif arg_13_1 == var_0_2 then
		arg_13_0:HideTip()
		arg_13_0:UpdateExplorePage()

		if arg_13_0.gameData:MarkExploreState() then
			arg_13_0:UpdateTip()
		end
	end
end

function var_0_0.InitArea(arg_14_0, arg_14_1, arg_14_2)
	local var_14_0

	var_14_0.sprite, var_14_0 = GetSpriteFromAtlas("ui/DlHandBookUI_atlas", "area" .. arg_14_1), arg_14_2:GetComponent(typeof(Image))

	var_14_0:SetNativeSize()

	local var_14_1 = arg_14_2:Find("selected")

	onToggle(arg_14_0, arg_14_2, function(arg_15_0)
		if arg_15_0 then
			arg_14_0:UpdateArea(arg_14_1)
		end

		local var_15_0 = arg_15_0 and not arg_14_0.gameData:IsUnlockMap(arg_14_1)

		if var_15_0 and not arg_14_0.initFlag then
			arg_14_0:ShowTip(i18n("dreamland_area_lock_tip"))
		end

		if var_15_0 then
			setActive(var_14_1, false)
		end
	end, SFX_PANEL)
end

function var_0_0.GetLineCunt(arg_16_0, arg_16_1)
	local var_16_0 = arg_16_1.gameObject.transform.sizeDelta.y
	local var_16_1 = arg_16_0.lineUIList.container:GetComponent(typeof(VerticalLayoutGroup)).spacing

	return math.max(math.ceil(var_16_0 / var_16_1), 4)
end

function var_0_0.UpdateArea(arg_17_0, arg_17_1)
	local var_17_0 = arg_17_0.gameData:IsUnlockMap(arg_17_1)

	if not var_17_0 then
		setActive(arg_17_0.mapContent, false)

		return
	end

	setActive(arg_17_0.mapContent, true)

	arg_17_0.selectedMapId = arg_17_1

	local var_17_1 = arg_17_0.gameData:FindMap(arg_17_1)

	arg_17_0.mapNameTxt.text = var_17_1.name
	arg_17_0.mapDescTxt.text = HXSet.hxLan(var_17_1.desc)

	onNextTick(function()
		local var_18_0 = arg_17_0:GetLineCunt(arg_17_0.mapDescTxt)

		arg_17_0.lineUIList:align(var_18_0)
	end)

	local var_17_2 = arg_17_0.gameData:IsReceiveMapAward(arg_17_1)

	setActive(arg_17_0.mapGoBtn, not var_17_0)
	setActive(arg_17_0.mapGetBtn, var_17_0 and not var_17_2)
	setActive(arg_17_0.mapGotBtn, var_17_0 and var_17_2)

	local var_17_3 = var_17_1.unlock_drop_display

	arg_17_0.mapAwardList:make(function(arg_19_0, arg_19_1, arg_19_2)
		if arg_19_0 == UIItemList.EventUpdate then
			arg_17_0:UpdateDrop(arg_19_2, var_17_3[arg_19_1 + 1], var_17_0 and var_17_2)
		end
	end)
	arg_17_0.mapAwardList:align(#var_17_3)
	onButton(arg_17_0, arg_17_0.mapGetBtn, function()
		if var_17_0 and not var_17_2 then
			arg_17_0:CheckAwardOverflow(var_17_3, function()
				arg_17_0:emit(DreamlandMediator.GET_MAP_AWARD, arg_17_0.gameData:GetActivityId(), arg_17_1)
			end)
		end
	end, SFX_PANEL)
end

function var_0_0.InitAreaPage(arg_22_0)
	arg_22_0.areaTrs = {}

	local var_22_0 = arg_22_0.gameData:GetAllMapId()

	arg_22_0.areaList:make(function(arg_23_0, arg_23_1, arg_23_2)
		if arg_23_0 == UIItemList.EventUpdate then
			arg_22_0:InitArea(var_22_0[arg_23_1 + 1], arg_23_2)

			arg_22_0.areaTrs[var_22_0[arg_23_1 + 1]] = arg_23_2
		end
	end)
	arg_22_0.areaList:align(#var_22_0)
end

function var_0_0.UpdateAreaPage(arg_24_0)
	if not arg_24_0.isInitAreaPage then
		arg_24_0:InitAreaPage()

		arg_24_0.isInitAreaPage = true
	end

	for iter_24_0, iter_24_1 in pairs(arg_24_0.areaTrs) do
		local var_24_0 = arg_24_0.gameData:IsUnlockMap(iter_24_0)

		setActive(iter_24_1:Find("tip"), var_24_0 and not arg_24_0.gameData:IsReceiveMapAward(iter_24_0))
		setActive(iter_24_1:Find("mask"), not var_24_0)
	end

	arg_24_0.initFlag = true

	triggerToggle(arg_24_0.areaTrs[arg_24_0.selectedMapId], true)

	arg_24_0.initFlag = false
end

function var_0_0.InitExplore(arg_25_0, arg_25_1, arg_25_2)
	local var_25_0 = arg_25_0.gameData:FindMap(arg_25_2)
	local var_25_1

	var_25_1.sprite, var_25_1 = GetSpriteFromAtlas("ui/DlHandBookUI_atlas", "ex_print" .. arg_25_2), arg_25_1:Find("num"):GetComponent(typeof(Image))

	var_25_1:SetNativeSize()

	local var_25_2 = arg_25_1:Find("Text"):GetComponent(typeof(Text))
	local var_25_3 = Color.New(0.3058824, 0.3058824, 0.3607843)
	local var_25_4 = Color.New(0.145098, 0.3215686, 0.9254902)

	onToggle(arg_25_0, arg_25_1, function(arg_26_0)
		if arg_26_0 then
			arg_25_0:UpdateExplore(arg_25_2)
		end

		if arg_26_0 and not arg_25_0.gameData:IsUnlockMap(arg_25_2) then
			setActive(arg_25_1:Find("selected"), false)
		end

		var_25_2.color = arg_26_0 and var_25_4 or var_25_3
	end, SFX_PANEL)
	onButton(arg_25_0, arg_25_1:Find("lock"), function(arg_27_0)
		arg_25_0:ShowTip(i18n("dreamland_area_lock_tip"))
	end, SFX_PANEL)
end

function var_0_0.UpdateExplore(arg_28_0, arg_28_1)
	if not arg_28_0.gameData:IsUnlockMap(arg_28_1) then
		setActive(arg_28_0.exContent, false)

		return
	end

	arg_28_0.selectedExploreId = arg_28_1

	setActive(arg_28_0.exContent, true)

	local var_28_0 = arg_28_0.gameData:FindMap(arg_28_1)
	local var_28_1 = arg_28_0.gameData:IsFinishMapExplore(arg_28_1)
	local var_28_2 = arg_28_0.gameData:IsReceiveExploreAward(arg_28_1)

	setActive(arg_28_0.exGoBtn, not var_28_1)
	setActive(arg_28_0.exGetBtn, var_28_1 and not var_28_2)
	setActive(arg_28_0.exGotBtn, var_28_1 and var_28_2)

	local var_28_3 = var_28_0.explore_drop_display

	arg_28_0.exAwardList:make(function(arg_29_0, arg_29_1, arg_29_2)
		if arg_29_0 == UIItemList.EventUpdate then
			arg_28_0:UpdateDrop(arg_29_2, var_28_3[arg_29_1 + 1], var_28_1 and var_28_2)
		end
	end)
	arg_28_0.exAwardList:align(#var_28_3)

	local var_28_4 = arg_28_0.gameData:GetMainExploreInMap(var_28_0)

	arg_28_0.exContentList:make(function(arg_30_0, arg_30_1, arg_30_2)
		if arg_30_0 == UIItemList.EventUpdate then
			arg_28_0:UpdateExploreObj(arg_30_2, arg_30_1 + 1, var_28_4[arg_30_1 + 1])
		end
	end)
	arg_28_0.exContentList:align(#var_28_4)
	onButton(arg_28_0, arg_28_0.exGetBtn, function(arg_31_0)
		if var_28_1 and not var_28_2 then
			arg_28_0:CheckAwardOverflow(var_28_3, function()
				arg_28_0:emit(DreamlandMediator.GET_EXPLORE_AWARD, arg_28_0.gameData:GetActivityId(), arg_28_1)
			end)
		end
	end, SFX_PANEL)
end

function var_0_0.UpdateExploreObj(arg_33_0, arg_33_1, arg_33_2, arg_33_3)
	local var_33_0 = arg_33_0.gameData:FindExploreObj(arg_33_3)
	local var_33_1 = arg_33_1:Find("1")
	local var_33_2 = arg_33_1:Find("2")
	local var_33_3 = arg_33_2 % 2 == 0 and var_33_2 or var_33_1

	setActive(var_33_1, var_33_3 == var_33_1)
	setActive(var_33_2, var_33_3 == var_33_2)

	local var_33_4 = var_33_3:Find("icon"):GetComponent(typeof(Image))

	LoadSpriteAsync("exploreObj/" .. var_33_0.pic, function(arg_34_0)
		var_33_4.sprite = arg_34_0
	end)

	local var_33_5 = var_33_3:Find("tip"):GetComponent(typeof(Text))
	local var_33_6 = var_33_3:Find("scrollrect/desc"):GetComponent(typeof(Text))
	local var_33_7 = arg_33_0.gameData:IsRecordExplore(arg_33_3)

	setActive(var_33_3:Find("tipbg"), not var_33_7)

	var_33_6.text = HXSet.hxLan(var_33_7 and var_33_0.dispaly_desc or "")
	var_33_5.text = HXSet.hxLan(var_33_7 and "" or var_33_0.tip_desc)

	setActive(var_33_3:Find("lock"), not var_33_7)

	var_33_4.color = var_33_7 and Color.New(1, 1, 1, 1) or Color.New(1, 1, 1, 0.25)
end

function var_0_0.InitExplorePage(arg_35_0)
	arg_35_0.exploreTrs = {}

	local var_35_0 = arg_35_0.gameData:GetAllMapId()

	arg_35_0.exploreList:make(function(arg_36_0, arg_36_1, arg_36_2)
		if arg_36_0 == UIItemList.EventUpdate then
			arg_35_0:InitExplore(arg_36_2, var_35_0[arg_36_1 + 1])

			arg_35_0.exploreTrs[var_35_0[arg_36_1 + 1]] = arg_36_2
		end
	end)
	arg_35_0.exploreList:align(#var_35_0)
end

function var_0_0.UpdateExplorePage(arg_37_0)
	if not arg_37_0.isInitExplorePage then
		arg_37_0:InitExplorePage()

		arg_37_0.isInitExplorePage = true
	end

	for iter_37_0, iter_37_1 in pairs(arg_37_0.exploreTrs) do
		local var_37_0 = arg_37_0.gameData:IsUnlockMap(iter_37_0)

		setText(iter_37_1:Find("Text"), var_37_0 and arg_37_0.gameData:FindMap(iter_37_0).name or "")
		setActive(iter_37_1:Find("lock"), not var_37_0)
		setToggleEnabled(iter_37_1, var_37_0)

		iter_37_1:Find("Text"):GetComponent(typeof(Text)).color = Color.New(0.3058824, 0.3058824, 0.3607843)

		setActive(iter_37_1:Find("tip"), arg_37_0.gameData:IsFinishMapExplore(iter_37_0) and not arg_37_0.gameData:IsReceiveExploreAward(iter_37_0))
	end

	triggerToggle(arg_37_0.exploreTrs[arg_37_0.selectedExploreId], true)
end

function var_0_0.CheckAwardOverflow(arg_38_0, arg_38_1, arg_38_2)
	local var_38_0, var_38_1 = Task.StaticJudgeOverflow(false, false, false, true, true, arg_38_1)

	if var_38_0 then
		pg.MsgboxMgr.GetInstance():ShowMsgBox({
			type = MSGBOX_TYPE_ITEM_BOX,
			content = i18n("award_max_warning"),
			items = var_38_1,
			onYes = arg_38_2
		})
	else
		arg_38_2()
	end
end

function var_0_0.UpdateDrop(arg_39_0, arg_39_1, arg_39_2, arg_39_3)
	local var_39_0 = Drop.New({
		type = arg_39_2[1],
		id = arg_39_2[2],
		count = arg_39_2[3]
	})

	updateDrop(arg_39_1:Find("mask_1"), var_39_0)
	onButton(arg_39_0, arg_39_1, function()
		arg_39_0:emit(BaseUI.ON_DROP, var_39_0)
	end, SFX_PANEL)
	setActive(arg_39_1:Find("mask"), arg_39_3)
end

function var_0_0.ShowTip(arg_41_0, arg_41_1)
	arg_41_0.tipTxt.text = arg_41_1

	setActive(arg_41_0.tipTr, true)
	arg_41_0:AddHideTimer()
end

function var_0_0.HideTip(arg_42_0)
	arg_42_0:RemoveHideTimer()
	setActive(arg_42_0.tipTr, false)
end

function var_0_0.AddHideTimer(arg_43_0)
	arg_43_0:RemoveHideTimer()

	arg_43_0.timer = Timer.New(function()
		arg_43_0:RemoveHideTimer()
		setActive(arg_43_0.tipTr, false)

		arg_43_0.tipTxt.text = ""
	end, 3, 1)

	arg_43_0.timer:Start()
end

function var_0_0.RemoveHideTimer(arg_45_0)
	if arg_45_0.timer then
		arg_45_0.timer:Stop()

		arg_45_0.timer = nil
	end
end

function var_0_0.OnDestroy(arg_46_0)
	if arg_46_0:isShowing() then
		arg_46_0:Hide()
	end
end

return var_0_0
