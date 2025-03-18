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
		128
	}
}, confHX)
pg.base = pg.base or {}
pg.base.dorm3d_collection_template = {
	{
		text = "dorm3d_sirius_table",
		name = "微波炉",
		award = 0,
		time = 0,
		id = 1,
		room_id = 1,
		icon = "3Ddrom_tianlangxing_item5",
		desc = "天狼星自备的微波炉，本该因长时间使用而留下使用痕迹，但不知为何每次看到都是完全崭新的模样。",
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
		name = "咖啡机",
		award = 0,
		time = 0,
		id = 2,
		room_id = 1,
		icon = "3Ddrom_tianlangxing_item6",
		desc = "天狼星每天早晨都会用它准备咖啡。机器上还留有她手指触碰过的痕迹。",
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
		name = "玛丽珍鞋",
		award = 0,
		time = 1,
		id = 3,
		room_id = 1,
		icon = "3Ddrom_tianlangxing_item2",
		desc = "天狼星日常行动时所穿的高跟玛丽珍鞋，皮面因被悉心保养而散发着柔润的光。",
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
		name = "装饰挂画",
		award = 0,
		time = 0,
		id = 4,
		room_id = 1,
		icon = "3Ddrom_tianlangxing_item8",
		desc = "戴着蓝色领结的橘猫。优雅之余又透露着几分憨态，也许房间的主人很喜欢这种可爱的东西？",
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
		name = "烤吐司机",
		award = 0,
		time = 1,
		id = 5,
		room_id = 1,
		icon = "3Ddrom_tianlangxing_item9",
		desc = "对于厨房新手而言非常实用的早餐工具。只需轻轻一按，即可得到微热松软的吐司。——当然，前提是学会调整档位和火候。",
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
		name = "垃圾桶",
		award = 0,
		time = 1,
		id = 6,
		room_id = 1,
		icon = "3Ddrom_tianlangxing_item10",
		desc = "随处可见的普通垃圾桶。………………再怎么看来看去，都只是最普通的垃圾桶。",
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
		name = "相框",
		award = 0,
		time = 0,
		id = 7,
		room_id = 1,
		icon = "3Ddrom_tianlangxing_item17",
		desc = "还未放入相片的空相框，仅有简单的图案让其看上去不那么单调。",
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
		name = "蝴蝶标本",
		award = 0,
		time = 0,
		id = 8,
		room_id = 1,
		icon = "3Ddrom_tianlangxing_item12",
		desc = "蓝色翅面上的花纹一如海面上翻涌起的海浪。也像天狼星驰行于海上时，被风扬起的发丝。工作不忙的时候，陪天狼星去海边走走吧。",
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
		name = "落地灯",
		award = 0,
		time = 0,
		id = 9,
		room_id = 1,
		icon = "3Ddrom_tianlangxing_item15",
		desc = "放置在沙发旁的落地灯，灯泡被天狼星特意换成了护眼的类型。偶尔也在这里处理一下文件吧。",
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
		name = "面包组合？",
		award = 0,
		time = 1,
		id = 10,
		room_id = 1,
		icon = "3Ddrom_tianlangxing_item16",
		desc = "疑似为天狼星亲手制作的可颂与三明治尽管色泽与气味都十分正常，但在天狼星发出邀请之前，还是先不主动品尝了……",
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
		name = "休闲读物",
		award = 0,
		time = 1,
		id = 11,
		room_id = 1,
		icon = "3Ddrom_tianlangxing_item25",
		desc = "茶几上摊开的小说，似乎是天狼星近期的休闲读物。粗略翻了几页，小说是在讲述一位女仆与她的主人之间的禁忌之恋。",
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
		name = "高脚杯",
		award = 0,
		time = 1,
		id = 12,
		room_id = 1,
		icon = "3Ddrom_tianlangxing_item14",
		desc = "用高脚杯盛着的饮用水，确实能体现出天狼星身为女仆的服侍态度……不过“用高脚杯优雅地喝水”多少有些麻烦。还是准备几个普通的玻璃杯吧。",
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
		name = "勇者之剑模型",
		award = 0,
		time = 0,
		id = 13,
		room_id = 1,
		icon = "3Ddrom_tianlangxing_item11",
		desc = "因大型港区虚拟现实体验而火爆起来的周边商品。模型底座上有着“厨具版”的字样。难怪天狼星摆在房间里的这一把摸起来份量更重……",
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
		name = "插花练习作品·I",
		award = 0,
		time = 0,
		id = 14,
		room_id = 1,
		icon = "3Ddrom_tianlangxing_item19",
		desc = "天狼星的插花练习作品。虽然只有纯色的花卉，但也算是错落有致。之后帮她放到比较开阔的位置会比较好吧？",
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
		name = "床头书堆",
		award = 0,
		time = 1,
		id = 15,
		room_id = 1,
		icon = "3Ddrom_tianlangxing_item20",
		desc = "天狼星放在床头的书堆。出乎意料的是，这些并非料理相关的书籍，而是战略及侍奉技巧相关。其中还夹杂着天狼星的读书笔记，从内容上看，她似乎是在钻研如何将二者相结合，好成为一名更优秀的女仆。",
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
		name = "梳妆台",
		award = 0,
		time = 0,
		id = 16,
		room_id = 1,
		icon = "3Ddrom_tianlangxing_item22",
		desc = "大概是急着迎接的缘故，口红盖都没来得及合上。还是帮她收起来吧！",
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
		name = "珠宝展示盒",
		award = 0,
		time = 0,
		id = 17,
		room_id = 1,
		icon = "3Ddrom_tianlangxing_item18",
		desc = "价值不菲的皇家珠宝，天狼星一直将其收纳在展示盒中，不曾佩戴。",
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
		name = "插花练习作品·II",
		award = 0,
		time = 0,
		id = 18,
		room_id = 1,
		icon = "3Ddrom_tianlangxing_item26",
		desc = "简单朴素的黄色玫瑰，作为桌上的点缀而言，这一抹亮色足矣。就是不知道天狼星她自己更喜欢哪种花呢？",
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
		name = "侦探小说",
		award = 0,
		time = 1,
		id = 19,
		room_id = 1,
		icon = "3Ddrom_tianlangxing_item28",
		desc = "尚未被拆封的侦探小说。看来天狼星近期的阅读兴趣不是这个题材。",
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
		name = "柴犬玩偶",
		award = 0,
		time = 1,
		id = 20,
		room_id = 1,
		icon = "3Ddrom_tianlangxing_item29",
		desc = "玩偶的肚皮上有着“{namecode:98}出品，匠心制造”的字样。看来天狼星自己平时也会去光顾{namecode:98}的生意。",
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
		name = "盛夏的纪念",
		award = 0,
		time = 0,
		id = 21,
		room_id = 1,
		icon = "3Ddrom_tianlangxing_item30",
		desc = "之前在海边和天狼星游泳时，她所使用的泳圈。被放在房间十分显眼的位置。或许是碍于女仆的身份而不主动提出想要游泳的请求，下次就主动邀请她去海边吧。",
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
		name = "日程本收纳箱",
		award = 0,
		time = 0,
		id = 22,
		room_id = 1,
		icon = "3Ddrom_tianlangxing_item31",
		desc = "常见的工作文档收纳箱。据天狼星说其中的记事本上都是女仆工作的日程规划。能看到封面的分类标签上半褪色的字迹。——“想要和主人进行的◼◼◼◼”后半的字迹因彻底褪色而无法辨认。",
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
		name = "浇水壶",
		award = 0,
		time = 0,
		id = 23,
		room_id = 1,
		icon = "3Ddrom_tianlangxing_item27",
		desc = "让室内的绿植和花卉保持生机的浇水壶。但无论怎么看都更像是用来倒茶的热水壶……天狼星是在什么情况下开始用它浇水的呢？",
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
		name = "小夜灯",
		award = 0,
		time = 2,
		id = 24,
		room_id = 1,
		icon = "3Ddrom_tianlangxing_item32",
		desc = "造型可爱的温馨小夜灯。是天狼星防止半夜起来时摔倒而特意准备的。温暖的光芒让人联想到她的笑容。",
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
		name = "太阳镜",
		award = 0,
		time = 2,
		id = 25,
		room_id = 1,
		icon = "3Ddrom_tianlangxing_item33",
		desc = "之前在海边和天狼星游泳时，她所使用的太阳镜。被她放在随手就能拿到的位置。",
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
		name = "身体乳",
		award = 0,
		time = 2,
		id = 26,
		room_id = 1,
		icon = "3Ddrom_tianlangxing_item34",
		desc = "天狼星在沐浴后使用的身体乳。有时能在房间门口闻到这股淡淡的香味。",
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
		name = "室内香薰",
		award = 0,
		time = 2,
		id = 27,
		room_id = 1,
		icon = "3Ddrom_tianlangxing_item35",
		desc = "天狼星精心挑选的室内香薰，散发着淡雅的花香。据她说这种香气有助于放松精神，缓解压力。",
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
		name = "使用过的白色毛巾",
		award = 0,
		time = 2,
		id = 28,
		room_id = 1,
		icon = "3Ddrom_tianlangxing_item36",
		desc = "随意披散的白色毛巾，还残留着些许潮湿的气息。或许……是天狼星刚从浴室出来？",
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
		name = "如何俘获指挥官的心·第二册",
		award = 0,
		time = 2,
		id = 29,
		room_id = 1,
		icon = "3Ddrom_tianlangxing_item37",
		desc = "被天狼星放在床头的书籍。……不过，为什么会在这里看到这本书？……甚至还有第二册？",
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
		name = "喝了一半的牛奶",
		award = 0,
		time = 2,
		id = 30,
		room_id = 1,
		icon = "3Ddrom_tianlangxing_item38",
		desc = "放在桌面上的玻璃杯，里面还剩下半杯牛奶。杯口边缘有一个淡淡的唇印。",
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
		name = "华丽沙雕城堡",
		award = 0,
		time = 0,
		id = 31,
		room_id = 4,
		icon = "3Ddrom_beach_item1",
		desc = "这座沙雕城堡在阳光下闪烁着金色的光芒，每个细节都透露出建造者的努力。可以想象建造者对它投入了多少心血。希望它不会被涨潮毁坏。",
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
		name = "沙雕玩具套组",
		award = 0,
		time = 0,
		id = 32,
		room_id = 4,
		icon = "3Ddrom_beach_item2",
		desc = "铲子和桶散落在沙滩上，看来不久前有人在这里制作沙雕。也许下次可以邀请某人一起来进行沙雕制作比赛。",
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
		name = "海风气息的吉他",
		award = 0,
		time = 0,
		id = 33,
		room_id = 4,
		icon = "3Ddrom_beach_item3",
		desc = "一把被主人遗落在沙滩上的木吉他，琴身残留着海风咸咸的气息，拨动琴弦，似乎还能听到海浪的和声。",
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
		name = "不知何人的饮料",
		award = 0,
		time = 0,
		id = 34,
		room_id = 4,
		icon = "3Ddrom_beach_item4",
		desc = "一杯半满的饮料，似乎还残留着冷感，外壁上的水珠正在缓缓滑落，不管它曾经属于谁，现在它属于这篇海滩了。",
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
		name = "冲浪板",
		award = 0,
		time = 0,
		id = 35,
		room_id = 4,
		icon = "3Ddrom_beach_item5",
		desc = "数只随意放置的冲浪板，板身的划痕诉说着与海浪的激情碰撞，也许下次也可以邀请某人一起试试冲浪。",
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
		name = "迷你冰箱",
		award = 0,
		time = 0,
		id = 36,
		room_id = 4,
		icon = "3Ddrom_beach_item6",
		desc = "一台小巧可爱的便携冰箱，里面塞满了各式饮料和点心，应该是为了某个聚会而准备，但它的主人又去哪了呢？",
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
		name = "救生圈",
		award = 0,
		time = 0,
		id = 37,
		room_id = 4,
		icon = "3Ddrom_beach_item7",
		desc = "明黄色和蓝色的救生圈静静躺在沙滩上，虽然有些旧了，但作为救生圈的功能可是一点都不含糊。",
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
		name = "垃圾桶",
		award = 0,
		time = 0,
		id = 38,
		room_id = 4,
		icon = "3Ddrom_beach_item8",
		desc = "造型朴素的垃圾桶，即使是海滩上也不能乱丢垃圾。为了这片蔚蓝的海洋，也必须好好爱护海滩呢。",
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
		name = "轻巧提灯",
		award = 0,
		time = 0,
		id = 39,
		room_id = 4,
		icon = "3Ddrom_beach_item9",
		desc = "一盏造型简约的提灯，似乎在夜晚就会亮起，为夜晚的海滩增添一抹温馨的光芒，仿佛在邀请人们来一场浪漫的夜游。",
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
		name = "花见团子",
		award = 0,
		time = 0,
		id = 51,
		room_id = 2,
		icon = "3Ddrom_nengdai_item1",
		desc = "粉嫩的花见团子静静躺在瓷碟上，和桌布的样式相得益彰。\n等下就坐下来和她一起品尝吧。",
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
		name = "菱饼",
		award = 0,
		time = 0,
		id = 52,
		room_id = 2,
		icon = "3Ddrom_nengdai_item2",
		desc = "青草、白雪、桃花，\n健康、纯洁、驱邪，\n软糯的口感中包含着她心中的期待……",
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
		name = "打开的书",
		award = 0,
		time = 1,
		id = 53,
		room_id = 2,
		icon = "3Ddrom_nengdai_item3",
		desc = "一本关于传统茶道礼仪的典籍，书页的边角已经略显陈旧。\n她似乎经常翻阅这些内容，后面几页还留有她工整的笔记。",
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
		name = "被褥",
		award = 0,
		time = 0,
		id = 54,
		room_id = 2,
		icon = "3Ddrom_nengdai_item4",
		desc = "叠放整齐的被褥,压着角的方式透露出主人极强的规整意识。",
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
		name = "制服",
		award = 0,
		time = 0,
		id = 55,
		room_id = 2,
		icon = "3Ddrom_nengdai_item5",
		desc = "挂在墙上的制服，与她身上穿的分毫不差。\n看来她还是最喜欢这样的打扮",
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
		name = "和果子",
		award = 0,
		time = 0,
		id = 56,
		room_id = 2,
		icon = "3Ddrom_nengdai_item6",
		desc = "包装精美的和果子礼盒，每一块点心都由她亲手制作。\n为了不辜负这份心意，之后就全吃掉吧！",
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
		name = "风铃",
		award = 0,
		time = 0,
		id = 57,
		room_id = 2,
		icon = "3Ddrom_nengdai_item7",
		desc = "挂在窗边的风铃，随着微风发出清脆悦耳的声响。\n她说这是夏日里最好的解暑方式之一。",
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
		name = "风铃·II",
		award = 0,
		time = 0,
		id = 58,
		room_id = 2,
		icon = "3Ddrom_nengdai_item8",
		desc = "发出的声音比玻璃风铃更加浑厚。\n她特意将它挂在不同的位置，两种声音交织，别有一番风情。",
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
		name = "购物袋",
		award = 0,
		time = 0,
		id = 59,
		room_id = 2,
		icon = "3Ddrom_nengdai_item9",
		desc = "咖啡店纸袋，上面印着标志性的商标。\n虽然只是普通购物袋，但她还是把它好好地收在了一旁。",
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
		name = "和服",
		award = 0,
		time = 0,
		id = 60,
		room_id = 2,
		icon = "3Ddrom_nengdai_item10",
		desc = "绣着金线的振袖，即便是挂着的时候也能感受到其端庄优雅。\n似乎是她最喜欢的一件和服，毕竟，每次她穿着它外出时都会格外小心。",
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
		name = "永生花",
		award = 0,
		time = 0,
		id = 61,
		room_id = 2,
		icon = "3Ddrom_nengdai_item11",
		desc = "被精心保存在玻璃罩中的玫瑰。\n花瓣的色泽依然鲜艳如初。",
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
		name = "景观树",
		award = 0,
		time = 0,
		id = 62,
		room_id = 2,
		icon = "3Ddrom_nengdai_item12",
		desc = "小巧的松树盆景，枝干的走向简约又不失情致。\n她这些天以来每天都会花些时间修剪养护,让这份自然的艺术保持最佳的状态。",
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
		name = "流水造景",
		award = 0,
		time = 0,
		id = 63,
		room_id = 2,
		icon = "3Ddrom_nengdai_item13",
		desc = "精致的竹制添水装置立在房间一角，当水流注满时会发出清脆的碰撞声。",
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
		name = "和伞",
		award = 0,
		time = 0,
		id = 64,
		room_id = 2,
		icon = "3Ddrom_nengdai_item14",
		desc = "收起的和伞斜靠在房间的角落，浅色的伞身安静地合拢着。\n是她外出时常用的随身之物。\n当然，前提是下雨天。",
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
		name = "蒲团",
		award = 0,
		time = 0,
		id = 65,
		room_id = 2,
		icon = "3Ddrom_nengdai_item15",
		desc = "浅色的圆形坐垫。\n看上去很硬，但坐起来意外地很舒适。\n是不是该在指挥室也放一个……？",
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
		name = "寿司拼盘",
		award = 0,
		time = 0,
		id = 66,
		room_id = 2,
		icon = "3Ddrom_nengdai_item16",
		desc = "精心摆盘的寿司,每一块都显示出她的细致心思。\n连装饰用的部分也经过精心修剪。\n只是这盘里还有反卷寿司……\n没想到她居然不是寿司原教旨主义者。",
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
		name = "樱花",
		award = 0,
		time = 0,
		id = 67,
		room_id = 2,
		icon = "3Ddrom_nengdai_item17",
		desc = "摆在桌上的一支樱花，粉色的花朵衬着枝条，为桌面增添了一丝淡雅的春意。",
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
		name = "书堆",
		award = 0,
		time = 0,
		id = 68,
		room_id = 2,
		icon = "3Ddrom_nengdai_item18",
		desc = "整齐摞放的书籍,除了茶道典籍外，还有不少花道与传统礼仪的书籍。\n从夹着的书签来看,她似乎正在研习新的插花技法。",
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
		name = "水壶",
		award = 0,
		time = 0,
		id = 70,
		room_id = 2,
		icon = "3Ddrom_nengdai_item19",
		desc = "普通的金属水壶。\n经常看到她用它来烧水泡茶，器具本身似乎已经用了很长时间，但一直保养得很好。",
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
		name = "卷轴",
		award = 0,
		time = 0,
		id = 72,
		room_id = 2,
		icon = "3Ddrom_nengdai_item20",
		desc = "捆扎整齐的卷轴静静地放在书房的一角，绳结一丝不苟地系着。\n虽然没有展开，但从收纳它的方式也能看出她的细心之处。",
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
		name = "石灯",
		award = 0,
		time = 1,
		id = 71,
		room_id = 2,
		icon = "3Ddrom_nengdai_item21",
		desc = "摆在角落的仿石材地灯，造型源自重樱传统庭院石灯。\n让房间里多了一份惬意悠闲的氛围。",
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
		name = "空气加湿器",
		award = 0,
		time = 2,
		id = 76,
		room_id = 2,
		icon = "3Ddrom_nengdai_item24",
		desc = "白色的空气净化器安静地运转着，偶尔会发出轻微的嗡鸣声。\n她把它放在房间的一角，让湿润的水汽慢慢弥散。\n她说，这样对皮肤更好。",
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
		name = "护肤精油",
		award = 0,
		time = 2,
		id = 77,
		room_id = 2,
		icon = "3Ddrom_nengdai_item25",
		desc = "玻璃瓶中的精油散发着淡淡的香气，她说这是由山茶花提炼而成。\n也是她护理肌肤时喜欢使用的单品之一。",
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
		name = "香水瓶",
		award = 0,
		time = 2,
		id = 78,
		room_id = 2,
		icon = "3Ddrom_nengdai_item26",
		desc = "造型简约的香水瓶，玻璃瓶身反射着柔和的光泽。\n仔细一看，正是之前送给她的那一瓶。",
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
		name = "香薰",
		award = 0,
		time = 2,
		id = 79,
		room_id = 2,
		icon = "3Ddrom_nengdai_item27",
		desc = "玻璃瓶中的香薰缓缓散发，清淡的香气弥漫在房间。\n是和她身上的气息接近的味道。",
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
		name = "夜灯",
		award = 0,
		time = 2,
		id = 74,
		room_id = 2,
		icon = "3Ddrom_nengdai_item23",
		desc = "方形的木制灯立在角落，灯芯散发的光透过纸罩映出柔和的光晕。\n是她精心挑选的房间装饰。",
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
		name = "台灯",
		award = 0,
		time = 2,
		id = 75,
		room_id = 2,
		icon = "3Ddrom_nengdai_item22",
		desc = "简约的和式落地灯散发着柔和的光芒，灯罩下悬挂着一个小巧的风铃样装饰。\n陪伴着和她在这里度过的每段平静时光。",
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
		name = "温馨映像",
		award = 0,
		time = 0,
		id = 101,
		room_id = 3,
		icon = "3Ddrom_ankeleiqi_item1",
		desc = "精心挑选的气球装饰着银色相框，安克雷奇似乎很喜欢这种搭配。\n相框上小兔子的蝴蝶结还带着她整理时留下的褶皱。",
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
		name = "童话茶时",
		award = 0,
		time = 0,
		id = 102,
		room_id = 3,
		icon = "3Ddrom_ankeleiqi_item2",
		desc = "兔子造型的茶壶配着小巧的茶杯，安克雷奇总是小心翼翼地摆弄着它们。",
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
		name = "心愿菜单",
		award = 0,
		time = 0,
		id = 103,
		room_id = 3,
		icon = "3Ddrom_ankeleiqi_item3",
		desc = "挂在墙上的粉笔小黑板，安克雷奇时常会在上面写下新的小目标。\n偶尔还能看到她画下的可爱涂鸦。",
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
		name = "知识宝库",
		award = 0,
		time = 0,
		id = 104,
		room_id = 3,
		icon = "3Ddrom_ankeleiqi_item4",
		desc = "整齐摆放在书柜中的童话故事书，每本书的书角都被安克雷奇贴心地包好，还标注着她独创的分类标签。",
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
		name = "文件收纳架",
		award = 0,
		time = 0,
		id = 105,
		room_id = 3,
		icon = "3Ddrom_ankeleiqi_item5",
		desc = "童话城堡造型的文件收纳架，安克雷奇会将各式各样的记事本和重要文件放在其中。",
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
		name = "古典钢琴",
		award = 0,
		time = 0,
		id = 106,
		room_id = 3,
		icon = "3Ddrom_ankeleiqi_item6",
		desc = "房间一角的古典钢琴，琴盖上摆着安克雷奇正在练习的乐谱，谱面上还留有她认真做的标记。",
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
		name = "蜡笔画作",
		award = 0,
		time = 0,
		id = 107,
		room_id = 3,
		icon = "3Ddrom_ankeleiqi_item7",
		desc = "放在桌上的蜡笔画作，画的是安克雷奇眼中的最美好的场景，这图中的人看起来……是我……？",
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
		name = "闹钟",
		award = 0,
		time = 0,
		id = 108,
		room_id = 3,
		icon = "3Ddrom_ankeleiqi_item8",
		desc = "造型简约的闹钟，被安克雷奇摆在床头的位置，似乎在提醒她不要错过每天的重要时刻。",
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
		name = "收纳箱",
		award = 0,
		time = 0,
		id = 109,
		room_id = 3,
		icon = "3Ddrom_ankeleiqi_item9",
		desc = "造型可爱的收纳箱，安克雷奇会把各种零碎的东西放在其中。",
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
		name = "夏日浮圈",
		award = 0,
		time = 0,
		id = 110,
		room_id = 3,
		icon = "3Ddrom_ankeleiqi_item10",
		desc = "装饰着星星图案的游泳圈，是安克雷奇挑选的夏日必需品。",
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
		name = "启蒙厨刀",
		award = 0,
		time = 0,
		id = 111,
		room_id = 3,
		icon = "3Ddrom_ankeleiqi_item11",
		desc = "不会割伤手的特殊启蒙厨刀，安克雷奇最近总是认真地演练着切菜的动作，在憧憬着未来能做出美味料理。",
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
		name = "童话绘本",
		award = 0,
		time = 0,
		id = 112,
		room_id = 3,
		icon = "3Ddrom_ankeleiqi_item12",
		desc = "精装的童话绘本，被安克雷奇小心翼翼地保管着，尽管如此，依然能看出她留在书页间的爱不释手的痕迹。",
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
		name = "毛绒玩具",
		award = 0,
		time = 0,
		id = 113,
		room_id = 3,
		icon = "3Ddrom_ankeleiqi_item13",
		desc = "戴着睡帽的企鹅玩偶，被安克雷奇放在沙发上最为显眼的位置，希望在小企鹅的守护下，她能做一个美梦。",
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
		name = "绿意相伴",
		award = 0,
		time = 0,
		id = 114,
		room_id = 3,
		icon = "3Ddrom_ankeleiqi_item14",
		desc = "小巧可爱的仙人掌，安克雷奇给它换上了色彩明亮的底座，为这个倔强的小生命增添了几分温馨。",
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
		name = "厨具套组",
		award = 0,
		time = 0,
		id = 115,
		room_id = 3,
		icon = "3Ddrom_ankeleiqi_item15",
		desc = "一套不具备实际使用功能的厨具玩具，被安克雷奇整齐地排列在专属的架子上。\n嗯……下厨对她现在来说还是有些太早了……",
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
		name = "海洋摇篮",
		award = 0,
		time = 0,
		id = 116,
		room_id = 3,
		icon = "3Ddrom_ankeleiqi_item16",
		desc = "虎鲸造型的摇摇椅，是安克雷奇最喜欢的休息场所之一。",
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
		name = "储物篮",
		award = 0,
		time = 0,
		id = 117,
		room_id = 3,
		icon = "3Ddrom_ankeleiqi_item17",
		desc = "编织精美的藤制储物篮，安克雷奇用它收纳着日常用品。",
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
		name = "海洋伙伴",
		award = 0,
		time = 0,
		id = 118,
		room_id = 3,
		icon = "3Ddrom_ankeleiqi_item18",
		desc = "蓝白相间的鱼鱼玩偶，有着圆圆的眼睛和友善的微笑，嗯……安克雷奇似乎很喜欢收集这类玩偶，下次再送她几个吧！",
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
		name = "小黑板",
		award = 0,
		time = 0,
		id = 119,
		room_id = 3,
		icon = "3Ddrom_ankeleiqi_item19",
		desc = "粉笔小黑板上画着相当童趣的内容，1+1=♡\n这是什么意思呢？",
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
		name = "方块抱枕",
		award = 0,
		time = 0,
		id = 120,
		room_id = 3,
		icon = "3Ddrom_ankeleiqi_item20",
		desc = "浅色的方块抱枕，其中一面印着温和可爱的鳐鱼图案，轻柔的色调带来了不一样的安宁感。",
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
		name = "回忆相册",
		award = 0,
		time = 0,
		id = 121,
		room_id = 3,
		icon = "3Ddrom_ankeleiqi_item21",
		desc = "悬挂的绳网编织成格，木质夹子固定着珍贵的照片，每一格都是和安克雷奇的温暖回忆。",
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
		name = "雨伞收纳",
		award = 0,
		time = 1,
		id = 122,
		room_id = 3,
		icon = "3Ddrom_ankeleiqi_item22",
		desc = "造型简约的雨伞收纳桶，安克雷奇总会把伞整齐地放置其中，为了随时应对突如其来的雨天。",
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
		name = "暖心相随",
		award = 0,
		time = 1,
		id = 123,
		room_id = 3,
		icon = "3Ddrom_ankeleiqi_item23",
		desc = "浅色调的保温杯，天气冷的时候，安克雷奇会用它装些温热的饮品。",
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
		name = "欢乐印记",
		award = 0,
		time = 1,
		id = 124,
		room_id = 3,
		icon = "3Ddrom_ankeleiqi_item24",
		desc = "可爱的啾啾造型贴纸和星星造型贴纸，被安克雷奇贴在不起眼的角落，为房间增添了几分活泼的气息。",
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
		name = "温柔光影",
		award = 0,
		time = 2,
		id = 125,
		room_id = 3,
		icon = "3Ddrom_ankeleiqi_item25",
		desc = "精致小巧的床头台灯，安克雷奇会在入睡前调至最柔和的亮度，让温暖的光芒守护她的梦。",
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
		name = "深海幻境",
		award = 0,
		time = 2,
		id = 126,
		room_id = 3,
		icon = "3Ddrom_ankeleiqi_item26",
		desc = "座头鲸造型的天花板吊灯，安克雷奇躺在床上时总会凝视着它，仿佛置身于梦幻的海底世界。",
		model = {
			"fbx/no_bake_pay_prop/pre_db_anchoragehostel01_lamp01_night"
		},
		unlock = {
			1,
			19903,
			1
		},
		vfx_prefab = {
			"fbx/no_bake_pay_prop/pre_db_anchoragehostel01_lamp01_night/vfx_wupintishi01"
		}
	},
	[127] = {
		text = "dorm3d_Ankeleiqi_chair",
		name = "啾啾马克杯",
		award = 0,
		time = 2,
		id = 127,
		room_id = 3,
		icon = "3Ddrom_ankeleiqi_item27",
		desc = "啾啾造型的马克杯，被安克雷奇放在最显眼的地方，显然能看出她喜爱的程度。",
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
		name = "浴巾",
		award = 0,
		time = 2,
		id = 128,
		room_id = 3,
		icon = "3Ddrom_ankeleiqi_item28",
		desc = "整齐叠放的浴巾卷，安克雷奇将它们卷成圆润的造型，像是两朵蓬松的云彩静静相依。",
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
	}
}
