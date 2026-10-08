local var_0_0 = class("MainBannerView4Mellow", import("...theme_classic.view.MainBannerView"))

function var_0_0.Ctor(arg_1_0, arg_1_1, arg_1_2)
	var_0_0.super.Ctor(arg_1_0, arg_1_1, arg_1_2)

	arg_1_0.scrollSnap = BannerScrollRect4Mellow.New(findTF(arg_1_1, "mask/content"), findTF(arg_1_1, "dots"))
end

function var_0_0.LayoutBannerItem(arg_2_0, arg_2_1)
	local var_2_0 = arg_2_1.transform
	local var_2_1 = var_2_0.parent
	local var_2_2 = arg_2_1:GetComponent(typeof(Image))

	if IsNil(var_2_2) or IsNil(var_2_2.sprite) then
		return
	end

	var_2_0.localScale = Vector3.one
	var_2_0.anchorMin = Vector2(0.5, 0.5)
	var_2_0.anchorMax = Vector2(0.5, 0.5)
	var_2_0.anchoredPosition = Vector2.zero

	var_2_2:SetNativeSize()

	local var_2_3 = var_2_1.rect
	local var_2_4 = var_2_0.rect

	if var_2_3.width <= 0 or var_2_3.height <= 0 or var_2_4.width <= 0 or var_2_4.height <= 0 then
		return
	end

	local var_2_5 = var_2_3.width / var_2_4.width
	local var_2_6 = var_2_3.height / var_2_4.height
	local var_2_7 = math.max(var_2_5, var_2_6)

	var_2_0.localScale = Vector3(var_2_7, var_2_7, 1)
end

function var_0_0.WhenRecycleBanner(arg_3_0, arg_3_1)
	local var_3_0 = arg_3_1.transform

	var_3_0.localScale = Vector3.one
	var_3_0.anchorMin = Vector2(0.5, 0.5)
	var_3_0.anchorMax = Vector2(0.5, 0.5)
	var_3_0.anchoredPosition = Vector2.zero
end

function var_0_0.GetDirection(arg_4_0)
	return Vector2.zero
end

return var_0_0
