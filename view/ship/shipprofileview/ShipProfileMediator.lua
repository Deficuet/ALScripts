local var_0_0 = class("ShipProfileMediator", import("...base.ContextMediator"))

var_0_0.CLICK_ROTATE_BTN = "ShipProfileMediator:CLICK_ROTATE_BTN"
var_0_0.OPEN_CRYPTOLALIA = "ShipProfileMediator:OPEN_CRYPTOLALIA"
var_0_0.OPEN_EQUIP_CODE_SHARE = "ShipProfileMediator.OPEN_EQUIP_CODE_SHARE"
var_0_0.OPEN_PAINTING_SHOW = "ShipProfileMediator.OPEN_PAINTING_SHOW"

function var_0_0.register(arg_1_0)
	local var_1_0 = getProxy(CollectionProxy)
	local var_1_1 = getProxy(ShipSkinProxy)

	arg_1_0.showTrans = arg_1_0.contextData.showTrans
	arg_1_0.groupId = arg_1_0.contextData.groupId

	local var_1_2 = var_1_0:getShipGroup(arg_1_0.groupId)

	arg_1_0.viewComponent:setShipGroup(var_1_2)
	arg_1_0.viewComponent:setShowTrans(arg_1_0.showTrans)
	arg_1_0.viewComponent:setOwnedSkinList(var_1_1:getSkinList())
	arg_1_0:bind(var_0_0.OPEN_CRYPTOLALIA, function(arg_2_0, arg_2_1)
		arg_1_0:sendNotification(GAME.GO_SCENE, SCENE.CRYPTOLALIA, {
			groupId = arg_2_1
		})
	end)
	arg_1_0:bind(var_0_0.CLICK_ROTATE_BTN, function(arg_3_0, arg_3_1, arg_3_2, arg_3_3)
		arg_1_0:addSubLayers(Context.New({
			mediator = ShipRotateMediator,
			viewComponent = ShipRotateLayer,
			data = {
				shipGroup = arg_3_1,
				showTrans = arg_3_2,
				skin = arg_3_3
			},
			onRemoved = function()
				setActive(arg_1_0.viewComponent.blurPanel, true)
				setActive(arg_1_0.viewComponent._tf, true)
			end
		}))
	end)
	arg_1_0:bind(ShipProfileScene.SHOW_SKILL_INFO, function(arg_5_0, arg_5_1, arg_5_2)
		arg_1_0:addSubLayers(Context.New({
			mediator = SkillInfoMediator,
			viewComponent = SkillInfoLayer,
			data = {
				skillOnShip = arg_5_2,
				skillId = arg_5_1
			}
		}))
	end)
	arg_1_0:bind(ShipProfileScene.SHOW_EVALUATION, function(arg_6_0, arg_6_1, arg_6_2)
		if arg_6_2 then
			pg.TipsMgr.GetInstance():ShowTips(i18n("npc_evaluation_tip"))

			return
		end

		arg_1_0:sendNotification(GAME.FETCH_EVALUATION, arg_6_1)
	end)
	arg_1_0:bind(ShipProfileScene.WEDDING_REVIEW, function(arg_7_0, arg_7_1)
		arg_1_0.viewComponent:onWeddingReview(true)
		arg_1_0:addSubLayers(Context.New({
			mediator = ProposeMediator,
			viewComponent = ProposeUI,
			data = {
				review = true,
				group = arg_7_1.group,
				skinID = arg_7_1.skinID,
				finishCallback = function()
					arg_1_0.viewComponent:onWeddingReview(false)
				end
			}
		}))
	end)
	arg_1_0:bind(var_0_0.OPEN_EQUIP_CODE_SHARE, function(arg_9_0, arg_9_1)
		arg_1_0:addSubLayers(Context.New({
			mediator = EquipCodeShareMediator,
			viewComponent = EquipCodeShareLayer,
			data = {
				shipGroupId = arg_9_1
			}
		}))
	end)
	arg_1_0:bind(var_0_0.OPEN_PAINTING_SHOW, function(arg_10_0, arg_10_1, arg_10_2)
		arg_1_0:addSubLayers(Context.New({
			mediator = PaintingShowMediator,
			viewComponent = PaintingShowScene,
			data = {
				skinId = arg_10_1,
				callback = arg_10_2
			}
		}))
	end)
end

function var_0_0.listNotificationInterests(arg_11_0)
	return {
		GAME.FETCH_EVALUATION_DONE,
		CollectionProxy.GROUP_INFO_UPDATE,
		ShipSkinProxy.SHIP_SKINS_UPDATE
	}
end

function var_0_0.handleNotification(arg_12_0, arg_12_1)
	local var_12_0 = arg_12_1:getName()
	local var_12_1 = arg_12_1:getBody()

	if var_12_0 == GAME.FETCH_EVALUATION_DONE then
		arg_12_0:addSubLayers(Context.New({
			mediator = ShipEvaluationMediator,
			viewComponent = ShipEvaluationLayer,
			data = {
				groupId = var_12_1,
				showTrans = arg_12_0.showTrans
			}
		}))
	elseif var_12_0 == CollectionProxy.GROUP_INFO_UPDATE then
		local var_12_2 = var_12_1

		if arg_12_0.groupId == var_12_2 then
			local var_12_3 = getProxy(CollectionProxy):getShipGroup(var_12_2)

			arg_12_0.viewComponent:setShipGroup(var_12_3)
			arg_12_0.viewComponent:FlushHearts()
		end
	elseif var_12_0 == ShipSkinProxy.SHIP_SKINS_UPDATE then
		local var_12_4 = getProxy(ShipSkinProxy)

		arg_12_0.viewComponent:setOwnedSkinList(var_12_4:getSkinList())
	end
end

return var_0_0
