local var_0_0 = class("IslandSignInInvitationPage", import("...base.IslandBasePage"))
local var_0_1 = 1
local var_0_2 = 2

function var_0_0.getUIName(arg_1_0)
	return "IslandSignInInvitationUI"
end

function var_0_0.OnLoaded(arg_2_0)
	arg_2_0.shareBtn = arg_2_0:findTF("frame/public")
	arg_2_0.onkeyBtn = arg_2_0:findTF("frame/onkey")
	arg_2_0.closeBtn = arg_2_0:findTF("frame/close")
	arg_2_0.toggles = {
		[var_0_1] = arg_2_0:findTF("frame/toggles/1"),
		[var_0_2] = arg_2_0:findTF("frame/toggles/2")
	}
	arg_2_0.texts = {
		[var_0_1] = arg_2_0:findTF("frame/toggles/1/Text"):GetComponent(typeof(Text)),
		[var_0_2] = arg_2_0:findTF("frame/toggles/2/Text"):GetComponent(typeof(Text))
	}
	arg_2_0.names = {
		i18n("island_friend"),
		i18n("island_guild")
	}
	arg_2_0._scrollrect = arg_2_0:findTF("frame/scrollrect"):GetComponent("LScrollRect")

	function arg_2_0._scrollrect.onInitItem(arg_3_0)
		arg_2_0:OnInitItem(arg_3_0)
	end

	function arg_2_0._scrollrect.onUpdateItem(arg_4_0, arg_4_1)
		arg_2_0:OnUpdateItem(arg_4_0, arg_4_1)
	end

	setText(arg_2_0:findTF("frame/public/Text"), i18n("island_public_invitation"))
	setText(arg_2_0:findTF("frame/onkey/Text"), i18n("island_onekey_invitation"))
end

function var_0_0.OnInit(arg_5_0)
	onButton(arg_5_0, arg_5_0._tf, function()
		arg_5_0:Hide()
	end, SFX_PANEL)
	onButton(arg_5_0, arg_5_0.closeBtn, function()
		arg_5_0:Hide()
	end, SFX_PANEL)
	onButton(arg_5_0, arg_5_0.shareBtn, function()
		if arg_5_0:GetIsland():GetAccessAgency():HasOpenFlag(IslandConst.OPEN_SIGNIN) then
			pg.TipsMgr.GetInstance():ShowTips(i18n("island_public_invitation_1"))

			return
		end

		arg_5_0:emit(IslandMediator.SHARE_SIGNIN)
	end, SFX_PANEL)
	onButton(arg_5_0, arg_5_0.onkeyBtn, function()
		local var_9_0 = {}

		for iter_9_0, iter_9_1 in ipairs(arg_5_0.displays) do
			table.insert(var_9_0, iter_9_1.id)
		end

		arg_5_0:emit(IslandMediator.SIGN_IN_INVITATION, var_9_0)
	end, SFX_PANEL)

	arg_5_0.cards = {}

	for iter_5_0, iter_5_1 in pairs(arg_5_0.toggles) do
		local var_5_0 = arg_5_0.texts[iter_5_0]
		local var_5_1 = arg_5_0.names[iter_5_0]

		onToggle(arg_5_0, iter_5_1, function(arg_10_0)
			if arg_10_0 then
				arg_5_0:SwitchPage(iter_5_0)
			end

			var_5_0.text = arg_10_0 and setColorStr(var_5_1, "#FEFEFE") or setColorStr(var_5_1, "#6B6E75")
		end, SFX_PANEL)

		var_5_0.text = setColorStr(var_5_1, "#6B6E75")
	end
end

function var_0_0.AddListeners(arg_11_0)
	arg_11_0:AddListener(GAME.ISLAND_SIGN_IN_INVITATION_DONE, arg_11_0.OnInvitation)
	arg_11_0:AddListener(GAME.ISLAND_SIGN_SHARE_SIGNIN_DONE, arg_11_0.OnShare)
end

function var_0_0.RemoveListeners(arg_12_0)
	arg_12_0:RemoveListener(GAME.ISLAND_SIGN_IN_INVITATION_DONE, arg_12_0.OnInvitation)
	arg_12_0:RemoveListener(GAME.ISLAND_SIGN_SHARE_SIGNIN_DONE, arg_12_0.OnShare)
end

function var_0_0.OnInvitation(arg_13_0)
	arg_13_0:FlushList()
end

function var_0_0.OnShare(arg_14_0)
	return
end

function var_0_0.GetDisplayData(arg_15_0, arg_15_1)
	local var_15_0 = {}

	if arg_15_1 == var_0_1 then
		var_15_0 = getProxy(FriendProxy):getAllFriends()
	elseif arg_15_1 == var_0_2 then
		local var_15_1 = getProxy(GuildProxy):getRawData()

		var_15_0 = var_15_1 and var_15_1:getSortMemberWithoutSelf() or {}
	end

	return var_15_0
end

function var_0_0.SwitchPage(arg_16_0, arg_16_1)
	arg_16_0.pageIndex = arg_16_1

	arg_16_0:FlushList()
end

function var_0_0.OnInitItem(arg_17_0, arg_17_1)
	local var_17_0 = IslandSignInInvitationCard.New(arg_17_1)

	onButton(arg_17_0, var_17_0.btn, function()
		arg_17_0:emit(IslandMediator.SIGN_IN_INVITATION, {
			var_17_0.player.id
		})
	end, SFX_PANEL)

	arg_17_0.cards[arg_17_1] = var_17_0
end

function var_0_0.OnUpdateItem(arg_19_0, arg_19_1, arg_19_2)
	local var_19_0 = arg_19_0.cards[arg_19_2]

	if not var_19_0 then
		arg_19_0:OnInitItem(arg_19_2)

		var_19_0 = arg_19_0.cards[arg_19_2]
	end

	local var_19_1 = arg_19_0:GetIsland()
	local var_19_2 = arg_19_0.displays[arg_19_1 + 1]

	var_19_0:Update(var_19_2, var_19_1)
end

function var_0_0.Show(arg_20_0)
	var_0_0.super.Show(arg_20_0)
	triggerToggle(arg_20_0.toggles[var_0_1], true)
end

function var_0_0.FlushList(arg_21_0)
	arg_21_0.displays = arg_21_0:GetDisplayData(arg_21_0.pageIndex)

	arg_21_0._scrollrect:SetTotalCount(#arg_21_0.displays)
end

function var_0_0.OnDestroy(arg_22_0)
	for iter_22_0, iter_22_1 in pairs(arg_22_0.cards) do
		iter_22_1:Dispose()
	end

	arg_22_0.cards = nil
end

return var_0_0
