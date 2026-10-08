local var_0_0 = class("IslandSelfCardLayer", import("view.base.BaseUI"))

var_0_0.LABEL_SHOW_CNT = 2
var_0_0.ACHV_SHOW_CNT = 4
var_0_0.COLORS = {
	"#A38759",
	"#AB7B7B",
	"#B1B284",
	"#8B99AC",
	"#8AAD8B",
	"#9D87A9"
}

function var_0_0.getUIName(arg_1_0)
	return "IslandSelfCardUI"
end

function var_0_0.preload(arg_2_0, arg_2_1)
	local var_2_0 = getProxy(PlayerProxy):getData().id

	seriesAsync({
		function(arg_3_0)
			local var_3_0 = getProxy(IslandProxy):GetIsland()

			if var_3_0 then
				arg_2_0.island = var_3_0

				arg_3_0()
			else
				pg.m02:sendNotification(GAME.ISLAND_GET_DATA, {
					isCardRequest = true,
					id = var_2_0,
					list = {},
					callback = function()
						arg_2_0.island = getProxy(IslandProxy):GetIsland()

						arg_3_0()
					end
				})
			end
		end,
		function(arg_5_0)
			pg.m02:sendNotification(GAME.ISLAND_GET_CARD_DATA, {
				userId = var_2_0,
				callback = function(arg_6_0)
					arg_2_0.card = arg_6_0

					arg_5_0()
				end
			})
		end
	}, function()
		arg_2_1()
	end)
end

function var_0_0.getResource(arg_8_0)
	local var_8_0 = var_0_0.super.getResource(arg_8_0)
	local var_8_1 = {
		"islandachievement",
		"islandphoto",
		"ui/islandcardui_atlas"
	}

	for iter_8_0, iter_8_1 in ipairs(var_8_1 or {}) do
		if not table.contains(var_8_0, iter_8_1) then
			table.insert(var_8_0, iter_8_1)
		end
	end

	return var_8_0
end

function var_0_0.init(arg_9_0)
	arg_9_0.uiAnim = arg_9_0._tf:GetComponent(typeof(Animation))
	arg_9_0.uiAnimEvent = arg_9_0._tf:GetComponent(typeof(DftAniEvent))

	arg_9_0.uiAnimEvent:SetEndEvent(function()
		arg_9_0.playingHideAnim = false

		arg_9_0:closeView(arg_9_0)
	end)
	setText(arg_9_0._tf:Find("tip"), i18n("island_card_close"))

	local var_9_0 = arg_9_0._tf:Find("panel")

	arg_9_0.photoTF = var_9_0:Find("photo/Image")
	arg_9_0.photoSwitchBtn = var_9_0:Find("photo/switch")
	arg_9_0.likeTF = var_9_0:Find("photo/like")
	arg_9_0.labelsTF = var_9_0:Find("labels")
	arg_9_0.visitTF = var_9_0:Find("btns/visit/Text")
	arg_9_0.diyBtn = var_9_0:Find("btns/diy")
	arg_9_0.whitelistBtn = var_9_0:Find("btns/whitelist")
	arg_9_0.blacklistBtn = var_9_0:Find("btns/blacklist")
	arg_9_0.levelTF = var_9_0:Find("level")
	arg_9_0.wordTF = var_9_0:Find("word")
	arg_9_0.nameTF = var_9_0:Find("name")
	arg_9_0.addBtn = arg_9_0.nameTF:Find("add")
	arg_9_0.removeBtn = arg_9_0.nameTF:Find("remove")
	arg_9_0.editBtn = arg_9_0.nameTF:Find("edit")
	arg_9_0.editPanel = arg_9_0._tf:Find("editPanel")
	arg_9_0.editNameBtn = arg_9_0.editPanel:Find("content/name")

	setText(arg_9_0.editNameBtn:Find("Text"), i18n("island_card_edit_name"))

	arg_9_0.editWordBtn = arg_9_0.editPanel:Find("content/word")

	setText(arg_9_0.editWordBtn:Find("Text"), i18n("island_card_edit_word"))

	arg_9_0.shipTF = var_9_0:Find("counts/ship/Text")
	arg_9_0.achvTF = var_9_0:Find("counts/achv/Text")
	arg_9_0.bookTF = var_9_0:Find("counts/book/Text")
	arg_9_0.achvUIList = UIItemList.New(var_9_0:Find("achvs"), var_9_0:Find("achvs/tpl"))

	setText(var_9_0:Find("achvs/tpl/empty/Text"), i18n("island_card_no_achv_self"))
	arg_9_0:InitBoxs()
end

function var_0_0.InitBoxs(arg_11_0)
	arg_11_0.editNameBox = IslandEditCardNameBox.New(arg_11_0._tf, arg_11_0.event)
	arg_11_0.editWordBox = IslandEditCardWordBox.New(arg_11_0._tf, arg_11_0.event)
	arg_11_0.setPhotoBox = IslandSetCardPhotoBox.New(arg_11_0._tf, arg_11_0.event)
	arg_11_0.setAchvsBox = IslandSetCardAchvsBox.New(arg_11_0._tf, arg_11_0.event)
	arg_11_0.showLabelBox = IslandShowCardLabelBox.New(arg_11_0._tf, arg_11_0.event)
end

function var_0_0.didEnter(arg_12_0)
	if not arg_12_0.contextData.isIslandPage then
		pg.UIMgr.GetInstance():BlurPanel(arg_12_0._tf)
	end

	onButton(arg_12_0, arg_12_0._tf:Find("panel/help"), function()
		pg.MsgboxMgr.GetInstance():ShowMsgBox({
			type = MSGBOX_TYPE_HELP,
			helps = pg.gametip.island_helpbtn_card.tip
		})
	end, SFX_PANEL)
	onButton(arg_12_0, arg_12_0._tf:Find("close"), function()
		arg_12_0:PlayHideAnim()
	end, SFX_PANEL)
	onButton(arg_12_0, arg_12_0.photoSwitchBtn, function()
		local var_15_0 = arg_12_0.island:GetCardDiyAgency():GetIds()

		arg_12_0.setPhotoBox:ExecuteAction("Show", var_15_0, arg_12_0.photoId)
	end, SFX_PANEL)
	onButton(arg_12_0, arg_12_0.editBtn, function()
		arg_12_0:ShowEditPanel()
	end, SFX_PANEL)
	onButton(arg_12_0, arg_12_0.editPanel:Find("close"), function()
		arg_12_0:HideEditPanel()
	end, SFX_PANEL)
	onButton(arg_12_0, arg_12_0.editNameBtn, function()
		arg_12_0.editNameBox:ExecuteAction("Show")
	end, SFX_PANEL)
	onButton(arg_12_0, arg_12_0.editWordBtn, function()
		arg_12_0.editWordBox:ExecuteAction("Show")
	end, SFX_PANEL)
	arg_12_0:InitAchvUIList()
	arg_12_0:Flush()
end

function var_0_0.InitAchvUIList(arg_20_0)
	arg_20_0.achvUIList:make(function(arg_21_0, arg_21_1, arg_21_2)
		if arg_21_0 == UIItemList.EventInit then
			onButton(arg_20_0, arg_21_2, function()
				local var_22_0 = arg_20_0.island:GetAchievementAgency():GetGotGroupMaxStageList()

				arg_20_0.setAchvsBox:ExecuteAction("Show", var_22_0, Clone(arg_20_0.card.achvList))
			end, SFX_PANEL)
		elseif arg_21_0 == UIItemList.EventUpdate then
			arg_20_0:UpdataAchvItem(arg_21_1, arg_21_2)
		end
	end)
end

function var_0_0.ShowEditPanel(arg_23_0)
	local var_23_0 = arg_23_0._tf:InverseTransformPoint(arg_23_0.editBtn.position)

	setAnchoredPosition(arg_23_0.editPanel:Find("content"), var_23_0)
	setActive(arg_23_0.editPanel, true)
end

function var_0_0.HideEditPanel(arg_24_0)
	setActive(arg_24_0.editPanel, false)
end

function var_0_0.UpdataAchvItem(arg_25_0, arg_25_1, arg_25_2)
	local var_25_0 = arg_25_0.card.achvList[arg_25_1 + 1]

	setActive(arg_25_2:Find("empty"), not var_25_0)
	setActive(arg_25_2:Find("content"), var_25_0)

	if var_25_0 then
		local var_25_1 = pg.island_achievement[var_25_0]

		LoadImageSpriteAtlasAsync("islandachievement", "achv_stage_" .. var_25_1.stage, arg_25_2:Find("content/Image"), true)
		setText(arg_25_2:Find("content/Text"), var_25_1.name)
	end
end

function var_0_0.Flush(arg_26_0)
	arg_26_0.card.achvList = getProxy(IslandProxy):GetIsland():GetAchievementAgency():UpdataAchLv(arg_26_0.card.achvList)

	arg_26_0:UpdataPhoto()
	arg_26_0:UpdataLabels()
	arg_26_0:UpdataInfos()
end

function var_0_0.UpdataPhoto(arg_27_0)
	arg_27_0.photoId = tonumber(arg_27_0.card.photoStr)

	if arg_27_0.photoId then
		local var_27_0 = pg.island_card_diy[arg_27_0.photoId].resource

		LoadImageSpriteAsync(var_27_0, arg_27_0.photoTF, true)
	end
end

function var_0_0.UpdataLabels(arg_28_0)
	arg_28_0.labels = arg_28_0.card:GetLabelList()

	table.sort(arg_28_0.labels, CompareFuncs({
		function(arg_29_0)
			return -arg_29_0.num
		end,
		function(arg_30_0)
			return arg_30_0.id
		end
	}))

	for iter_28_0 = 1, var_0_0.LABEL_SHOW_CNT + 1 do
		local var_28_0 = arg_28_0.labelsTF:GetChild(iter_28_0 - 1)
		local var_28_1 = iter_28_0 <= #arg_28_0.labels + 1

		setActive(var_28_0, var_28_1)

		if var_28_1 then
			if iter_28_0 <= #arg_28_0.labels then
				arg_28_0:UpdateNoramlLabel(var_28_0, arg_28_0.labels[iter_28_0])
			else
				arg_28_0:UpdateGrayLabel(var_28_0)
			end
		end
	end
end

function var_0_0.UpdateNoramlLabel(arg_31_0, arg_31_1, arg_31_2)
	local var_31_0 = pg.island_card_label[arg_31_2.id]

	LoadImageSpriteAtlasAsync("ui/islandcardui_atlas", "label_bg_" .. var_31_0.color, arg_31_1, true)

	local var_31_1 = var_0_0.COLORS[var_31_0.color]

	setTextColor(arg_31_1:Find("name"), Color.NewHex(var_31_1))
	setTextColor(arg_31_1:Find("value"), Color.NewHex(var_31_1))
	setText(arg_31_1:Find("name"), var_31_0.name)
	setText(arg_31_1:Find("value"), arg_31_2.num)
	removeOnButton(arg_31_1)
end

function var_0_0.UpdateGrayLabel(arg_32_0, arg_32_1)
	LoadImageSpriteAtlasAsync("ui/islandcardui_atlas", "bg_label_gray", arg_32_1, true)

	local var_32_0 = #arg_32_0.labels == 0

	setTextColor(arg_32_1:Find("name"), Color.NewHex("#F7F7F7"))
	setText(arg_32_1:Find("name"), var_32_0 and i18n("island_card_no_label") or i18n("island_card_view_detaills"))
	setText(arg_32_1:Find("value"), "")

	if not var_32_0 then
		onButton(arg_32_0, arg_32_1, function()
			arg_32_0.showLabelBox:ExecuteAction("Show", arg_32_0.labels)
		end, SFX_PANEL)
	else
		removeOnButton(arg_32_1)
	end
end

function var_0_0.UpdataInfos(arg_34_0)
	setText(arg_34_0.nameTF, arg_34_0.card.name)
	setText(arg_34_0.levelTF, "Lv." .. arg_34_0.card.level)
	setText(arg_34_0.wordTF, arg_34_0.card.word)
	setText(arg_34_0.likeTF, arg_34_0.card.likeCnt)
	setText(arg_34_0.visitTF, arg_34_0.card.visitCnt)
	setText(arg_34_0.shipTF, arg_34_0.card.shipCnt)
	setText(arg_34_0.achvTF, arg_34_0.card.achvCnt)
	setText(arg_34_0.bookTF, arg_34_0.card.bookCnt)
	arg_34_0.achvUIList:align(var_0_0.ACHV_SHOW_CNT)
end

function var_0_0.OnSetNameDone(arg_35_0, arg_35_1)
	arg_35_0:HideEditPanel()
	arg_35_0.editNameBox:ExecuteAction("Hide")

	arg_35_0.card.name = arg_35_1

	setText(arg_35_0.nameTF, arg_35_0.card.name)
end

function var_0_0.OnSetWordDone(arg_36_0, arg_36_1)
	arg_36_0:HideEditPanel()
	arg_36_0.editWordBox:ExecuteAction("Hide")

	arg_36_0.card.word = arg_36_1

	setText(arg_36_0.wordTF, arg_36_0.card.word)
end

function var_0_0.OnSetPhotoDone(arg_37_0, arg_37_1)
	arg_37_0.setPhotoBox:ExecuteAction("Hide")

	arg_37_0.card.photoStr = arg_37_1

	arg_37_0:UpdataPhoto()
end

function var_0_0.OnSetAchvsDone(arg_38_0, arg_38_1)
	arg_38_0.setAchvsBox:ExecuteAction("Hide")

	arg_38_0.card.achvList = getProxy(IslandProxy):GetIsland():GetAchievementAgency():UpdataAchLv(arg_38_1)

	arg_38_0.achvUIList:align(var_0_0.ACHV_SHOW_CNT)

	local var_38_0 = {}

	arg_38_0.achvUIList:eachActive(function(arg_39_0, arg_39_1)
		if arg_38_0.card.achvList[arg_39_0 + 1] then
			local var_39_0 = arg_39_1:Find("content/Image")

			var_39_0:GetComponent(typeof(CanvasGroup)).alpha = 0

			table.insert(var_38_0, function(arg_40_0)
				arg_39_1:GetComponent(typeof(Animation)):Play()

				var_39_0:GetComponent(typeof(CanvasGroup)).alpha = 1

				arg_38_0:managedTween(LeanTween.delayedCall, function()
					arg_40_0()
				end, 0.08, nil)
			end)
		end
	end)
	seriesAsync(var_38_0)
end

function var_0_0.PlayHideAnim(arg_42_0)
	if arg_42_0.playingHideAnim then
		return
	end

	arg_42_0.uiAnim:Play("anim_IslandSelfCardUI_out")

	arg_42_0.playingHideAnim = true
end

function var_0_0.willExit(arg_43_0)
	arg_43_0.uiAnimEvent:SetEndEvent(nil)

	if not arg_43_0.contextData.isIslandPage then
		pg.UIMgr.GetInstance():UnOverlayPanel(arg_43_0._tf)
	end

	if arg_43_0.editNameBox then
		arg_43_0.editNameBox:Destroy()

		arg_43_0.editNameBox = nil
	end

	if arg_43_0.editWordBox then
		arg_43_0.editWordBox:Destroy()

		arg_43_0.editWordBox = nil
	end

	if arg_43_0.setPhotoBox then
		arg_43_0.setPhotoBox:Destroy()

		arg_43_0.setPhotoBox = nil
	end

	if arg_43_0.setAchvsBox then
		arg_43_0.setAchvsBox:Destroy()

		arg_43_0.setAchvsBox = nil
	end

	if arg_43_0.showLabelBox then
		arg_43_0.showLabelBox:Destroy()

		arg_43_0.showLabelBox = nil
	end
end

return var_0_0
