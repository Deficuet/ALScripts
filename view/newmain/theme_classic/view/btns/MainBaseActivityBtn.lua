local var_0_0 = class("MainBaseActivityBtn")

function var_0_0.Ctor(arg_1_0, arg_1_1, arg_1_2, arg_1_3, arg_1_4)
	arg_1_0.tpl = arg_1_1

	pg.DelegateInfo.New(arg_1_0)

	arg_1_0.event = arg_1_2
	arg_1_0.hideSubImg = arg_1_4

	if arg_1_3 then
		arg_1_0._tf = arg_1_0.tpl
	end
end

function var_0_0.GetLinkConfig(arg_2_0)
	local var_2_0 = arg_2_0:GetEventName()
	local var_2_1 = pg.activity_link_button
	local var_2_2 = var_2_1.get_id_list_by_name[var_2_0] or {}
	local var_2_3 = _.select(var_2_2, function(arg_3_0)
		local var_3_0 = var_2_1[arg_3_0].time

		if type(var_3_0) == "table" and var_3_0[1] and var_3_0[1] == "default" then
			return arg_2_0:InActTime(var_3_0[2])
		else
			return pg.TimeMgr.GetInstance():inTime(var_3_0)
		end
	end)

	if #var_2_3 > 0 then
		table.sort(var_2_3, function(arg_4_0, arg_4_1)
			return var_2_1[arg_4_0].order < var_2_1[arg_4_1].order
		end)

		return var_2_1[var_2_3[1]]
	end
end

function var_0_0.InActTime(arg_5_0, arg_5_1)
	local var_5_0 = arg_5_1 or arg_5_0:GetActivityID()

	if var_5_0 then
		local var_5_1 = getProxy(ActivityProxy):getActivityById(var_5_0)

		return var_5_1 and not var_5_1:isEnd()
	end

	return false
end

function var_0_0.InShowTime(arg_6_0)
	local var_6_0 = arg_6_0:GetLinkConfig()

	if var_6_0 ~= nil then
		arg_6_0.config = var_6_0

		return true
	else
		return false
	end
end

function var_0_0.NewGameObject(arg_7_0)
	return arg_7_0._tf or Object.Instantiate(arg_7_0.tpl, arg_7_0.tpl.parent).transform
end

function var_0_0.Init(arg_8_0, arg_8_1)
	arg_8_0._tf = arg_8_0:NewGameObject()
	arg_8_0._tf.gameObject.name = arg_8_0.__cname
	arg_8_0.image = arg_8_0._tf:Find("Image"):GetComponent(typeof(Image))
	arg_8_0.subImage = arg_8_0._tf:Find("sub_Image"):GetComponent(typeof(Image))
	arg_8_0.tipTr = arg_8_0._tf:Find("Tip"):GetComponent(typeof(Image))
	arg_8_0.tipTxt = arg_8_0._tf:Find("Tip/Text"):GetComponent(typeof(Text))

	setActive(arg_8_0._tf, true)

	arg_8_0.tipTxt.text = ""

	arg_8_0:InitTipImage()
	arg_8_0:UpdatePosition(arg_8_1)
	arg_8_0:InitSubImage()
	arg_8_0:InitImage(function()
		arg_8_0:OnInit()
		arg_8_0:Register()
	end)
end

function var_0_0.Register(arg_10_0)
	onButton(arg_10_0, arg_10_0._tf, function()
		if arg_10_0.config.type <= 0 then
			arg_10_0:CustomOnClick()
		else
			arg_10_0:OnClick()
		end
	end, SFX_MAIN)
end

function var_0_0.OnClick(arg_12_0)
	var_0_0.Skip(arg_12_0, arg_12_0.config)
end

function var_0_0.InitImage(arg_13_0, arg_13_1)
	local var_13_0 = arg_13_0.config.pic

	if not var_13_0 or var_13_0 == arg_13_0.imgName then
		arg_13_1()

		return
	end

	arg_13_0.imgName = var_13_0

	LoadSpriteAtlasAsync(arg_13_0:ResPath() .. "/" .. var_13_0, "", function(arg_14_0)
		if IsNil(arg_13_0.image) then
			return
		end

		arg_13_0.image.sprite = arg_14_0

		arg_13_0.image:SetNativeSize()
		arg_13_1()
	end)
end

function var_0_0.InitSubImage(arg_15_0)
	if arg_15_0.hideSubImg then
		setActive(arg_15_0.subImage.gameObject, false)

		return
	end

	local var_15_0 = arg_15_0.config.text_pic

	setActive(arg_15_0.subImage.gameObject, var_15_0 ~= nil and var_15_0 ~= "")

	if not var_15_0 or var_15_0 == arg_15_0.subImgName then
		return
	end

	arg_15_0.subImgName = var_15_0

	GetImageSpriteFromAtlasAsync(arg_15_0:ResPath() .. "/" .. var_15_0, "", arg_15_0.subImage, true)
end

function var_0_0.GetTipImage(arg_16_0)
	return "tip"
end

function var_0_0.InitTipImage(arg_17_0)
	local var_17_0 = arg_17_0:GetTipImage()

	if not var_17_0 or var_17_0 == arg_17_0.tipImageName then
		return
	end

	arg_17_0.tipImageName = var_17_0

	GetImageSpriteFromAtlasAsync("LinkButton/" .. var_17_0, "", arg_17_0.tipTr, true)
end

function var_0_0.UpdatePosition(arg_18_0, arg_18_1)
	local var_18_0 = -20
	local var_18_1 = -150 - (arg_18_1 - 1) * (arg_18_0._tf.sizeDelta.y + var_18_0)

	arg_18_0._tf.anchoredPosition = Vector2(arg_18_0._tf.anchoredPosition.x, var_18_1, 0)
end

function var_0_0.Clear(arg_19_0)
	if arg_19_0._tf then
		setActive(arg_19_0._tf, false)
	end
end

function var_0_0.emit(arg_20_0, ...)
	arg_20_0.event:emit(...)
end

function var_0_0.Dispose(arg_21_0)
	pg.DelegateInfo.Dispose(arg_21_0)

	if arg_21_0._tf then
		Destroy(arg_21_0._tf.gameObject)

		arg_21_0._tf = nil
	end
end

function var_0_0.Skip(arg_22_0, arg_22_1)
	if arg_22_1.type == GAMEUI_BANNER_1 then
		Application.OpenURL(arg_22_1.param)
	elseif arg_22_1.type == GAMEUI_BANNER_2 then
		arg_22_0:emit(NewMainMediator.SKIP_SCENE, arg_22_1.param)
	elseif arg_22_1.type == GAMEUI_BANNER_3 then
		arg_22_0:emit(NewMainMediator.SKIP_ACTIVITY, tonumber(arg_22_1.param))
	elseif arg_22_1.type == GAMEUI_BANNER_4 then
		arg_22_0:emit(NewMainMediator.SKIP_SHOP, arg_22_1.param)
	elseif arg_22_1.type == GAMEUI_BANNER_5 then
		-- block empty
	elseif arg_22_1.type == GAMEUI_BANNER_6 then
		arg_22_0:emit(NewMainMediator.GO_SCENE, SCENE.SELTECHNOLOGY)
	elseif arg_22_1.type == GAMEUI_BANNER_7 then
		arg_22_0:emit(NewMainMediator.GO_MINI_GAME, arg_22_1.param[1])
	elseif arg_22_1.type == GAMEUI_BANNER_8 then
		if getProxy(GuildProxy):getRawData() then
			arg_22_0:emit(NewMainMediator.GO_SCENE, SCENE.GUILD)
		else
			arg_22_0:emit(NewMainMediator.GO_SCENE, SCENE.NEWGUILD)
		end
	elseif arg_22_1.type == GAMEUI_BANNER_14 then
		arg_22_0:emit(NewMainMediator.OPEN_KINK_BUTTON_LAYER, Context.New({
			mediator = _G[arg_22_1.param.mediator],
			viewComponent = _G[arg_22_1.param.view]
		}))
	elseif arg_22_1.type == GAMEUI_BANNER_15 then
		arg_22_0:emit(NewMainMediator.SKIP_INS)
	elseif arg_22_1.type == GAMEUI_BANNER_16 then
		arg_22_0:emit(NewMainMediator.SKIP_CORE_ACTIVITY, arg_22_1.param)
	end
end

function var_0_0.ResPath(arg_23_0)
	return "LinkButton"
end

function var_0_0.GetActivityID(arg_24_0)
	assert(false, "策划配置default类型 必须重写这个方法")
end

function var_0_0.CustomOnClick(arg_25_0)
	assert(false, "策划配置type = 0 这个按钮必须自己定义跳转行为")
end

function var_0_0.GetEventName(arg_26_0)
	assert(false, "overwrite me !!!")
end

function var_0_0.OnInit(arg_27_0)
	return
end

return var_0_0
