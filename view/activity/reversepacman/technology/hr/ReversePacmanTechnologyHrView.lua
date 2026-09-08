local var_0_0 = class("ReversePacmanTechnologyHrView", import("view.base.BasePanel"))

var_0_0.GIFT_SUCCESS = "ReversePacmanTechnologyHrView::GIFT_SUCCESS"
var_0_0.STORY_SELECTED_OPTIONAL = "ReversePacmanTechnologyHrView::STORY_SELECTED_OPTIONAL"
var_0_0.STORY_ADD_FAVORABILITY = "ReversePacmanTechnologyHrView::STORY_ADD_FAVORABILITY"

function var_0_0.Ctor(arg_1_0, arg_1_1, arg_1_2)
	arg_1_0._go = arg_1_1.gameObject

	var_0_0.super.Ctor(arg_1_0, arg_1_0._go)

	arg_1_0._parentClass = arg_1_2

	arg_1_0:attach(arg_1_2)
	arg_1_0:Init()
	arg_1_0:didEnter()
end

function var_0_0.Init(arg_2_0)
	setText(arg_2_0.uiFrontText, i18n("reverse_pacman_owned"))

	local var_2_0 = ReversePacmanTools.GetGiftItemID()
	local var_2_1 = Drop.New({
		type = DROP_TYPE_VITEM,
		id = var_2_0
	})

	setImageSprite(arg_2_0.uiIconImage, GetSpriteFromAtlas(var_2_1:getIcon(), ""))
	onButton(arg_2_0, arg_2_0.uiCurrencyBtn, function()
		local var_3_0 = Drop.New({
			type = DROP_TYPE_VITEM,
			id = var_2_0
		})

		arg_2_0:emit(BaseUI.ON_ADD_SUBLAYER, Context.New({
			viewComponent = ReversePacmanItemPopScene,
			mediator = ReversePacmanItemPopMediator,
			data = {
				dropType = var_3_0.type,
				dropID = var_3_0.id,
				count = ReversePacmanTools.GetItemCnt(var_2_0),
				limitItemGuideID = ReversePacmanTools.GetActivity():getConfig("config_client").gift_link or 239
			}
		}))
	end, SFX_PANEL)

	arg_2_0.uiScrollView = LuaList.New(arg_2_0, handler(arg_2_0, arg_2_0.IndexItem), arg_2_0.uiListTf, ReversePacmanTechnologyHrItem)
end

function var_0_0.didEnter(arg_4_0)
	local var_4_0 = ReversePacmanTools.GetActivity()
	local var_4_1 = var_4_0:getConfig("config_client").chasing_char

	arg_4_0.roleIDList = Clone(var_4_1)

	local var_4_2 = var_4_0:GetFavorabilityList()

	table.sort(arg_4_0.roleIDList, function(arg_5_0, arg_5_1)
		local var_5_0 = ReversePacmanTools.IsUnlockRole(arg_5_0)

		if var_5_0 ~= ReversePacmanTools.IsUnlockRole(arg_5_1) then
			return var_5_0 == true
		else
			return table.keyof(var_4_1, arg_5_0) < table.keyof(var_4_1, arg_5_1)
		end
	end)
	arg_4_0.uiScrollView:StartScroll(#arg_4_0.roleIDList)

	arg_4_0.eventIDList = {
		arg_4_0:bind(var_0_0.GIFT_SUCCESS, handler(arg_4_0, arg_4_0.OnGiftSuccess)),
		arg_4_0:bind(var_0_0.STORY_SELECTED_OPTIONAL, handler(arg_4_0, arg_4_0.OnStorySelectedOptional)),
		arg_4_0:bind(var_0_0.STORY_ADD_FAVORABILITY, handler(arg_4_0, arg_4_0.OnSotryAddFavorablity))
	}

	local var_4_3 = ReversePacmanTools.GetFavorabilityUnreadyStory()

	if #var_4_3 > 0 then
		local var_4_4 = {}

		for iter_4_0, iter_4_1 in ipairs(var_4_3) do
			table.insert(var_4_4, function(arg_6_0)
				arg_4_0:PlayFavorabilityStory(iter_4_1, arg_6_0)
			end)
		end

		seriesAsync(var_4_4, function()
			return
		end)
	end
end

function var_0_0.Show(arg_8_0)
	arg_8_0:RefreshCurrency()
	arg_8_0.uiScrollView:Refresh()
end

function var_0_0.RefreshCurrency(arg_9_0)
	local var_9_0 = ReversePacmanTools.GetGiftItemID()

	setText(arg_9_0.uiGiftCntText, i18n("reverse_pacman_count", ReversePacmanTools.GetItemCnt(var_9_0)))
end

function var_0_0.IndexItem(arg_10_0, arg_10_1, arg_10_2)
	arg_10_2:didEnter(arg_10_0.roleIDList[arg_10_1])
end

function var_0_0.OnGiftSuccess(arg_11_0, arg_11_1, arg_11_2)
	arg_11_0.uiScrollView:Refresh()

	local var_11_0 = pg.activity_chasing_character[arg_11_2]

	pg.TipsMgr.GetInstance():ShowTips(i18n("reverse_pacman_favourite_increased", HXSet.hxLan(var_11_0.name)))
	arg_11_0:PlayFavorabilityStory(arg_11_2)
end

function var_0_0.PlayFavorabilityStory(arg_12_0, arg_12_1, arg_12_2)
	arg_12_0:RefreshCurrency()

	local var_12_0 = ReversePacmanTools.GetUpgradeFavorability(arg_12_1)

	if var_12_0 ~= 0 then
		local var_12_1 = pg.activity_chasing_character[arg_12_1]
		local var_12_2 = var_12_1.love_level_show[var_12_0][1]

		arg_12_0.storyRoleID = arg_12_1
		arg_12_0.storyOptionalFlag = var_12_1.love_level_show[var_12_0][2]

		pg.NewStoryMgr.GetInstance():Play(var_12_2, function()
			existCall(arg_12_2)
		end)
	end
end

function var_0_0.OnStorySelectedOptional(arg_14_0, arg_14_1, arg_14_2)
	if arg_14_2.optionalFlag == arg_14_0.storyOptionalFlag then
		arg_14_0:emit(ReversePacmanTechnologyMediator.CMD_SELECTED_OPTIONAL, {
			roleID = arg_14_0.storyRoleID
		})
	end
end

function var_0_0.OnSotryAddFavorablity(arg_15_0, arg_15_1, arg_15_2)
	local var_15_0 = pg.activity_chasing_character[arg_15_2]

	pg.TipsMgr.GetInstance():ShowTips(i18n("reverse_pacman_favourite_increased", HXSet.hxLan(var_15_0.name)))
	arg_15_0.uiScrollView:Refresh()
end

function var_0_0.willExit(arg_16_0)
	for iter_16_0, iter_16_1 in ipairs(arg_16_0.eventIDList) do
		arg_16_0:disconnect(iter_16_1)
	end

	arg_16_0.eventIDList = nil

	arg_16_0:detach()
	arg_16_0.uiScrollView:Dispose()

	arg_16_0.uiScrollView = nil
end

return var_0_0
