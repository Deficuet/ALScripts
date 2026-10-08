local var_0_0 = class("MainActRemasterBtn")

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
	return {
		param = "0",
		name = "event_actremaster",
		type = 3,
		text_pic = "text_event_all",
		id = 1,
		group_id = 1,
		pic = "event_actremaster",
		order = 1,
		time = {
			"default",
			51033
		}
	}
end

function var_0_0.InShowTime(arg_3_0)
	arg_3_0.config = arg_3_0:GetLinkConfig()

	return getProxy(ActivityRemasterProxy):ShouldShowActiveBtn()
end

function var_0_0.NewGameObject(arg_4_0)
	return arg_4_0._tf or Object.Instantiate(arg_4_0.tpl, arg_4_0.tpl.parent).transform
end

function var_0_0.Init(arg_5_0, arg_5_1)
	arg_5_0._tf = arg_5_0:NewGameObject()
	arg_5_0._tf.gameObject.name = arg_5_0.__cname
	arg_5_0.image = arg_5_0._tf:Find("Image"):GetComponent(typeof(Image))
	arg_5_0.subImage = arg_5_0._tf:Find("sub_Image"):GetComponent(typeof(Image))
	arg_5_0.tipTr = arg_5_0._tf:Find("Tip"):GetComponent(typeof(Image))
	arg_5_0.tipTxt = arg_5_0._tf:Find("Tip/Text"):GetComponent(typeof(Text))

	setActive(arg_5_0._tf, true)

	arg_5_0.tipTxt.text = ""

	arg_5_0:InitTipImage()
	arg_5_0:UpdatePosition(arg_5_1)
	arg_5_0:InitSubImage()
	arg_5_0:InitImage(function()
		arg_5_0:OnInit()
		arg_5_0:Register()
	end)
end

function var_0_0.Register(arg_7_0)
	onButton(arg_7_0, arg_7_0._tf, function()
		arg_7_0:emit(NewMainMediator.OPEN_ACT_REMASTER_SCENE)
	end, SFX_MAIN)
end

function var_0_0.InitImage(arg_9_0, arg_9_1)
	local var_9_0 = arg_9_0.config.pic

	if not var_9_0 or var_9_0 == arg_9_0.imgName then
		arg_9_1()

		return
	end

	arg_9_0.imgName = var_9_0

	LoadSpriteAtlasAsync(arg_9_0:ResPath() .. "/" .. var_9_0, "", function(arg_10_0)
		if IsNil(arg_9_0.image) then
			return
		end

		arg_9_0.image.sprite = arg_10_0

		arg_9_0.image:SetNativeSize()
		arg_9_1()
	end)
end

function var_0_0.InitSubImage(arg_11_0)
	if arg_11_0.hideSubImg then
		setActive(arg_11_0.subImage.gameObject, false)

		return
	end

	local var_11_0 = arg_11_0.config.text_pic

	setActive(arg_11_0.subImage.gameObject, var_11_0 ~= nil and var_11_0 ~= "")

	if not var_11_0 or var_11_0 == arg_11_0.subImgName then
		return
	end

	arg_11_0.subImgName = var_11_0

	GetImageSpriteFromAtlasAsync(arg_11_0:ResPath() .. "/" .. var_11_0, "", arg_11_0.subImage, true)
end

function var_0_0.GetTipImage(arg_12_0)
	return "tip"
end

function var_0_0.InitTipImage(arg_13_0)
	local var_13_0 = arg_13_0:GetTipImage()

	if not var_13_0 or var_13_0 == arg_13_0.tipImageName then
		return
	end

	arg_13_0.tipImageName = var_13_0

	GetImageSpriteFromAtlasAsync("LinkButton/" .. var_13_0, "", arg_13_0.tipTr, true)
end

function var_0_0.UpdatePosition(arg_14_0, arg_14_1)
	local var_14_0 = -20
	local var_14_1 = -150 - (arg_14_1 - 1) * (arg_14_0._tf.sizeDelta.y + var_14_0)

	arg_14_0._tf.anchoredPosition = Vector2(arg_14_0._tf.anchoredPosition.x, var_14_1, 0)
end

function var_0_0.Clear(arg_15_0)
	if arg_15_0._tf then
		setActive(arg_15_0._tf, false)
	end
end

function var_0_0.emit(arg_16_0, ...)
	arg_16_0.event:emit(...)
end

function var_0_0.Dispose(arg_17_0)
	pg.DelegateInfo.Dispose(arg_17_0)

	if arg_17_0._tf then
		Destroy(arg_17_0._tf.gameObject)

		arg_17_0._tf = nil
	end
end

function var_0_0.ResPath(arg_18_0)
	return "LinkButton"
end

function var_0_0.GetActivityID(arg_19_0)
	assert(false, "策划配置default类型 必须重写这个方法")
end

function var_0_0.CustomOnClick(arg_20_0)
	assert(false, "策划配置type = 0 这个按钮必须自己定义跳转行为")
end

function var_0_0.GetEventName(arg_21_0)
	assert(false, "overwrite me !!!")
end

function var_0_0.OnInit(arg_22_0)
	setActive(arg_22_0.tipTr.gameObject, true)
end

return var_0_0
