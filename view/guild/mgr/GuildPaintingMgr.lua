pg = pg or {}
pg.GuildPaintingMgr = singletonClass("GuildPaintingMgr")

local var_0_0 = pg.GuildPaintingMgr

function var_0_0.Enter(arg_1_0, arg_1_1)
	arg_1_0._tf = arg_1_1
end

function var_0_0.Update(arg_2_0, arg_2_1, arg_2_2, arg_2_3)
	if HXSet.isHx() then
		arg_2_1 = pg.ship_skin_template[107030].painting
		arg_2_3 = true
	end

	arg_2_0.isShipPainting = arg_2_3

	arg_2_0:Show()

	if arg_2_0.name == arg_2_1 then
		return
	end

	arg_2_0:Clear()

	if arg_2_0.isShipPainting then
		setPaintingPrefabAsync(arg_2_0._tf, arg_2_1, "chuanwu")
	else
		setGuildPaintingPrefabAsync(arg_2_0._tf, arg_2_1, "chuanwu")
	end

	arg_2_0.name = arg_2_1

	if arg_2_2 then
		arg_2_0._tf.localPosition = arg_2_2
	end
end

function var_0_0.Show(arg_3_0)
	if not IsNil(arg_3_0._tf) then
		setActive(arg_3_0._tf, true)
	end
end

function var_0_0.Hide(arg_4_0)
	if not IsNil(arg_4_0._tf) then
		setActive(arg_4_0._tf, false)
	end
end

function var_0_0.Clear(arg_5_0)
	if arg_5_0.name then
		if arg_5_0.isShipPainting then
			retPaintingPrefab(arg_5_0._tf, arg_5_0.name)
		else
			retGuildPaintingPrefab(arg_5_0._tf, arg_5_0.name)
		end

		arg_5_0.name = nil
	end
end

function var_0_0.Exit(arg_6_0)
	arg_6_0:Clear()
end
