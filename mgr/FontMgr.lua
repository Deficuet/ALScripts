pg = pg or {}

local var_0_0 = pg

var_0_0.FontMgr = singletonClass("FontMgr")

local var_0_1 = var_0_0.FontMgr

var_0_1.FONT_NAME_IMPACT = "impact"

function var_0_1.Init(arg_1_0, arg_1_1)
	print("initializing font manager...")

	local var_1_0 = {}

	for iter_1_0, iter_1_1 in pairs({
		impact = "impact",
		remfont = "remfont",
		lvnumber = "lvnumber",
		heitibold = "ZhunYuan_Bold",
		crifont = "crifont",
		heiti = "zhunyuan",
		explofont = "explofont",
		bankgthd = "bankgthd",
		countnumber = "countnumber",
		weaponcountfont = "weaponcountfont",
		missfont = "missfont",
		treatfont = "treatfont",
		MStiffHei = "MStiffHei",
		chuanjiadanFont = "chuanjiadanFont",
		number = "number",
		sourcehanserifcn = "sourcehanserifcn-bold_0",
		weijichuanFont = "weijichuanFont"
	}) do
		table.insert(var_1_0, function(arg_2_0)
			AssetBundleHelper.StoreAssetBundle("font/" .. iter_1_1, true, false, function(arg_3_0)
				arg_2_0()
			end)
		end)
	end

	parallelAsync(var_1_0, function(arg_4_0)
		arg_1_1(arg_4_0)
	end)
end
