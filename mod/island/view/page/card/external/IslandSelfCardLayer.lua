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

function var_0_0.init(arg_8_0)
	arg_8_0.uiAnim = arg_8_0._tf:GetComponent(typeof(Animation))
	arg_8_0.uiAnimEvent = arg_8_0._tf:GetComponent(typeof(DftAniEvent))

	arg_8_0.uiAnimEvent:SetEndEvent(function()
		arg_8_0.playingHideAnim = false

		arg_8_0:closeView(arg_8_0)
	end)
	setText(arg_8_0._tf:Find("tip"), i18n("island_card_close"))

	local var_8_0 = arg_8_0._tf:Find("panel")

	arg_8_0.photoTF = var_8_0:Find("photo/Image")
	arg_8_0.photoSwitchBtn = var_8_0:Find("photo/switch")
	arg_8_0.likeTF = var_8_0:Find("photo/like")
	arg_8_0.labelsTF = var_8_0:Find("labels")
	arg_8_0.visitTF = var_8_0:Find("btns/visit/Text")
	arg_8_0.diyBtn = var_8_0:Find("btns/diy")
	arg_8_0.whitelistBtn = var_8_0:Find("btns/whitelist")
	arg_8_0.blacklistBtn = var_8_0:Find("btns/blacklist")
	arg_8_0.levelTF = var_8_0:Find("level")
	arg_8_0.wordTF = var_8_0:Find("word")
	arg_8_0.nameTF = var_8_0:Find("name")
	arg_8_0.addBtn = arg_8_0.nameTF:Find("add")
	arg_8_0.removeBtn = arg_8_0.nameTF:Find("remove")
	arg_8_0.editBtn = arg_8_0.nameTF:Find("edit")
	arg_8_0.editPanel = arg_8_0._tf:Find("editPanel")
	arg_8_0.editNameBtn = arg_8_0.editPanel:Find("content/name")

	setText(arg_8_0.editNameBtn:Find("Text"), i18n("island_card_edit_name"))

	arg_8_0.editWordBtn = arg_8_0.editPanel:Find("content/word")

	setText(arg_8_0.editWordBtn:Find("Text"), i18n("island_card_edit_word"))

	arg_8_0.shipTF = var_8_0:Find("counts/ship/Text")
	arg_8_0.achvTF = var_8_0:Find("counts/achv/Text")
	arg_8_0.bookTF = var_8_0:Find("counts/book/Text")
	arg_8_0.achvUIList = UIItemList.New(var_8_0:Find("achvs"), var_8_0:Find("achvs/tpl"))

	setText(var_8_0:Find("achvs/tpl/empty/Text"), i18n("island_card_no_achv_self"))
	arg_8_0:InitBoxs()
end

function var_0_0.InitBoxs(arg_10_0)
	arg_10_0.editNameBox = IslandEditCardNameBox.New(arg_10_0._tf, arg_10_0.event)
	arg_10_0.editWordBox = IslandEditCardWordBox.New(arg_10_0._tf, arg_10_0.event)
	arg_10_0.setPhotoBox = IslandSetCardPhotoBox.New(arg_10_0._tf, arg_10_0.event)
	arg_10_0.setAchvsBox = IslandSetCardAchvsBox.New(arg_10_0._tf, arg_10_0.event)
	arg_10_0.showLabelBox = IslandShowCardLabelBox.New(arg_10_0._tf, arg_10_0.event)
end

function var_0_0.didEnter(arg_11_0)
	if not arg_11_0.contextData.isIslandPage then
		pg.UIMgr.GetInstance():BlurPanel(arg_11_0._tf)
	end

	onButton(arg_11_0, arg_11_0._tf:Find("close"), function()
		arg_11_0:PlayHideAnim()
	end, SFX_PANEL)
	onButton(arg_11_0, arg_11_0.photoSwitchBtn, function()
		local var_13_0 = arg_11_0.island:GetCardDiyAgency():GetIds()

		arg_11_0.setPhotoBox:ExecuteAction("Show", var_13_0, arg_11_0.photoId)
	end, SFX_PANEL)
	onButton(arg_11_0, arg_11_0.editBtn, function()
		arg_11_0:ShowEditPanel()
	end, SFX_PANEL)
	onButton(arg_11_0, arg_11_0.editPanel:Find("close"), function()
		arg_11_0:HideEditPanel()
	end, SFX_PANEL)
	onButton(arg_11_0, arg_11_0.editNameBtn, function()
		arg_11_0.editNameBox:ExecuteAction("Show")
	end, SFX_PANEL)
	onButton(arg_11_0, arg_11_0.editWordBtn, function()
		arg_11_0.editWordBox:ExecuteAction("Show")
	end, SFX_PANEL)
	arg_11_0:InitAchvUIList()
	arg_11_0:Flush()
end

function var_0_0.InitAchvUIList(arg_18_0)
	arg_18_0.achvUIList:make(function(arg_19_0, arg_19_1, arg_19_2)
		if arg_19_0 == UIItemList.EventInit then
			onButton(arg_18_0, arg_19_2, function()
				local var_20_0 = arg_18_0.island:GetAchievementAgency():GetGotGroupMaxStageList()

				arg_18_0.setAchvsBox:ExecuteAction("Show", var_20_0, Clone(arg_18_0.card.achvList))
			end, SFX_PANEL)
		elseif arg_19_0 == UIItemList.EventUpdate then
			arg_18_0:UpdataAchvItem(arg_19_1, arg_19_2)
		end
	end)
end

function var_0_0.ShowEditPanel(arg_21_0)
	local var_21_0 = arg_21_0._tf:InverseTransformPoint(arg_21_0.editBtn.position)

	setAnchoredPosition(arg_21_0.editPanel:Find("content"), var_21_0)
	setActive(arg_21_0.editPanel, true)
end

function var_0_0.HideEditPanel(arg_22_0)
	setActive(arg_22_0.editPanel, false)
end

function var_0_0.UpdataAchvItem(arg_23_0, arg_23_1, arg_23_2)
	local var_23_0 = arg_23_0.card.achvList[arg_23_1 + 1]

	setActive(arg_23_2:Find("empty"), not var_23_0)
	setActive(arg_23_2:Find("content"), var_23_0)

	if var_23_0 then
		local var_23_1 = pg.island_achievement[var_23_0]

		LoadImageSpriteAtlasAsync("islandachievement", "achv_stage_" .. var_23_1.stage, arg_23_2:Find("content/Image"), true)
		setText(arg_23_2:Find("content/Text"), var_23_1.name)
	end
end

function var_0_0.Flush(arg_24_0)
	arg_24_0:UpdataPhoto()
	arg_24_0:UpdataLabels()
	arg_24_0:UpdataInfos()
end

function var_0_0.UpdataPhoto(arg_25_0)
	arg_25_0.photoId = tonumber(arg_25_0.card.photoStr)

	if arg_25_0.photoId then
		local var_25_0 = pg.island_card_diy[arg_25_0.photoId].resource

		LoadImageSpriteAsync(var_25_0, arg_25_0.photoTF, true)
	end
end

function var_0_0.UpdataLabels(arg_26_0)
	arg_26_0.labels = arg_26_0.card:GetLabelList()

	table.sort(arg_26_0.labels, CompareFuncs({
		function(arg_27_0)
			return -arg_27_0.num
		end,
		function(arg_28_0)
			return arg_28_0.id
		end
	}))

	for iter_26_0 = 1, var_0_0.LABEL_SHOW_CNT + 1 do
		local var_26_0 = arg_26_0.labelsTF:GetChild(iter_26_0 - 1)
		local var_26_1 = iter_26_0 <= #arg_26_0.labels + 1

		setActive(var_26_0, var_26_1)

		if var_26_1 then
			if iter_26_0 <= #arg_26_0.labels then
				arg_26_0:UpdateNoramlLabel(var_26_0, arg_26_0.labels[iter_26_0])
			else
				arg_26_0:UpdateGrayLabel(var_26_0)
			end
		end
	end
end

function var_0_0.UpdateNoramlLabel(arg_29_0, arg_29_1, arg_29_2)
	local var_29_0 = pg.island_card_label[arg_29_2.id]

	LoadImageSpriteAtlasAsync("ui/islandcardui_atlas", "label_bg_" .. var_29_0.color, arg_29_1, true)

	local var_29_1 = var_0_0.COLORS[var_29_0.color]

	setTextColor(arg_29_1:Find("name"), Color.NewHex(var_29_1))
	setTextColor(arg_29_1:Find("value"), Color.NewHex(var_29_1))
	setText(arg_29_1:Find("name"), var_29_0.name)
	setText(arg_29_1:Find("value"), arg_29_2.num)
	removeOnButton(arg_29_1)
end

function var_0_0.UpdateGrayLabel(arg_30_0, arg_30_1)
	LoadImageSpriteAtlasAsync("ui/islandcardui_atlas", "bg_label_gray", arg_30_1, true)

	local var_30_0 = #arg_30_0.labels == 0

	setTextColor(arg_30_1:Find("name"), Color.NewHex("#F7F7F7"))
	setText(arg_30_1:Find("name"), var_30_0 and i18n("island_card_no_label") or i18n("island_card_view_detaills"))
	setText(arg_30_1:Find("value"), "")

	if not var_30_0 then
		onButton(arg_30_0, arg_30_1, function()
			arg_30_0.showLabelBox:ExecuteAction("Show", arg_30_0.labels)
		end, SFX_PANEL)
	else
		removeOnButton(arg_30_1)
	end
end

function var_0_0.UpdataInfos(arg_32_0)
	setText(arg_32_0.nameTF, arg_32_0.card.name)
	setText(arg_32_0.levelTF, "Lv." .. arg_32_0.card.level)
	setText(arg_32_0.wordTF, arg_32_0.card.word)
	setText(arg_32_0.likeTF, arg_32_0.card.likeCnt)
	setText(arg_32_0.visitTF, arg_32_0.card.visitCnt)
	setText(arg_32_0.shipTF, arg_32_0.card.shipCnt)
	setText(arg_32_0.achvTF, arg_32_0.card.achvCnt)
	setText(arg_32_0.bookTF, arg_32_0.card.bookCnt)
	arg_32_0.achvUIList:align(var_0_0.ACHV_SHOW_CNT)
end

function var_0_0.OnSetNameDone(arg_33_0, arg_33_1)
	arg_33_0:HideEditPanel()
	arg_33_0.editNameBox:ExecuteAction("Hide")

	arg_33_0.card.name = arg_33_1

	setText(arg_33_0.nameTF, arg_33_0.card.name)
end

function var_0_0.OnSetWordDone(arg_34_0, arg_34_1)
	arg_34_0:HideEditPanel()
	arg_34_0.editWordBox:ExecuteAction("Hide")

	arg_34_0.card.word = arg_34_1

	setText(arg_34_0.wordTF, arg_34_0.card.word)
end

function var_0_0.OnSetPhotoDone(arg_35_0, arg_35_1)
	arg_35_0.setPhotoBox:ExecuteAction("Hide")

	arg_35_0.card.photoStr = arg_35_1

	arg_35_0:UpdataPhoto()
end

function var_0_0.OnSetAchvsDone(arg_36_0, arg_36_1)
	arg_36_0.setAchvsBox:ExecuteAction("Hide")

	arg_36_0.card.achvList = arg_36_1

	arg_36_0.achvUIList:align(var_0_0.ACHV_SHOW_CNT)

	local var_36_0 = {}

	arg_36_0.achvUIList:eachActive(function(arg_37_0, arg_37_1)
		if arg_36_0.card.achvList[arg_37_0 + 1] then
			local var_37_0 = arg_37_1:Find("content/Image")

			var_37_0:GetComponent(typeof(CanvasGroup)).alpha = 0

			table.insert(var_36_0, function(arg_38_0)
				arg_37_1:GetComponent(typeof(Animation)):Play()

				var_37_0:GetComponent(typeof(CanvasGroup)).alpha = 1

				arg_36_0:managedTween(LeanTween.delayedCall, function()
					arg_38_0()
				end, 0.08, nil)
			end)
		end
	end)
	seriesAsync(var_36_0)
end

function var_0_0.PlayHideAnim(arg_40_0)
	if arg_40_0.playingHideAnim then
		return
	end

	arg_40_0.uiAnim:Play("anim_IslandSelfCardUI_out")

	arg_40_0.playingHideAnim = true
end

function var_0_0.willExit(arg_41_0)
	arg_41_0.uiAnimEvent:SetEndEvent(nil)

	if not arg_41_0.contextData.isIslandPage then
		pg.UIMgr.GetInstance():UnOverlayPanel(arg_41_0._tf)
	end

	if arg_41_0.editNameBox then
		arg_41_0.editNameBox:Destroy()

		arg_41_0.editNameBox = nil
	end

	if arg_41_0.editWordBox then
		arg_41_0.editWordBox:Destroy()

		arg_41_0.editWordBox = nil
	end

	if arg_41_0.setPhotoBox then
		arg_41_0.setPhotoBox:Destroy()

		arg_41_0.setPhotoBox = nil
	end

	if arg_41_0.setAchvsBox then
		arg_41_0.setAchvsBox:Destroy()

		arg_41_0.setAchvsBox = nil
	end

	if arg_41_0.showLabelBox then
		arg_41_0.showLabelBox:Destroy()

		arg_41_0.showLabelBox = nil
	end
end

return var_0_0
