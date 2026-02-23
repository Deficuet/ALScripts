pg = pg or {}
pg.dorm3d_collection_template = setmetatable({
	__name = "dorm3d_collection_template",
	get_id_list_by_room_id = {
		{
			1,
			2,
			3,
			4,
			5,
			6,
			7,
			8,
			9,
			10,
			11,
			12,
			13,
			14,
			15,
			16,
			17,
			18,
			19,
			20,
			21,
			22,
			23,
			24,
			25,
			26,
			27,
			28,
			29,
			30
		},
		[4] = {
			31,
			32,
			33,
			34,
			35,
			36,
			37,
			38,
			39
		},
		{
			51,
			52,
			53,
			54,
			55,
			56,
			57,
			58,
			59,
			60,
			61,
			62,
			63,
			64,
			65,
			66,
			67,
			68,
			70,
			72,
			71,
			76,
			77,
			78,
			79,
			74,
			75
		},
		{
			101,
			102,
			103,
			104,
			105,
			106,
			107,
			108,
			109,
			110,
			111,
			112,
			113,
			114,
			115,
			116,
			117,
			118,
			119,
			120,
			121,
			122,
			123,
			124,
			125,
			126,
			127,
			128
		},
		[11] = {
			1101,
			1102,
			1103,
			1104,
			1105,
			1106,
			1107,
			1108,
			1109,
			1110,
			1111,
			1112,
			1113,
			1114,
			1115,
			1116,
			1117,
			1118,
			1119,
			1120,
			1121,
			1122,
			1123,
			1124,
			1125,
			1126,
			1127,
			1128
		},
		[12] = {
			1201,
			1202,
			1203,
			1204,
			1205,
			1206,
			1207,
			1208,
			1209,
			1210,
			1211,
			1212,
			1213,
			1214,
			1215,
			1216,
			1217,
			1218,
			1219,
			1220,
			1221,
			1222,
			1223,
			1224,
			1225,
			1226,
			1227,
			1228,
			1229,
			1230
		},
		[16] = {
			1601,
			1602,
			1603,
			1604,
			1605,
			1606,
			1607,
			1608,
			1609
		},
		[14] = {
			1401,
			1402,
			1403,
			1404,
			1405,
			1406,
			1407,
			1408,
			1409,
			1410,
			1411,
			1412,
			1413,
			1414,
			1415,
			1416,
			1417,
			1418,
			1419,
			1420,
			1421,
			1422,
			1423,
			1424,
			1425
		}
	},
	all = {
		1,
		2,
		3,
		4,
		5,
		6,
		7,
		8,
		9,
		10,
		11,
		12,
		13,
		14,
		15,
		16,
		17,
		18,
		19,
		20,
		21,
		22,
		23,
		24,
		25,
		26,
		27,
		28,
		29,
		30,
		31,
		32,
		33,
		34,
		35,
		36,
		37,
		38,
		39,
		51,
		52,
		53,
		54,
		55,
		56,
		57,
		58,
		59,
		60,
		61,
		62,
		63,
		64,
		65,
		66,
		67,
		68,
		70,
		72,
		71,
		76,
		77,
		78,
		79,
		74,
		75,
		101,
		102,
		103,
		104,
		105,
		106,
		107,
		108,
		109,
		110,
		111,
		112,
		113,
		114,
		115,
		116,
		117,
		118,
		119,
		120,
		121,
		122,
		123,
		124,
		125,
		126,
		127,
		128,
		1101,
		1102,
		1103,
		1104,
		1105,
		1106,
		1107,
		1108,
		1109,
		1110,
		1111,
		1112,
		1113,
		1114,
		1115,
		1116,
		1117,
		1118,
		1119,
		1120,
		1121,
		1122,
		1123,
		1124,
		1125,
		1126,
		1127,
		1128,
		1201,
		1202,
		1203,
		1204,
		1205,
		1206,
		1207,
		1208,
		1209,
		1210,
		1211,
		1212,
		1213,
		1214,
		1215,
		1216,
		1217,
		1218,
		1219,
		1220,
		1221,
		1222,
		1223,
		1224,
		1225,
		1226,
		1227,
		1228,
		1229,
		1230,
		1601,
		1602,
		1603,
		1604,
		1605,
		1606,
		1607,
		1608,
		1609,
		1401,
		1402,
		1403,
		1404,
		1405,
		1406,
		1407,
		1408,
		1409,
		1410,
		1411,
		1412,
		1413,
		1414,
		1415,
		1416,
		1417,
		1418,
		1419,
		1420,
		1421,
		1422,
		1423,
		1424,
		1425
	}
}, confHX)
pg.base = pg.base or {}
pg.base.dorm3d_collection_template = {
	{
		text = "dorm3d_sirius_table",
		name = "Microwave Oven",
		award = 0,
		time = 0,
		id = 1,
		room_id = 1,
		icon = "3Ddrom_tianlangxing_item5",
		desc = "A microwave oven Sirius bought herself. Despite seeing heavy use, it somehow looks as pristine as the day it was purchased.",
		model = {
			"fbx/litmap_04/pre_db_electrical01"
		},
		unlock = {
			1,
			20220,
			1
		},
		vfx_prefab = {
			"fbx/litmap_04/pre_db_electrical01/vfx_wupintishi01"
		}
	},
	{
		text = "dorm3d_sirius_table",
		name = "Coffee Machine",
		award = 0,
		time = 0,
		id = 2,
		room_id = 1,
		icon = "3Ddrom_tianlangxing_item6",
		desc = "Sirius uses this to make coffee every morning.The machine still has traces of her fingerprints on it.",
		model = {
			"fbx/litmap_04/pre_db_electrical07"
		},
		unlock = {
			1,
			20220,
			1
		},
		vfx_prefab = {
			"fbx/litmap_04/pre_db_electrical07/vfx_wupintishi01"
		}
	},
	{
		text = "dorm3d_sirius_table",
		name = "Mary Janes",
		award = 0,
		time = 1,
		id = 3,
		room_id = 1,
		icon = "3Ddrom_tianlangxing_item2",
		desc = "The pair of shoes that Sirius wears all the time. They are loved and cared for, and thus the leather retains its soft luster.",
		model = {
			"fbx/litmap_01/pre_db_shoe01"
		},
		unlock = {
			1,
			20220,
			1
		},
		vfx_prefab = {
			"fbx/litmap_01/pre_db_shoe01/vfx_wupintishi01"
		}
	},
	{
		text = "dorm3d_sirius_table",
		name = "Wall-Mounted Photograph",
		award = 0,
		time = 0,
		id = 4,
		room_id = 1,
		icon = "3Ddrom_tianlangxing_item8",
		desc = "The subject is an orange tabby wearing a blue necktie. Behind the apparent sophistication lies a silly but cute appeal. It's safe to say the tenant likes this particular kind of cuteness.",
		model = {
			"fbx/litmap_03/pre_db_billboard06d"
		},
		unlock = {
			1,
			20220,
			1
		},
		vfx_prefab = {
			"fbx/litmap_03/pre_db_billboard06d/vfx_wupintishi01"
		}
	},
	{
		text = "dorm3d_sirius_chair",
		name = "Toaster",
		award = 0,
		time = 1,
		id = 5,
		room_id = 1,
		icon = "3Ddrom_tianlangxing_item9",
		desc = "A very practical machine for the novice at-home cook. Drop in some bread slices, push down, and soon you'll have hot, crispy toast. You can of course adjust how toasty you want it.",
		model = {
			"no_bake_prop/pre_db_electrical02"
		},
		unlock = {
			1,
			20220,
			1
		},
		vfx_prefab = {
			"no_bake_prop/pre_db_electrical02/vfx_wupintishi01"
		}
	},
	{
		text = "dorm3d_sirius_chair",
		name = "Trash Can",
		award = 0,
		time = 1,
		id = 6,
		room_id = 1,
		icon = "3Ddrom_tianlangxing_item10",
		desc = "Also known as a \"rubbish bin\" in some parts of the world. You look and you look, but you can't find anything unusual about this wholly unremarkable waste receptacle.",
		model = {
			"no_bake_prop/pre_db_pail01"
		},
		unlock = {
			1,
			20220,
			1
		},
		vfx_prefab = {
			"no_bake_prop/pre_db_pail01/vfx_wupintishi01"
		}
	},
	{
		text = "dorm3d_sirius_chair",
		name = "Blue Sky Picture Frame",
		award = 0,
		time = 0,
		id = 7,
		room_id = 1,
		icon = "3Ddrom_tianlangxing_item17",
		desc = "This frame doesn't have a proper photo in it yet. The placeholder image is just there to look more appealing than a plain beige background.",
		model = {
			"fbx/litmap_03/pre_db_billboard02"
		},
		unlock = {
			1,
			20220,
			1
		},
		vfx_prefab = {
			"fbx/litmap_03/pre_db_billboard02/vfx_wupintishi01"
		}
	},
	{
		text = "dorm3d_sirius_chair",
		name = "Preserved Butterfly",
		award = 0,
		time = 0,
		id = 8,
		room_id = 1,
		icon = "3Ddrom_tianlangxing_item12",
		desc = "The pattern on its wings reminds you of a wave washing up on a shore, and of Sirius sprinting across the sea, her hair fluttering in the wind. You should invite Sirius to go on a walk on the beach the next time you're free.",
		model = {
			"fbx/litmap_03/pre_db_billboard03 (1)"
		},
		unlock = {
			1,
			20220,
			1
		},
		vfx_prefab = {
			"fbx/litmap_03/pre_db_billboard03 (1)/vfx_wupintishi01"
		}
	},
	{
		text = "dorm3d_sirius_chair",
		name = "Floor Lamp",
		award = 0,
		time = 0,
		id = 9,
		room_id = 1,
		icon = "3Ddrom_tianlangxing_item15",
		desc = "A floor lamp standing just by the couch. Sirius graciously thought ahead and picked a bulb that wouldn't strain your eyes. You could see yourself working from here every now and then.",
		model = {
			"fbx/litmap_03/pre_db_chandelier06"
		},
		unlock = {
			1,
			20220,
			1
		},
		vfx_prefab = {
			"fbx/litmap_03/pre_db_chandelier06/vfx_wupintishi01"
		}
	},
	{
		text = "dorm3d_sirius_bed",
		name = "Bread Plate",
		award = 0,
		time = 1,
		id = 10,
		room_id = 1,
		icon = "3Ddrom_tianlangxing_item16",
		desc = "Two sandwiches and a croissant. Baked by Sirius, from the looks of it. Although they look and smell perfectly fine, you probably shouldn't taste them until Sirius urges you to.",
		model = {
			"fbx/litmap_04/pre_db_food01b"
		},
		unlock = {
			1,
			20220,
			1
		},
		vfx_prefab = {
			"fbx/litmap_04/pre_db_food01b/vfx_wupintishi01"
		}
	},
	{
		text = "dorm3d_sirius_bed",
		name = "Recreational Reading",
		award = 0,
		time = 1,
		id = 11,
		room_id = 1,
		icon = "3Ddrom_tianlangxing_item25",
		desc = "A book lying on the table by the bed. Sirius has been reading this one quite a lot lately. After flipping through a few pages, you figure out that it's a story about a forbidden love between a maid and her master.",
		model = {
			"no_bake_prop/pre_db_book01"
		},
		unlock = {
			1,
			20220,
			1
		},
		vfx_prefab = {
			"no_bake_prop/pre_db_book01/vfx_wupintishi01"
		}
	},
	{
		text = "dorm3d_sirius_bath",
		name = "Wine Glasses",
		award = 0,
		time = 1,
		id = 12,
		room_id = 1,
		icon = "3Ddrom_tianlangxing_item14",
		desc = "They're filled not with wine, but water. A perfect illustration of the kind of service Sirius provides. Although, drinking water from a wine glass with your pinky extended is a chore. You should tell her to get some regular glasses someday.",
		model = {
			"no_bake_prop/pre_db_tableware07"
		},
		unlock = {
			1,
			20220,
			1
		},
		vfx_prefab = {
			"no_bake_prop/pre_db_tableware07/vfx_wupintishi01"
		}
	},
	{
		text = "dorm3d_sirius_bath",
		name = "Legendary Sword Replica",
		award = 0,
		time = 0,
		id = 13,
		room_id = 1,
		icon = "3Ddrom_tianlangxing_item11",
		desc = "A replica of the hero's sword from the smash hit port virtual reality RPG. The stand says, \"For Kitchen Adventures.\" It's no wonder why the one in Sirius' room feels so much heavier.",
		model = {
			"no_bake_prop/pre_db_decoration02"
		},
		unlock = {
			1,
			20220,
			1
		},
		vfx_prefab = {
			"no_bake_prop/pre_db_decoration02/vfx_wupintishi01"
		}
	},
	{
		text = "dorm3d_sirius_bath",
		name = "Flower Arrangement 1",
		award = 0,
		time = 0,
		id = 14,
		room_id = 1,
		icon = "3Ddrom_tianlangxing_item19",
		desc = "One of the fruits of Sirius' practicing of flower arrangement. While it isn't very varied in color, the flowers are distributed well. These would look better in a more open place.",
		model = {
			"fbx/litmap_04/pre_db_ceram05 (1)"
		},
		unlock = {
			1,
			20220,
			1
		},
		vfx_prefab = {
			"fbx/litmap_04/pre_db_ceram05 (1)/vfx_wupintishi01"
		}
	},
	{
		text = "dorm3d_sirius_bed",
		name = "Bedside Books",
		award = 0,
		time = 1,
		id = 15,
		room_id = 1,
		icon = "3Ddrom_tianlangxing_item20",
		desc = "A pile of books lying by the bedside. Surprisingly, they're not all about cooking – they cover subjects like military tactics and how to provide optimal service. Sirius' personal notes are layered between the books. Judging by their contents, she's diligently studying to become an even better maid.",
		model = {
			"fbx/litmap_01/pre_db_book08"
		},
		unlock = {
			1,
			20220,
			1
		},
		vfx_prefab = {
			"fbx/litmap_01/pre_db_book08/vfx_wupintishi01"
		}
	},
	{
		text = "dorm3d_sirius_bed",
		name = "Dresser",
		award = 0,
		time = 0,
		id = 16,
		room_id = 1,
		icon = "3Ddrom_tianlangxing_item22",
		desc = "Sirius must have been in a rush to see you, because she forgot to put the cap back on her lipstick. Be kind and do it for her!",
		model = {
			"no_bake_prop/pre_db_dressingtablecomponents01"
		},
		unlock = {
			1,
			20220,
			1
		},
		vfx_prefab = {
			"no_bake_prop/pre_db_dressingtablecomponents01/vfx_wupintishi01"
		}
	},
	{
		text = "dorm3d_sirius_bed",
		name = "Jewelry Case",
		award = 0,
		time = 0,
		id = 17,
		room_id = 1,
		icon = "3Ddrom_tianlangxing_item18",
		desc = "An expensive piece of jewelry. Sirius hasn't worn it even once, preferring to keep it nice and safe behind the glass.",
		model = {
			"no_bake_prop/pre_db_jewelrybox01"
		},
		unlock = {
			1,
			20220,
			1
		},
		vfx_prefab = {
			"no_bake_prop/pre_db_jewelrybox01/vfx_wupintishi01"
		}
	},
	{
		text = "dorm3d_sirius_bed",
		name = "Flower Arrangement 2",
		award = 0,
		time = 0,
		id = 18,
		room_id = 1,
		icon = "3Ddrom_tianlangxing_item26",
		desc = "A pair of pretty yellow roses. They bring a sunny mood to whatever table they find themselves atop. You start to wonder what flower is Sirius' favorite.",
		model = {
			"fbx/litmap_02/pre_db_ceram10_01"
		},
		unlock = {
			1,
			20220,
			1
		},
		vfx_prefab = {
			"fbx/litmap_02/pre_db_ceram10_01/vfx_wupintishi01"
		}
	},
	{
		text = "dorm3d_sirius_bed",
		name = "Mystery Novel",
		award = 0,
		time = 1,
		id = 19,
		room_id = 1,
		icon = "3Ddrom_tianlangxing_item28",
		desc = "A mystery book yet to be even opened. One can assume this genre isn't Sirius' cup of tea for the time being.",
		model = {
			"fbx/litmap_02/pre_db_book02"
		},
		unlock = {
			1,
			20220,
			1
		},
		vfx_prefab = {
			"fbx/litmap_02/pre_db_book02/vfx_wupintishi01"
		}
	},
	{
		text = "dorm3d_sirius_bed",
		name = "Stuffed Shiba Inu",
		award = 0,
		time = 1,
		id = 20,
		room_id = 1,
		icon = "3Ddrom_tianlangxing_item29",
		desc = "It has writing on its stomach that reads, \"EXPERTLY CRAFTED BY AKASHI.\" Sirius is a regular patron of hers.",
		model = {
			"fbx/litmap_03/pre_db_toy03"
		},
		unlock = {
			1,
			20220,
			1
		},
		vfx_prefab = {
			"fbx/litmap_03/pre_db_toy03/vfx_wupintishi01"
		}
	},
	{
		text = "dorm3d_sirius_bath",
		name = "A Summer Memory",
		award = 0,
		time = 0,
		id = 21,
		room_id = 1,
		icon = "3Ddrom_tianlangxing_item30",
		desc = "The float ring Sirius used when you went to the beach with her. It's placed in a very eye-catching location inside her home. Being a maid, she's hesitant to ask her master to go swimming with her for fear of making a faux pas. So instead, you should be the one to ask her.",
		model = {
			"no_bake_prop/pre_db_toy02"
		},
		unlock = {
			1,
			20220,
			1
		},
		vfx_prefab = {
			"no_bake_prop/pre_db_toy02/vfx_wupintishi01"
		}
	},
	{
		text = "dorm3d_sirius_bath",
		name = "Box of Books",
		award = 0,
		time = 0,
		id = 22,
		room_id = 1,
		icon = "3Ddrom_tianlangxing_item31",
		desc = "A storage box for regular workbooks. Sirius says the notepads outline her maidly work schedules. You see half-faded writing on the label on the cover. \"The Ways I Want to Be --------\" it says – half of the title has been almost completely erased.",
		model = {
			"no_bake_prop/pre_db_paperskin01"
		},
		unlock = {
			1,
			20220,
			1
		},
		vfx_prefab = {
			"no_bake_prop/pre_db_paperskin01/vfx_wupintishi01"
		}
	},
	{
		text = "dorm3d_sirius_bath",
		name = "Watering Pot",
		award = 0,
		time = 0,
		id = 23,
		room_id = 1,
		icon = "3Ddrom_tianlangxing_item27",
		desc = "A watering can keeps the potted plants and flowers around the room happy. This is not a watering can. It's very blatantly a teapot. You wonder what bizarre thinking led Sirius to start using this in place of a proper watering can.",
		model = {
			"no_bake_prop/pre_db_smalltool02"
		},
		unlock = {
			1,
			20220,
			1
		},
		vfx_prefab = {
			"no_bake_prop/pre_db_smalltool02/vfx_wupintishi01"
		}
	},
	{
		text = "dorm3d_sirius_bed",
		name = "Nightlight",
		award = 0,
		time = 2,
		id = 24,
		room_id = 1,
		icon = "3Ddrom_tianlangxing_item32",
		desc = "A nightlight with an endearing design.Sirius got it so she wouldn't trip and fall when she gets up at night.Its warm light reminds you of the warmth of her smile.",
		model = {
			"no_bake_prop/pre_db_desklamp02"
		},
		unlock = {
			1,
			20220,
			1
		},
		vfx_prefab = {
			"no_bake_prop/pre_db_desklamp02/vfx_wupintishi01"
		}
	},
	{
		text = "dorm3d_sirius_bed",
		name = "Sunglasses",
		award = 0,
		time = 2,
		id = 25,
		room_id = 1,
		icon = "3Ddrom_tianlangxing_item33",
		desc = "The pair of sunglasses Sirius brought with her to the beach.She leaves them where they're always in reach.",
		model = {
			"no_bake_prop/pre_db_glasses01"
		},
		unlock = {
			1,
			20220,
			1
		},
		vfx_prefab = {
			"no_bake_prop/pre_db_glasses01/vfx_wupintishi01"
		}
	},
	{
		text = "dorm3d_sirius_bath",
		name = "Body Lotion",
		award = 0,
		time = 2,
		id = 26,
		room_id = 1,
		icon = "3Ddrom_tianlangxing_item34",
		desc = "Sirius uses this body lotion after her baths.Sometimes, you can smell its faint aroma even from the door to her quarters.",
		model = {
			"no_bake_prop/pre_db_cosmetic15"
		},
		unlock = {
			1,
			20220,
			1
		},
		vfx_prefab = {
			"no_bake_prop/pre_db_cosmetic15/vfx_wupintishi01"
		}
	},
	{
		text = "dorm3d_sirius_bed",
		name = "Aroma Diffuser",
		award = 0,
		time = 2,
		id = 27,
		room_id = 1,
		icon = "3Ddrom_tianlangxing_item35",
		desc = "This diffuser exudes a mild floral scent. Sirius chose it with great care.The aroma supposedly relieves stress and helps the mind relax.",
		model = {
			"no_bake_prop/pre_db_cosmetic14"
		},
		unlock = {
			1,
			20220,
			1
		},
		vfx_prefab = {
			"no_bake_prop/pre_db_cosmetic14/vfx_wupintishi01"
		}
	},
	{
		text = "dorm3d_sirius_chair",
		name = "White Towel",
		award = 0,
		time = 2,
		id = 28,
		room_id = 1,
		icon = "3Ddrom_tianlangxing_item36",
		desc = "This white towel was haphazardly left here. It's still slightly moist to the touch.Maybe Sirius just got done in the bathroom? Who knows.",
		model = {
			"no_bake_prop/pre_db_towel10"
		},
		unlock = {
			1,
			20220,
			1
		},
		vfx_prefab = {
			"no_bake_prop/pre_db_towel10/vfx_wupintishi01"
		}
	},
	{
		text = "dorm3d_sirius_bed",
		name = "How to Win Your Commander's Heart - Volume 2",
		award = 0,
		time = 2,
		id = 29,
		room_id = 1,
		icon = "3Ddrom_tianlangxing_item37",
		desc = "A book Sirius left by her bedside.What is this book doing here?Also, they made TWO volumes of this?",
		model = {
			"no_bake_prop/pre_db_book10"
		},
		unlock = {
			1,
			20220,
			1
		},
		vfx_prefab = {
			"no_bake_prop/pre_db_book10/vfx_wupintishi01"
		}
	},
	{
		text = "dorm3d_sirius_chair",
		name = "Half-Drunk Milk",
		award = 0,
		time = 2,
		id = 30,
		room_id = 1,
		icon = "3Ddrom_tianlangxing_item38",
		desc = "Half full, or half empty? Either way, it's sitting on the table and has faint lip markings along its rim.",
		model = {
			"no_bake_prop/pre_db_drink01"
		},
		unlock = {
			1,
			20220,
			1
		},
		vfx_prefab = {
			"no_bake_prop/pre_db_drink01/vfx_wupintishi01"
		}
	},
	{
		text = "dorm3d_collection_beach",
		name = "Splendid Sandcastle",
		award = 0,
		time = 0,
		id = 31,
		room_id = 4,
		icon = "3Ddrom_beach_item1",
		desc = "This sandcastle shines golden under the sun. Its builder put clear effort into everything down to the smallest details.You can readily picture just how much work was put into it.Here's hoping that the waves won't wash it away.",
		model = {
			"no_bake_prop/pre_dp_toy05_01"
		},
		unlock = {
			1,
			20220,
			1
		},
		vfx_prefab = {
			"no_bake_prop/pre_dp_toy05_01/vfx_wupintishi01"
		}
	},
	{
		text = "dorm3d_collection_beach",
		name = "Beach Tools",
		award = 0,
		time = 0,
		id = 32,
		room_id = 4,
		icon = "3Ddrom_beach_item2",
		desc = "A shovel and a bucket lying in the sand. Looks like someone was using them until just a minute ago.You think to yourself that maybe you should have a sandcastle-building contest next time you visit the beach with someone.",
		model = {
			"no_bake_prop/pre_db_smalltool09_01"
		},
		unlock = {
			1,
			20220,
			1
		},
		vfx_prefab = {
			"no_bake_prop/pre_db_smalltool09_01/vfx_wupintishi01"
		}
	},
	{
		text = "dorm3d_collection_beach",
		name = "Seabreeze Guitar",
		award = 0,
		time = 0,
		id = 33,
		room_id = 4,
		icon = "3Ddrom_beach_item3",
		desc = "A wooden guitar, forgotten and left behind by its own. Brine lingers inside its cavity, and it smells like the sea. Its notes sound almost like the lapping of waves on a beach.",
		model = {
			"no_bake_prop/pre_guitar02"
		},
		unlock = {
			1,
			20220,
			1
		},
		vfx_prefab = {
			"no_bake_prop/pre_guitar02/vfx_wupintishi01"
		}
	},
	{
		text = "dorm3d_collection_beach",
		name = "Half-Consumed Drink",
		award = 0,
		time = 0,
		id = 34,
		room_id = 4,
		icon = "3Ddrom_beach_item4",
		desc = "A partially drunk beverage. It's still cold, with drops of condensation gently running down its sides. Whoever this belonged to earlier, the beached has claimed it now.",
		model = {
			"no_bake_prop/pre_db_drink06_01"
		},
		unlock = {
			1,
			20220,
			1
		},
		vfx_prefab = {
			"no_bake_prop/pre_db_drink06_01/vfx_wupintishi01"
		}
	},
	{
		text = "dorm3d_collection_beach",
		name = "Surfboards",
		award = 0,
		time = 0,
		id = 35,
		room_id = 4,
		icon = "3Ddrom_beach_item5",
		desc = "These surfboards have been casually left here. Their many scratches whisper stories about past encounters with fierce waves. Maybe you should go surfing the next time you visit the beach with someone.",
		model = {
			"no_bake_prop/pre_db_sportinggoods04a_01"
		},
		unlock = {
			1,
			20220,
			1
		},
		vfx_prefab = {
			"no_bake_prop/pre_db_sportinggoods04a_01/vfx_wupintishi01"
		}
	},
	{
		text = "dorm3d_collection_beach",
		name = "Cooler",
		award = 0,
		time = 0,
		id = 36,
		room_id = 4,
		icon = "3Ddrom_beach_item6",
		desc = "A cute little cooler. Someone must have packed for some sort of party, because it's stuffed full of drinks and snacks. You can't help but wonder where its owner has gone.",
		model = {
			"fbx/litmap06/box/pre_plasticbox01_2"
		},
		unlock = {
			1,
			20220,
			1
		},
		vfx_prefab = {
			"fbx/litmap06/box/pre_plasticbox01_2/vfx_wupintishi01"
		}
	},
	{
		text = "dorm3d_collection_beach",
		name = "Inner Tubes",
		award = 0,
		time = 0,
		id = 37,
		room_id = 4,
		icon = "3Ddrom_beach_item7",
		desc = "Two inner tubes, one in blue and one in yellow, silently resting on the beach. While they look pretty old, they are still able to do their job perfectly well.",
		model = {
			"no_bake_prop/pre_db_sportinggoods02_01"
		},
		unlock = {
			1,
			20220,
			1
		},
		vfx_prefab = {
			"no_bake_prop/pre_db_sportinggoods02_01/vfx_wupintishi01"
		}
	},
	{
		text = "dorm3d_collection_beach",
		name = "Trash Can",
		award = 0,
		time = 0,
		id = 38,
		room_id = 4,
		icon = "3Ddrom_beach_item8",
		desc = "A trash can with a humble design. Remember: don't litter on the beach! Keeping it clean is just as important as keeping the oceans clean.",
		model = {
			"no_bake_prop/pre_db_trashcan02"
		},
		unlock = {
			1,
			20220,
			1
		},
		vfx_prefab = {
			"no_bake_prop/pre_db_trashcan02/vfx_wupintishi01"
		}
	},
	{
		text = "dorm3d_collection_beach",
		name = "Lantern",
		award = 0,
		time = 0,
		id = 39,
		room_id = 4,
		icon = "3Ddrom_beach_item9",
		desc = "A lantern with a simple design. When it gets dark at the beach, this can be a real lifesaver. It's all but begging to be brought along on a fantastical nightly stroll along the sea.",
		model = {
			"fbx/litmap04/pre_desklamp01"
		},
		unlock = {
			1,
			20220,
			1
		},
		vfx_prefab = {
			"fbx/litmap04/pre_desklamp01/vfx_wupintishi01"
		}
	},
	[51] = {
		text = "dorm3d_noshiro_chair",
		name = "Hanami Dango Plate",
		award = 0,
		time = 0,
		id = 51,
		room_id = 2,
		icon = "3Ddrom_nengdai_item1",
		desc = "The delectable dango rest quietly on a ceramic plate,\nperfectly complementing the tablecloth's design.\nEnjoy them with her later.",
		model = {
			"fbx/no_bake_pay_prop/livingroom/table/pre_db_tableware14"
		},
		unlock = {
			1,
			30221,
			1
		},
		vfx_prefab = {
			"fbx/no_bake_pay_prop/livingroom/table/pre_db_tableware14/vfx_wupintishi01"
		}
	},
	[52] = {
		text = "dorm3d_noshiro_chair",
		name = "Tri-Color Mochi",
		award = 0,
		time = 0,
		id = 52,
		room_id = 2,
		icon = "3Ddrom_nengdai_item2",
		desc = "Green grass, white snow, peach blossoms;\nhealth, purity, protection;\nsoft and chewy, filled with her heartfelt wishes...",
		model = {
			"fbx/no_bake_pay_prop/livingroom/table/pre_db_tableware15"
		},
		unlock = {
			1,
			30221,
			1
		},
		vfx_prefab = {
			"fbx/no_bake_pay_prop/livingroom/table/pre_db_tableware15/vfx_wupintishi01"
		}
	},
	[53] = {
		text = "dorm3d_noshiro_bed",
		name = "Opened Book",
		award = 0,
		time = 1,
		id = 53,
		room_id = 2,
		icon = "3Ddrom_nengdai_item3",
		desc = "A book on traditional Sakuran tea ceremonies,\nits corners slightly weathered.\nNoshiro appears to revisit this book often,\nleaving many neat notes on the last pages.",
		model = {
			"fbx/litmap_03/day/pre_db_book01"
		},
		unlock = {
			1,
			30221,
			1
		},
		vfx_prefab = {
			"fbx/litmap_03/day/pre_db_book01/vfx_wupintishi01"
		}
	},
	[54] = {
		text = "dorm3d_noshiro_bed",
		name = "Bedding",
		award = 0,
		time = 0,
		id = 54,
		room_id = 2,
		icon = "3Ddrom_nengdai_item4",
		desc = "Neatly folded bedding.\nThe precise corners are a testament to its owner's diligence.",
		model = {
			"fbx/litmap_04/pre_db_quilt01"
		},
		unlock = {
			1,
			30221,
			1
		},
		vfx_prefab = {
			"fbx/litmap_04/pre_db_quilt01/vfx_wupintishi01"
		}
	},
	[55] = {
		text = "dorm3d_noshiro_bed",
		name = "Uniform",
		award = 0,
		time = 0,
		id = 55,
		room_id = 2,
		icon = "3Ddrom_nengdai_item5",
		desc = "The uniform hanging on the wall is the same as the one she is wearing.\nLooks like this is the outfit she likes the most.",
		model = {
			"fbx/litmap_03/pre_db_cloth02_01"
		},
		unlock = {
			1,
			30221,
			1
		},
		vfx_prefab = {
			"fbx/litmap_03/pre_db_cloth02_01/vfx_wupintishi01"
		}
	},
	[56] = {
		text = "dorm3d_noshiro_chair",
		name = "Sakuran Sweets",
		award = 0,
		time = 0,
		id = 56,
		room_id = 2,
		icon = "3Ddrom_nengdai_item6",
		desc = "A beautifully arranged assortment of Sakuran sweets, each handmade by Noshiro.\nThough they may almost be too pretty to eat,\nbe sure to savor them later – lest her hard work will go to waste!",
		model = {
			"fbx/no_bake_pay_prop/livingroom/table/pre_db_tableware13"
		},
		unlock = {
			1,
			30221,
			1
		},
		vfx_prefab = {
			"fbx/no_bake_pay_prop/livingroom/table/pre_db_tableware13/vfx_wupintishi01"
		}
	},
	[57] = {
		text = "dorm3d_noshiro_chair",
		name = "Wind Chime",
		award = 0,
		time = 0,
		id = 57,
		room_id = 2,
		icon = "3Ddrom_nengdai_item7",
		desc = "A wind chime hangs by the window,\nproducing a clear melody as the breeze passes through.\nAccording to Noshiro, it's one of the best ways to beat the summer heat.",
		model = {
			"fbx/litmap_03/pre_db_curtain04"
		},
		unlock = {
			1,
			30221,
			1
		},
		vfx_prefab = {
			"fbx/litmap_03/pre_db_curtain04/vfx_wupintishi01"
		}
	},
	[58] = {
		text = "dorm3d_noshiro_table",
		name = "Wind Chime 2",
		award = 0,
		time = 0,
		id = 58,
		room_id = 2,
		icon = "3Ddrom_nengdai_item8",
		desc = "This wind chime produces a deeper tone than the glass one.\nNoshiro has purposefully hung it up elsewhereso the different notes interweave, creating a unique mood.",
		model = {
			"fbx/litmap_03/pre_db_decoration06"
		},
		unlock = {
			1,
			30221,
			1
		},
		vfx_prefab = {
			"fbx/litmap_03/pre_db_decoration06/vfx_wupintishi01"
		}
	},
	[59] = {
		text = "dorm3d_noshiro_table",
		name = "Shopping Bag",
		award = 0,
		time = 0,
		id = 59,
		room_id = 2,
		icon = "3Ddrom_nengdai_item9",
		desc = "A paper bag bearing a coffee shop logo.\nNoshiro treats it with great care,\nmore than you'd expect for a regular paper bag.",
		model = {
			"fbx/litmap_03/pre_db_bag01"
		},
		unlock = {
			1,
			30221,
			1
		},
		vfx_prefab = {
			"fbx/litmap_03/pre_db_bag01/vfx_wupintishi01"
		}
	},
	[60] = {
		text = "dorm3d_noshiro_bed",
		name = "Sakuran Kimono",
		award = 0,
		time = 0,
		id = 60,
		room_id = 2,
		icon = "3Ddrom_nengdai_item10",
		desc = "The gold-thread embroidery on this kimono's sleeves speaks of its elegance.\nIt's Noshiro's favorite.\nShe always conducts herself carefully when she wears it outside.",
		model = {
			"fbx/litmap_03/pre_db_frame06"
		},
		unlock = {
			1,
			30221,
			1
		},
		vfx_prefab = {
			"fbx/litmap_03/pre_db_frame06/vfx_wupintishi01"
		}
	},
	[61] = {
		text = "dorm3d_noshiro_chair",
		name = "Preserved Flowers",
		award = 0,
		time = 0,
		id = 61,
		room_id = 2,
		icon = "3Ddrom_nengdai_item11",
		desc = "Yellow roses carefully preserved inside a bell jar.\nThe petals retain their vivid color even to this day.",
		model = {
			"fbx/litmap_03/day/pre_db_decoration07"
		},
		unlock = {
			1,
			30221,
			1
		},
		vfx_prefab = {
			"fbx/litmap_03/day/pre_db_decoration07/vfx_wupintishi01"
		}
	},
	[62] = {
		text = "dorm3d_noshiro_chair",
		name = "Pine Bonsai",
		award = 0,
		time = 0,
		id = 62,
		room_id = 2,
		icon = "3Ddrom_nengdai_item12",
		desc = "A small pine tree bonsai.\nThe branches have been trimmed in a plain yet tasteful way.\nNoshiro tends to it daily, preserving its natural beauty in perfect form.",
		model = {
			"fbx/litmap_03/pre_db_bonsai03_01"
		},
		unlock = {
			1,
			30221,
			1
		},
		vfx_prefab = {
			"fbx/litmap_03/pre_db_bonsai03_01/vfx_wupintishi01"
		}
	},
	[63] = {
		text = "dorm3d_noshiro_chair",
		name = "Water Ornament",
		award = 0,
		time = 0,
		id = 63,
		room_id = 2,
		icon = "3Ddrom_nengdai_item13",
		desc = "A Sakuran ornament that typically goes in the garden but, in this case, has been placed in a corner of the room.\nWhen water flows in, it produces a clear and pleasant sound.",
		model = {
			"fbx/litmap_03/pre_db_noshirohostel01_02"
		},
		unlock = {
			1,
			30221,
			1
		},
		vfx_prefab = {
			"fbx/litmap_03/pre_db_noshirohostel01_02/vfx_wupintishi01"
		}
	},
	[64] = {
		text = "dorm3d_noshiro_table",
		name = "Sakuran Umbrella",
		award = 0,
		time = 0,
		id = 64,
		room_id = 2,
		icon = "3Ddrom_nengdai_item14",
		desc = "This folded umbrella rests against the wall.\nNoshiro often carries it with her when she goes outside.\nWhen it's raining, obviously.",
		model = {
			"fbx/litmap_03/pre_db_decoration05_01"
		},
		unlock = {
			1,
			30221,
			1
		},
		vfx_prefab = {
			"fbx/litmap_03/pre_db_decoration05_01/vfx_wupintishi01"
		}
	},
	[65] = {
		text = "dorm3d_noshiro_chair",
		name = "Round Cushion",
		award = 0,
		time = 0,
		id = 65,
		room_id = 2,
		icon = "3Ddrom_nengdai_item15",
		desc = "A round cushion in a bright color.\nWhile it looks firm at a glance, it's surprisingly comfy to sit on.\nMaybe you should put one in your office too?",
		model = {
			"fbx/no_bake_pay_prop/livingroom/table/pre_db_chair08"
		},
		unlock = {
			1,
			30221,
			1
		},
		vfx_prefab = {
			"fbx/no_bake_pay_prop/livingroom/table/pre_db_chair08/vfx_wupintishi01"
		}
	},
	[66] = {
		text = "dorm3d_noshiro_table",
		name = "Sushi Platter",
		award = 0,
		time = 0,
		id = 66,
		room_id = 2,
		icon = "3Ddrom_nengdai_item16",
		desc = "A tray lined with hand-formed sushi and other delicacies.\nEvery item is meticulously placed,\nand even the decorative elements are well-thought-out.\nSurprisingly, sushi rolls are even included.\nTurns out Noshiro isn't a stickler for tradition.",
		model = {
			"fbx/no_bake_pay_prop/diningroom/pre_db_tableware12_01"
		},
		unlock = {
			1,
			30221,
			1
		},
		vfx_prefab = {
			"fbx/no_bake_pay_prop/diningroom/pre_db_tableware12_01/vfx_wupintishi01"
		}
	},
	[67] = {
		text = "dorm3d_noshiro_chair",
		name = "Cherry Blossom Branch",
		award = 0,
		time = 0,
		id = 67,
		room_id = 2,
		icon = "3Ddrom_nengdai_item17",
		desc = "A cherry blossom branch left on the table.\nThe pink petals almost glow on the branch, lending a touch of spring mood.",
		model = {
			"fbx/no_bake_pay_prop/livingroom/table/pre_db_flowers04"
		},
		unlock = {
			1,
			30221,
			1
		},
		vfx_prefab = {
			"fbx/no_bake_pay_prop/livingroom/table/pre_db_flowers04/vfx_wupintishi01"
		}
	},
	[68] = {
		text = "dorm3d_noshiro_bed",
		name = "Stack of Books",
		award = 0,
		time = 0,
		id = 68,
		room_id = 2,
		icon = "3Ddrom_nengdai_item18",
		desc = "A stack of books piled atop one another.\nThe subjects covered range from tea ceremonies to flower arrangement and traditional etiquette.\nBased on where the bookmark is, Noshiro is studying a new flower arrangement technique.",
		model = {
			"fbx/litmap_03/pre_db_book04_01"
		},
		unlock = {
			1,
			30221,
			1
		},
		vfx_prefab = {
			"fbx/litmap_03/pre_db_book04_01/vfx_wupintishi01"
		}
	},
	[70] = {
		text = "dorm3d_noshiro_bed",
		name = "Kettle",
		award = 0,
		time = 0,
		id = 70,
		room_id = 2,
		icon = "3Ddrom_nengdai_item19",
		desc = "An unremarkable kettle.\nNoshiro often uses it when making tea.\nDespite its signs of heavy use, it's still in good condition thanks to diligent care.",
		model = {
			"fbx/litmap_02/pre_db_tableware09"
		},
		unlock = {
			1,
			30221,
			1
		},
		vfx_prefab = {
			"fbx/litmap_02/pre_db_tableware09/vfx_wupintishi01"
		}
	},
	[72] = {
		text = "dorm3d_noshiro_bed",
		name = "Tied Hanging Scrolls",
		award = 0,
		time = 0,
		id = 72,
		room_id = 2,
		icon = "3Ddrom_nengdai_item20",
		desc = "These scrolls rest quietly in the corner of the study,\ntheir knots perfectly tied.\nThough not unfurled, they still convey Noshiro's meticulous care.",
		model = {
			"fbx/litmap_03/pre_db_cupboard08_01"
		},
		unlock = {
			1,
			30221,
			1
		},
		vfx_prefab = {
			"fbx/litmap_03/pre_db_cupboard08_01/vfx_wupintishi01"
		}
	},
	[71] = {
		text = "dorm3d_sirius_chair",
		name = "Stone Lantern",
		award = 0,
		time = 1,
		id = 71,
		room_id = 2,
		icon = "3Ddrom_nengdai_item21",
		desc = "A lantern made of stone, inspired by traditional Sakuran garden lanterns.\nIt lends an air of tranquility to wherever it's placed.",
		model = {
			"fbx/litmap_03/day/pre_db_noshirohostel01_lamp02"
		},
		unlock = {
			1,
			30221,
			1
		},
		vfx_prefab = {
			"fbx/litmap_03/day/pre_db_noshirohostel01_lamp02/vfx_wupintishi01"
		}
	},
	[76] = {
		text = "dorm3d_noshiro_bed",
		name = "Humidifier",
		award = 0,
		time = 2,
		id = 76,
		room_id = 2,
		icon = "3Ddrom_nengdai_item24",
		desc = "This white humidifier operates silently most of the time,\nonly sometimes making a faint hum.\nNoshiro placed it in a corner where it can slowly release moist air.\nShe says it's good for her skin.",
		model = {
			"fbx/litmap_03/night/pre_db_electrical08"
		},
		unlock = {
			1,
			30221,
			1
		},
		vfx_prefab = {
			"fbx/litmap_03/night/pre_db_electrical08/vfx_wupintishi01"
		}
	},
	[77] = {
		text = "dorm3d_noshiro_bed",
		name = "Skincare Oil",
		award = 0,
		time = 2,
		id = 77,
		room_id = 2,
		icon = "3Ddrom_nengdai_item25",
		desc = "The oil inside the bottle emits a delicate fragrance.\nAccording to Noshiro, it's extracted from camellias.\nIt's one of her favorite skincare products.",
		model = {
			"fbx/litmap_03/night/pre_db_cosmetic10"
		},
		unlock = {
			1,
			30221,
			1
		},
		vfx_prefab = {
			"fbx/litmap_03/night/pre_db_cosmetic10/vfx_wupintishi01"
		}
	},
	[78] = {
		text = "dorm3d_noshiro_bed",
		name = "Perfume Bottle",
		award = 0,
		time = 2,
		id = 78,
		room_id = 2,
		icon = "3Ddrom_nengdai_item26",
		desc = "A bottle of perfume with a simple design.\nLight softly reflects off its glass surface.\nUpon closer inspection, you notice that this is the very bottle you gifted her.",
		model = {
			"fbx/litmap_03/night/pre_db_cosmetic01_01/pre_db_cosmetic01c"
		},
		unlock = {
			1,
			30221,
			1
		},
		vfx_prefab = {
			"fbx/litmap_03/night/pre_db_cosmetic01_01/pre_db_cosmetic01c/vfx_wupintishi01"
		}
	},
	[79] = {
		text = "dorm3d_noshiro_bed",
		name = "Reed Diffuser",
		award = 0,
		time = 2,
		id = 79,
		room_id = 2,
		icon = "3Ddrom_nengdai_item27",
		desc = "A diffuser with a delicate fragrance.\nIts subtle aroma fills the room.\nIt's the scent that always lingers around Noshiro.",
		model = {
			"fbx/litmap_04/night/pre_db_cosmetic02a_01"
		},
		unlock = {
			1,
			30221,
			1
		},
		vfx_prefab = {
			"fbx/litmap_04/night/pre_db_cosmetic02a_01/vfx_wupintishi01"
		}
	},
	[74] = {
		text = "dorm3d_noshiro_bed",
		name = "Wooden Lantern",
		award = 0,
		time = 2,
		id = 74,
		room_id = 2,
		icon = "3Ddrom_nengdai_item23",
		desc = "A square, wooden lantern that's been placed in a corner.\nA soft light glows through the translucent paper.\nNoshiro picked this furnishing after careful deliberation.",
		model = {
			"fbx/litmap_03/night/pre_db_chandelier11_on"
		},
		unlock = {
			1,
			30221,
			1
		},
		vfx_prefab = {
			"fbx/litmap_03/night/pre_db_chandelier11_on/vfx_wupintishi01"
		}
	},
	[75] = {
		text = "dorm3d_noshiro_chair",
		name = "Floor Lamp",
		award = 0,
		time = 2,
		id = 75,
		room_id = 2,
		icon = "3Ddrom_nengdai_item22",
		desc = "An austere Sakuran-style floor lamp. It glows with a soft light.\nBeneath its shade hangs a delicate wind chime ornament.\nIt creates a quiet, serene space where you can spend a peaceful time with Noshiro.",
		model = {
			"fbx/no_bake_pay_prop/livingroom/pre_db_chandelier08_on"
		},
		unlock = {
			1,
			30221,
			1
		},
		vfx_prefab = {
			"fbx/no_bake_pay_prop/livingroom/pre_db_chandelier08_on/vfx_wupintishi01"
		}
	},
	[101] = {
		text = "dorm3d_Ankeleiqi_chair",
		name = "Balloons and Photo",
		award = 0,
		time = 0,
		id = 101,
		room_id = 3,
		icon = "3Ddrom_ankeleiqi_item1",
		desc = "A framed photo decorated with carefully selected balloons.\nAnchorage loves this little combo.\nThe bunny bow is still crinkled from the last time she tied it.",
		model = {
			"fbx/litmap_02/pre_db_billboard14"
		},
		unlock = {
			1,
			19903,
			1
		},
		vfx_prefab = {
			"fbx/litmap_02/pre_db_billboard14/vfx_wupintishi01"
		}
	},
	[102] = {
		text = "dorm3d_Ankeleiqi_chair",
		name = "Bunny Tea Set",
		award = 0,
		time = 0,
		id = 102,
		room_id = 3,
		icon = "3Ddrom_ankeleiqi_item2",
		desc = "A bunny-themed teapot and tiny cups to match.\nAnchorage takes good care of them.",
		model = {
			"fbx/litmap_02/pre_db_ceram11_group01"
		},
		unlock = {
			1,
			19903,
			1
		},
		vfx_prefab = {
			"fbx/litmap_02/pre_db_ceram11_group01/vfx_wupintishi01"
		}
	},
	[103] = {
		text = "dorm3d_Ankeleiqi_chair",
		name = "Wish List",
		award = 0,
		time = 0,
		id = 103,
		room_id = 3,
		icon = "3Ddrom_ankeleiqi_item3",
		desc = "A chalkboard hanging on the wall.\nAnchorage often writes her little goals on it.\nSometimes, you can see cute little doodles.",
		model = {
			"fbx/litmap_02/pre_db_blackboard01"
		},
		unlock = {
			1,
			19903,
			1
		},
		vfx_prefab = {
			"fbx/litmap_02/pre_db_blackboard01/vfx_wupintishi01"
		}
	},
	[104] = {
		text = "dorm3d_Ankeleiqi_chair",
		name = "Trove of Knowledge",
		award = 0,
		time = 0,
		id = 104,
		room_id = 3,
		icon = "3Ddrom_ankeleiqi_item4",
		desc = "Fairy tale books are neatly arranged in the bookcase.\nAll of them are wrapped, labeled, and sorted \nunder Anchorage's personal system.",
		model = {
			"fbx/litmap_02/pre_db_book15_group01"
		},
		unlock = {
			1,
			19903,
			1
		},
		vfx_prefab = {
			"fbx/litmap_02/pre_db_book15_group01/vfx_wupintishi01"
		}
	},
	[105] = {
		text = "dorm3d_Ankeleiqi_chair",
		name = "Castle Storage",
		award = 0,
		time = 0,
		id = 105,
		room_id = 3,
		icon = "3Ddrom_ankeleiqi_item5",
		desc = "A file storage container modeled after a fairy-tale castle.\nAnchorage uses it to store various notes and important documents.",
		model = {
			"fbx/litmap_02/pre_db_cupboard18"
		},
		unlock = {
			1,
			19903,
			1
		},
		vfx_prefab = {
			"fbx/litmap_02/pre_db_cupboard18/vfx_wupintishi01"
		}
	},
	[106] = {
		text = "dorm3d_Ankeleiqi_chair",
		name = "Classic Piano",
		award = 0,
		time = 0,
		id = 106,
		room_id = 3,
		icon = "3Ddrom_ankeleiqi_item6",
		desc = "A classic piano in the corner of the room.\nThe last score that Anchorage was learning is open on it, \nwith careful notes taken here and there.",
		model = {
			"fbx/litmap_02/pre_db_musicalInstrument02"
		},
		unlock = {
			1,
			19903,
			1
		},
		vfx_prefab = {
			"fbx/litmap_02/pre_db_musicalInstrument02/vfx_wupintishi01"
		}
	},
	[107] = {
		text = "dorm3d_Ankeleiqi_entertainmentarea",
		name = "Crayon Drawing",
		award = 0,
		time = 0,
		id = 107,
		room_id = 3,
		icon = "3Ddrom_ankeleiqi_item7",
		desc = "Some crayon art left on Anchorage's desk.\nIt depicts the most beautiful thing she's ever seen, \nwhich seems to be... the Commander?",
		model = {
			"fbx/litmap_02/pre_db_paper02_group01"
		},
		unlock = {
			1,
			19903,
			1
		},
		vfx_prefab = {
			"fbx/litmap_02/pre_db_paper02_group01/vfx_wupintishi01"
		}
	},
	[108] = {
		text = "dorm3d_Ankeleiqi_bed",
		name = "Alarm Clock",
		award = 0,
		time = 0,
		id = 108,
		room_id = 3,
		icon = "3Ddrom_ankeleiqi_item8",
		desc = "An alarm clock with a traditional, if not plain, design.\nIt sits on Anchorage's nightstand, \nensuring that she never misses an important moment.",
		model = {
			"fbx/no_bake_pay_prop/bedroom/pre_db_clock02"
		},
		unlock = {
			1,
			19903,
			1
		},
		vfx_prefab = {
			"fbx/no_bake_pay_prop/bedroom/pre_db_clock02/vfx_wupintishi01"
		}
	},
	[109] = {
		text = "dorm3d_Ankeleiqi_bed",
		name = "Storage Box",
		award = 0,
		time = 0,
		id = 109,
		room_id = 3,
		icon = "3Ddrom_ankeleiqi_item9",
		desc = "A storage box with a cute design.\nAnchorage keeps all kinds of odds and ends inside.",
		model = {
			"fbx/litmap_02/pre_db_basket04_group01"
		},
		unlock = {
			1,
			19903,
			1
		},
		vfx_prefab = {
			"fbx/litmap_02/pre_db_basket04_group01/vfx_wupintishi01"
		}
	},
	[110] = {
		text = "dorm3d_Ankeleiqi_chair",
		name = "Floatie",
		award = 0,
		time = 0,
		id = 110,
		room_id = 3,
		icon = "3Ddrom_ankeleiqi_item10",
		desc = "A swim ring adorned with stars.\nAnchorage considers it a summer must-have.",
		model = {
			"fbx/litmap_02/pre_db_toy07"
		},
		unlock = {
			1,
			19903,
			1
		},
		vfx_prefab = {
			"fbx/litmap_02/pre_db_toy07/vfx_wupintishi01"
		}
	},
	[111] = {
		text = "dorm3d_Ankeleiqi_chair",
		name = "Safety Knife",
		award = 0,
		time = 0,
		id = 111,
		room_id = 3,
		icon = "3Ddrom_ankeleiqi_item11",
		desc = "A beginner's kitchen knife that won't cut through skin.\nAnchorage has been learning how to cut veggies, \nno doubt dreaming of making delicious dishes someday.",
		model = {
			"fbx/litmap_02/pre_db_kitchenware08_group01"
		},
		unlock = {
			1,
			19903,
			1
		},
		vfx_prefab = {
			"fbx/litmap_02/pre_db_kitchenware08_group01/vfx_wupintishi01"
		}
	},
	[112] = {
		text = "dorm3d_Ankeleiqi_chair",
		name = "Fairy Tale Picture Book",
		award = 0,
		time = 0,
		id = 112,
		room_id = 3,
		icon = "3Ddrom_ankeleiqi_item12",
		desc = "A hardcover picture book.\nAnchorage keeps it safely stored, \nthough you can see the traces of her rapt reading on the pages.",
		model = {
			"fbx/no_bake_pay_prop/livingroom/pre_db_book11a"
		},
		unlock = {
			1,
			19903,
			1
		},
		vfx_prefab = {
			"fbx/no_bake_pay_prop/livingroom/pre_db_book11a/vfx_wupintishi01"
		}
	},
	[113] = {
		text = "dorm3d_Ankeleiqi_chair",
		name = "Fluffy Plushie",
		award = 0,
		time = 0,
		id = 113,
		room_id = 3,
		icon = "3Ddrom_ankeleiqi_item13",
		desc = "A penguin plushie wearing a little nightcap.\nAnchorage gives it pride of place on the sofa, \nperhaps hoping that the penguin will watch over her as she dreams.",
		model = {
			"fbx/no_bake_pay_prop/livingroom/pre_db_toy06"
		},
		unlock = {
			1,
			19903,
			1
		},
		vfx_prefab = {
			"fbx/no_bake_pay_prop/livingroom/pre_db_toy06/vfx_wupintishi01"
		}
	},
	[114] = {
		text = "dorm3d_Ankeleiqi_chair",
		name = "Cactus",
		award = 0,
		time = 0,
		id = 114,
		room_id = 3,
		icon = "3Ddrom_ankeleiqi_item14",
		desc = "An adorable cactus.\nAnchorage has given it a colorful pot, \nadding some warmth to its life.",
		model = {
			"fbx/litmap_02/pre_db_flowerpot10"
		},
		unlock = {
			1,
			19903,
			1
		},
		vfx_prefab = {
			"fbx/litmap_02/pre_db_flowerpot10/vfx_wupintishi01"
		}
	},
	[115] = {
		text = "dorm3d_Ankeleiqi_chair",
		name = "Kitchenware",
		award = 0,
		time = 0,
		id = 115,
		room_id = 3,
		icon = "3Ddrom_ankeleiqi_item15",
		desc = "A kitchenware set for playing house.\nAnchorage has arranged them neatly on the wall.\nIt's a little early for her to start cooking for real...",
		model = {
			"fbx/litmap_02/pre_db_kitchenware01"
		},
		unlock = {
			1,
			19903,
			1
		},
		vfx_prefab = {
			"fbx/litmap_02/pre_db_kitchenware01/vfx_wupintishi01"
		}
	},
	[116] = {
		text = "dorm3d_Ankeleiqi_chair",
		name = "Orca Chair",
		award = 0,
		time = 0,
		id = 116,
		room_id = 3,
		icon = "3Ddrom_ankeleiqi_item16",
		desc = "A rocking chair made to look like a killer whale.\nIt's one of Anchorage's favorite places.",
		model = {
			"fbx/no_bake_pay_prop/livingroom/pre_db_chair16"
		},
		unlock = {
			1,
			19903,
			1
		},
		vfx_prefab = {
			"fbx/no_bake_pay_prop/livingroom/pre_db_chair16/vfx_wupintishi01"
		}
	},
	[117] = {
		text = "dorm3d_Ankeleiqi_bed",
		name = "Basket",
		award = 0,
		time = 0,
		id = 117,
		room_id = 3,
		icon = "3Ddrom_ankeleiqi_item17",
		desc = "A storage basket woven with rattan.\nAnchorage keeps her daily necessities in it.",
		model = {
			"fbx/litmap_02/pre_db_basket05"
		},
		unlock = {
			1,
			19903,
			1
		},
		vfx_prefab = {
			"fbx/litmap_02/pre_db_basket05/vfx_wupintishi01"
		}
	},
	[118] = {
		text = "dorm3d_Ankeleiqi_bed",
		name = "Whale Plushie",
		award = 0,
		time = 0,
		id = 118,
		room_id = 3,
		icon = "3Ddrom_ankeleiqi_item18",
		desc = "A blue whale plushie with round eyes and a friendly smile.\nShe must like collecting plushies.\nWhy not bring her a few some time?",
		model = {
			"fbx/no_bake_pay_prop/bedroom/pre_db_toy10"
		},
		unlock = {
			1,
			19903,
			1
		},
		vfx_prefab = {
			"fbx/no_bake_pay_prop/bedroom/pre_db_toy10/vfx_wupintishi01"
		}
	},
	[119] = {
		text = "dorm3d_Ankeleiqi_entertainmentarea",
		name = "Small Blackboard",
		award = 0,
		time = 0,
		id = 119,
		room_id = 3,
		icon = "3Ddrom_ankeleiqi_item19",
		desc = "On the blackboard is Anchorage's cute handwriting.\nBut what is this equation supposed to mean, exactly...?",
		model = {
			"fbx/no_bake_pay_prop/entertainmentarea/pre_db_blackboard02"
		},
		unlock = {
			1,
			19903,
			1
		},
		vfx_prefab = {
			"fbx/no_bake_pay_prop/entertainmentarea/pre_db_blackboard02/vfx_wupintishi01"
		}
	},
	[120] = {
		text = "dorm3d_Ankeleiqi_entertainmentarea",
		name = "Cube Cushion",
		award = 0,
		time = 0,
		id = 120,
		room_id = 3,
		icon = "3Ddrom_ankeleiqi_item20",
		desc = "A light-blue cushion in the shape of a die.\nOne side features a cute manta ray, \nand its soft colors add a hint of peace to the room.",
		model = {
			"fbx/no_bake_pay_prop/entertainmentarea/pre_db_toy12"
		},
		unlock = {
			1,
			19903,
			1
		},
		vfx_prefab = {
			"fbx/no_bake_pay_prop/entertainmentarea/pre_db_toy12/vfx_wupintishi01"
		}
	},
	[121] = {
		text = "dorm3d_Ankeleiqi_entertainmentarea",
		name = "Adorned Photos",
		award = 0,
		time = 0,
		id = 121,
		room_id = 3,
		icon = "3Ddrom_ankeleiqi_item21",
		desc = "Rope and wooden clips hold up various beloved photos.\nEach of them is filled with warm memories of Anchorage.",
		model = {
			"fbx/litmap_02/pre_db_decoration12"
		},
		unlock = {
			1,
			19903,
			1
		},
		vfx_prefab = {
			"fbx/litmap_02/pre_db_decoration12/vfx_wupintishi01"
		}
	},
	[122] = {
		text = "dorm3d_Ankeleiqi_chair",
		name = "Umbrella Stand",
		award = 0,
		time = 1,
		id = 122,
		room_id = 3,
		icon = "3Ddrom_ankeleiqi_item22",
		desc = "A simple umbrella stand.\nAnchorage diligently stores her umbrellas inside, \nready for a rainy day.",
		model = {
			"fbx/litmap_02/day/pre_db_decoration11"
		},
		unlock = {
			1,
			19903,
			1
		},
		vfx_prefab = {
			"fbx/litmap_02/day/pre_db_decoration11/vfx_wupintishi01"
		}
	},
	[123] = {
		text = "dorm3d_Ankeleiqi_chair",
		name = "Thermos",
		award = 0,
		time = 1,
		id = 123,
		room_id = 3,
		icon = "3Ddrom_ankeleiqi_item23",
		desc = "A brightly-colored thermos bottle.\nWhen it's cold out, Anchorage puts a hot drink inside.",
		model = {
			"fbx/litmap_02/day/pre_db_tableware26"
		},
		unlock = {
			1,
			19903,
			1
		},
		vfx_prefab = {
			"fbx/litmap_02/day/pre_db_tableware26/vfx_wupintishi01"
		}
	},
	[124] = {
		text = "dorm3d_Ankeleiqi_chair",
		name = "Stickers",
		award = 0,
		time = 1,
		id = 124,
		room_id = 3,
		icon = "3Ddrom_ankeleiqi_item24",
		desc = "One sticker is a star, and the other is a manjuu.\nThey're put up in an inconspicuous place, \nbut it adds life to the room.",
		model = {
			"fbx/litmap_02/day/pre_db_cupboard19_01"
		},
		unlock = {
			1,
			19903,
			1
		},
		vfx_prefab = {
			"fbx/litmap_02/day/pre_db_cupboard19_01/vfx_wupintishi01"
		}
	},
	[125] = {
		text = "dorm3d_Ankeleiqi_bed",
		name = "Bedside Lamp",
		award = 0,
		time = 2,
		id = 125,
		room_id = 3,
		icon = "3Ddrom_ankeleiqi_item25",
		desc = "A delicate bedside lamp.\nAnchorage sets it at the softest setting before bed, \nletting the warm light lull her into sweet dreams.",
		model = {
			"fbx/no_bake_pay_prop/bedroom/pre_db_desklamp03"
		},
		unlock = {
			1,
			19903,
			1
		},
		vfx_prefab = {
			"fbx/no_bake_pay_prop/bedroom/pre_db_desklamp03/vfx_wupintishi01"
		}
	},
	[126] = {
		text = "dorm3d_Ankeleiqi_bed",
		name = "Whale Pendant Light",
		award = 0,
		time = 2,
		id = 126,
		room_id = 3,
		icon = "3Ddrom_ankeleiqi_item26",
		desc = "A huge ceiling lamp shaped like a humpback whale.\nAnchorage gazes up at it from her bed, \nimagining herself deep in a dreamy underwater world.",
		model = {
			"fbx/no_bake/pre_db_anchoragehostel01_lamp01_night"
		},
		unlock = {
			1,
			19903,
			1
		},
		vfx_prefab = {
			"fbx/no_bake/pre_db_anchoragehostel01_lamp01_night/vfx_wupintishi01"
		}
	},
	[127] = {
		text = "dorm3d_Ankeleiqi_chair",
		name = "Manjuu Mug",
		award = 0,
		time = 2,
		id = 127,
		room_id = 3,
		icon = "3Ddrom_ankeleiqi_item27",
		desc = "A mug that looks like a manjuu.\nAnchorage's love for it is evident from \nhow she places it in the most conspicuous spot.",
		model = {
			"fbx/no_bake_pay_prop/livingroom/pre_db_tableware24"
		},
		unlock = {
			1,
			19903,
			1
		},
		vfx_prefab = {
			"fbx/no_bake_pay_prop/livingroom/pre_db_tableware24/vfx_wupintishi01"
		}
	},
	[128] = {
		text = "dorm3d_Ankeleiqi_chair",
		name = "Bath Towels",
		award = 0,
		time = 2,
		id = 128,
		room_id = 3,
		icon = "3Ddrom_ankeleiqi_item28",
		desc = "Perfectly folded bath towels.\nThey look like little clouds drifting across the sky together.",
		model = {
			"fbx/litmap_02/night/pre_db_towel01_group01"
		},
		unlock = {
			1,
			19903,
			1
		},
		vfx_prefab = {
			"fbx/litmap_02/night/pre_db_towel01_group01/vfx_wupintishi01"
		}
	},
	[1101] = {
		text = "dorm3d_xinzexi_table",
		name = "Caramel Popcorn",
		award = 0,
		time = 0,
		id = 1101,
		room_id = 11,
		icon = "3Ddrom_xinzexi_item1",
		desc = "Freshly microwaved popcorn covered in amber caramel coating.\nIt's a must-have for any movies watched in New Jersey's home.",
		model = {
			"fbx/litmap_01/pre_db_electrical18"
		},
		unlock = {
			1,
			10517,
			1
		},
		vfx_prefab = {
			"fbx/litmap_01/pre_db_electrical18/vfx_wupintishi01"
		}
	},
	[1102] = {
		text = "dorm3d_xinzexi_table",
		name = "Bunny Apron",
		award = 0,
		time = 0,
		id = 1102,
		room_id = 11,
		icon = "3Ddrom_xinzexi_item2",
		desc = "An apron hung up in the corner of the kitchen.\nIt has a simple yet cute rabbit graphic on the front.\nShe's always full of energy, even when cooking and cleaning.",
		model = {
			"fbx/litmap_01/pre_db_cloth05"
		},
		unlock = {
			1,
			10517,
			1
		},
		vfx_prefab = {
			"fbx/litmap_01/pre_db_cloth05/vfx_wupintishi01"
		}
	},
	[1103] = {
		text = "dorm3d_xinzexi_table",
		name = "Juicer",
		award = 0,
		time = 0,
		id = 1103,
		room_id = 11,
		icon = "3Ddrom_xinzexi_item3",
		desc = "One powerful juicer.\nEvery morning, she throws all kinds of fruits into it,\nand out comes a colorful and refreshing juice.",
		model = {
			"fbx/litmap_01/pre_db_electrical13"
		},
		unlock = {
			1,
			10517,
			1
		},
		vfx_prefab = {
			"fbx/litmap_01/pre_db_electrical13/vfx_wupintishi01"
		}
	},
	[1104] = {
		text = "dorm3d_xinzexi_table",
		name = "Bowl of Strawberries",
		award = 0,
		time = 0,
		id = 1104,
		room_id = 11,
		icon = "3Ddrom_xinzexi_item4",
		desc = "Fresh, plump strawberries fill the bowl,\neach one glistening with beads of water.\nHer fingers reach for one,\nand you find your heart skipping a beat as she places it in her mouth.",
		model = {
			"fbx/litmap_01/pre_db_fruit01"
		},
		unlock = {
			1,
			10517,
			1
		},
		vfx_prefab = {
			"fbx/litmap_01/pre_db_fruit01/vfx_wupintishi01"
		}
	},
	[1105] = {
		text = "dorm3d_xinzexi_table",
		name = "Range Hood",
		award = 0,
		time = 0,
		id = 1105,
		room_id = 11,
		icon = "3Ddrom_xinzexi_item5",
		desc = "Every kitchen needs a range hood.\nThat familiar humming is proof that\nthe Big J is showing off her cooking skills!",
		model = {
			"fbx/litmap_01/pre_db_newjerseyhostel01_cupboard01"
		},
		unlock = {
			1,
			10517,
			1
		},
		vfx_prefab = {
			"fbx/litmap_01/pre_db_newjerseyhostel01_cupboard01/vfx_wupintishi01"
		}
	},
	[1106] = {
		text = "dorm3d_xinzexi_table",
		name = "Lemon Water",
		award = 0,
		time = 0,
		id = 1106,
		room_id = 11,
		icon = "3Ddrom_xinzexi_item6",
		desc = "A pitcher full of cool, refreshing lemon water.\nIt's the perfect balance of sour and sweet,\nwith a few sugar cubes dissolved within.",
		model = {
			"no_bake_pay_prop/kitchen/pre_db_tableware28_group"
		},
		unlock = {
			1,
			10517,
			1
		},
		vfx_prefab = {
			"no_bake_pay_prop/kitchen/pre_db_tableware28_group/vfx_wupintishi01"
		}
	},
	[1107] = {
		text = "dorm3d_xinzexi_table",
		name = "White Jacket",
		award = 0,
		time = 0,
		id = 1107,
		room_id = 11,
		icon = "3Ddrom_xinzexi_item7",
		desc = "New Jersey's everyday wear, a light but stylish jacket.\nShe took off the jacket and threw it onto a chair –\nthe very first thing she does when she gets home.",
		model = {
			"fbx/litmap_01/pre_db_cloth06"
		},
		unlock = {
			1,
			10517,
			1
		},
		vfx_prefab = {
			"fbx/litmap_01/pre_db_cloth06/vfx_wupintishi01"
		}
	},
	[1108] = {
		text = "dorm3d_xinzexi_table",
		name = "Toaster",
		award = 0,
		time = 0,
		id = 1108,
		room_id = 11,
		icon = "3Ddrom_xinzexi_item8",
		desc = "A toaster with an adorable design.\nPress down the lever, and crispy golden toast will pop out.\nAdd some jam, honey, or butter for the perfect breakfast!",
		model = {
			"fbx/litmap_01/pre_db_electrical10_01"
		},
		unlock = {
			1,
			10517,
			1
		},
		vfx_prefab = {
			"fbx/litmap_01/pre_db_electrical10_01/vfx_wupintishi01"
		}
	},
	[1109] = {
		text = "dorm3d_xinzexi_table",
		name = "Jungle Vibes",
		award = 0,
		time = 0,
		id = 1109,
		room_id = 11,
		icon = "3Ddrom_xinzexi_item9",
		desc = "A potted sansevieria plant growing steadily.\nIt quietly spreads its leaves in the corner of the room.\nWith every breath,\nyou can feel the fresh, revitalizing air it brings.",
		model = {
			"fbx/litmap_01/pre_db_bonsai13"
		},
		unlock = {
			1,
			10517,
			1
		},
		vfx_prefab = {
			"fbx/litmap_01/pre_db_bonsai13/vfx_wupintishi01"
		}
	},
	[1110] = {
		text = "dorm3d_xinzexi_table",
		name = "Glazed Donut",
		award = 0,
		time = 0,
		id = 1110,
		room_id = 11,
		icon = "3Ddrom_xinzexi_item10",
		desc = "New Jersey made this for afternoon tea.\n\"Gotta taste-test before I let you eat it, honey!\" she says,\nlicking the sugar off of her lips.",
		model = {
			"fbx/litmap_01/pre_db_food16_group"
		},
		unlock = {
			1,
			10517,
			1
		},
		vfx_prefab = {
			"fbx/litmap_01/pre_db_food16_group/vfx_wupintishi01"
		}
	},
	[1111] = {
		text = "dorm3d_xinzexi_chair",
		name = "Robot Vacuum",
		award = 0,
		time = 0,
		id = 1111,
		room_id = 11,
		icon = "3Ddrom_xinzexi_item11",
		desc = "A cute cleaning robot that leaves your room spick and span.\nIt dutifully gathers not just dust, but the traces of everyday life as well.",
		model = {
			"fbx/litmap_01/pre_db_electrical17"
		},
		unlock = {
			1,
			10517,
			1
		},
		vfx_prefab = {
			"fbx/litmap_01/pre_db_electrical17/vfx_wupintishi01"
		}
	},
	[1112] = {
		text = "dorm3d_xinzexi_chair",
		name = "4K TV",
		award = 0,
		time = 0,
		id = 1112,
		room_id = 11,
		icon = "3Ddrom_xinzexi_item12",
		desc = "When the 55-inch screen lights up,\nit becomes a door to worlds unknown.\nWhat will it be today?\nExplosive action? Or a kiss in the rain on Union streets?",
		model = {
			"fbx/litmap_01/pre_db_appliances06"
		},
		unlock = {
			1,
			10517,
			1
		},
		vfx_prefab = {
			"fbx/litmap_01/pre_db_appliances06/vfx_wupintishi01"
		}
	},
	[1113] = {
		text = "dorm3d_xinzexi_chair",
		name = "Fashion Magazines",
		award = 0,
		time = 0,
		id = 1113,
		room_id = 11,
		icon = "3Ddrom_xinzexi_item13",
		desc = "Magazines that have been read over and over are piled on the table.\nThis is her fashion supply station, an endless fount of inspiration.",
		model = {
			"no_bake_pay_prop/livingroom/pre_db_book05_group"
		},
		unlock = {
			1,
			10517,
			1
		},
		vfx_prefab = {
			"no_bake_pay_prop/livingroom/pre_db_book05_group/vfx_wupintishi01"
		}
	},
	[1114] = {
		text = "dorm3d_xinzexi_chair",
		name = "Handbag",
		award = 0,
		time = 0,
		id = 1114,
		room_id = 11,
		icon = "3Ddrom_xinzexi_item14",
		desc = "A nice handbag left lazily on the floor.\nIt's filled with all sorts of useful little things.\nNo doubt she took it on countless adventures again today.",
		model = {
			"no_bake_pay_prop/livingroom/pre_db_bag05"
		},
		unlock = {
			1,
			10517,
			1
		},
		vfx_prefab = {
			"no_bake_pay_prop/livingroom/pre_db_bag05/vfx_wupintishi01"
		}
	},
	[1115] = {
		text = "dorm3d_xinzexi_bed",
		name = "Sports Gear",
		award = 0,
		time = 0,
		id = 1115,
		room_id = 11,
		icon = "3Ddrom_xinzexi_item15",
		desc = "A whole set of exercise clothes and items.\nThe ever-energetic New Jersey is always ready for a serious aerobic workout!",
		model = {
			"fbx/litmap_01/pre_db_bag03_group"
		},
		unlock = {
			1,
			10517,
			1
		},
		vfx_prefab = {
			"fbx/litmap_01/pre_db_bag03_group/vfx_wupintishi01"
		}
	},
	[1116] = {
		text = "dorm3d_xinzexi_bed",
		name = "Big J Nameplate",
		award = 0,
		time = 0,
		id = 1116,
		room_id = 11,
		icon = "3Ddrom_xinzexi_item16",
		desc = "A dragon lurks within! No coming in without permission!\n\"...Hm? Honey, you're here?! Come in, come in!\"",
		model = {
			"fbx/litmap_01/pre_db_newjerseyhostel01_billboard01_1"
		},
		unlock = {
			1,
			10517,
			1
		},
		vfx_prefab = {
			"fbx/litmap_01/pre_db_newjerseyhostel01_billboard01_1/vfx_wupintishi01"
		}
	},
	[1117] = {
		text = "dorm3d_xinzexi_bed",
		name = "Clothes Rack",
		award = 0,
		time = 0,
		id = 1117,
		room_id = 11,
		icon = "3Ddrom_xinzexi_item17",
		desc = "When she's picking out clothes for a date,\nall of them seem to scream, \"Pick me!\"\nThat supposedly simple \"What to wear?\" question?\nNot so simple when it really counts.",
		model = {
			"fbx/litmap_01/pre_db_cloth07_group"
		},
		unlock = {
			1,
			10517,
			1
		},
		vfx_prefab = {
			"fbx/litmap_01/pre_db_cloth07_group/vfx_wupintishi01"
		}
	},
	[1118] = {
		text = "dorm3d_xinzexi_bed",
		name = "Clear Tote",
		award = 0,
		time = 0,
		id = 1118,
		room_id = 11,
		icon = "3Ddrom_xinzexi_item18",
		desc = "A tote filled with cosmetics and the like.\nThese are must-have items for daily commuting and travel,\nso she can redo her makeup any time!",
		model = {
			"fbx/litmap_01/pre_db_bag06"
		},
		unlock = {
			1,
			10517,
			1
		},
		vfx_prefab = {
			"fbx/litmap_01/pre_db_bag06/vfx_wupintishi01"
		}
	},
	[1119] = {
		text = "dorm3d_xinzexi_bed",
		name = "Bunny Ears",
		award = 0,
		time = 0,
		id = 1119,
		room_id = 11,
		icon = "3Ddrom_xinzexi_item19",
		desc = "A quirky bunny hood with ears that move according to your mood.\nThis is one of Big J's favorite accessories.",
		model = {
			"fbx/litmap_01/pre_db_headgear01"
		},
		unlock = {
			1,
			10517,
			1
		},
		vfx_prefab = {
			"fbx/litmap_01/pre_db_headgear01/vfx_wupintishi01"
		}
	},
	[1120] = {
		text = "dorm3d_xinzexi_bed",
		name = "Air Conditioner",
		award = 0,
		time = 0,
		id = 1120,
		room_id = 11,
		icon = "3Ddrom_xinzexi_item21",
		desc = "Among the greatest human inventions in history.\nIt adjusts the room temperature to exactly what you need,\ncreating a soothing space for ultimate relaxation.",
		model = {
			"fbx/litmap_01/pre_db_appliances01"
		},
		unlock = {
			1,
			10517,
			1
		},
		vfx_prefab = {
			"fbx/litmap_01/pre_db_appliances01/vfx_wupintishi01"
		}
	},
	[1121] = {
		text = "dorm3d_xinzexi_bed",
		name = "Air Purifier",
		award = 0,
		time = 0,
		id = 1121,
		room_id = 11,
		icon = "3Ddrom_xinzexi_item22",
		desc = "A quiet air purifier stands in the corner.\nIts unceasing, reliable operation makes every breath a luxurious one.",
		model = {
			"fbx/litmap_01/pre_db_appliances03"
		},
		unlock = {
			1,
			10517,
			1
		},
		vfx_prefab = {
			"fbx/litmap_01/pre_db_appliances03/vfx_wupintishi01"
		}
	},
	[1122] = {
		text = "dorm3d_xinzexi_bed",
		name = "Frozen Drinks",
		award = 0,
		time = 0,
		id = 1122,
		room_id = 11,
		icon = "3Ddrom_xinzexi_item23",
		desc = "Two frozen drinks radiating icy coolness.\nWhether you drink alone or with someone you love,\nevery sip is the very picture of bliss.",
		model = {
			"fbx/litmap_01/pre_db_food03_group"
		},
		unlock = {
			1,
			10517,
			1
		},
		vfx_prefab = {
			"fbx/litmap_01/pre_db_food03_group/vfx_wupintishi01"
		}
	},
	[1123] = {
		text = "dorm3d_xinzexi_bed",
		name = "Wireless Speaker",
		award = 0,
		time = 0,
		id = 1123,
		room_id = 11,
		icon = "3Ddrom_xinzexi_item24",
		desc = "A portable, stylish speaker packed with melodies ranging from classical to rock.\nThe right tune always awaits you.",
		model = {
			"fbx/litmap_01/pre_db_electrical03"
		},
		unlock = {
			1,
			10517,
			1
		},
		vfx_prefab = {
			"fbx/litmap_01/pre_db_electrical03/vfx_wupintishi01"
		}
	},
	[1124] = {
		text = "dorm3d_xinzexi_bed",
		name = "Bunny Nightlight",
		award = 0,
		time = 2,
		id = 1124,
		room_id = 11,
		icon = "3Ddrom_xinzexi_item25",
		desc = "An adorable nightlight that looks like a bunny.\nIt casts a soft blue glow, illuminating the way in the darkness.",
		model = {
			"fbx/litmap_01/night/pre_db_newjerseyhostel01_lamp01a_on"
		},
		unlock = {
			1,
			10517,
			1
		},
		vfx_prefab = {
			"fbx/litmap_01/night/pre_db_newjerseyhostel01_lamp01a_on/vfx_wupintishi01"
		}
	},
	[1125] = {
		text = "dorm3d_xinzexi_bed",
		name = "Dumbbells",
		award = 0,
		time = 0,
		id = 1125,
		room_id = 11,
		icon = "3Ddrom_xinzexi_item26",
		desc = "A pair of dumbbells, just the right weight,\nperfectly suited to New Jersey's workout needs.\nWith every drop of sweat,\nshe finds a better version of herself than the day before.",
		model = {
			"no_bake_pay_prop/livingroom/pre_db_sportinggoods06_group"
		},
		unlock = {
			1,
			10517,
			1
		},
		vfx_prefab = {
			"no_bake_pay_prop/livingroom/pre_db_sportinggoods06_group/vfx_wupintishi01"
		}
	},
	[1126] = {
		text = "dorm3d_xinzexi_bed",
		name = "Curling Iron",
		award = 0,
		time = 0,
		id = 1126,
		room_id = 11,
		icon = "3Ddrom_xinzexi_item27",
		desc = "A curling iron with a sleek design, the perfect helper for hair styling.\nBe sure to unplug it after use!",
		model = {
			"fbx/litmap_01/pre_db_electrical15"
		},
		unlock = {
			1,
			10517,
			1
		},
		vfx_prefab = {
			"fbx/litmap_01/pre_db_electrical15/vfx_wupintishi01"
		}
	},
	[1127] = {
		text = "dorm3d_xinzexi_bed",
		name = "Black Stockings",
		award = 0,
		time = 2,
		id = 1127,
		room_id = 11,
		icon = "3Ddrom_xinzexi_item28",
		desc = "In her room, every stocking seems to have the travel bug.\nThat's seven and a half pairs vanished this month alone.",
		model = {
			"fbx/litmap_01/night/pre_db_sock01"
		},
		unlock = {
			1,
			10517,
			1
		},
		vfx_prefab = {
			"fbx/litmap_01/night/pre_db_sock01/vfx_wupintishi01"
		}
	},
	[1128] = {
		text = "dorm3d_xinzexi_bed",
		name = "Skincare Set",
		award = 0,
		time = 2,
		id = 1128,
		room_id = 11,
		icon = "3Ddrom_xinzexi_item29",
		desc = "A comprehensive set of skincare products, New Jersey's personal beauty lab.\nSometimes the oddest combinations yield the most surprising results.",
		model = {
			"fbx/litmap_01/night/pre_db_cosmetic17"
		},
		unlock = {
			1,
			10517,
			1
		},
		vfx_prefab = {
			"fbx/litmap_01/night/pre_db_cosmetic17/vfx_wupintishi01"
		}
	},
	[1201] = {
		text = "dorm3d_dafeng_bed",
		name = "Porcelain",
		award = 0,
		time = 0,
		id = 1201,
		room_id = 12,
		icon = "3Ddrom_dafeng_item1",
		desc = "White porcelain with intricate patterns on display. It's pristine and shiny, proving how well Taihou cares for it.",
		model = {
			"fbx/litmap_01/pre_db_ceram23"
		},
		unlock = {
			1,
			30707,
			1
		},
		vfx_prefab = {
			"fbx/litmap_01/pre_db_ceram23/vfx_wupintishi01"
		}
	},
	[1202] = {
		text = "dorm3d_dafeng_bed",
		name = "After-School Fun",
		award = 0,
		time = 2,
		id = 1202,
		room_id = 12,
		icon = "3Ddrom_dafeng_item2",
		desc = "A uniform with an armband and a skirt. It's a nice change of style from her usual red dress.",
		model = {
			"fbx/litmap_01/night/pre_db_cloth11"
		},
		unlock = {
			1,
			30707,
			1
		},
		vfx_prefab = {
			"fbx/litmap_01/night/pre_db_cloth11/vfx_wupintishi01"
		}
	},
	[1203] = {
		text = "dorm3d_dafeng_bed",
		name = "Forbidden Feast",
		award = 0,
		time = 0,
		id = 1203,
		room_id = 12,
		icon = "3Ddrom_dafeng_item3",
		desc = "An elegant red slip dress made of soft, light fabric. Taihou wears it to parties and other special occasions.",
		model = {
			"fbx/litmap_01/pre_db_cloth10"
		},
		unlock = {
			1,
			30707,
			1
		},
		vfx_prefab = {
			"fbx/litmap_01/pre_db_cloth10/vfx_wupintishi01"
		}
	},
	[1204] = {
		text = "dorm3d_dafeng_bed",
		name = "Wooden Storage Box",
		award = 0,
		time = 0,
		id = 1204,
		room_id = 12,
		icon = "3Ddrom_dafeng_item4",
		desc = "A box containing her treasure collection. It's full of memories of her beloved.",
		model = {
			"fbx/litmap_01/pre_db_woodbox03"
		},
		unlock = {
			1,
			30707,
			1
		},
		vfx_prefab = {
			"fbx/litmap_01/pre_db_woodbox03/vfx_wupintishi01"
		}
	},
	[1205] = {
		text = "dorm3d_dafeng_bed",
		name = "Small Bonsai",
		award = 0,
		time = 0,
		id = 1205,
		room_id = 12,
		icon = "3Ddrom_dafeng_item5",
		desc = "A beautifully maintained bonsai with glossy and vibrant leaves. You can tell at a glance how much care it's given.",
		model = {
			"fbx/litmap_01/pre_db_bonsai20"
		},
		unlock = {
			1,
			30707,
			1
		},
		vfx_prefab = {
			"fbx/litmap_01/pre_db_bonsai20/vfx_wupintishi01"
		}
	},
	[1206] = {
		text = "dorm3d_dafeng_table",
		name = "Phoenix Hairpin",
		award = 0,
		time = 0,
		id = 1206,
		room_id = 12,
		icon = "3Ddrom_dafeng_item6",
		desc = "A hair ornament with a phoenix motif is left on her vanity. It's the same as the one she always wears. She clearly likes it enough to have multiple.",
		model = {
			"fbx/litmap_01/pre_db_headgear02"
		},
		unlock = {
			1,
			30707,
			1
		},
		vfx_prefab = {
			"fbx/litmap_01/pre_db_headgear02/vfx_wupintishi01"
		}
	},
	[1207] = {
		text = "dorm3d_dafeng_table",
		name = "Geta Clogs",
		award = 0,
		time = 0,
		id = 1207,
		room_id = 12,
		icon = "3Ddrom_dafeng_item7",
		desc = "A pair of traditional geta, with patterns carved into their wooden soles. When worn on a stroll, they make one's footsteps all the more musical.",
		model = {
			"fbx/litmap_01/pre_db_shoe02"
		},
		unlock = {
			1,
			30707,
			1
		},
		vfx_prefab = {
			"fbx/litmap_01/pre_db_shoe02/vfx_wupintishi01"
		}
	},
	[1208] = {
		text = "dorm3d_dafeng_bed",
		name = "Book Collection",
		award = 0,
		time = 0,
		id = 1208,
		room_id = 12,
		icon = "3Ddrom_dafeng_item8",
		desc = "Subjects in her collection range from literature to military affairs. Some of these books also seem a little... odd?",
		model = {
			"fbx/litmap_01/pre_db_book19"
		},
		unlock = {
			1,
			30707,
			1
		},
		vfx_prefab = {
			"fbx/litmap_01/pre_db_book19/vfx_wupintishi01"
		}
	},
	[1209] = {
		text = "dorm3d_dafeng_chair",
		name = "Incense Burner",
		award = 0,
		time = 2,
		id = 1209,
		room_id = 12,
		icon = "3Ddrom_dafeng_item9",
		desc = "The incense burner emits a floral scent. Before bedtime, she likes to fill her room with tranquil aromas.",
		model = {
			"fbx/litmap_01/night/pre_db_decoration17"
		},
		unlock = {
			1,
			30707,
			1
		},
		vfx_prefab = {
			"fbx/litmap_01/night/pre_db_decoration17/vfx_wupintishi01"
		}
	},
	[1210] = {
		text = "dorm3d_dafeng_chair",
		name = "Cat Tree",
		award = 0,
		time = 0,
		id = 1210,
		room_id = 12,
		icon = "3Ddrom_dafeng_item10",
		desc = "A cat tree with a cute design, complete with a toy ball on top. Is she thinking of getting a cat, maybe?",
		model = {
			"fbx/litmap_01/pre_db_decoration04"
		},
		unlock = {
			1,
			30707,
			1
		},
		vfx_prefab = {
			"fbx/litmap_01/pre_db_decoration04/vfx_wupintishi01"
		}
	},
	[1211] = {
		text = "dorm3d_dafeng_bed",
		name = "Aromatherapy Candle",
		award = 0,
		time = 2,
		id = 1211,
		room_id = 12,
		icon = "3Ddrom_dafeng_item11",
		desc = "The candle serves as both illumination and decoration. Taihou has also mixed in some essential oils, adding a gentle lavender scent when it burns.",
		model = {
			"fbx/litmap_01/night/pre_db_decoration19"
		},
		unlock = {
			1,
			30707,
			1
		},
		vfx_prefab = {
			"fbx/litmap_01/night/pre_db_decoration19/vfx_wupintishi01"
		}
	},
	[1212] = {
		text = "dorm3d_dafeng_chair",
		name = "Vivacious Flowers",
		award = 0,
		time = 0,
		id = 1212,
		room_id = 12,
		icon = "3Ddrom_dafeng_item12",
		desc = "A vibrant arrangement of brightly colored flowers sits by the window. Taihou regularly takes care of the collection, maintaining its freshness.",
		model = {
			"fbx/litmap_01/pre_db_flowerpot16"
		},
		unlock = {
			1,
			30707,
			1
		},
		vfx_prefab = {
			"fbx/litmap_01/pre_db_flowerpot16/vfx_wupintishi01"
		}
	},
	[1213] = {
		text = "dorm3d_dafeng_chair",
		name = "Cat Bowls",
		award = 0,
		time = 0,
		id = 1213,
		room_id = 12,
		icon = "3Ddrom_dafeng_item13",
		desc = "Brand-new cat bowls divided by color – white for water, black for food.",
		model = {
			"fbx/litmap_01/pre_db_tableware44"
		},
		unlock = {
			1,
			30707,
			1
		},
		vfx_prefab = {
			"fbx/litmap_01/pre_db_tableware44/vfx_wupintishi01"
		}
	},
	[1214] = {
		text = "dorm3d_dafeng_table",
		name = "Fruit Bowl",
		award = 0,
		time = 0,
		id = 1214,
		room_id = 12,
		icon = "3Ddrom_dafeng_item14",
		desc = "A bowl of fresh, delicious-looking fruit sits on the table. She always keeps it filled for her guests' convenience.",
		model = {
			"no_bake_pay_prop/kitchen/pre_db_df_kitchen01_0/pre_db_tableware47"
		},
		unlock = {
			1,
			30707,
			1
		},
		vfx_prefab = {
			"no_bake_pay_prop/kitchen/pre_db_df_kitchen01_0/pre_db_tableware47/vfx_wupintishi01"
		}
	},
	[1215] = {
		text = "dorm3d_dafeng_table",
		name = "Full-Size Fridge",
		award = 0,
		time = 0,
		id = 1215,
		room_id = 12,
		icon = "3Ddrom_dafeng_item15",
		desc = "A large refrigerator full of fruit, vegetables, sweets, and drinks. Taihou frequently replaces the contents to suit her whims.",
		model = {
			"fbx/litmap_01/pre_db_appliances08"
		},
		unlock = {
			1,
			30707,
			1
		},
		vfx_prefab = {
			"fbx/litmap_01/pre_db_appliances08/vfx_wupintishi01"
		}
	},
	[1216] = {
		text = "dorm3d_dafeng_table",
		name = "Ceramic Knife",
		award = 0,
		time = 0,
		id = 1216,
		room_id = 12,
		icon = "3Ddrom_dafeng_item16",
		desc = "A high-quality ceramic kitchen knife. Taihou never fails to use it when making heartfelt lunches for a certain someone.",
		model = {
			"no_bake/pre_db_kitchenware25"
		},
		unlock = {
			1,
			30707,
			1
		},
		vfx_prefab = {
			"no_bake/pre_db_kitchenware25/vfx_wupintishi01"
		}
	},
	[1217] = {
		text = "dorm3d_dafeng_table",
		name = "Kettle",
		award = 0,
		time = 0,
		id = 1217,
		room_id = 12,
		icon = "3Ddrom_dafeng_item17",
		desc = "She often uses this kettle to make tea. Apparently, she accidentally burned herself a lot when she first started.",
		model = {
			"fbx/litmap_01/pre_db_kitchenware19"
		},
		unlock = {
			1,
			30707,
			1
		},
		vfx_prefab = {
			"fbx/litmap_01/pre_db_kitchenware19/vfx_wupintishi01"
		}
	},
	[1218] = {
		text = "dorm3d_dafeng_chair",
		name = "Temari Ball",
		award = 0,
		time = 2,
		id = 1218,
		room_id = 12,
		icon = "3Ddrom_dafeng_item18",
		desc = "An exquisite temari ball, but it looks like it's only for decoration. She probably hasn't played with it in a long time – you could ask her to teach you how to play.",
		model = {
			"fbx/litmap_01/night/pre_db_toy15"
		},
		unlock = {
			1,
			30707,
			1
		},
		vfx_prefab = {
			"fbx/litmap_01/night/pre_db_toy15/vfx_wupintishi01"
		}
	},
	[1219] = {
		text = "dorm3d_dafeng_chair",
		name = "Cushioned Seat",
		award = 0,
		time = 0,
		id = 1219,
		room_id = 12,
		icon = "3Ddrom_dafeng_item19",
		desc = "A dark, round cushion. It's comfortable, but so low that it's clearly meant to be used on a tatami floor.",
		model = {
			"fbx/litmap_01/pre_db_chair28"
		},
		unlock = {
			1,
			30707,
			1
		},
		vfx_prefab = {
			"fbx/litmap_01/pre_db_chair28/vfx_wupintishi01"
		}
	},
	[1220] = {
		text = "dorm3d_dafeng_table",
		name = "Tuna Sushi",
		award = 0,
		time = 2,
		id = 1220,
		room_id = 12,
		icon = "3Ddrom_dafeng_item20",
		desc = "Fresh sushi with fatty tuna. It's part of a special meal set aside for a loved one. She has more kinds on offer, too.",
		model = {
			"no_bake_pay_prop/kitchen/pre_db_df_kitchen01_0/pre_db_food22"
		},
		unlock = {
			1,
			30707,
			1
		},
		vfx_prefab = {
			"no_bake_pay_prop/kitchen/pre_db_df_kitchen01_0/pre_db_food22/vfx_wupintishi01"
		}
	},
	[1221] = {
		text = "dorm3d_dafeng_table",
		name = "Loving Lunch",
		award = 0,
		time = 2,
		id = 1221,
		room_id = 12,
		icon = "3Ddrom_dafeng_item21",
		desc = "A luxurious bento box with nine compartments. The selection of foods is diverse, creating an effective nutritional balance and flavors that you'll never forget.",
		model = {
			"no_bake_pay_prop/kitchen/pre_db_df_kitchen01_0/pre_db_food23"
		},
		unlock = {
			1,
			30707,
			1
		},
		vfx_prefab = {
			"no_bake_pay_prop/kitchen/pre_db_df_kitchen01_0/pre_db_food23/vfx_wupintishi01"
		}
	},
	[1222] = {
		text = "dorm3d_dafeng_table",
		name = "Wooden Cabinet",
		award = 0,
		time = 0,
		id = 1222,
		room_id = 12,
		icon = "3Ddrom_dafeng_item22",
		desc = "This small wooden cabinet by the entrance neatly displays her various odds and ends.",
		model = {
			"fbx/litmap_01/pre_db_cupboard29"
		},
		unlock = {
			1,
			30707,
			1
		},
		vfx_prefab = {
			"fbx/litmap_01/pre_db_cupboard29/vfx_wupintishi01"
		}
	},
	[1223] = {
		text = "dorm3d_dafeng_table",
		name = "Kitchen Set",
		award = 0,
		time = 0,
		id = 1223,
		room_id = 12,
		icon = "3Ddrom_dafeng_item23",
		desc = "A tool set comprising a frying pan, ladle, spatula, and more. All of them are clean and hang neatly on the wall.",
		model = {
			"fbx/litmap_01/pre_db_kitchenware21"
		},
		unlock = {
			1,
			30707,
			1
		},
		vfx_prefab = {
			"fbx/litmap_01/pre_db_kitchenware21/vfx_wupintishi01"
		}
	},
	[1224] = {
		text = "dorm3d_dafeng_bed",
		name = "Paper Fan",
		award = 0,
		time = 0,
		id = 1224,
		room_id = 12,
		icon = "3Ddrom_dafeng_item24",
		desc = "A traditional red Sakuran fan, illustrated with wild geese and white cherry blossoms. Taihou made it herself.",
		model = {
			"fbx/litmap_01/pre_db_decoration16b"
		},
		unlock = {
			1,
			30707,
			1
		},
		vfx_prefab = {
			"fbx/litmap_01/pre_db_decoration16b/vfx_wupintishi01"
		}
	},
	[1225] = {
		text = "dorm3d_dafeng_bed",
		name = "Calligraphy Desk",
		award = 0,
		time = 0,
		id = 1225,
		room_id = 12,
		icon = "3Ddrom_dafeng_item25",
		desc = "A simple desk with calligraphy paper on top. Sometimes, she writes or paints here.",
		model = {
			"fbx/litmap_01/pre_db_table19"
		},
		unlock = {
			1,
			30707,
			1
		},
		vfx_prefab = {
			"fbx/litmap_01/pre_db_table19/vfx_wupintishi01"
		}
	},
	[1226] = {
		text = "dorm3d_dafeng_chair",
		name = "Decorative Flowers",
		award = 0,
		time = 0,
		id = 1226,
		room_id = 12,
		icon = "3Ddrom_dafeng_item26",
		desc = "A display of flowers with subtle colors and a pleasingly uneven arrangement.",
		model = {
			"fbx/litmap_01/pre_db_flowerpot19"
		},
		unlock = {
			1,
			30707,
			1
		},
		vfx_prefab = {
			"fbx/litmap_01/pre_db_flowerpot19/vfx_wupintishi01"
		}
	},
	[1227] = {
		text = "dorm3d_dafeng_table",
		name = "Range Hood",
		award = 0,
		time = 0,
		id = 1227,
		room_id = 12,
		icon = "3Ddrom_dafeng_item27",
		desc = "A practical, efficient, and quiet range hood is placed over the stove.",
		model = {
			"fbx/litmap_01/pre_db_dafeng01_rangehood01"
		},
		unlock = {
			1,
			30707,
			1
		},
		vfx_prefab = {
			"fbx/litmap_01/pre_db_dafeng01_rangehood01/vfx_wupintishi01"
		}
	},
	[1228] = {
		text = "dorm3d_dafeng_chair",
		name = "Framed Fan",
		award = 0,
		time = 0,
		id = 1228,
		room_id = 12,
		icon = "3Ddrom_dafeng_item28",
		desc = "A fan is placed in a frame for decoration. It hangs in a conspicuous place, immediately catching the eye.",
		model = {
			"no_bake_pay_prop/entertainment/pre_db_df_entertainment_01_0/pre_db_billboard27"
		},
		unlock = {
			1,
			30707,
			1
		},
		vfx_prefab = {
			"no_bake_pay_prop/entertainment/pre_db_df_entertainment_01_0/pre_db_billboard27/vfx_wupintishi01"
		}
	},
	[1229] = {
		text = "dorm3d_dafeng_chair",
		name = "Kitty Wall Scroll",
		award = 0,
		time = 0,
		id = 1229,
		room_id = 12,
		icon = "3Ddrom_dafeng_item29",
		desc = "A piece of cat artwork is prominently displayed. The confident brush strokes give a glimpse of the artist's love for cats.",
		model = {
			"fbx/litmap_01/pre_db_wallscrolls03"
		},
		unlock = {
			1,
			30707,
			1
		},
		vfx_prefab = {
			"fbx/litmap_01/pre_db_wallscrolls03/vfx_wupintishi01"
		}
	},
	[1230] = {
		text = "dorm3d_dafeng_table",
		name = "Ceramic Cups",
		award = 0,
		time = 0,
		id = 1230,
		room_id = 12,
		icon = "3Ddrom_dafeng_item30",
		desc = "A collection of exquisite ceramic cups with fancy patterns. Their smooth surfaces are inviting and pleasant to the touch.",
		model = {
			"fbx/litmap_01/pre_db_ceram18"
		},
		unlock = {
			1,
			30707,
			1
		},
		vfx_prefab = {
			"fbx/litmap_01/pre_db_ceram18/vfx_wupintishi01"
		}
	},
	[1601] = {
		text = "dorm3d_collection_cafe",
		name = "Menu",
		award = 0,
		time = 0,
		id = 1601,
		room_id = 16,
		icon = "3Ddrom_cafe_item1",
		desc = "The variety of drinks on this menu helps you see what this café is all about at a glance.\nEach cup is full of creativity and care, satisfying even the most unique tastes.",
		model = {
			"fbx/litmap_03/pre_db_billboard16_2"
		},
		unlock = {},
		vfx_prefab = {
			"fbx/litmap_03/pre_db_billboard16_2/vfx_wupintishi01"
		}
	},
	[1602] = {
		text = "dorm3d_collection_cafe",
		name = "Signs",
		award = 0,
		time = 0,
		id = 1602,
		room_id = 16,
		icon = "3Ddrom_cafe_item2",
		desc = "Convenient signs guide you to the coziest corners of the café. First impressions matter!",
		model = {
			"fbx/litmap_03/pre_db_billboard13"
		},
		unlock = {},
		vfx_prefab = {
			"fbx/litmap_03/pre_db_billboard13/vfx_wupintishi01"
		}
	},
	[1603] = {
		text = "dorm3d_collection_cafe",
		name = "Candle",
		award = 0,
		time = 0,
		id = 1603,
		room_id = 16,
		icon = "3Ddrom_cafe_item3",
		desc = "Warm, gentle light cultivates a romantic and relaxing vibe.",
		model = {
			"fbx/litmap_03/pre_db_desklamp06_1"
		},
		unlock = {},
		vfx_prefab = {
			"fbx/litmap_03/pre_db_desklamp06_1/vfx_wupintishi01"
		}
	},
	[1604] = {
		text = "dorm3d_collection_cafe",
		name = "Order Counter",
		award = 0,
		time = 0,
		id = 1604,
		room_id = 16,
		icon = "3Ddrom_cafe_item4",
		desc = "The monitor is operated by touch screen, and its design is simple yet functional. Ordering and payment are quick and easy.",
		model = {
			"fbx/litmap_03/pre_db_electrical19"
		},
		unlock = {},
		vfx_prefab = {
			"fbx/litmap_03/pre_db_electrical19/vfx_wupintishi01"
		}
	},
	[1605] = {
		text = "dorm3d_collection_cafe",
		name = "Bottle",
		award = 0,
		time = 0,
		id = 1605,
		room_id = 16,
		icon = "3Ddrom_cafe_item5",
		desc = "The bottle is designed by an expert craftsman. Its appearance and practicality make your morning cup of coffee more refined and enjoyable.",
		model = {
			"fbx/litmap_03/pre_db_drink03_1"
		},
		unlock = {},
		vfx_prefab = {
			"fbx/litmap_03/pre_db_drink03_1/vfx_wupintishi01"
		}
	},
	[1606] = {
		text = "dorm3d_collection_cafe",
		name = "Chocolate Donut",
		award = 0,
		time = 0,
		id = 1606,
		room_id = 16,
		icon = "3Ddrom_cafe_item6",
		desc = "Crispy on the outside, tender on the inside. A classic, delicious dessert.\nEvery bite leaves a lasting impression of joy on your taste buds.",
		model = {
			"fbx/litmap_03/pre_db_food07"
		},
		unlock = {},
		vfx_prefab = {
			"fbx/litmap_03/pre_db_food07/vfx_wupintishi01"
		}
	},
	[1607] = {
		text = "dorm3d_collection_cafe",
		name = "Cocktail Set",
		award = 0,
		time = 0,
		id = 1607,
		room_id = 16,
		icon = "3Ddrom_cafe_item7",
		desc = "Cocktails mixed with professional tools make the night much more colorful.",
		model = {
			"fbx/litmap_03/pre_db_frame23_group"
		},
		unlock = {},
		vfx_prefab = {
			"fbx/litmap_03/pre_db_frame23_group/vfx_wupintishi01"
		}
	},
	[1608] = {
		text = "dorm3d_collection_cafe",
		name = "Napkins",
		award = 0,
		time = 0,
		id = 1608,
		room_id = 16,
		icon = "3Ddrom_cafe_item8",
		desc = "Soft, clean napkins lie ready to attend to any and all cleaning needs.",
		model = {
			"fbx/litmap_03/pre_db_tableware30_4"
		},
		unlock = {},
		vfx_prefab = {
			"fbx/litmap_03/pre_db_tableware30_4/vfx_wupintishi01"
		}
	},
	[1609] = {
		text = "dorm3d_collection_cafe",
		name = "Carved Mascot",
		award = 0,
		time = 0,
		id = 1609,
		room_id = 16,
		icon = "3Ddrom_cafe_item9",
		desc = "A carving of the café's iconic mascot.",
		model = {
			"fbx/litmap_03/pre_db_publiccafe01_statue01"
		},
		unlock = {},
		vfx_prefab = {
			"fbx/litmap_03/pre_db_publiccafe01_statue01/vfx_wupintishi01"
		}
	},
	[1401] = {
		text = "dorm3d_aijier_chair",
		name = "Vintage Gramophone",
		award = 0,
		time = 0,
		id = 1401,
		room_id = 14,
		icon = "3Ddrom_aijier_item1",
		desc = "An intricate, traditional record player. It brings out the warm, rich depth of vinyl.",
		model = {
			"fbx/litmap_01/pre_db_decoration25"
		},
		unlock = {
			1,
			49905,
			1
		},
		vfx_prefab = {
			"fbx/litmap_01/pre_db_decoration25/vfx_wupintishi01"
		}
	},
	[1402] = {
		text = "dorm3d_aijier_chair",
		name = "Classic Candelabra",
		award = 0,
		time = 2,
		id = 1402,
		room_id = 14,
		icon = "3Ddrom_aijier_item2",
		desc = "A meticulously designed candelabra. Its brass base holds three candles, each giving off a warm, soft glow.",
		model = {
			"fbx/litmap_01/night/pre_db_decoration26_on"
		},
		unlock = {
			1,
			49905,
			1
		},
		vfx_prefab = {
			"fbx/litmap_01/night/pre_db_decoration26_on/vfx_wupintishi01"
		}
	},
	[1403] = {
		text = "dorm3d_aijier_table",
		name = "Record Collection",
		award = 0,
		time = 0,
		id = 1403,
		room_id = 14,
		icon = "3Ddrom_aijier_item3",
		desc = "A curated collection of records spanning diverse genres. From the beautiful sleeves to the music inside, it's an ideal selection for her gramophone.",
		model = {
			"fbx/litmap_05/pre_db_decoration28"
		},
		unlock = {
			1,
			49905,
			1
		},
		vfx_prefab = {
			"fbx/litmap_05/pre_db_decoration28/vfx_wupintishi01"
		}
	},
	[1404] = {
		text = "dorm3d_aijier_table",
		name = "Twinbell Alarm Clock",
		award = 0,
		time = 0,
		id = 1404,
		room_id = 14,
		icon = "3Ddrom_aijier_item4",
		desc = "An alarm clock with a simple design. Its clarion call pierces even the deepest of sleeps, waking one up from any dream.",
		model = {
			"fbx/litmap_05/pre_db_clock04"
		},
		unlock = {
			1,
			49905,
			1
		},
		vfx_prefab = {
			"fbx/litmap_05/pre_db_clock04/vfx_wupintishi01"
		}
	},
	[1405] = {
		text = "dorm3d_aijier_chair",
		name = "Bronze Goblet",
		award = 0,
		time = 2,
		id = 1405,
		room_id = 14,
		icon = "3Ddrom_aijier_item5",
		desc = "An elegant goblet with a flawless silhouette. It is the ideal vessel for enjoying red wine or fine liquor.",
		model = {
			"fbx/litmap_01/night/pre_db_decoration23"
		},
		unlock = {
			1,
			49905,
			1
		},
		vfx_prefab = {
			"fbx/litmap_01/night/pre_db_decoration23/vfx_wupintishi01"
		}
	},
	[1406] = {
		text = "dorm3d_aijier_chair",
		name = "Ceramic Teacup",
		award = 0,
		time = 0,
		id = 1406,
		room_id = 14,
		icon = "3Ddrom_aijier_item6",
		desc = "A ceramic teacup with a design that is understated yet intricate. Together with its saucer, it brings a quiet elegance to the table.",
		model = {
			"no_bake_pay_prop/livingroom/pre_db_aijier_living01_0/pre_db_ceram28_group02/pre_db_ceram28a"
		},
		unlock = {
			1,
			49905,
			1
		},
		vfx_prefab = {
			"no_bake_pay_prop/livingroom/pre_db_aijier_living01_0/pre_db_ceram28_group02/pre_db_ceram28a/vfx_wupintishi01"
		}
	},
	[1407] = {
		text = "dorm3d_aijier_chair",
		name = "Art Display",
		award = 0,
		time = 0,
		id = 1407,
		room_id = 14,
		icon = "3Ddrom_aijier_item7",
		desc = "A set of framed classical art pieces hangs on the wall. They add a gallery-like feel to her room.",
		model = {
			"fbx/litmap_01/pre_db_billboard_group"
		},
		unlock = {
			1,
			49905,
			1
		},
		vfx_prefab = {
			"fbx/litmap_01/pre_db_billboard_group/vfx_wupintishi01"
		}
	},
	[1408] = {
		text = "dorm3d_aijier_bed",
		name = "Wooden Wardrobe",
		award = 0,
		time = 0,
		id = 1408,
		room_id = 14,
		icon = "3Ddrom_aijier_item8",
		desc = "Behind the patterned doors of this beautiful wooden wardrobe lies ample space for all her clothes.",
		model = {
			"fbx/litmap_01/pre_db_cupboard38"
		},
		unlock = {
			1,
			49905,
			1
		},
		vfx_prefab = {
			"fbx/litmap_01/pre_db_cupboard38/vfx_wupintishi01"
		}
	},
	[1409] = {
		text = "dorm3d_aijier_bed",
		name = "Hand Mirror",
		award = 0,
		time = 0,
		id = 1409,
		room_id = 14,
		icon = "3Ddrom_aijier_item9",
		desc = "A small mirror with a pretty design. Its smooth, flawless surface makes her daily routine just a touch more effortless and elegant.",
		model = {
			"no_bake_pay_prop/entertainment/pre_db_aje_entertainment01_0/pre_db_mirror05"
		},
		unlock = {
			1,
			49905,
			1
		},
		vfx_prefab = {
			"no_bake_pay_prop/entertainment/pre_db_aje_entertainment01_0/pre_db_mirror05/vfx_wupintishi01"
		}
	},
	[1410] = {
		text = "dorm3d_aijier_chair",
		name = "Painting A",
		award = 0,
		time = 0,
		id = 1410,
		room_id = 14,
		icon = "3Ddrom_aijier_item10",
		desc = "An exquisite oil painting of a landscape. It's so realistic that it puts the artist's talent on full display.",
		model = {
			"fbx/litmap_01/pre_db_billboard32"
		},
		unlock = {
			1,
			49905,
			1
		},
		vfx_prefab = {
			"fbx/litmap_01/pre_db_billboard32/vfx_wupintishi01"
		}
	},
	[1411] = {
		text = "dorm3d_aijier_chair",
		name = "Painting B",
		award = 0,
		time = 0,
		id = 1411,
		room_id = 14,
		icon = "3Ddrom_aijier_item11",
		desc = "An exquisite oil painting of a landscape. It's so realistic that it puts the artist's talent on full display.",
		model = {
			"fbx/litmap_01/pre_db_billboard31"
		},
		unlock = {
			1,
			49905,
			1
		},
		vfx_prefab = {
			"fbx/litmap_01/pre_db_billboard31/vfx_wupintishi01"
		}
	},
	[1412] = {
		text = "dorm3d_aijier_bed",
		name = "Jewelry Box",
		award = 0,
		time = 1,
		id = 1412,
		room_id = 14,
		icon = "3Ddrom_aijier_item12",
		desc = "A lovely jewelry box with built-in dividers. It neatly stores her various accessories.",
		model = {
			"no_bake_pay_prop/entertainment/pre_db_aje_entertainment01_0/pre_db_jewelrybox02"
		},
		unlock = {
			1,
			49905,
			1
		},
		vfx_prefab = {
			"no_bake_pay_prop/entertainment/pre_db_aje_entertainment01_0/pre_db_jewelrybox02/vfx_wupintishi01"
		}
	},
	[1413] = {
		text = "dorm3d_aijier_table",
		name = "Suitcase",
		award = 0,
		time = 0,
		id = 1413,
		room_id = 14,
		icon = "3Ddrom_aijier_item13",
		desc = "A very practical suitcase made of soft and durable material. Its spacious interior makes it perfect for vacations and day trips.",
		model = {
			"fbx/litmap_03/pre_db_bag08"
		},
		unlock = {
			1,
			49905,
			1
		},
		vfx_prefab = {
			"fbx/litmap_03/pre_db_bag08/vfx_wupintishi01"
		}
	},
	[1414] = {
		text = "dorm3d_aijier_table",
		name = "Small Cabinet",
		award = 0,
		time = 0,
		id = 1414,
		room_id = 14,
		icon = "3Ddrom_aijier_item14",
		desc = "This standing cabinet has many drawers and compartments. Ägir uses it to store her books and documents.",
		model = {
			"fbx/litmap_05/pre_db_cupboard39"
		},
		unlock = {
			1,
			49905,
			1
		},
		vfx_prefab = {
			"fbx/litmap_05/pre_db_cupboard39/vfx_wupintishi01"
		}
	},
	[1415] = {
		text = "dorm3d_aijier_chair",
		name = "Fireplace",
		award = 0,
		time = 0,
		id = 1415,
		room_id = 14,
		icon = "3Ddrom_aijier_item15",
		desc = "The black marble fireplace feels cool and smooth to the touch. Wood sits inside, ready to be lit at any time.",
		model = {
			"fbx/litmap_01/pre_db_fireplace02"
		},
		unlock = {
			1,
			49905,
			1
		},
		vfx_prefab = {
			"fbx/litmap_01/pre_db_fireplace02/vfx_wupintishi01"
		}
	},
	[1416] = {
		text = "dorm3d_aijier_chair",
		name = "Floor Lamp",
		award = 0,
		time = 0,
		id = 1416,
		room_id = 14,
		icon = "3Ddrom_aijier_item16",
		desc = "This tall standing lamp has a translucent shade that lets its soft light spread through the room.",
		model = {
			"fbx/litmap_01/day/pre_db_floorlamp04_2"
		},
		unlock = {
			1,
			49905,
			1
		},
		vfx_prefab = {
			"fbx/litmap_01/day/pre_db_floorlamp04_2/vfx_wupintishi01"
		}
	},
	[1417] = {
		text = "dorm3d_aijier_bed",
		name = "Fresh Flowers",
		award = 0,
		time = 0,
		id = 1417,
		room_id = 14,
		icon = "3Ddrom_aijier_item17",
		desc = "A carefully arranged bouquet of fresh blooms. The red and white roses smell as sweet as if they were still in the garden.",
		model = {
			"fbx/litmap_01/pre_db_flowers17"
		},
		unlock = {
			1,
			49905,
			1
		},
		vfx_prefab = {
			"fbx/litmap_01/pre_db_flowers17/vfx_wupintishi01"
		}
	},
	[1418] = {
		text = "dorm3d_aijier_chair",
		name = "Decorative Flowers",
		award = 0,
		time = 0,
		id = 1418,
		room_id = 14,
		icon = "3Ddrom_aijier_item18",
		desc = "A cluster of dark, decorative flowers. As a rare species, they seem to be used to adorn specific, special items.",
		model = {
			"fbx/litmap_01/pre_db_flowers18"
		},
		unlock = {
			1,
			49905,
			1
		},
		vfx_prefab = {
			"fbx/litmap_01/pre_db_flowers18/vfx_wupintishi01"
		}
	},
	[1419] = {
		text = "dorm3d_aijier_bed",
		name = "Scented Candle",
		award = 0,
		time = 2,
		id = 1419,
		room_id = 14,
		icon = "3Ddrom_aijier_item19",
		desc = "Decorative and functional, the candle casts a warm light while releasing a refreshing scent.",
		model = {
			"fbx/litmap_01/night/pre_db_decoration24_on"
		},
		unlock = {
			1,
			49905,
			1
		},
		vfx_prefab = {
			"fbx/litmap_01/night/pre_db_decoration24_on/vfx_wupintishi01"
		}
	},
	[1420] = {
		text = "dorm3d_aijier_bed",
		name = "Wide Cabinet",
		award = 0,
		time = 0,
		id = 1420,
		room_id = 14,
		icon = "3Ddrom_aijier_item20",
		desc = "A two-tiered wooden cabinet with a carved pattern on the front. Ägir stores many of her odds and ends inside.",
		model = {
			"fbx/litmap_01/pre_db_cupboard37"
		},
		unlock = {
			1,
			49905,
			1
		},
		vfx_prefab = {
			"fbx/litmap_01/pre_db_cupboard37/vfx_wupintishi01"
		}
	},
	[1421] = {
		text = "dorm3d_aijier_table",
		name = "Wall Lamp",
		award = 0,
		time = 0,
		id = 1421,
		room_id = 14,
		icon = "3Ddrom_aijier_item21",
		desc = "A simple wall lamp illuminates the hallway, adding warmth to the space.",
		model = {
			"fbx/litmap_05/pre_db_aijier_lamp01_7"
		},
		unlock = {
			1,
			49905,
			1
		},
		vfx_prefab = {
			"fbx/litmap_05/pre_db_aijier_lamp01_7/vfx_wupintishi01"
		}
	},
	[1422] = {
		text = "dorm3d_aijier_bed",
		name = "Cosmetics Set",
		award = 0,
		time = 1,
		id = 1422,
		room_id = 14,
		icon = "3Ddrom_aijier_item22",
		desc = "A simple wall lamp illuminates the room, adding warmth to the space.",
		model = {
			"no_bake_pay_prop/entertainment/pre_db_aje_entertainment01_0/pre_db_cosmetic19"
		},
		unlock = {
			1,
			49905,
			1
		},
		vfx_prefab = {
			"no_bake_pay_prop/entertainment/pre_db_aje_entertainment01_0/pre_db_cosmetic19/vfx_wupintishi01"
		}
	},
	[1423] = {
		text = "dorm3d_aijier_bed",
		name = "Reading Materials?",
		award = 0,
		time = 0,
		id = 1423,
		room_id = 14,
		icon = "3Ddrom_aijier_item23",
		desc = "A well-bound book that she reads in her spare time. Apparently, it's some kind of light reading?",
		model = {
			"fbx/litmap_01/book_group"
		},
		unlock = {
			1,
			49905,
			1
		},
		vfx_prefab = {
			"fbx/litmap_01/book_group/vfx_wupintishi01"
		}
	},
	[1424] = {
		text = "dorm3d_aijier_table",
		name = "Oil Painting",
		award = 0,
		time = 0,
		id = 1424,
		room_id = 14,
		icon = "3Ddrom_aijier_item24",
		desc = "An oil painting by a well-known artist. It's one of her favorites.",
		model = {
			"fbx/litmap_05/pre_db_billboard29a"
		},
		unlock = {
			1,
			49905,
			1
		},
		vfx_prefab = {
			"fbx/litmap_05/pre_db_billboard29a/vfx_wupintishi01"
		}
	},
	[1425] = {
		text = "dorm3d_aijier_chair",
		name = "Gold Trophy",
		award = 0,
		time = 0,
		id = 1425,
		room_id = 14,
		icon = "3Ddrom_aijier_item25",
		desc = "A gold trophy awarded for some achievement. She doesn't seem to attach much importance to it, given how carelessly it's been placed.",
		model = {
			"fbx/litmap_01/pre_db_decoration21"
		},
		unlock = {
			1,
			49905,
			1
		},
		vfx_prefab = {
			"fbx/litmap_01/pre_db_decoration21/vfx_wupintishi01"
		}
	}
}
