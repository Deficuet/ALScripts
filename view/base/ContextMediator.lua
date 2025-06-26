local var_0_0 = class("ContextMediator", pm.Mediator)

function var_0_0.Ctor(arg_1_0, arg_1_1)
	arg_1_0:initNotificationHandleDic()
	var_0_0.super.Ctor(arg_1_0, nil, arg_1_1)
end

function var_0_0.initNotificationHandleDic(arg_2_0)
	arg_2_0.handleDic, arg_2_0.handleElse = nil
end

function var_0_0.listNotificationInterests(arg_3_0)
	if arg_3_0.handleDic then
		return underscore.keys(arg_3_0.handleDic)
	else
		return var_0_0.super.listNotificationInterests(arg_3_0)
	end
end

function var_0_0.handleNotification(arg_4_0, arg_4_1)
	if arg_4_0.handleDic then
		switch(arg_4_1:getName(), arg_4_0.handleDic, arg_4_0.handleElse, arg_4_0, arg_4_1)
	else
		var_0_0.super.handleNotification(arg_4_0, arg_4_1)
	end
end

function var_0_0.onRegister(arg_5_0)
	arg_5_0.event = {}

	arg_5_0:bind(BaseUI.ON_BACK_PRESSED, function(arg_6_0, arg_6_1)
		arg_5_0:onBackPressed(arg_6_1)
	end)
	arg_5_0:bind(BaseUI.AVALIBLE, function(arg_7_0, arg_7_1)
		arg_5_0:onUIAvalible()
	end)
	arg_5_0:bind(BaseUI.ON_BACK, function(arg_8_0, arg_8_1, arg_8_2)
		if arg_8_2 and arg_8_2 > 0 then
			pg.UIMgr.GetInstance():LoadingOn(false)
			LeanTween.delayedCall(arg_8_2, System.Action(function()
				pg.UIMgr.GetInstance():LoadingOff()
				arg_5_0:sendNotification(GAME.GO_BACK, nil, arg_8_1)
			end))
		else
			arg_5_0:sendNotification(GAME.GO_BACK, nil, arg_8_1)
		end
	end)
	arg_5_0:bind(BaseUI.ON_RETURN, function(arg_10_0, arg_10_1)
		arg_5_0:sendNotification(GAME.GO_BACK, arg_10_1)
	end)
	arg_5_0:bind(BaseUI.ON_HOME, function(arg_11_0)
		local var_11_0 = getProxy(ContextProxy):getCurrentContext()

		if var_11_0.mediator == NewMainMediator then
			for iter_11_0 = #var_11_0.children, 1, -1 do
				local var_11_1 = var_11_0.children[iter_11_0]

				arg_5_0:sendNotification(GAME.REMOVE_LAYERS, {
					context = var_11_1
				})
			end

			return
		end

		local var_11_2 = var_11_0:retriveLastChild()

		if var_11_2 and var_11_2 ~= var_11_0 then
			arg_5_0:sendNotification(GAME.REMOVE_LAYERS, {
				onHome = true,
				context = var_11_2
			})
		end

		pg.PoolMgr.GetInstance():ClearAllTempCache()
		arg_5_0:sendNotification(GAME.GO_SCENE, SCENE.MAINUI)
	end)
	arg_5_0:bind(BaseUI.ON_CLOSE, function(arg_12_0)
		local var_12_0 = getProxy(ContextProxy):getCurrentContext():getContextByMediator(arg_5_0.class)

		if var_12_0 then
			arg_5_0:sendNotification(GAME.REMOVE_LAYERS, {
				context = var_12_0
			})
		end
	end)
	arg_5_0:bind(BaseUI.ON_AWARD, function(arg_13_0, arg_13_1)
		local var_13_0 = {}

		if _.all(arg_13_1.items, function(arg_14_0)
			return arg_14_0.type == DROP_TYPE_ICON_FRAME or arg_14_0.type == DROP_TYPE_CHAT_FRAME or arg_14_0.type == DROP_TYPE_LIVINGAREA_COVER
		end) then
			table.insert(var_13_0, function(arg_15_0)
				onNextTick(arg_15_0)
			end)
		else
			table.insert(var_13_0, function(arg_16_0)
				arg_5_0:addSubLayers(Context.New({
					mediator = AwardInfoMediator,
					viewComponent = AwardInfoLayer,
					data = setmetatable({
						removeFunc = arg_16_0,
						auto = arg_13_1.auto
					}, {
						__index = arg_13_1
					})
				}))
			end)
		end

		seriesAsync(var_13_0, arg_13_1.removeFunc)
	end)

	local function var_5_0(arg_17_0, arg_17_1)
		local var_17_0 = getProxy(BayProxy)
		local var_17_1 = var_17_0:getNewShip(true)
		local var_17_2 = {}

		for iter_17_0, iter_17_1 in pairs(var_17_1) do
			if iter_17_1:isMetaShip() then
				table.insert(var_17_2, iter_17_1.configId)
			end
		end

		local var_17_3 = #var_17_1

		underscore.each(arg_17_0, function(arg_18_0)
			if arg_18_0.type == DROP_TYPE_OPERATION then
				table.insert(var_17_1, var_17_0:getShipById(arg_18_0.count))
			elseif arg_18_0.type == DROP_TYPE_SHIP then
				local var_18_0 = arg_18_0.configId or arg_18_0.id

				if Ship.isMetaShipByConfigID(var_18_0) then
					local var_18_1 = table.indexof(var_17_2, var_18_0)

					if var_18_1 then
						table.remove(var_17_2, var_18_1)

						var_17_3 = var_17_3 - 1
					else
						local var_18_2 = Ship.New({
							configId = var_18_0
						})
						local var_18_3 = getProxy(BayProxy):getMetaTransItemMap(var_18_2.configId)

						if var_18_3 then
							var_18_2:setReMetaSpecialItemVO(var_18_3)
						end

						table.insert(var_17_1, var_18_2)
					end
				else
					var_17_3 = var_17_3 - 1
				end
			end
		end)

		var_17_1 = underscore.rest(var_17_1, var_17_3 + 1)

		if (pg.gameset.award_ship_limit and pg.gameset.award_ship_limit.key_value or 20) >= #var_17_1 then
			for iter_17_2, iter_17_3 in ipairs(var_17_1) do
				table.insert(arg_17_1, function(arg_19_0)
					arg_5_0:addSubLayers(Context.New({
						mediator = NewShipMediator,
						viewComponent = NewShipLayer,
						data = {
							ship = iter_17_3
						},
						onRemoved = arg_19_0
					}))
				end)
			end
		end
	end

	local function var_5_1(arg_20_0, arg_20_1)
		for iter_20_0, iter_20_1 in pairs(arg_20_0) do
			if iter_20_1.type == DROP_TYPE_SKIN and pg.ship_skin_template[iter_20_1.id].skin_type ~= ShipSkin.SKIN_TYPE_REMAKE and not getProxy(ShipSkinProxy):hasOldNonLimitSkin(iter_20_1.id) then
				table.insert(arg_20_1, function(arg_21_0)
					arg_5_0:addSubLayers(Context.New({
						mediator = NewSkinMediator,
						viewComponent = NewSkinLayer,
						data = {
							skinId = iter_20_1.id,
							LayerWeightMgr_weight = LayerWeightConst.SECOND_LAYER
						},
						onRemoved = arg_21_0
					}))
				end)
			end

			if iter_20_1.type == DROP_TYPE_SKIN_TIMELIMIT then
				if iter_20_1.count > 0 and not getProxy(ShipSkinProxy):hasOldNonLimitSkin(iter_20_1.id) then
					table.insert(arg_20_1, function(arg_22_0)
						arg_5_0:addSubLayers(Context.New({
							mediator = NewSkinMediator,
							viewComponent = NewSkinLayer,
							data = {
								timeLimit = true,
								skinId = iter_20_1.id,
								LayerWeightMgr_weight = LayerWeightConst.SECOND_LAYER
							},
							onRemoved = arg_22_0
						}))
					end)
				else
					table.insert(arg_20_1, function(arg_23_0)
						pg.TipsMgr.GetInstance():ShowTips(i18n("already_have_the_skin"))
						arg_23_0()
					end)
				end
			end
		end
	end

	local function var_5_2(arg_24_0, arg_24_1)
		local var_24_0 = 0

		for iter_24_0, iter_24_1 in ipairs(arg_24_0) do
			if iter_24_1.type == DROP_TYPE_COMMANDER_CAT then
				var_24_0 = var_24_0 + 1
			end
		end

		if var_24_0 == 0 then
			return
		end

		local var_24_1 = getProxy(CommanderProxy):GetNewestCommander(var_24_0)

		for iter_24_2, iter_24_3 in ipairs(var_24_1) do
			table.insert(arg_24_1, function(arg_25_0)
				arg_5_0:addSubLayers(Context.New({
					viewComponent = NewCommanderScene,
					mediator = NewCommanderMediator,
					data = {
						commander = iter_24_3,
						onExit = arg_25_0
					}
				}))
			end)
		end
	end

	arg_5_0:bind(BaseUI.ON_ACHIEVE, function(arg_26_0, arg_26_1, arg_26_2)
		local var_26_0 = {}

		if #arg_26_1 > 0 then
			table.insert(var_26_0, function(arg_27_0)
				arg_5_0.viewComponent:emit(BaseUI.ON_AWARD, {
					items = arg_26_1,
					removeFunc = arg_27_0
				})
			end)
			table.insert(var_26_0, function(arg_28_0)
				var_5_0(arg_26_1, var_26_0)
				var_5_1(arg_26_1, var_26_0)
				var_5_2(arg_26_1, var_26_0)
				arg_28_0()
			end)
		end

		seriesAsyncExtend(var_26_0, arg_26_2)
	end)
	arg_5_0:bind(BaseUI.ON_ACHIEVE_AUTO, function(arg_29_0, arg_29_1, arg_29_2, arg_29_3)
		local var_29_0 = {}

		if #arg_29_1 > 0 then
			table.insert(var_29_0, function(arg_30_0)
				arg_5_0.viewComponent:emit(BaseUI.ON_AWARD, {
					items = arg_29_1,
					removeFunc = arg_30_0,
					auto = arg_29_2 or 2
				})
			end)
			table.insert(var_29_0, function(arg_31_0)
				var_5_0(arg_29_1, var_29_0)
				var_5_1(arg_29_1, var_29_0)
				var_5_2(arg_29_1, var_29_0)
				arg_31_0()
			end)
		end

		seriesAsyncExtend(var_29_0, arg_29_3)
	end)
	arg_5_0:bind(BaseUI.ON_WORLD_ACHIEVE, function(arg_32_0, arg_32_1)
		local var_32_0 = {}
		local var_32_1 = arg_32_1.items

		if #var_32_1 > 0 then
			table.insert(var_32_0, function(arg_33_0)
				arg_5_0.viewComponent:emit(BaseUI.ON_AWARD, setmetatable({
					removeFunc = arg_33_0
				}, {
					__index = arg_32_1
				}))
			end)
			table.insert(var_32_0, function(arg_34_0)
				var_5_0(var_32_1, var_32_0)
				var_5_1(var_32_1, var_32_0)
				var_5_2(var_32_1, var_32_0)
				arg_34_0()
			end)
		end

		seriesAsyncExtend(var_32_0, arg_32_1.removeFunc)
	end)
	arg_5_0:bind(BaseUI.ON_SHIP_EXP, function(arg_35_0, arg_35_1, arg_35_2)
		arg_5_0:addSubLayers(Context.New({
			mediator = ShipExpMediator,
			viewComponent = ShipExpLayer,
			data = arg_35_1,
			onRemoved = arg_35_2
		}))
	end)
	arg_5_0:bind(BaseUI.ON_SPWEAPON, function(arg_36_0, arg_36_1)
		arg_36_1.type = defaultValue(arg_36_1.type, SpWeaponInfoLayer.TYPE_DEFAULT)

		arg_5_0:addSubLayers(Context.New({
			mediator = SpWeaponInfoMediator,
			viewComponent = SpWeaponInfoLayer,
			data = arg_36_1,
			onRemoved = arg_36_1 and arg_36_1.onRemoved or nil
		}))
	end)
	arg_5_0:commonBind()
	arg_5_0:register()
end

function var_0_0.commonBind(arg_37_0)
	var_0_0.CommonBindDic = var_0_0.CommonBindDic or {
		[BaseUI.ON_DROP] = function(arg_38_0, arg_38_1, arg_38_2, arg_38_3)
			if arg_38_2.type == DROP_TYPE_EQUIP then
				arg_38_0:addSubLayers(Context.New({
					mediator = EquipmentInfoMediator,
					viewComponent = EquipmentInfoLayer,
					data = {
						equipmentId = arg_38_2:getConfig("id"),
						type = EquipmentInfoMediator.TYPE_DISPLAY,
						onRemoved = arg_38_3,
						LayerWeightMgr_weight = LayerWeightConst.TOP_LAYER
					}
				}))
			elseif arg_38_2.type == DROP_TYPE_SPWEAPON then
				arg_38_0:addSubLayers(Context.New({
					mediator = SpWeaponInfoMediator,
					viewComponent = SpWeaponInfoLayer,
					data = {
						spWeaponConfigId = arg_38_2:getConfig("id"),
						type = SpWeaponInfoLayer.TYPE_DISPLAY,
						onRemoved = arg_38_3,
						LayerWeightMgr_weight = LayerWeightConst.TOP_LAYER
					}
				}))
			elseif arg_38_2.type == DROP_TYPE_EQUIPMENT_SKIN then
				arg_38_0:addSubLayers(Context.New({
					mediator = EquipmentSkinMediator,
					viewComponent = EquipmentSkinLayer,
					data = {
						skinId = arg_38_2:getConfig("id"),
						mode = EquipmentSkinLayer.DISPLAY,
						weight = LayerWeightConst.TOP_LAYER
					}
				}))
			elseif arg_38_2.type == DROP_TYPE_EMOJI then
				arg_38_0:addSubLayers(Context.New({
					mediator = ContextMediator,
					viewComponent = EmojiInfoLayer,
					data = {
						id = arg_38_2.cfg.id
					}
				}))
			elseif arg_38_2.type == DROP_TYPE_COMBAT_UI_STYLE and not arg_38_2.notPlay then
				arg_38_0:addSubLayers(Context.New({
					mediator = CombatSkinInfoMediator,
					viewComponent = CombatSkinInfoLayer,
					data = {
						skinID = arg_38_2:getConfig("id")
					}
				}))
			else
				pg.MsgboxMgr.GetInstance():ShowMsgBox({
					type = MSGBOX_TYPE_SINGLE_ITEM,
					drop = arg_38_2,
					onNo = arg_38_3,
					onYes = arg_38_3,
					weight = LayerWeightConst.TOP_LAYER
				})
			end
		end,
		[BaseUI.ON_DROP_LIST] = function(arg_39_0, arg_39_1, arg_39_2)
			pg.MsgboxMgr.GetInstance():ShowMsgBox({
				hideNo = true,
				type = MSGBOX_TYPE_ITEM_BOX,
				items = arg_39_2.itemList,
				content = arg_39_2.content,
				item2Row = arg_39_2.item2Row,
				itemFunc = function(arg_40_0)
					arg_39_0.viewComponent:emit(BaseUI.ON_DROP, arg_40_0, function()
						arg_39_0.viewComponent:emit(BaseUI.ON_DROP_LIST, arg_39_2)
					end)
				end,
				weight = LayerWeightConst.TOP_LAYER
			})
		end,
		[BaseUI.ON_DROP_LIST_OWN] = function(arg_42_0, arg_42_1, arg_42_2)
			pg.MsgboxMgr.GetInstance():ShowMsgBox({
				hideNo = true,
				type = MSGBOX_TYPE_DROP_ITEM_ESKIN,
				items = arg_42_2.itemList,
				content = arg_42_2.content,
				item2Row = arg_42_2.item2Row,
				itemFunc = function(arg_43_0)
					arg_42_0.viewComponent:emit(BaseUI.ON_DROP, arg_43_0, function()
						arg_42_0.viewComponent:emit(BaseUI.ON_DROP_LIST, arg_42_2)
					end)
				end,
				weight = LayerWeightConst.TOP_LAYER
			})
		end,
		[BaseUI.ON_ITEM] = function(arg_45_0, arg_45_1, arg_45_2, arg_45_3)
			arg_45_0:addSubLayers(Context.New({
				mediator = ItemInfoMediator,
				viewComponent = ItemInfoLayer,
				data = {
					drop = Drop.New({
						type = DROP_TYPE_ITEM,
						id = arg_45_2
					}),
					confirmCall = arg_45_3
				}
			}))
		end,
		[BaseUI.ON_ITEM_EXTRA] = function(arg_46_0, arg_46_1, arg_46_2, arg_46_3)
			arg_46_0:addSubLayers(Context.New({
				mediator = ItemInfoMediator,
				viewComponent = ItemInfoLayer,
				data = {
					drop = Drop.New({
						type = DROP_TYPE_ITEM,
						id = arg_46_2,
						extra = arg_46_3
					})
				}
			}))
		end,
		[BaseUI.ON_SHIP] = function(arg_47_0, arg_47_1, arg_47_2)
			arg_47_0:addSubLayers(Context.New({
				mediator = ItemInfoMediator,
				viewComponent = ItemInfoLayer,
				data = {
					drop = Drop.New({
						type = DROP_TYPE_SHIP,
						id = arg_47_2
					})
				}
			}))
		end,
		[BaseUI.ON_EQUIPMENT] = function(arg_48_0, arg_48_1, arg_48_2)
			arg_48_2.type = defaultValue(arg_48_2.type, EquipmentInfoMediator.TYPE_DEFAULT)

			arg_48_0:addSubLayers(Context.New({
				mediator = EquipmentInfoMediator,
				viewComponent = EquipmentInfoLayer,
				data = arg_48_2,
				onRemoved = arg_48_2 and arg_48_2.onRemoved or nil
			}))
		end,
		[BaseUI.ON_NEW_DROP] = function(arg_49_0, arg_49_1, arg_49_2)
			pg.NewStyleMsgboxMgr.GetInstance():Show(pg.NewStyleMsgboxMgr.TYPE_DROP, setmetatable(arg_49_2, {
				__index = {
					blurParams = {
						weight = LayerWeightConst.TOP_LAYER
					}
				}
			}))
		end,
		[BaseUI.ON_NEW_STYLE_DROP] = function(arg_50_0, arg_50_1, arg_50_2)
			local var_50_0 = pg.NewStyleMsgboxMgr.TYPE_COMMON_DROP
			local var_50_1 = setmetatable(arg_50_2, {
				__index = {
					blurParams = {
						weight = LayerWeightConst.TOP_LAYER
					}
				}
			})

			if arg_50_2.useDeepShow then
				pg.NewStyleMsgboxMgr.GetInstance():DeepShow(var_50_0, var_50_1)
			else
				pg.NewStyleMsgboxMgr.GetInstance():Show(var_50_0, var_50_1)
			end
		end,
		[BaseUI.ON_NEW_STYLE_ITEMS] = function(arg_51_0, arg_51_1, arg_51_2)
			local var_51_0 = pg.NewStyleMsgboxMgr.TYPE_COMMON_ITEMS
			local var_51_1 = setmetatable(arg_51_2, {
				__index = {
					btnList = {
						{
							type = pg.NewStyleMsgboxMgr.BUTTON_TYPE.confirm,
							name = i18n("msgbox_text_confirm"),
							sound = SFX_CONFIRM
						}
					},
					blurParams = {
						weight = LayerWeightConst.TOP_LAYER
					},
					items = arg_51_2.itemList,
					content = arg_51_2.content,
					itemFunc = function(arg_52_0)
						arg_51_0.viewComponent:emit(BaseUI.ON_NEW_STYLE_DROP, {
							useDeepShow = true,
							drop = arg_52_0
						})
					end
				}
			})

			if arg_51_2.useDeepShow then
				pg.NewStyleMsgboxMgr.GetInstance():DeepShow(var_51_0, var_51_1)
			else
				pg.NewStyleMsgboxMgr.GetInstance():Show(var_51_0, var_51_1)
			end
		end
	}

	for iter_37_0, iter_37_1 in pairs(var_0_0.CommonBindDic) do
		arg_37_0:bind(iter_37_0, function(...)
			return iter_37_1(arg_37_0, ...)
		end)
	end
end

function var_0_0.register(arg_54_0)
	return
end

function var_0_0.onUIAvalible(arg_55_0)
	return
end

function var_0_0.setContextData(arg_56_0, arg_56_1)
	arg_56_0.contextData = arg_56_1
end

function var_0_0.bind(arg_57_0, arg_57_1, arg_57_2)
	arg_57_0.viewComponent.event:connect(arg_57_1, arg_57_2)
	table.insert(arg_57_0.event, {
		event = arg_57_1,
		callback = arg_57_2
	})
end

function var_0_0.onRemove(arg_58_0)
	arg_58_0:remove()

	for iter_58_0, iter_58_1 in ipairs(arg_58_0.event) do
		arg_58_0.viewComponent.event:disconnect(iter_58_1.event, iter_58_1.callback)
	end

	arg_58_0.event = {}
end

function var_0_0.remove(arg_59_0)
	return
end

function var_0_0.addSubLayers(arg_60_0, arg_60_1, arg_60_2, arg_60_3, arg_60_4)
	assert(isa(arg_60_1, Context), "should be an instance of Context")

	local var_60_0 = arg_60_0:GetContext()

	if arg_60_2 then
		while var_60_0.parent do
			var_60_0 = var_60_0.parent
		end
	end

	local var_60_1 = {
		parentContext = var_60_0,
		context = arg_60_1,
		callback = arg_60_3
	}

	var_60_1 = arg_60_4 and table.merge(var_60_1, arg_60_4) or var_60_1

	arg_60_0:sendNotification(GAME.LOAD_LAYERS, var_60_1)
end

function var_0_0.GetContext(arg_61_0)
	return getProxy(ContextProxy):getCurrentContext():getContextByMediator(arg_61_0.class)
end

function var_0_0.blockEvents(arg_62_0)
	if arg_62_0.event then
		for iter_62_0, iter_62_1 in ipairs(arg_62_0.event) do
			arg_62_0.viewComponent.event:block(iter_62_1.event, iter_62_1.callback)
		end
	end
end

function var_0_0.unblockEvents(arg_63_0)
	if arg_63_0.event then
		for iter_63_0, iter_63_1 in ipairs(arg_63_0.event) do
			arg_63_0.viewComponent.event:unblock(iter_63_1.event, iter_63_1.callback)
		end
	end
end

function var_0_0.onBackPressed(arg_64_0, arg_64_1)
	pg.CriMgr.GetInstance():PlaySoundEffect_V3(SFX_CANCEL)

	local var_64_0 = getProxy(ContextProxy)

	if arg_64_1 then
		local var_64_1 = var_64_0:getContextByMediator(arg_64_0.class).parent

		if var_64_1 then
			local var_64_2 = pg.m02:retrieveMediator(var_64_1.mediator.__cname)

			if var_64_2 and var_64_2.viewComponent then
				var_64_2.viewComponent:onBackPressed()
			end
		end
	else
		arg_64_0.viewComponent:closeView()
	end
end

function var_0_0.removeSubLayers(arg_65_0, arg_65_1, arg_65_2)
	assert(isa(arg_65_1, var_0_0), "should be a ContextMediator Class")

	local var_65_0 = getProxy(ContextProxy):getContextByMediator(arg_65_0.class or arg_65_0)

	if not var_65_0 then
		return
	end

	local var_65_1 = var_65_0:getContextByMediator(arg_65_1)

	if not var_65_1 then
		return
	end

	arg_65_0:sendNotification(GAME.REMOVE_LAYERS, {
		context = var_65_1,
		callback = arg_65_2
	})
end

return var_0_0
