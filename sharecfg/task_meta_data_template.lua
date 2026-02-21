pg = pg or {}
pg.task_meta_data_template = setmetatable({
	__name = "task_meta_data_template",
	all = {
		1,
		2,
		3,
		4,
		5,
		6,
		7,
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
		129,
		130,
		131,
		132,
		133,
		134,
		135,
		136,
		137,
		138,
		139,
		140,
		141,
		142,
		143,
		144,
		145,
		146,
		147,
		148,
		149,
		150,
		151,
		152,
		153,
		154,
		155,
		156,
		157,
		158,
		159,
		160,
		161,
		162,
		163,
		164,
		165,
		166,
		167,
		168,
		169,
		170,
		200,
		201,
		202,
		203,
		204,
		205,
		206,
		207,
		208,
		209,
		210,
		211,
		212,
		213,
		214,
		215,
		216,
		217,
		218,
		219,
		220,
		221,
		222,
		223,
		224,
		225,
		226,
		227,
		228,
		229,
		230,
		231,
		232,
		233,
		234,
		235,
		236,
		237,
		238,
		239,
		240,
		241,
		242,
		243,
		244,
		245,
		246,
		247,
		248,
		249,
		250,
		251,
		252,
		253,
		254,
		255,
		301,
		302,
		100001,
		100002,
		100003,
		100004,
		100005,
		100021,
		100022,
		100023,
		100024,
		100025,
		100031,
		100032,
		100033,
		100034,
		100035,
		100041,
		100042,
		100043,
		100044,
		100045,
		100051,
		100052,
		100053,
		100054,
		100055,
		100061,
		100062,
		100063,
		100064,
		100065,
		100071,
		100072,
		100073,
		100074,
		100075,
		100081,
		100082,
		100083,
		100084,
		100085,
		100091,
		100092,
		100093,
		100094,
		100095,
		100101,
		100102,
		100103,
		100104,
		100105,
		100111,
		100112,
		100113,
		100114,
		100115,
		100121,
		100122,
		100123,
		100124,
		100125,
		100131,
		100132,
		100133,
		100134,
		100135,
		100141,
		100142,
		100143,
		100144,
		100145,
		100151,
		100152,
		100153,
		100154,
		100155,
		100161,
		100162,
		100163,
		100164,
		100165,
		100171,
		100172,
		100173,
		100174,
		100175,
		100181,
		100182,
		100183,
		100184,
		100185,
		100191,
		100192,
		100193,
		100194,
		100195,
		100201,
		100202,
		100203,
		100204,
		100205,
		100301,
		100302,
		100303,
		100304,
		100305,
		100311,
		100312,
		100313,
		100314,
		100315,
		100321,
		100322,
		100323,
		100324,
		100325,
		100331,
		100332,
		100333,
		100334,
		100335,
		100341,
		100342,
		100343,
		100344,
		100345,
		100351,
		100352,
		100353,
		100354,
		100355,
		100361,
		100362,
		100363,
		100364,
		100365,
		100371,
		100372,
		100373,
		100374,
		100375,
		100381,
		100382,
		100383,
		100384,
		100385,
		100391,
		100392,
		100393,
		100394,
		100395,
		100401,
		100402,
		100403,
		100404,
		100405,
		100411,
		100412,
		100413,
		100414,
		100415,
		100421,
		100422,
		100423,
		100424,
		100425,
		100431,
		100432,
		100433,
		100434,
		100435,
		100441,
		100442,
		100443,
		100444,
		100445,
		100451,
		100452,
		100453,
		100454,
		100455,
		100461,
		100462,
		100463,
		100464,
		100465,
		100471,
		100472,
		100473,
		100474,
		100475,
		100481,
		100482,
		100483,
		100484,
		100485,
		100491,
		100492,
		100493,
		100494,
		100495,
		100501,
		100502,
		100503,
		100504,
		100505,
		100511,
		100512,
		100513,
		100514,
		100515,
		200001,
		200002,
		200003,
		200004,
		200021,
		200022,
		200023,
		200024,
		200031,
		200032,
		200033,
		200034,
		200041,
		200042,
		200043,
		200044,
		200051,
		200052,
		200053,
		200054,
		200061,
		200062,
		200063,
		200064,
		200071,
		200072,
		200073,
		200074,
		200081,
		200082,
		200083,
		200084,
		200091,
		200092,
		200093,
		200094,
		200101,
		200102,
		200103,
		200104,
		200111,
		200112,
		200113,
		200114,
		200121,
		200122,
		200123,
		200124,
		200131,
		200132,
		200133,
		200134,
		200141,
		200142,
		200143,
		200144,
		200151,
		200152,
		200153,
		200154,
		200161,
		200162,
		200163,
		200164,
		200171,
		200172,
		200173,
		200174,
		200181,
		200182,
		200183,
		200184,
		200191,
		200192,
		200193,
		200194,
		200201,
		200202,
		200203,
		200204,
		200211,
		200212,
		200213,
		200214,
		200221,
		200222,
		200223,
		200224,
		200231,
		200232,
		200233,
		200234,
		200241,
		200242,
		200243,
		200244,
		200251,
		200252,
		200253,
		200254,
		200261,
		200262,
		200263,
		200264,
		200271,
		200272,
		200273,
		200274,
		200281,
		200282,
		200283,
		200284,
		200291,
		200292,
		200293,
		200294,
		200301,
		200302,
		200303,
		200304,
		200311,
		200312,
		200313,
		200314,
		200321,
		200322,
		200323,
		200324,
		200331,
		200332,
		200333,
		200334,
		200341,
		200342,
		200343,
		200344,
		200351,
		200352,
		200353,
		200354,
		200361,
		200362,
		200363,
		200364,
		200371,
		200372,
		200373,
		200374,
		200381,
		200382,
		200383,
		200384,
		200391,
		200392,
		200393,
		200394,
		200401,
		200402,
		200403,
		200404,
		200411,
		200412,
		200413,
		200414,
		200421,
		200422,
		200423,
		200424
	}
}, confHX)
pg.base = pg.base or {}
pg.base.task_meta_data_template = {
	{
		target_id_2 = "",
		sub_type = 27,
		desc = "演習を1回行おう！",
		id = 1,
		target_num = 1,
		target_id = "0"
	},
	{
		target_id_2 = "",
		sub_type = 80,
		desc = "軍事委託を1回遂行する",
		id = 2,
		target_num = 1,
		target_id = "0"
	},
	{
		target_id_2 = "",
		sub_type = 20,
		desc = "艦隊を出撃させ、1回勝利せよ！",
		id = 3,
		target_num = 1,
		target_id = "0"
	},
	{
		target_id_2 = "",
		sub_type = 11,
		desc = "任意の敵艦を1隻撃破する",
		id = 4,
		target_num = 1,
		target_id = "0"
	},
	{
		target_id_2 = "",
		sub_type = 302,
		desc = "セイレーン作戦で1回戦闘を勝利する",
		id = 5,
		target_num = 1,
		target_id = "0"
	},
	{
		target_id_2 = "",
		sub_type = 300,
		desc = "セイレーン作戦で敵を1隻撃破する",
		id = 6,
		target_num = 1,
		target_id = "0"
	},
	{
		target_id_2 = "",
		sub_type = 308,
		desc = "セイレーン作戦の港任務を1回完了する",
		id = 7,
		target_num = 1,
		target_id = "0"
	},
	[101] = {
		target_id_2 = "970701",
		sub_type = 180,
		desc = "飛龍(META)を編成した艦隊で1回戦闘を勝利する",
		id = 101,
		target_num = 1,
		target_id = "0"
	},
	[102] = {
		target_id_2 = "970701",
		sub_type = 180,
		desc = "飛龍(META)を編成した艦隊でLv30+の敵艦隊を撃破する",
		id = 102,
		target_num = 1,
		target_id = "30"
	},
	[103] = {
		target_id_2 = "970701",
		sub_type = 180,
		desc = "飛龍(META)を編成した艦隊でLv55+の敵艦隊を撃破する",
		id = 103,
		target_num = 1,
		target_id = "55"
	},
	[104] = {
		target_id_2 = "970701",
		sub_type = 180,
		desc = "飛龍(META)を編成した艦隊でLv80+の敵艦隊を撃破する",
		id = 104,
		target_num = 1,
		target_id = "80"
	},
	[105] = {
		target_id_2 = "970701",
		sub_type = 180,
		desc = "飛龍(META)を編成した艦隊でLv100+の敵艦隊を撃破する",
		id = 105,
		target_num = 1,
		target_id = "100"
	},
	[106] = {
		target_id_2 = "970702",
		sub_type = 180,
		desc = "アーク・ロイヤル(META)を編成した艦隊で1回戦闘を勝利する",
		id = 106,
		target_num = 1,
		target_id = "0"
	},
	[107] = {
		target_id_2 = "970702",
		sub_type = 180,
		desc = "アーク・ロイヤル(META)を編成した艦隊でLv30+の敵艦隊を撃破する",
		id = 107,
		target_num = 1,
		target_id = "30"
	},
	[108] = {
		target_id_2 = "970702",
		sub_type = 180,
		desc = "アーク・ロイヤル(META)を編成した艦隊でLv55+の敵艦隊を撃破する",
		id = 108,
		target_num = 1,
		target_id = "55"
	},
	[109] = {
		target_id_2 = "970702",
		sub_type = 180,
		desc = "アーク・ロイヤル(META)を編成した艦隊でLv80+の敵艦隊を撃破する",
		id = 109,
		target_num = 1,
		target_id = "80"
	},
	[110] = {
		target_id_2 = "970702",
		sub_type = 180,
		desc = "アーク・ロイヤル(META)を編成した艦隊でLv100+の敵艦隊を撃破する",
		id = 110,
		target_num = 1,
		target_id = "100"
	},
	[111] = {
		target_id_2 = "970201",
		sub_type = 180,
		desc = "ヘレナ(META)を編成した艦隊で1回戦闘を勝利する",
		id = 111,
		target_num = 1,
		target_id = "0"
	},
	[112] = {
		target_id_2 = "970201",
		sub_type = 180,
		desc = "ヘレナ(META)を編成した艦隊でLv30+の敵艦隊を撃破する",
		id = 112,
		target_num = 1,
		target_id = "30"
	},
	[113] = {
		target_id_2 = "970201",
		sub_type = 180,
		desc = "ヘレナ(META)を編成した艦隊でLv55+の敵艦隊を撃破する",
		id = 113,
		target_num = 1,
		target_id = "55"
	},
	[114] = {
		target_id_2 = "970201",
		sub_type = 180,
		desc = "ヘレナ(META)を編成した艦隊でLv80+の敵艦隊を撃破する",
		id = 114,
		target_num = 1,
		target_id = "80"
	},
	[115] = {
		target_id_2 = "970201",
		sub_type = 180,
		desc = "ヘレナ(META)を編成した艦隊でLv100+の敵艦隊を撃破する",
		id = 115,
		target_num = 1,
		target_id = "100"
	},
	[116] = {
		target_id_2 = "970703",
		sub_type = 180,
		desc = "蒼龍(META)を編成した艦隊で1回戦闘を勝利する",
		id = 116,
		target_num = 1,
		target_id = "0"
	},
	[117] = {
		target_id_2 = "970703",
		sub_type = 180,
		desc = "蒼龍(META)を編成した艦隊でLv30+の敵艦隊を撃破する",
		id = 117,
		target_num = 1,
		target_id = "30"
	},
	[118] = {
		target_id_2 = "970703",
		sub_type = 180,
		desc = "蒼龍(META)を編成した艦隊でLv55+の敵艦隊を撃破する",
		id = 118,
		target_num = 1,
		target_id = "55"
	},
	[119] = {
		target_id_2 = "970703",
		sub_type = 180,
		desc = "蒼龍(META)を編成した艦隊でLv80+の敵艦隊を撃破する",
		id = 119,
		target_num = 1,
		target_id = "80"
	},
	[120] = {
		target_id_2 = "970703",
		sub_type = 180,
		desc = "蒼龍(META)を編成した艦隊でLv100+の敵艦隊を撃破する",
		id = 120,
		target_num = 1,
		target_id = "100"
	},
	[121] = {
		target_id_2 = "970501",
		sub_type = 180,
		desc = "扶桑(META)を編成した艦隊で1回戦闘を勝利する",
		id = 121,
		target_num = 1,
		target_id = "0"
	},
	[122] = {
		target_id_2 = "970501",
		sub_type = 180,
		desc = "扶桑(META)を編成した艦隊でLv30+の敵艦隊を撃破する",
		id = 122,
		target_num = 1,
		target_id = "30"
	},
	[123] = {
		target_id_2 = "970501",
		sub_type = 180,
		desc = "扶桑(META)を編成した艦隊でLv55+の敵艦隊を撃破する",
		id = 123,
		target_num = 1,
		target_id = "55"
	},
	[124] = {
		target_id_2 = "970501",
		sub_type = 180,
		desc = "扶桑(META)を編成した艦隊でLv80+の敵艦隊を撃破する",
		id = 124,
		target_num = 1,
		target_id = "80"
	},
	[125] = {
		target_id_2 = "970501",
		sub_type = 180,
		desc = "扶桑(META)を編成した艦隊でLv100+の敵艦隊を撃破する",
		id = 125,
		target_num = 1,
		target_id = "100"
	},
	[126] = {
		target_id_2 = "970601",
		sub_type = 180,
		desc = "飛鷹(META)を編成した艦隊で1回戦闘を勝利する",
		id = 126,
		target_num = 1,
		target_id = "0"
	},
	[127] = {
		target_id_2 = "970601",
		sub_type = 180,
		desc = "飛鷹(META)を編成した艦隊でLv30+の敵艦隊を撃破する",
		id = 127,
		target_num = 1,
		target_id = "30"
	},
	[128] = {
		target_id_2 = "970601",
		sub_type = 180,
		desc = "飛鷹(META)を編成した艦隊でLv55+の敵艦隊を撃破する",
		id = 128,
		target_num = 1,
		target_id = "55"
	},
	[129] = {
		target_id_2 = "970601",
		sub_type = 180,
		desc = "飛鷹(META)を編成した艦隊でLv80+の敵艦隊を撃破する",
		id = 129,
		target_num = 1,
		target_id = "80"
	},
	[130] = {
		target_id_2 = "970601",
		sub_type = 180,
		desc = "飛鷹(META)を編成した艦隊でLv100+の敵艦隊を撃破する",
		id = 130,
		target_num = 1,
		target_id = "100"
	},
	[131] = {
		target_id_2 = "970401",
		sub_type = 180,
		desc = "グナイゼナウ(META)を編成した艦隊で1回戦闘を勝利する",
		id = 131,
		target_num = 1,
		target_id = "0"
	},
	[132] = {
		target_id_2 = "970401",
		sub_type = 180,
		desc = "グナイゼナウ(META)を編成した艦隊でLv30+の敵艦隊を撃破する",
		id = 132,
		target_num = 1,
		target_id = "30"
	},
	[133] = {
		target_id_2 = "970401",
		sub_type = 180,
		desc = "グナイゼナウ(META)を編成した艦隊でLv55+の敵艦隊を撃破する",
		id = 133,
		target_num = 1,
		target_id = "55"
	},
	[134] = {
		target_id_2 = "970401",
		sub_type = 180,
		desc = "グナイゼナウ(META)を編成した艦隊でLv80+の敵艦隊を撃破する",
		id = 134,
		target_num = 1,
		target_id = "80"
	},
	[135] = {
		target_id_2 = "970401",
		sub_type = 180,
		desc = "グナイゼナウ(META)を編成した艦隊でLv100+の敵艦隊を撃破する",
		id = 135,
		target_num = 1,
		target_id = "100"
	},
	[136] = {
		target_id_2 = "970602",
		sub_type = 180,
		desc = "隼鷹(META)を編成した艦隊で1回戦闘を勝利する",
		id = 136,
		target_num = 1,
		target_id = "0"
	},
	[137] = {
		target_id_2 = "970602",
		sub_type = 180,
		desc = "隼鷹(META)を編成した艦隊でLv30+の敵艦隊を撃破する",
		id = 137,
		target_num = 1,
		target_id = "30"
	},
	[138] = {
		target_id_2 = "970602",
		sub_type = 180,
		desc = "隼鷹(META)を編成した艦隊でLv55+の敵艦隊を撃破する",
		id = 138,
		target_num = 1,
		target_id = "55"
	},
	[139] = {
		target_id_2 = "970602",
		sub_type = 180,
		desc = "隼鷹(META)を編成した艦隊でLv80+の敵艦隊を撃破する",
		id = 139,
		target_num = 1,
		target_id = "80"
	},
	[140] = {
		target_id_2 = "970602",
		sub_type = 180,
		desc = "隼鷹(META)を編成した艦隊でLv100+の敵艦隊を撃破する",
		id = 140,
		target_num = 1,
		target_id = "100"
	},
	[141] = {
		target_id_2 = "970402",
		sub_type = 180,
		desc = "シャルンホルスト(META)を編成した艦隊で1回戦闘を勝利する",
		id = 141,
		target_num = 1,
		target_id = "0"
	},
	[142] = {
		target_id_2 = "970402",
		sub_type = 180,
		desc = "シャルンホルスト(META)を編成した艦隊でLv30+の敵艦隊を撃破する",
		id = 142,
		target_num = 1,
		target_id = "30"
	},
	[143] = {
		target_id_2 = "970402",
		sub_type = 180,
		desc = "シャルンホルスト(META)を編成した艦隊でLv55+の敵艦隊を撃破する",
		id = 143,
		target_num = 1,
		target_id = "55"
	},
	[144] = {
		target_id_2 = "970402",
		sub_type = 180,
		desc = "シャルンホルスト(META)を編成した艦隊でLv80+の敵艦隊を撃破する",
		id = 144,
		target_num = 1,
		target_id = "80"
	},
	[145] = {
		target_id_2 = "970402",
		sub_type = 180,
		desc = "シャルンホルスト(META)を編成した艦隊でLv100+の敵艦隊を撃破する",
		id = 145,
		target_num = 1,
		target_id = "100"
	},
	[146] = {
		target_id_2 = "970502",
		sub_type = 180,
		desc = "山城(META)を編成した艦隊で1回戦闘を勝利する",
		id = 146,
		target_num = 1,
		target_id = "0"
	},
	[147] = {
		target_id_2 = "970502",
		sub_type = 180,
		desc = "山城(META)を編成した艦隊でLv30+の敵艦隊を撃破する",
		id = 147,
		target_num = 1,
		target_id = "30"
	},
	[148] = {
		target_id_2 = "970502",
		sub_type = 180,
		desc = "山城(META)を編成した艦隊でLv55+の敵艦隊を撃破する",
		id = 148,
		target_num = 1,
		target_id = "55"
	},
	[149] = {
		target_id_2 = "970502",
		sub_type = 180,
		desc = "山城(META)を編成した艦隊でLv80+の敵艦隊を撃破する",
		id = 149,
		target_num = 1,
		target_id = "80"
	},
	[150] = {
		target_id_2 = "970502",
		sub_type = 180,
		desc = "山城(META)を編成した艦隊でLv100+の敵艦隊を撃破する",
		id = 150,
		target_num = 1,
		target_id = "100"
	},
	[151] = {
		target_id_2 = "970202",
		sub_type = 180,
		desc = "メンフィス(META)を編成した艦隊で1回戦闘を勝利する",
		id = 151,
		target_num = 1,
		target_id = "0"
	},
	[152] = {
		target_id_2 = "970202",
		sub_type = 180,
		desc = "メンフィス(META)を編成した艦隊でLv30+の敵艦隊を撃破する",
		id = 152,
		target_num = 1,
		target_id = "30"
	},
	[153] = {
		target_id_2 = "970202",
		sub_type = 180,
		desc = "メンフィス(META)を編成した艦隊でLv55+の敵艦隊を撃破する",
		id = 153,
		target_num = 1,
		target_id = "55"
	},
	[154] = {
		target_id_2 = "970202",
		sub_type = 180,
		desc = "メンフィス(META)を編成した艦隊でLv80+の敵艦隊を撃破する",
		id = 154,
		target_num = 1,
		target_id = "80"
	},
	[155] = {
		target_id_2 = "970202",
		sub_type = 180,
		desc = "メンフィス(META)を編成した艦隊でLv100+の敵艦隊を撃破する",
		id = 155,
		target_num = 1,
		target_id = "100"
	},
	[156] = {
		target_id_2 = "970403",
		sub_type = 180,
		desc = "レパルス(META)を編成した艦隊で1回戦闘を勝利する",
		id = 156,
		target_num = 1,
		target_id = "0"
	},
	[157] = {
		target_id_2 = "970403",
		sub_type = 180,
		desc = "レパルス(META)を編成した艦隊でLv30+の敵艦隊を撃破する",
		id = 157,
		target_num = 1,
		target_id = "30"
	},
	[158] = {
		target_id_2 = "970403",
		sub_type = 180,
		desc = "レパルス(META)を編成した艦隊でLv55+の敵艦隊を撃破する",
		id = 158,
		target_num = 1,
		target_id = "55"
	},
	[159] = {
		target_id_2 = "970403",
		sub_type = 180,
		desc = "レパルス(META)を編成した艦隊でLv80+の敵艦隊を撃破する",
		id = 159,
		target_num = 1,
		target_id = "80"
	},
	[160] = {
		target_id_2 = "970403",
		sub_type = 180,
		desc = "レパルス(META)を編成した艦隊でLv100+の敵艦隊を撃破する",
		id = 160,
		target_num = 1,
		target_id = "100"
	},
	[161] = {
		target_id_2 = "970301",
		sub_type = 180,
		desc = "トレント(META)を編成した艦隊で1回戦闘を勝利する",
		id = 161,
		target_num = 1,
		target_id = "0"
	},
	[162] = {
		target_id_2 = "970301",
		sub_type = 180,
		desc = "トレント(META)を編成した艦隊でLv30+の敵艦隊を撃破する",
		id = 162,
		target_num = 1,
		target_id = "30"
	},
	[163] = {
		target_id_2 = "970301",
		sub_type = 180,
		desc = "トレント(META)を編成した艦隊でLv55+の敵艦隊を撃破する",
		id = 163,
		target_num = 1,
		target_id = "55"
	},
	[164] = {
		target_id_2 = "970301",
		sub_type = 180,
		desc = "トレント(META)を編成した艦隊でLv80+の敵艦隊を撃破する",
		id = 164,
		target_num = 1,
		target_id = "80"
	},
	[165] = {
		target_id_2 = "970301",
		sub_type = 180,
		desc = "トレント(META)を編成した艦隊でLv100+の敵艦隊を撃破する",
		id = 165,
		target_num = 1,
		target_id = "100"
	},
	[166] = {
		target_id_2 = "970404",
		sub_type = 180,
		desc = "レナウン(META)を編成した艦隊で1回戦闘を勝利する",
		id = 166,
		target_num = 1,
		target_id = "0"
	},
	[167] = {
		target_id_2 = "970404",
		sub_type = 180,
		desc = "レナウン(META)を編成した艦隊でLv30+の敵艦隊を撃破する",
		id = 167,
		target_num = 1,
		target_id = "30"
	},
	[168] = {
		target_id_2 = "970404",
		sub_type = 180,
		desc = "レナウン(META)を編成した艦隊でLv55+の敵艦隊を撃破する",
		id = 168,
		target_num = 1,
		target_id = "55"
	},
	[169] = {
		target_id_2 = "970404",
		sub_type = 180,
		desc = "レナウン(META)を編成した艦隊でLv80+の敵艦隊を撃破する",
		id = 169,
		target_num = 1,
		target_id = "80"
	},
	[170] = {
		target_id_2 = "970404",
		sub_type = 180,
		desc = "レナウン(META)を編成した艦隊でLv100+の敵艦隊を撃破する",
		id = 170,
		target_num = 1,
		target_id = "100"
	},
	[200] = {
		target_id_2 = "970701",
		sub_type = 302,
		desc = "セイレーン作戦で飛龍(META)を含めた艦隊で1回勝利する",
		id = 200,
		target_num = 1,
		target_id = "0"
	},
	[201] = {
		target_id_2 = "970701",
		sub_type = 302,
		desc = "セイレーン作戦で飛龍(META)を含めた艦隊でLv70+の敵を撃破",
		id = 201,
		target_num = 1,
		target_id = "70"
	},
	[202] = {
		target_id_2 = "970701",
		sub_type = 302,
		desc = "セイレーン作戦で飛龍(META)を含めた艦隊でLv90+の敵を撃破",
		id = 202,
		target_num = 1,
		target_id = "90"
	},
	[203] = {
		target_id_2 = "970701",
		sub_type = 302,
		desc = "セイレーン作戦で飛龍(META)を含めた艦隊でLv100+の敵を撃破 ",
		id = 203,
		target_num = 1,
		target_id = "100"
	},
	[204] = {
		target_id_2 = "970702",
		sub_type = 302,
		desc = "セイレーン作戦でアーク・ロイヤル(META)を含めた艦隊で1回勝利する",
		id = 204,
		target_num = 1,
		target_id = "0"
	},
	[205] = {
		target_id_2 = "970702",
		sub_type = 302,
		desc = "セイレーン作戦でアーク・ロイヤル(META)を含めた艦隊でLv70+の敵を撃破",
		id = 205,
		target_num = 1,
		target_id = "70"
	},
	[206] = {
		target_id_2 = "970702",
		sub_type = 302,
		desc = "セイレーン作戦でアーク・ロイヤル(META)を含めた艦隊でLv90+の敵を撃破",
		id = 206,
		target_num = 1,
		target_id = "90"
	},
	[207] = {
		target_id_2 = "970702",
		sub_type = 302,
		desc = "セイレーン作戦でアーク・ロイヤル(META)を含めた艦隊でLv100+の敵を撃破 ",
		id = 207,
		target_num = 1,
		target_id = "100"
	},
	[208] = {
		target_id_2 = "970201",
		sub_type = 302,
		desc = "セイレーン作戦でヘレナ(META)を含めた艦隊で1回勝利する",
		id = 208,
		target_num = 1,
		target_id = "0"
	},
	[209] = {
		target_id_2 = "970201",
		sub_type = 302,
		desc = "セイレーン作戦でヘレナ(META)を含めた艦隊でLv70+の敵を撃破",
		id = 209,
		target_num = 1,
		target_id = "70"
	},
	[210] = {
		target_id_2 = "970201",
		sub_type = 302,
		desc = "セイレーン作戦でヘレナ(META)を含めた艦隊でLv90+の敵を撃破",
		id = 210,
		target_num = 1,
		target_id = "90"
	},
	[211] = {
		target_id_2 = "970201",
		sub_type = 302,
		desc = "セイレーン作戦でヘレナ(META)を含めた艦隊でLv100+の敵を撃破 ",
		id = 211,
		target_num = 1,
		target_id = "100"
	},
	[212] = {
		target_id_2 = "970703",
		sub_type = 302,
		desc = "セイレーン作戦で蒼龍(META)を含めた艦隊で1回勝利する",
		id = 212,
		target_num = 1,
		target_id = "0"
	},
	[213] = {
		target_id_2 = "970703",
		sub_type = 302,
		desc = "セイレーン作戦で蒼龍(META)を含めた艦隊でLv70+の敵を撃破",
		id = 213,
		target_num = 1,
		target_id = "70"
	},
	[214] = {
		target_id_2 = "970703",
		sub_type = 302,
		desc = "セイレーン作戦で蒼龍(META)を含めた艦隊でLv90+の敵を撃破",
		id = 214,
		target_num = 1,
		target_id = "90"
	},
	[215] = {
		target_id_2 = "970703",
		sub_type = 302,
		desc = "セイレーン作戦で蒼龍(META)を含めた艦隊でLv100+の敵を撃破 ",
		id = 215,
		target_num = 1,
		target_id = "100"
	},
	[216] = {
		target_id_2 = "970501",
		sub_type = 302,
		desc = "セイレーン作戦で扶桑(META)を含めた艦隊で1回勝利する",
		id = 216,
		target_num = 1,
		target_id = "0"
	},
	[217] = {
		target_id_2 = "970501",
		sub_type = 302,
		desc = "セイレーン作戦で扶桑(META)を含めた艦隊でLv70+の敵を撃破",
		id = 217,
		target_num = 1,
		target_id = "70"
	},
	[218] = {
		target_id_2 = "970501",
		sub_type = 302,
		desc = "セイレーン作戦で扶桑(META)を含めた艦隊でLv90+の敵を撃破",
		id = 218,
		target_num = 1,
		target_id = "90"
	},
	[219] = {
		target_id_2 = "970501",
		sub_type = 302,
		desc = "セイレーン作戦で扶桑(META)を含めた艦隊でLv100+の敵を撃破 ",
		id = 219,
		target_num = 1,
		target_id = "100"
	},
	[220] = {
		target_id_2 = "970601",
		sub_type = 302,
		desc = "セイレーン作戦で飛鷹(META)を含めた艦隊で1回勝利する",
		id = 220,
		target_num = 1,
		target_id = "0"
	},
	[221] = {
		target_id_2 = "970601",
		sub_type = 302,
		desc = "セイレーン作戦で飛鷹(META)を含めた艦隊でLv70+の敵を撃破",
		id = 221,
		target_num = 1,
		target_id = "70"
	},
	[222] = {
		target_id_2 = "970601",
		sub_type = 302,
		desc = "セイレーン作戦で飛鷹(META)を含めた艦隊でLv90+の敵を撃破",
		id = 222,
		target_num = 1,
		target_id = "90"
	},
	[223] = {
		target_id_2 = "970601",
		sub_type = 302,
		desc = "セイレーン作戦で飛鷹(META)を含めた艦隊でLv100+の敵を撃破 ",
		id = 223,
		target_num = 1,
		target_id = "100"
	},
	[224] = {
		target_id_2 = "970401",
		sub_type = 302,
		desc = "セイレーン作戦でグナイゼナウ(META)を含めた艦隊で1回勝利する",
		id = 224,
		target_num = 1,
		target_id = "0"
	},
	[225] = {
		target_id_2 = "970401",
		sub_type = 302,
		desc = "セイレーン作戦でグナイゼナウ(META)を含めた艦隊でLv70+の敵を撃破",
		id = 225,
		target_num = 1,
		target_id = "70"
	},
	[226] = {
		target_id_2 = "970401",
		sub_type = 302,
		desc = "セイレーン作戦でグナイゼナウ(META)を含めた艦隊でLv90+の敵を撃破",
		id = 226,
		target_num = 1,
		target_id = "90"
	},
	[227] = {
		target_id_2 = "970401",
		sub_type = 302,
		desc = "セイレーン作戦でグナイゼナウ(META)を含めた艦隊でLv100+の敵を撃破 ",
		id = 227,
		target_num = 1,
		target_id = "100"
	},
	[228] = {
		target_id_2 = "970602",
		sub_type = 302,
		desc = "セイレーン作戦で隼鷹(META)を含めた艦隊で1回勝利する",
		id = 228,
		target_num = 1,
		target_id = "0"
	},
	[229] = {
		target_id_2 = "970602",
		sub_type = 302,
		desc = "セイレーン作戦で隼鷹(META)を含めた艦隊でLv70+の敵を撃破",
		id = 229,
		target_num = 1,
		target_id = "70"
	},
	[230] = {
		target_id_2 = "970602",
		sub_type = 302,
		desc = "セイレーン作戦で隼鷹(META)を含めた艦隊でLv90+の敵を撃破",
		id = 230,
		target_num = 1,
		target_id = "90"
	},
	[231] = {
		target_id_2 = "970602",
		sub_type = 302,
		desc = "セイレーン作戦で隼鷹(META)を含めた艦隊でLv100+の敵を撃破 ",
		id = 231,
		target_num = 1,
		target_id = "100"
	},
	[232] = {
		target_id_2 = "970402",
		sub_type = 302,
		desc = "セイレーン作戦でシャルンホルスト(META)を含めた艦隊で1回勝利する",
		id = 232,
		target_num = 1,
		target_id = "0"
	},
	[233] = {
		target_id_2 = "970402",
		sub_type = 302,
		desc = "セイレーン作戦でシャルンホルスト(META)を含めた艦隊でLv70+の敵を撃破",
		id = 233,
		target_num = 1,
		target_id = "70"
	},
	[234] = {
		target_id_2 = "970402",
		sub_type = 302,
		desc = "セイレーン作戦でシャルンホルスト(META)を含めた艦隊でLv90+の敵を撃破",
		id = 234,
		target_num = 1,
		target_id = "90"
	},
	[235] = {
		target_id_2 = "970402",
		sub_type = 302,
		desc = "セイレーン作戦でシャルンホルスト(META)を含めた艦隊でLv100+の敵を撃破 ",
		id = 235,
		target_num = 1,
		target_id = "100"
	},
	[236] = {
		target_id_2 = "970502",
		sub_type = 302,
		desc = "セイレーン作戦で山城(META)を含めた艦隊で1回勝利する",
		id = 236,
		target_num = 1,
		target_id = "0"
	},
	[237] = {
		target_id_2 = "970502",
		sub_type = 302,
		desc = "セイレーン作戦で山城(META)を含めた艦隊でLv70+の敵を撃破",
		id = 237,
		target_num = 1,
		target_id = "70"
	},
	[238] = {
		target_id_2 = "970502",
		sub_type = 302,
		desc = "セイレーン作戦で山城(META)を含めた艦隊でLv90+の敵を撃破",
		id = 238,
		target_num = 1,
		target_id = "90"
	},
	[239] = {
		target_id_2 = "970502",
		sub_type = 302,
		desc = "セイレーン作戦で山城(META)を含めた艦隊でLv100+の敵を撃破 ",
		id = 239,
		target_num = 1,
		target_id = "100"
	},
	[240] = {
		target_id_2 = "970202",
		sub_type = 302,
		desc = "セイレーン作戦でメンフィス(META)を含めた艦隊で1回勝利する",
		id = 240,
		target_num = 1,
		target_id = "0"
	},
	[241] = {
		target_id_2 = "970202",
		sub_type = 302,
		desc = "セイレーン作戦でメンフィス(META)を含めた艦隊でLv70+の敵を撃破",
		id = 241,
		target_num = 1,
		target_id = "70"
	},
	[242] = {
		target_id_2 = "970202",
		sub_type = 302,
		desc = "セイレーン作戦でメンフィス(META)を含めた艦隊でLv90+の敵を撃破",
		id = 242,
		target_num = 1,
		target_id = "90"
	},
	[243] = {
		target_id_2 = "970202",
		sub_type = 302,
		desc = "セイレーン作戦でメンフィス(META)を含めた艦隊でLv100+の敵を撃破 ",
		id = 243,
		target_num = 1,
		target_id = "100"
	},
	[244] = {
		target_id_2 = "970403",
		sub_type = 302,
		desc = "セイレーン作戦でレパルス(META)を含めた艦隊で1回勝利する",
		id = 244,
		target_num = 1,
		target_id = "0"
	},
	[245] = {
		target_id_2 = "970403",
		sub_type = 302,
		desc = "セイレーン作戦でレパルス(META)を含めた艦隊でLv70+の敵を撃破",
		id = 245,
		target_num = 1,
		target_id = "70"
	},
	[246] = {
		target_id_2 = "970403",
		sub_type = 302,
		desc = "セイレーン作戦でレパルス(META)を含めた艦隊でLv90+の敵を撃破",
		id = 246,
		target_num = 1,
		target_id = "90"
	},
	[247] = {
		target_id_2 = "970403",
		sub_type = 302,
		desc = "セイレーン作戦でレパルス(META)を含めた艦隊でLv100+の敵を撃破 ",
		id = 247,
		target_num = 1,
		target_id = "100"
	},
	[248] = {
		target_id_2 = "970301",
		sub_type = 302,
		desc = "セイレーン作戦でトレント(META)を含めた艦隊で1回勝利する",
		id = 248,
		target_num = 1,
		target_id = "0"
	},
	[249] = {
		target_id_2 = "970301",
		sub_type = 302,
		desc = "セイレーン作戦でトレント(META)を含めた艦隊でLv70+の敵を撃破",
		id = 249,
		target_num = 1,
		target_id = "70"
	},
	[250] = {
		target_id_2 = "970301",
		sub_type = 302,
		desc = "セイレーン作戦でトレント(META)を含めた艦隊でLv90+の敵を撃破",
		id = 250,
		target_num = 1,
		target_id = "90"
	},
	[251] = {
		target_id_2 = "970301",
		sub_type = 302,
		desc = "セイレーン作戦でトレント(META)を含めた艦隊でLv100+の敵を撃破 ",
		id = 251,
		target_num = 1,
		target_id = "100"
	},
	[252] = {
		target_id_2 = "970404",
		sub_type = 302,
		desc = "セイレーン作戦でレナウン(META)を含めた艦隊で1回勝利する",
		id = 252,
		target_num = 1,
		target_id = "0"
	},
	[253] = {
		target_id_2 = "970404",
		sub_type = 302,
		desc = "セイレーン作戦でレナウン(META)を含めた艦隊でLv70+の敵を撃破",
		id = 253,
		target_num = 1,
		target_id = "70"
	},
	[254] = {
		target_id_2 = "970404",
		sub_type = 302,
		desc = "セイレーン作戦でレナウン(META)を含めた艦隊でLv90+の敵を撃破",
		id = 254,
		target_num = 1,
		target_id = "90"
	},
	[255] = {
		target_id_2 = "970404",
		sub_type = 302,
		desc = "セイレーン作戦でレナウン(META)を含めた艦隊でLv100+の敵を撃破",
		id = 255,
		target_num = 1,
		target_id = "100"
	},
	[301] = {
		target_id_2 = "",
		sub_type = 305,
		desc = "META座標解析を1回行う",
		id = 301,
		target_num = 1,
		target_id = "0"
	},
	[302] = {
		target_id_2 = "",
		sub_type = 306,
		desc = "META戦を1回行う",
		id = 302,
		target_num = 1,
		target_id = "0"
	},
	[100001] = {
		target_id_2 = "970101",
		sub_type = 180,
		desc = "ハンター(META)を編成した艦隊で1回戦闘を勝利する",
		id = 100001,
		target_num = 1,
		target_id = "0"
	},
	[100002] = {
		target_id_2 = "970101",
		sub_type = 180,
		desc = "ハンター(META)を編成した艦隊でLv30+の敵艦隊を撃破する",
		id = 100002,
		target_num = 1,
		target_id = "30"
	},
	[100003] = {
		target_id_2 = "970101",
		sub_type = 180,
		desc = "ハンター(META)を編成した艦隊でLv55+の敵艦隊を撃破する",
		id = 100003,
		target_num = 1,
		target_id = "55"
	},
	[100004] = {
		target_id_2 = "970101",
		sub_type = 180,
		desc = "ハンター(META)を編成した艦隊でLv80+の敵艦隊を撃破する",
		id = 100004,
		target_num = 1,
		target_id = "80"
	},
	[100005] = {
		target_id_2 = "970101",
		sub_type = 180,
		desc = "ハンター(META)を編成した艦隊でLv100+の敵艦隊を撃破する",
		id = 100005,
		target_num = 1,
		target_id = "100"
	},
	[100021] = {
		target_id_2 = "970102",
		sub_type = 180,
		desc = "フォーチュン(META)を編成した艦隊で1回戦闘を勝利する",
		id = 100021,
		target_num = 1,
		target_id = "0"
	},
	[100022] = {
		target_id_2 = "970102",
		sub_type = 180,
		desc = "フォーチュン(META)を編成した艦隊でLv30+の敵艦隊を撃破する",
		id = 100022,
		target_num = 1,
		target_id = "30"
	},
	[100023] = {
		target_id_2 = "970102",
		sub_type = 180,
		desc = "フォーチュン(META)を編成した艦隊でLv55+の敵艦隊を撃破する",
		id = 100023,
		target_num = 1,
		target_id = "55"
	},
	[100024] = {
		target_id_2 = "970102",
		sub_type = 180,
		desc = "フォーチュン(META)を編成した艦隊でLv80+の敵艦隊を撃破する",
		id = 100024,
		target_num = 1,
		target_id = "80"
	},
	[100025] = {
		target_id_2 = "970102",
		sub_type = 180,
		desc = "フォーチュン(META)を編成した艦隊でLv100+の敵艦隊を撃破する",
		id = 100025,
		target_num = 1,
		target_id = "100"
	},
	[100031] = {
		target_id_2 = "970503",
		sub_type = 180,
		desc = "アリゾナ(META)を編成した艦隊で1回戦闘を勝利する",
		id = 100031,
		target_num = 1,
		target_id = "0"
	},
	[100032] = {
		target_id_2 = "970503",
		sub_type = 180,
		desc = "アリゾナ(META)を編成した艦隊でLv30+の敵艦隊を撃破する",
		id = 100032,
		target_num = 1,
		target_id = "30"
	},
	[100033] = {
		target_id_2 = "970503",
		sub_type = 180,
		desc = "アリゾナ(META)を編成した艦隊でLv55+の敵艦隊を撃破する",
		id = 100033,
		target_num = 1,
		target_id = "55"
	},
	[100034] = {
		target_id_2 = "970503",
		sub_type = 180,
		desc = "アリゾナ(META)を編成した艦隊でLv80+の敵艦隊を撃破する",
		id = 100034,
		target_num = 1,
		target_id = "80"
	},
	[100035] = {
		target_id_2 = "970503",
		sub_type = 180,
		desc = "アリゾナ(META)を編成した艦隊でLv100+の敵艦隊を撃破する",
		id = 100035,
		target_num = 1,
		target_id = "100"
	},
	[100041] = {
		target_id_2 = "970203",
		sub_type = 180,
		desc = "シェフィールド(META)を編成した艦隊で1回戦闘を勝利する",
		id = 100041,
		target_num = 1,
		target_id = "0"
	},
	[100042] = {
		target_id_2 = "970203",
		sub_type = 180,
		desc = "シェフィールド(META)を編成した艦隊でLv30+の敵艦隊を撃破する",
		id = 100042,
		target_num = 1,
		target_id = "30"
	},
	[100043] = {
		target_id_2 = "970203",
		sub_type = 180,
		desc = "シェフィールド(META)を編成した艦隊でLv55+の敵艦隊を撃破する",
		id = 100043,
		target_num = 1,
		target_id = "55"
	},
	[100044] = {
		target_id_2 = "970203",
		sub_type = 180,
		desc = "シェフィールド(META)を編成した艦隊でLv80+の敵艦隊を撃破する",
		id = 100044,
		target_num = 1,
		target_id = "80"
	},
	[100045] = {
		target_id_2 = "970203",
		sub_type = 180,
		desc = "シェフィールド(META)を編成した艦隊でLv100+の敵艦隊を撃破する",
		id = 100045,
		target_num = 1,
		target_id = "100"
	},
	[100051] = {
		target_id_2 = "970504",
		sub_type = 180,
		desc = "クイーン・エリザベス(META)を編成した艦隊で1回戦闘を勝利する",
		id = 100051,
		target_num = 1,
		target_id = "0"
	},
	[100052] = {
		target_id_2 = "970504",
		sub_type = 180,
		desc = "クイーン・エリザベス(META)を編成した艦隊でLv30+の敵艦隊を撃破する",
		id = 100052,
		target_num = 1,
		target_id = "30"
	},
	[100053] = {
		target_id_2 = "970504",
		sub_type = 180,
		desc = "クイーン・エリザベス(META)を編成した艦隊でLv55+の敵艦隊を撃破する",
		id = 100053,
		target_num = 1,
		target_id = "55"
	},
	[100054] = {
		target_id_2 = "970504",
		sub_type = 180,
		desc = "クイーン・エリザベス(META)を編成した艦隊でLv80+の敵艦隊を撃破する",
		id = 100054,
		target_num = 1,
		target_id = "80"
	},
	[100055] = {
		target_id_2 = "970504",
		sub_type = 180,
		desc = "クイーン・エリザベス(META)を編成した艦隊でLv100+の敵艦隊を撃破する",
		id = 100055,
		target_num = 1,
		target_id = "100"
	},
	[100061] = {
		target_id_2 = "970204",
		sub_type = 180,
		desc = "ラ·ガリソニエール(META)を編成した艦隊で1回戦闘を勝利する",
		id = 100061,
		target_num = 1,
		target_id = "0"
	},
	[100062] = {
		target_id_2 = "970204",
		sub_type = 180,
		desc = "ラ·ガリソニエール(META)を編成した艦隊でLv30+の敵艦隊を撃破する",
		id = 100062,
		target_num = 1,
		target_id = "30"
	},
	[100063] = {
		target_id_2 = "970204",
		sub_type = 180,
		desc = "ラ·ガリソニエール(META)を編成した艦隊でLv55+の敵艦隊を撃破する",
		id = 100063,
		target_num = 1,
		target_id = "55"
	},
	[100064] = {
		target_id_2 = "970204",
		sub_type = 180,
		desc = "ラ·ガリソニエール(META)を編成した艦隊でLv80+の敵艦隊を撃破する",
		id = 100064,
		target_num = 1,
		target_id = "80"
	},
	[100065] = {
		target_id_2 = "970204",
		sub_type = 180,
		desc = "ラ·ガリソニエール(META)を編成した艦隊でLv100+の敵艦隊を撃破する",
		id = 100065,
		target_num = 1,
		target_id = "100"
	},
	[100071] = {
		target_id_2 = "970801",
		sub_type = 180,
		desc = "U-556(META)を編成した艦隊で1回戦闘を勝利する",
		id = 100071,
		target_num = 1,
		target_id = "0"
	},
	[100072] = {
		target_id_2 = "970801",
		sub_type = 180,
		desc = "U-556(META)を編成した艦隊でLv30+の敵艦隊を撃破する",
		id = 100072,
		target_num = 1,
		target_id = "30"
	},
	[100073] = {
		target_id_2 = "970801",
		sub_type = 180,
		desc = "U-556(META)を編成した艦隊でLv55+の敵艦隊を撃破する",
		id = 100073,
		target_num = 1,
		target_id = "55"
	},
	[100074] = {
		target_id_2 = "970801",
		sub_type = 180,
		desc = "U-556(META)を編成した艦隊でLv80+の敵艦隊を撃破する",
		id = 100074,
		target_num = 1,
		target_id = "80"
	},
	[100075] = {
		target_id_2 = "970801",
		sub_type = 180,
		desc = "U-556(META)を編成した艦隊でLv100+の敵艦隊を撃破する",
		id = 100075,
		target_num = 1,
		target_id = "100"
	},
	[100081] = {
		target_id_2 = "971201",
		sub_type = 180,
		desc = "ヴェスタル(META)を編成した艦隊で1回戦闘を勝利する",
		id = 100081,
		target_num = 1,
		target_id = "0"
	},
	[100082] = {
		target_id_2 = "971201",
		sub_type = 180,
		desc = "ヴェスタル(META)を編成した艦隊でLv30+の敵艦隊を撃破する",
		id = 100082,
		target_num = 1,
		target_id = "30"
	},
	[100083] = {
		target_id_2 = "971201",
		sub_type = 180,
		desc = "ヴェスタル(META)を編成した艦隊でLv55+の敵艦隊を撃破する",
		id = 100083,
		target_num = 1,
		target_id = "55"
	},
	[100084] = {
		target_id_2 = "971201",
		sub_type = 180,
		desc = "ヴェスタル(META)を編成した艦隊でLv80+の敵艦隊を撃破する",
		id = 100084,
		target_num = 1,
		target_id = "80"
	},
	[100085] = {
		target_id_2 = "971201",
		sub_type = 180,
		desc = "ヴェスタル(META)を編成した艦隊でLv100+の敵艦隊を撃破する",
		id = 100085,
		target_num = 1,
		target_id = "100"
	},
	[100091] = {
		target_id_2 = "970302",
		sub_type = 180,
		desc = "アルジェリー(META)を編成した艦隊で1回戦闘を勝利する",
		id = 100091,
		target_num = 1,
		target_id = "0"
	},
	[100092] = {
		target_id_2 = "970302",
		sub_type = 180,
		desc = "アルジェリー(META)を編成した艦隊でLv30+の敵艦隊を撃破する",
		id = 100092,
		target_num = 1,
		target_id = "30"
	},
	[100093] = {
		target_id_2 = "970302",
		sub_type = 180,
		desc = "アルジェリー(META)を編成した艦隊でLv55+の敵艦隊を撃破する",
		id = 100093,
		target_num = 1,
		target_id = "55"
	},
	[100094] = {
		target_id_2 = "970302",
		sub_type = 180,
		desc = "アルジェリー(META)を編成した艦隊でLv80+の敵艦隊を撃破する",
		id = 100094,
		target_num = 1,
		target_id = "80"
	},
	[100095] = {
		target_id_2 = "970302",
		sub_type = 180,
		desc = "アルジェリー(META)を編成した艦隊でLv100+の敵艦隊を撃破する",
		id = 100095,
		target_num = 1,
		target_id = "100"
	},
	[100101] = {
		target_id_2 = "970103",
		sub_type = 180,
		desc = "旗風(META)を編成した艦隊で1回戦闘を勝利する",
		id = 100101,
		target_num = 1,
		target_id = "0"
	},
	[100102] = {
		target_id_2 = "970103",
		sub_type = 180,
		desc = "旗風(META)を編成した艦隊でLv30+の敵艦隊を撃破する",
		id = 100102,
		target_num = 1,
		target_id = "30"
	},
	[100103] = {
		target_id_2 = "970103",
		sub_type = 180,
		desc = "旗風(META)を編成した艦隊でLv55+の敵艦隊を撃破する",
		id = 100103,
		target_num = 1,
		target_id = "55"
	},
	[100104] = {
		target_id_2 = "970103",
		sub_type = 180,
		desc = "旗風(META)を編成した艦隊でLv80+の敵艦隊を撃破する",
		id = 100104,
		target_num = 1,
		target_id = "80"
	},
	[100105] = {
		target_id_2 = "970103",
		sub_type = 180,
		desc = "旗風(META)を編成した艦隊でLv100+の敵艦隊を撃破する",
		id = 100105,
		target_num = 1,
		target_id = "100"
	},
	[100111] = {
		target_id_2 = "970205",
		sub_type = 180,
		desc = "神通(META)を編成した艦隊で1回戦闘を勝利する",
		id = 100111,
		target_num = 1,
		target_id = "0"
	},
	[100112] = {
		target_id_2 = "970205",
		sub_type = 180,
		desc = "神通(META)を編成した艦隊でLv30+の敵艦隊を撃破する",
		id = 100112,
		target_num = 1,
		target_id = "30"
	},
	[100113] = {
		target_id_2 = "970205",
		sub_type = 180,
		desc = "神通(META)を編成した艦隊でLv55+の敵艦隊を撃破する",
		id = 100113,
		target_num = 1,
		target_id = "55"
	},
	[100114] = {
		target_id_2 = "970205",
		sub_type = 180,
		desc = "神通(META)を編成した艦隊でLv80+の敵艦隊を撃破する",
		id = 100114,
		target_num = 1,
		target_id = "80"
	},
	[100115] = {
		target_id_2 = "970205",
		sub_type = 180,
		desc = "神通(META)を編成した艦隊でLv100+の敵艦隊を撃破する",
		id = 100115,
		target_num = 1,
		target_id = "100"
	},
	[100121] = {
		target_id_2 = "970603",
		sub_type = 180,
		desc = "プリンストン(META)を編成した艦隊で1回戦闘を勝利する",
		id = 100121,
		target_num = 1,
		target_id = "0"
	},
	[100122] = {
		target_id_2 = "970603",
		sub_type = 180,
		desc = "プリンストン(META)を編成した艦隊でLv30+の敵艦隊を撃破する",
		id = 100122,
		target_num = 1,
		target_id = "30"
	},
	[100123] = {
		target_id_2 = "970603",
		sub_type = 180,
		desc = "プリンストン(META)を編成した艦隊でLv55+の敵艦隊を撃破する",
		id = 100123,
		target_num = 1,
		target_id = "55"
	},
	[100124] = {
		target_id_2 = "970603",
		sub_type = 180,
		desc = "プリンストン(META)を編成した艦隊でLv80+の敵艦隊を撃破する",
		id = 100124,
		target_num = 1,
		target_id = "80"
	},
	[100125] = {
		target_id_2 = "970603",
		sub_type = 180,
		desc = "プリンストン(META)を編成した艦隊でLv100+の敵艦隊を撃破する",
		id = 100125,
		target_num = 1,
		target_id = "100"
	},
	[100131] = {
		target_id_2 = "971301",
		sub_type = 180,
		desc = "エレバス(META)を編成した艦隊で1回戦闘を勝利する",
		id = 100131,
		target_num = 1,
		target_id = "0"
	},
	[100132] = {
		target_id_2 = "971301",
		sub_type = 180,
		desc = "エレバス(META)を編成した艦隊でLv30+の敵艦隊を撃破する",
		id = 100132,
		target_num = 1,
		target_id = "30"
	},
	[100133] = {
		target_id_2 = "971301",
		sub_type = 180,
		desc = "エレバス(META)を編成した艦隊でLv55+の敵艦隊を撃破する",
		id = 100133,
		target_num = 1,
		target_id = "55"
	},
	[100134] = {
		target_id_2 = "971301",
		sub_type = 180,
		desc = "エレバス(META)を編成した艦隊でLv80+の敵艦隊を撃破する",
		id = 100134,
		target_num = 1,
		target_id = "80"
	},
	[100135] = {
		target_id_2 = "971301",
		sub_type = 180,
		desc = "エレバス(META)を編成した艦隊でLv100+の敵艦隊を撃破する",
		id = 100135,
		target_num = 1,
		target_id = "100"
	},
	[100141] = {
		target_id_2 = "970206",
		sub_type = 180,
		desc = "キーロフ(META)を編成した艦隊で1回戦闘を勝利する",
		id = 100141,
		target_num = 1,
		target_id = "0"
	},
	[100142] = {
		target_id_2 = "970206",
		sub_type = 180,
		desc = "キーロフ(META)を編成した艦隊でLv30+の敵艦隊を撃破する",
		id = 100142,
		target_num = 1,
		target_id = "30"
	},
	[100143] = {
		target_id_2 = "970206",
		sub_type = 180,
		desc = "キーロフ(META)を編成した艦隊でLv55+の敵艦隊を撃破する",
		id = 100143,
		target_num = 1,
		target_id = "55"
	},
	[100144] = {
		target_id_2 = "970206",
		sub_type = 180,
		desc = "キーロフ(META)を編成した艦隊でLv80+の敵艦隊を撃破する",
		id = 100144,
		target_num = 1,
		target_id = "80"
	},
	[100145] = {
		target_id_2 = "970206",
		sub_type = 180,
		desc = "キーロフ(META)を編成した艦隊でLv100+の敵艦隊を撃破する",
		id = 100145,
		target_num = 1,
		target_id = "100"
	},
	[100151] = {
		target_id_2 = "970104",
		sub_type = 180,
		desc = "キンバリー(META)を編成した艦隊で1回戦闘を勝利する",
		id = 100151,
		target_num = 1,
		target_id = "0"
	},
	[100152] = {
		target_id_2 = "970104",
		sub_type = 180,
		desc = "キンバリー(META)を編成した艦隊でLv30+の敵艦隊を撃破する",
		id = 100152,
		target_num = 1,
		target_id = "30"
	},
	[100153] = {
		target_id_2 = "970104",
		sub_type = 180,
		desc = "キンバリー(META)を編成した艦隊でLv55+の敵艦隊を撃破する",
		id = 100153,
		target_num = 1,
		target_id = "55"
	},
	[100154] = {
		target_id_2 = "970104",
		sub_type = 180,
		desc = "キンバリー(META)を編成した艦隊でLv80+の敵艦隊を撃破する",
		id = 100154,
		target_num = 1,
		target_id = "80"
	},
	[100155] = {
		target_id_2 = "970104",
		sub_type = 180,
		desc = "キンバリー(META)を編成した艦隊でLv100+の敵艦隊を撃破する",
		id = 100155,
		target_num = 1,
		target_id = "100"
	},
	[100161] = {
		target_id_2 = "970207",
		sub_type = 180,
		desc = "パーミャチ・メルクーリヤ(META)を編成した艦隊で1回戦闘を勝利する",
		id = 100161,
		target_num = 1,
		target_id = "0"
	},
	[100162] = {
		target_id_2 = "970207",
		sub_type = 180,
		desc = "パーミャチ・メルクーリヤ(META)を編成した艦隊でLv30+の敵艦隊を撃破する",
		id = 100162,
		target_num = 1,
		target_id = "30"
	},
	[100163] = {
		target_id_2 = "970207",
		sub_type = 180,
		desc = "パーミャチ・メルクーリヤ(META)を編成した艦隊でLv55+の敵艦隊を撃破する",
		id = 100163,
		target_num = 1,
		target_id = "55"
	},
	[100164] = {
		target_id_2 = "970207",
		sub_type = 180,
		desc = "パーミャチ・メルクーリヤ(META)を編成した艦隊でLv80+の敵艦隊を撃破する",
		id = 100164,
		target_num = 1,
		target_id = "80"
	},
	[100165] = {
		target_id_2 = "970207",
		sub_type = 180,
		desc = "パーミャチ・メルクーリヤ(META)を編成した艦隊でLv100+の敵艦隊を撃破する",
		id = 100165,
		target_num = 1,
		target_id = "100"
	},
	[100171] = {
		target_id_2 = "970505",
		sub_type = 180,
		desc = "ロドニー(META)を編成した艦隊で1回戦闘を勝利する",
		id = 100171,
		target_num = 1,
		target_id = "0"
	},
	[100172] = {
		target_id_2 = "970505",
		sub_type = 180,
		desc = "ロドニー(META)を編成した艦隊でLv30+の敵艦隊を撃破する",
		id = 100172,
		target_num = 1,
		target_id = "30"
	},
	[100173] = {
		target_id_2 = "970505",
		sub_type = 180,
		desc = "ロドニー(META)を編成した艦隊でLv55+の敵艦隊を撃破する",
		id = 100173,
		target_num = 1,
		target_id = "55"
	},
	[100174] = {
		target_id_2 = "970505",
		sub_type = 180,
		desc = "ロドニー(META)を編成した艦隊でLv80+の敵艦隊を撃破する",
		id = 100174,
		target_num = 1,
		target_id = "80"
	},
	[100175] = {
		target_id_2 = "970505",
		sub_type = 180,
		desc = "ロドニー(META)を編成した艦隊でLv100+の敵艦隊を撃破する",
		id = 100175,
		target_num = 1,
		target_id = "100"
	},
	[100181] = {
		target_id_2 = "970105",
		sub_type = 180,
		desc = "ヴァンパイア(META)を編成した艦隊で1回戦闘を勝利する",
		id = 100181,
		target_num = 1,
		target_id = "0"
	},
	[100182] = {
		target_id_2 = "970105",
		sub_type = 180,
		desc = "ヴァンパイア(META)を編成した艦隊でLv30+の敵艦隊を撃破する",
		id = 100182,
		target_num = 1,
		target_id = "30"
	},
	[100183] = {
		target_id_2 = "970105",
		sub_type = 180,
		desc = "ヴァンパイア(META)を編成した艦隊でLv55+の敵艦隊を撃破する",
		id = 100183,
		target_num = 1,
		target_id = "55"
	},
	[100184] = {
		target_id_2 = "970105",
		sub_type = 180,
		desc = "ヴァンパイア(META)を編成した艦隊でLv80+の敵艦隊を撃破する",
		id = 100184,
		target_num = 1,
		target_id = "80"
	},
	[100185] = {
		target_id_2 = "970105",
		sub_type = 180,
		desc = "ヴァンパイア(META)を編成した艦隊でLv100+の敵艦隊を撃破する",
		id = 100185,
		target_num = 1,
		target_id = "100"
	},
	[100191] = {
		target_id_2 = "970704",
		sub_type = 180,
		desc = "ベアルン(META)を編成した艦隊で1回戦闘を勝利する",
		id = 100191,
		target_num = 1,
		target_id = "0"
	},
	[100192] = {
		target_id_2 = "970704",
		sub_type = 180,
		desc = "ベアルン(META)を編成した艦隊でLv30+の敵艦隊を撃破する",
		id = 100192,
		target_num = 1,
		target_id = "30"
	},
	[100193] = {
		target_id_2 = "970704",
		sub_type = 180,
		desc = "ベアルン(META)を編成した艦隊でLv55+の敵艦隊を撃破する",
		id = 100193,
		target_num = 1,
		target_id = "55"
	},
	[100194] = {
		target_id_2 = "970704",
		sub_type = 180,
		desc = "ベアルン(META)を編成した艦隊でLv80+の敵艦隊を撃破する",
		id = 100194,
		target_num = 1,
		target_id = "80"
	},
	[100195] = {
		target_id_2 = "970704",
		sub_type = 180,
		desc = "ベアルン(META)を編成した艦隊でLv100+の敵艦隊を撃破する",
		id = 100195,
		target_num = 1,
		target_id = "100"
	},
	[100201] = {
		target_id_2 = "970303",
		sub_type = 180,
		desc = "フォッシュ(META)を編成した艦隊で1回戦闘を勝利する",
		id = 100201,
		target_num = 1,
		target_id = "0"
	},
	[100202] = {
		target_id_2 = "970303",
		sub_type = 180,
		desc = "フォッシュ(META)を編成した艦隊でLv30+の敵艦隊を撃破する",
		id = 100202,
		target_num = 1,
		target_id = "30"
	},
	[100203] = {
		target_id_2 = "970303",
		sub_type = 180,
		desc = "フォッシュ(META)を編成した艦隊でLv55+の敵艦隊を撃破する",
		id = 100203,
		target_num = 1,
		target_id = "55"
	},
	[100204] = {
		target_id_2 = "970303",
		sub_type = 180,
		desc = "フォッシュ(META)を編成した艦隊でLv80+の敵艦隊を撃破する",
		id = 100204,
		target_num = 1,
		target_id = "80"
	},
	[100205] = {
		target_id_2 = "970303",
		sub_type = 180,
		desc = "フォッシュ(META)を編成した艦隊でLv100+の敵艦隊を撃破する",
		id = 100205,
		target_num = 1,
		target_id = "100"
	},
	[100301] = {
		target_id_2 = "970304",
		sub_type = 180,
		desc = "ウィチタ(META)を編成した艦隊で1回戦闘を勝利する",
		id = 100301,
		target_num = 1,
		target_id = "0"
	},
	[100302] = {
		target_id_2 = "970304",
		sub_type = 180,
		desc = "ウィチタ(META)を編成した艦隊でLv30+の敵艦隊を撃破する",
		id = 100302,
		target_num = 1,
		target_id = "30"
	},
	[100303] = {
		target_id_2 = "970304",
		sub_type = 180,
		desc = "ウィチタ(META)を編成した艦隊でLv55+の敵艦隊を撃破する",
		id = 100303,
		target_num = 1,
		target_id = "55"
	},
	[100304] = {
		target_id_2 = "970304",
		sub_type = 180,
		desc = "ウィチタ(META)を編成した艦隊でLv80+の敵艦隊を撃破する",
		id = 100304,
		target_num = 1,
		target_id = "80"
	},
	[100305] = {
		target_id_2 = "970304",
		sub_type = 180,
		desc = "ウィチタ(META)を編成した艦隊でLv100+の敵艦隊を撃破する",
		id = 100305,
		target_num = 1,
		target_id = "100"
	},
	[100311] = {
		target_id_2 = "970106",
		sub_type = 180,
		desc = "霞(META)を編成した艦隊で1回戦闘を勝利する",
		id = 100311,
		target_num = 1,
		target_id = "0"
	},
	[100312] = {
		target_id_2 = "970106",
		sub_type = 180,
		desc = "霞(META)を編成した艦隊でLv30+の敵艦隊を撃破する",
		id = 100312,
		target_num = 1,
		target_id = "30"
	},
	[100313] = {
		target_id_2 = "970106",
		sub_type = 180,
		desc = "霞(META)を編成した艦隊でLv55+の敵艦隊を撃破する",
		id = 100313,
		target_num = 1,
		target_id = "55"
	},
	[100314] = {
		target_id_2 = "970106",
		sub_type = 180,
		desc = "霞(META)を編成した艦隊でLv80+の敵艦隊を撃破する",
		id = 100314,
		target_num = 1,
		target_id = "80"
	},
	[100315] = {
		target_id_2 = "970106",
		sub_type = 180,
		desc = "霞(META)を編成した艦隊でLv100+の敵艦隊を撃破する",
		id = 100315,
		target_num = 1,
		target_id = "100"
	},
	[100321] = {
		target_id_2 = "970506",
		sub_type = 180,
		desc = "長門(META)を編成した艦隊で1回戦闘を勝利する",
		id = 100321,
		target_num = 1,
		target_id = "0"
	},
	[100322] = {
		target_id_2 = "970506",
		sub_type = 180,
		desc = "長門(META)を編成した艦隊でLv30+の敵艦隊を撃破する",
		id = 100322,
		target_num = 1,
		target_id = "30"
	},
	[100323] = {
		target_id_2 = "970506",
		sub_type = 180,
		desc = "長門(META)を編成した艦隊でLv55+の敵艦隊を撃破する",
		id = 100323,
		target_num = 1,
		target_id = "55"
	},
	[100324] = {
		target_id_2 = "970506",
		sub_type = 180,
		desc = "長門(META)を編成した艦隊でLv80+の敵艦隊を撃破する",
		id = 100324,
		target_num = 1,
		target_id = "80"
	},
	[100325] = {
		target_id_2 = "970506",
		sub_type = 180,
		desc = "長門(META)を編成した艦隊でLv100+の敵艦隊を撃破する",
		id = 100325,
		target_num = 1,
		target_id = "100"
	},
	[100331] = {
		target_id_2 = "970405",
		sub_type = 180,
		desc = "比叡(META)を編成した艦隊で1回戦闘を勝利する",
		id = 100331,
		target_num = 1,
		target_id = "0"
	},
	[100332] = {
		target_id_2 = "970405",
		sub_type = 180,
		desc = "比叡(META)を編成した艦隊でLv30+の敵艦隊を撃破する",
		id = 100332,
		target_num = 1,
		target_id = "30"
	},
	[100333] = {
		target_id_2 = "970405",
		sub_type = 180,
		desc = "比叡(META)を編成した艦隊でLv55+の敵艦隊を撃破する",
		id = 100333,
		target_num = 1,
		target_id = "55"
	},
	[100334] = {
		target_id_2 = "970405",
		sub_type = 180,
		desc = "比叡(META)を編成した艦隊でLv80+の敵艦隊を撃破する",
		id = 100334,
		target_num = 1,
		target_id = "80"
	},
	[100335] = {
		target_id_2 = "970405",
		sub_type = 180,
		desc = "比叡(META)を編成した艦隊でLv100+の敵艦隊を撃破する",
		id = 100335,
		target_num = 1,
		target_id = "100"
	},
	[100341] = {
		target_id_2 = "970604",
		sub_type = 180,
		desc = "鳳翔(META)を編成した艦隊で1回戦闘を勝利する",
		id = 100341,
		target_num = 1,
		target_id = "0"
	},
	[100342] = {
		target_id_2 = "970604",
		sub_type = 180,
		desc = "鳳翔(META)を編成した艦隊でLv30+の敵艦隊を撃破する",
		id = 100342,
		target_num = 1,
		target_id = "30"
	},
	[100343] = {
		target_id_2 = "970604",
		sub_type = 180,
		desc = "鳳翔(META)を編成した艦隊でLv55+の敵艦隊を撃破する",
		id = 100343,
		target_num = 1,
		target_id = "55"
	},
	[100344] = {
		target_id_2 = "970604",
		sub_type = 180,
		desc = "鳳翔(META)を編成した艦隊でLv80+の敵艦隊を撃破する",
		id = 100344,
		target_num = 1,
		target_id = "80"
	},
	[100345] = {
		target_id_2 = "970604",
		sub_type = 180,
		desc = "鳳翔(META)を編成した艦隊でLv100+の敵艦隊を撃破する",
		id = 100345,
		target_num = 1,
		target_id = "100"
	},
	[100351] = {
		target_id_2 = "970507",
		sub_type = 180,
		desc = "ジュリオ・チェザーレ(META)を編成した艦隊で1回戦闘に勝利する",
		id = 100351,
		target_num = 1,
		target_id = "0"
	},
	[100352] = {
		target_id_2 = "970507",
		sub_type = 180,
		desc = "ジュリオ・チェザーレ(META)を編成した艦隊でLV30+の敵艦隊を撃破する",
		id = 100352,
		target_num = 1,
		target_id = "30"
	},
	[100353] = {
		target_id_2 = "970507",
		sub_type = 180,
		desc = "ジュリオ・チェザーレ(META)を編成した艦隊でLV55+の敵艦隊を撃破する",
		id = 100353,
		target_num = 1,
		target_id = "55"
	},
	[100354] = {
		target_id_2 = "970507",
		sub_type = 180,
		desc = "ジュリオ・チェザーレ(META)を編成した艦隊でLV80+の敵艦隊を撃破する",
		id = 100354,
		target_num = 1,
		target_id = "80"
	},
	[100355] = {
		target_id_2 = "970507",
		sub_type = 180,
		desc = "ジュリオ・チェザーレ(META)を編成した艦隊でLV100+の敵艦隊を撃破する",
		id = 100355,
		target_num = 1,
		target_id = "100"
	},
	[100361] = {
		target_id_2 = "970705",
		sub_type = 180,
		desc = "大鳳(META)を編成した艦隊で1回戦闘を勝利する",
		id = 100361,
		target_num = 1,
		target_id = "0"
	},
	[100362] = {
		target_id_2 = "970705",
		sub_type = 180,
		desc = "大鳳(META)を編成した艦隊でLv30+の敵艦隊を撃破する",
		id = 100362,
		target_num = 1,
		target_id = "30"
	},
	[100363] = {
		target_id_2 = "970705",
		sub_type = 180,
		desc = "大鳳(META)を編成した艦隊でLv55+の敵艦隊を撃破する",
		id = 100363,
		target_num = 1,
		target_id = "55"
	},
	[100364] = {
		target_id_2 = "970705",
		sub_type = 180,
		desc = "大鳳(META)を編成した艦隊でLv80+の敵艦隊を撃破する",
		id = 100364,
		target_num = 1,
		target_id = "80"
	},
	[100365] = {
		target_id_2 = "970705",
		sub_type = 180,
		desc = "大鳳(META)を編成した艦隊でLv100+の敵艦隊を撃破する",
		id = 100365,
		target_num = 1,
		target_id = "100"
	},
	[100371] = {
		target_id_2 = "970305",
		sub_type = 180,
		desc = "アドミラル・ヒッパー(META)を編成した艦隊で1回戦闘を勝利する",
		id = 100371,
		target_num = 1,
		target_id = "0"
	},
	[100372] = {
		target_id_2 = "970305",
		sub_type = 180,
		desc = "アドミラル・ヒッパー(META)を編成した艦隊でLv30+の敵艦隊を撃破する",
		id = 100372,
		target_num = 1,
		target_id = "30"
	},
	[100373] = {
		target_id_2 = "970305",
		sub_type = 180,
		desc = "アドミラル・ヒッパー(META)を編成した艦隊でLv55+の敵艦隊を撃破する",
		id = 100373,
		target_num = 1,
		target_id = "55"
	},
	[100374] = {
		target_id_2 = "970305",
		sub_type = 180,
		desc = "アドミラル・ヒッパー(META)を編成した艦隊でLv80+の敵艦隊を撃破する",
		id = 100374,
		target_num = 1,
		target_id = "80"
	},
	[100375] = {
		target_id_2 = "970305",
		sub_type = 180,
		desc = "アドミラル・ヒッパー(META)を編成した艦隊でLv100+の敵艦隊を撃破する",
		id = 100375,
		target_num = 1,
		target_id = "100"
	},
	[100381] = {
		target_id_2 = "970306",
		sub_type = 180,
		desc = "ボルツァーノ(META)を編成した艦隊で1回戦闘を勝利する",
		id = 100381,
		target_num = 1,
		target_id = "0"
	},
	[100382] = {
		target_id_2 = "970306",
		sub_type = 180,
		desc = "ボルツァーノ(META)を編成した艦隊でLv30+の敵艦隊を撃破する",
		id = 100382,
		target_num = 1,
		target_id = "30"
	},
	[100383] = {
		target_id_2 = "970306",
		sub_type = 180,
		desc = "ボルツァーノ(META)を編成した艦隊でLv55+の敵艦隊を撃破する",
		id = 100383,
		target_num = 1,
		target_id = "55"
	},
	[100384] = {
		target_id_2 = "970306",
		sub_type = 180,
		desc = "ボルツァーノ(META)を編成した艦隊でLv80+の敵艦隊を撃破する",
		id = 100384,
		target_num = 1,
		target_id = "80"
	},
	[100385] = {
		target_id_2 = "970306",
		sub_type = 180,
		desc = "ボルツァーノ(META)を編成した艦隊でLv100+の敵艦隊を撃破する",
		id = 100385,
		target_num = 1,
		target_id = "100"
	},
	[100391] = {
		target_id_2 = "970508",
		sub_type = 180,
		desc = "アンドレア・ドーリア(META)を編成した艦隊で1回戦闘を勝利する",
		id = 100391,
		target_num = 1,
		target_id = "0"
	},
	[100392] = {
		target_id_2 = "970508",
		sub_type = 180,
		desc = "アンドレア・ドーリア(META)を編成した艦隊でLv30+の敵艦隊を撃破する",
		id = 100392,
		target_num = 1,
		target_id = "30"
	},
	[100393] = {
		target_id_2 = "970508",
		sub_type = 180,
		desc = "アンドレア・ドーリア(META)を編成した艦隊でLv55+の敵艦隊を撃破する",
		id = 100393,
		target_num = 1,
		target_id = "55"
	},
	[100394] = {
		target_id_2 = "970508",
		sub_type = 180,
		desc = "アンドレア・ドーリア(META)を編成した艦隊でLv80+の敵艦隊を撃破する",
		id = 100394,
		target_num = 1,
		target_id = "80"
	},
	[100395] = {
		target_id_2 = "970508",
		sub_type = 180,
		desc = "アンドレア・ドーリア(META)を編成した艦隊でLv100+の敵艦隊を撃破する",
		id = 100395,
		target_num = 1,
		target_id = "100"
	},
	[100401] = {
		target_id_2 = "970706",
		sub_type = 180,
		desc = "ホーネット(META)を編成した艦隊で1回戦闘を勝利する",
		id = 100401,
		target_num = 1,
		target_id = "0"
	},
	[100402] = {
		target_id_2 = "970706",
		sub_type = 180,
		desc = "ホーネット(META)を編成した艦隊でLv30+の敵艦隊を撃破する",
		id = 100402,
		target_num = 1,
		target_id = "30"
	},
	[100403] = {
		target_id_2 = "970706",
		sub_type = 180,
		desc = "ホーネット(META)を編成した艦隊でLv55+の敵艦隊を撃破する",
		id = 100403,
		target_num = 1,
		target_id = "55"
	},
	[100404] = {
		target_id_2 = "970706",
		sub_type = 180,
		desc = "ホーネット(META)を編成した艦隊でLv80+の敵艦隊を撃破する",
		id = 100404,
		target_num = 1,
		target_id = "80"
	},
	[100405] = {
		target_id_2 = "970706",
		sub_type = 180,
		desc = "ホーネット(META)を編成した艦隊でLv100+の敵艦隊を撃破する",
		id = 100405,
		target_num = 1,
		target_id = "100"
	},
	[100411] = {
		target_id_2 = "970509",
		sub_type = 180,
		desc = "ネバダ(META)を編成した艦隊で1回戦闘を勝利する",
		id = 100411,
		target_num = 1,
		target_id = "0"
	},
	[100412] = {
		target_id_2 = "970509",
		sub_type = 180,
		desc = "ネバダ(META)を編成した艦隊でLv30+の敵艦隊を撃破する",
		id = 100412,
		target_num = 1,
		target_id = "30"
	},
	[100413] = {
		target_id_2 = "970509",
		sub_type = 180,
		desc = "ネバダ(META)を編成した艦隊でLv55+の敵艦隊を撃破する",
		id = 100413,
		target_num = 1,
		target_id = "55"
	},
	[100414] = {
		target_id_2 = "970509",
		sub_type = 180,
		desc = "ネバダ(META)を編成した艦隊でLv80+の敵艦隊を撃破する",
		id = 100414,
		target_num = 1,
		target_id = "80"
	},
	[100415] = {
		target_id_2 = "970509",
		sub_type = 180,
		desc = "ネバダ(META)を編成した艦隊でLv100+の敵艦隊を撃破する",
		id = 100415,
		target_num = 1,
		target_id = "100"
	},
	[100421] = {
		target_id_2 = "970107",
		sub_type = 180,
		desc = "グレンヴィル(META)を編成した艦隊で1回戦闘を勝利する",
		id = 100421,
		target_num = 1,
		target_id = "0"
	},
	[100422] = {
		target_id_2 = "970107",
		sub_type = 180,
		desc = "グレンヴィル(META)を編成した艦隊でLv30+の敵艦隊を撃破する",
		id = 100422,
		target_num = 1,
		target_id = "30"
	},
	[100423] = {
		target_id_2 = "970107",
		sub_type = 180,
		desc = "グレンヴィル(META)を編成した艦隊でLv55+の敵艦隊を撃破する",
		id = 100423,
		target_num = 1,
		target_id = "55"
	},
	[100424] = {
		target_id_2 = "970107",
		sub_type = 180,
		desc = "グレンヴィル(META)を編成した艦隊でLv80+の敵艦隊を撃破する",
		id = 100424,
		target_num = 1,
		target_id = "80"
	},
	[100425] = {
		target_id_2 = "970107",
		sub_type = 180,
		desc = "グレンヴィル(META)を編成した艦隊でLv100+の敵艦隊を撃破する",
		id = 100425,
		target_num = 1,
		target_id = "100"
	},
	[100431] = {
		target_id_2 = "970707",
		sub_type = 180,
		desc = "グロリアス(META)を編成した艦隊で1回戦闘を勝利する",
		id = 100431,
		target_num = 1,
		target_id = "0"
	},
	[100432] = {
		target_id_2 = "970707",
		sub_type = 180,
		desc = "グロリアス(META)を編成した艦隊でLv30+の敵艦隊を撃破する",
		id = 100432,
		target_num = 1,
		target_id = "30"
	},
	[100433] = {
		target_id_2 = "970707",
		sub_type = 180,
		desc = "グロリアス(META)を編成した艦隊でLv55+の敵艦隊を撃破する",
		id = 100433,
		target_num = 1,
		target_id = "55"
	},
	[100434] = {
		target_id_2 = "970707",
		sub_type = 180,
		desc = "グロリアス(META)を編成した艦隊でLv80+の敵艦隊を撃破する",
		id = 100434,
		target_num = 1,
		target_id = "80"
	},
	[100435] = {
		target_id_2 = "970707",
		sub_type = 180,
		desc = "グロリアス(META)を編成した艦隊でLv100+の敵艦隊を撃破する",
		id = 100435,
		target_num = 1,
		target_id = "100"
	},
	[100441] = {
		target_id_2 = "970108",
		sub_type = 180,
		desc = "江風(META)を編成した艦隊で1回戦闘を勝利する",
		id = 100441,
		target_num = 1,
		target_id = "0"
	},
	[100442] = {
		target_id_2 = "970108",
		sub_type = 180,
		desc = "江風(META)を編成した艦隊でLv30+の敵艦隊を撃破する",
		id = 100442,
		target_num = 1,
		target_id = "30"
	},
	[100443] = {
		target_id_2 = "970108",
		sub_type = 180,
		desc = "江風(META)を編成した艦隊でLv55+の敵艦隊を撃破する",
		id = 100443,
		target_num = 1,
		target_id = "55"
	},
	[100444] = {
		target_id_2 = "970108",
		sub_type = 180,
		desc = "江風(META)を編成した艦隊でLv80+の敵艦隊を撃破する",
		id = 100444,
		target_num = 1,
		target_id = "80"
	},
	[100445] = {
		target_id_2 = "970108",
		sub_type = 180,
		desc = "江風(META)を編成した艦隊でLv100+の敵艦隊を撃破する",
		id = 100445,
		target_num = 1,
		target_id = "100"
	},
	[100451] = {
		target_id_2 = "970406",
		sub_type = 180,
		desc = "ダンケルク(META)を編成した艦隊で1回戦闘を勝利する",
		id = 100451,
		target_num = 1,
		target_id = "0"
	},
	[100452] = {
		target_id_2 = "970406",
		sub_type = 180,
		desc = "ダンケルク(META)を編成した艦隊でLv30+の敵艦隊を撃破する",
		id = 100452,
		target_num = 1,
		target_id = "30"
	},
	[100453] = {
		target_id_2 = "970406",
		sub_type = 180,
		desc = "ダンケルク(META)を編成した艦隊でLv55+の敵艦隊を撃破する",
		id = 100453,
		target_num = 1,
		target_id = "55"
	},
	[100454] = {
		target_id_2 = "970406",
		sub_type = 180,
		desc = "ダンケルク(META)を編成した艦隊でLv80+の敵艦隊を撃破する",
		id = 100454,
		target_num = 1,
		target_id = "80"
	},
	[100455] = {
		target_id_2 = "970406",
		sub_type = 180,
		desc = "ダンケルク(META)を編成した艦隊でLv100+の敵艦隊を撃破する",
		id = 100455,
		target_num = 1,
		target_id = "100"
	},
	[100461] = {
		target_id_2 = "970109",
		sub_type = 180,
		desc = "夕立(META)を編成した艦隊で1回戦闘を勝利する",
		id = 100461,
		target_num = 1,
		target_id = "0"
	},
	[100462] = {
		target_id_2 = "970109",
		sub_type = 180,
		desc = "夕立(META)を編成した艦隊でLv30+の敵艦隊を撃破する",
		id = 100462,
		target_num = 1,
		target_id = "30"
	},
	[100463] = {
		target_id_2 = "970109",
		sub_type = 180,
		desc = "夕立(META)を編成した艦隊でLv55+の敵艦隊を撃破する",
		id = 100463,
		target_num = 1,
		target_id = "55"
	},
	[100464] = {
		target_id_2 = "970109",
		sub_type = 180,
		desc = "夕立(META)を編成した艦隊でLv80+の敵艦隊を撃破する",
		id = 100464,
		target_num = 1,
		target_id = "80"
	},
	[100465] = {
		target_id_2 = "970109",
		sub_type = 180,
		desc = "夕立(META)を編成した艦隊でLv100+の敵艦隊を撃破する",
		id = 100465,
		target_num = 1,
		target_id = "100"
	},
	[100471] = {
		target_id_2 = "970110",
		sub_type = 180,
		desc = "デューイ(META)を編成した艦隊で1回戦闘を勝利する",
		id = 100471,
		target_num = 1,
		target_id = "0"
	},
	[100472] = {
		target_id_2 = "970110",
		sub_type = 180,
		desc = "デューイ(META)を編成した艦隊でLv30+の敵艦隊を撃破する",
		id = 100472,
		target_num = 1,
		target_id = "30"
	},
	[100473] = {
		target_id_2 = "970110",
		sub_type = 180,
		desc = "デューイ(META)を編成した艦隊でLv55+の敵艦隊を撃破する",
		id = 100473,
		target_num = 1,
		target_id = "55"
	},
	[100474] = {
		target_id_2 = "970110",
		sub_type = 180,
		desc = "デューイ(META)を編成した艦隊でLv80+の敵艦隊を撃破する",
		id = 100474,
		target_num = 1,
		target_id = "80"
	},
	[100475] = {
		target_id_2 = "970110",
		sub_type = 180,
		desc = "デューイ(META)を編成した艦隊でLv100+の敵艦隊を撃破する",
		id = 100475,
		target_num = 1,
		target_id = "100"
	},
	[100481] = {
		target_id_2 = "970208",
		sub_type = 180,
		desc = "ボイシ(META)を編成した艦隊で1回戦闘を勝利する",
		id = 100481,
		target_num = 1,
		target_id = "0"
	},
	[100482] = {
		target_id_2 = "970208",
		sub_type = 180,
		desc = "ボイシ(META)を編成した艦隊でLv30+の敵艦隊を撃破する",
		id = 100482,
		target_num = 1,
		target_id = "30"
	},
	[100483] = {
		target_id_2 = "970208",
		sub_type = 180,
		desc = "ボイシ(META)を編成した艦隊でLv55+の敵艦隊を撃破する",
		id = 100483,
		target_num = 1,
		target_id = "55"
	},
	[100484] = {
		target_id_2 = "970208",
		sub_type = 180,
		desc = "ボイシ(META)を編成した艦隊でLv80+の敵艦隊を撃破する",
		id = 100484,
		target_num = 1,
		target_id = "80"
	},
	[100485] = {
		target_id_2 = "970208",
		sub_type = 180,
		desc = "ボイシ(META)を編成した艦隊でLv100+の敵艦隊を撃破する",
		id = 100485,
		target_num = 1,
		target_id = "100"
	},
	[100491] = {
		target_id_2 = "970708",
		sub_type = 180,
		desc = "ヨークタウン(META)を編成した艦隊で1回戦闘を勝利する",
		id = 100491,
		target_num = 1,
		target_id = "0"
	},
	[100492] = {
		target_id_2 = "970708",
		sub_type = 180,
		desc = "ヨークタウン(META)を編成した艦隊でLv30+の敵艦隊を撃破する",
		id = 100492,
		target_num = 1,
		target_id = "30"
	},
	[100493] = {
		target_id_2 = "970708",
		sub_type = 180,
		desc = "ヨークタウン(META)を編成した艦隊でLv55+の敵艦隊を撃破する",
		id = 100493,
		target_num = 1,
		target_id = "55"
	},
	[100494] = {
		target_id_2 = "970708",
		sub_type = 180,
		desc = "ヨークタウン(META)を編成した艦隊でLv80+の敵艦隊を撃破する",
		id = 100494,
		target_num = 1,
		target_id = "80"
	},
	[100495] = {
		target_id_2 = "970708",
		sub_type = 180,
		desc = "ヨークタウン(META)を編成した艦隊でLv100+の敵艦隊を撃破する",
		id = 100495,
		target_num = 1,
		target_id = "100"
	},
	[100501] = {
		target_id_2 = "970209",
		sub_type = 180,
		desc = "クリーブランド(META)を編成した艦隊で1回戦闘を勝利する",
		id = 100501,
		target_num = 1,
		target_id = "0"
	},
	[100502] = {
		target_id_2 = "970209",
		sub_type = 180,
		desc = "クリーブランド(META)を編成した艦隊でLv30+の敵艦隊を撃破する",
		id = 100502,
		target_num = 1,
		target_id = "30"
	},
	[100503] = {
		target_id_2 = "970209",
		sub_type = 180,
		desc = "クリーブランド(META)を編成した艦隊でLv55+の敵艦隊を撃破する",
		id = 100503,
		target_num = 1,
		target_id = "55"
	},
	[100504] = {
		target_id_2 = "970209",
		sub_type = 180,
		desc = "クリーブランド(META)を編成した艦隊でLv80+の敵艦隊を撃破する",
		id = 100504,
		target_num = 1,
		target_id = "80"
	},
	[100505] = {
		target_id_2 = "970209",
		sub_type = 180,
		desc = "クリーブランド(META)を編成した艦隊でLv100+の敵艦隊を撃破する",
		id = 100505,
		target_num = 1,
		target_id = "100"
	},
	[100511] = {
		target_id_2 = "970111",
		sub_type = 180,
		desc = "カラビニエーレ(META)を編成した艦隊で1回戦闘を勝利する",
		id = 100511,
		target_num = 1,
		target_id = "0"
	},
	[100512] = {
		target_id_2 = "970111",
		sub_type = 180,
		desc = "カラビニエーレ(META)を編成した艦隊でLv30+の敵艦隊を撃破する",
		id = 100512,
		target_num = 1,
		target_id = "30"
	},
	[100513] = {
		target_id_2 = "970111",
		sub_type = 180,
		desc = "カラビニエーレ(META)を編成した艦隊でLv55+の敵艦隊を撃破する",
		id = 100513,
		target_num = 1,
		target_id = "55"
	},
	[100514] = {
		target_id_2 = "970111",
		sub_type = 180,
		desc = "カラビニエーレ(META)を編成した艦隊でLv80+の敵艦隊を撃破する",
		id = 100514,
		target_num = 1,
		target_id = "80"
	},
	[100515] = {
		target_id_2 = "970111",
		sub_type = 180,
		desc = "カラビニエーレ(META)を編成した艦隊でLv100+の敵艦隊を撃破する",
		id = 100515,
		target_num = 1,
		target_id = "100"
	},
	[200001] = {
		target_id_2 = "970101",
		sub_type = 302,
		desc = "セイレーン作戦でハンター(META)を含めた艦隊で1回勝利する",
		id = 200001,
		target_num = 1,
		target_id = "0"
	},
	[200002] = {
		target_id_2 = "970101",
		sub_type = 302,
		desc = "セイレーン作戦でハンター(META)を含めた艦隊でLv70+の敵を撃破",
		id = 200002,
		target_num = 1,
		target_id = "70"
	},
	[200003] = {
		target_id_2 = "970101",
		sub_type = 302,
		desc = "セイレーン作戦でハンター(META)を含めた艦隊でLv90+の敵を撃破",
		id = 200003,
		target_num = 1,
		target_id = "90"
	},
	[200004] = {
		target_id_2 = "970101",
		sub_type = 302,
		desc = "セイレーン作戦でハンター(META)を含めた艦隊でLv100+の敵を撃破",
		id = 200004,
		target_num = 1,
		target_id = "100"
	},
	[200021] = {
		target_id_2 = "970102",
		sub_type = 302,
		desc = "セイレーン作戦でフォーチュン(META)を含めた艦隊で1回勝利する",
		id = 200021,
		target_num = 1,
		target_id = "0"
	},
	[200022] = {
		target_id_2 = "970102",
		sub_type = 302,
		desc = "セイレーン作戦でフォーチュン(META)を含めた艦隊でLv70+の敵を撃破",
		id = 200022,
		target_num = 1,
		target_id = "70"
	},
	[200023] = {
		target_id_2 = "970102",
		sub_type = 302,
		desc = "セイレーン作戦でフォーチュン(META)を含めた艦隊でLv90+の敵を撃破",
		id = 200023,
		target_num = 1,
		target_id = "90"
	},
	[200024] = {
		target_id_2 = "970102",
		sub_type = 302,
		desc = "セイレーン作戦でフォーチュン(META)を含めた艦隊でLv100+の敵を撃破",
		id = 200024,
		target_num = 1,
		target_id = "100"
	},
	[200031] = {
		target_id_2 = "970503",
		sub_type = 302,
		desc = "セイレーン作戦でアリゾナ(META)を含めた艦隊で1回勝利する",
		id = 200031,
		target_num = 1,
		target_id = "0"
	},
	[200032] = {
		target_id_2 = "970503",
		sub_type = 302,
		desc = "セイレーン作戦でアリゾナ(META)を含めた艦隊でLv70+の敵を撃破",
		id = 200032,
		target_num = 1,
		target_id = "70"
	},
	[200033] = {
		target_id_2 = "970503",
		sub_type = 302,
		desc = "セイレーン作戦でアリゾナ(META)を含めた艦隊でLv90+の敵を撃破",
		id = 200033,
		target_num = 1,
		target_id = "90"
	},
	[200034] = {
		target_id_2 = "970503",
		sub_type = 302,
		desc = "セイレーン作戦でアリゾナ(META)を含めた艦隊でLv100+の敵を撃破",
		id = 200034,
		target_num = 1,
		target_id = "100"
	},
	[200041] = {
		target_id_2 = "970203",
		sub_type = 302,
		desc = "セイレーン作戦でシェフィールド(META)を含めた艦隊で1回勝利する",
		id = 200041,
		target_num = 1,
		target_id = "0"
	},
	[200042] = {
		target_id_2 = "970203",
		sub_type = 302,
		desc = "セイレーン作戦でシェフィールド(META)を含めた艦隊でLv70+の敵を撃破",
		id = 200042,
		target_num = 1,
		target_id = "70"
	},
	[200043] = {
		target_id_2 = "970203",
		sub_type = 302,
		desc = "セイレーン作戦でシェフィールド(META)を含めた艦隊でLv90+の敵を撃破",
		id = 200043,
		target_num = 1,
		target_id = "90"
	},
	[200044] = {
		target_id_2 = "970203",
		sub_type = 302,
		desc = "セイレーン作戦でシェフィールド(META)を含めた艦隊でLv100+の敵を撃破",
		id = 200044,
		target_num = 1,
		target_id = "100"
	},
	[200051] = {
		target_id_2 = "970504",
		sub_type = 302,
		desc = "セイレーン作戦でクイーン・エリザベス(META)を含めた艦隊で1回勝利する",
		id = 200051,
		target_num = 1,
		target_id = "0"
	},
	[200052] = {
		target_id_2 = "970504",
		sub_type = 302,
		desc = "セイレーン作戦でクイーン・エリザベス(META)を含めた艦隊でLv70+の敵を撃破",
		id = 200052,
		target_num = 1,
		target_id = "70"
	},
	[200053] = {
		target_id_2 = "970504",
		sub_type = 302,
		desc = "セイレーン作戦でクイーン・エリザベス(META)を含めた艦隊でLv90+の敵を撃破",
		id = 200053,
		target_num = 1,
		target_id = "90"
	},
	[200054] = {
		target_id_2 = "970504",
		sub_type = 302,
		desc = "セイレーン作戦でクイーン・エリザベス(META)を含めた艦隊でLv100+の敵を撃破",
		id = 200054,
		target_num = 1,
		target_id = "100"
	},
	[200061] = {
		target_id_2 = "970204",
		sub_type = 302,
		desc = "セイレーン作戦でラ·ガリソニエール(META)を含めた艦隊で1回勝利する",
		id = 200061,
		target_num = 1,
		target_id = "0"
	},
	[200062] = {
		target_id_2 = "970204",
		sub_type = 302,
		desc = "セイレーン作戦でラ·ガリソニエール(META)を含めた艦隊でLv70+の敵を撃破",
		id = 200062,
		target_num = 1,
		target_id = "70"
	},
	[200063] = {
		target_id_2 = "970204",
		sub_type = 302,
		desc = "セイレーン作戦でラ·ガリソニエール(META)を含めた艦隊でLv90+の敵を撃破",
		id = 200063,
		target_num = 1,
		target_id = "90"
	},
	[200064] = {
		target_id_2 = "970204",
		sub_type = 302,
		desc = "セイレーン作戦でラ·ガリソニエール(META)を含めた艦隊でLv100+の敵を撃破",
		id = 200064,
		target_num = 1,
		target_id = "100"
	},
	[200071] = {
		target_id_2 = "970801",
		sub_type = 302,
		desc = "セイレーン作戦でU-556(META)を含めた艦隊で1回勝利する",
		id = 200071,
		target_num = 1,
		target_id = "0"
	},
	[200072] = {
		target_id_2 = "970801",
		sub_type = 302,
		desc = "セイレーン作戦でU-556(META)を含めた艦隊でLv70+の敵を撃破",
		id = 200072,
		target_num = 1,
		target_id = "70"
	},
	[200073] = {
		target_id_2 = "970801",
		sub_type = 302,
		desc = "セイレーン作戦でU-556(META)を含めた艦隊でLv90+の敵を撃破",
		id = 200073,
		target_num = 1,
		target_id = "90"
	},
	[200074] = {
		target_id_2 = "970801",
		sub_type = 302,
		desc = "セイレーン作戦でU-556(META)を含めた艦隊でLv100+の敵を撃破",
		id = 200074,
		target_num = 1,
		target_id = "100"
	},
	[200081] = {
		target_id_2 = "971201",
		sub_type = 302,
		desc = "セイレーン作戦でヴェスタル(META)を含めた艦隊で1回勝利する",
		id = 200081,
		target_num = 1,
		target_id = "0"
	},
	[200082] = {
		target_id_2 = "971201",
		sub_type = 302,
		desc = "セイレーン作戦でヴェスタル(META)を含めた艦隊でLv70+の敵を撃破",
		id = 200082,
		target_num = 1,
		target_id = "70"
	},
	[200083] = {
		target_id_2 = "971201",
		sub_type = 302,
		desc = "セイレーン作戦でヴェスタル(META)を含めた艦隊でLv90+の敵を撃破",
		id = 200083,
		target_num = 1,
		target_id = "90"
	},
	[200084] = {
		target_id_2 = "971201",
		sub_type = 302,
		desc = "セイレーン作戦でヴェスタル(META)を含めた艦隊でLv100+の敵を撃破",
		id = 200084,
		target_num = 1,
		target_id = "100"
	},
	[200091] = {
		target_id_2 = "970302",
		sub_type = 302,
		desc = "セイレーン作戦でアルジェリー(META)を含めた艦隊で1回勝利する",
		id = 200091,
		target_num = 1,
		target_id = "0"
	},
	[200092] = {
		target_id_2 = "970302",
		sub_type = 302,
		desc = "セイレーン作戦でアルジェリー(META)を含めた艦隊でLv70+の敵を撃破",
		id = 200092,
		target_num = 1,
		target_id = "70"
	},
	[200093] = {
		target_id_2 = "970302",
		sub_type = 302,
		desc = "セイレーン作戦でアルジェリー(META)を含めた艦隊でLv90+の敵を撃破",
		id = 200093,
		target_num = 1,
		target_id = "90"
	},
	[200094] = {
		target_id_2 = "970302",
		sub_type = 302,
		desc = "セイレーン作戦でアルジェリー(META)を含めた艦隊でLv100+の敵を撃破",
		id = 200094,
		target_num = 1,
		target_id = "100"
	},
	[200101] = {
		target_id_2 = "970103",
		sub_type = 302,
		desc = "セイレーン作戦で旗風(META)を含めた艦隊で1回勝利する",
		id = 200101,
		target_num = 1,
		target_id = "0"
	},
	[200102] = {
		target_id_2 = "970103",
		sub_type = 302,
		desc = "セイレーン作戦で旗風(META)を含めた艦隊でLv70+の敵を撃破",
		id = 200102,
		target_num = 1,
		target_id = "70"
	},
	[200103] = {
		target_id_2 = "970103",
		sub_type = 302,
		desc = "セイレーン作戦で旗風(META)を含めた艦隊でLv90+の敵を撃破",
		id = 200103,
		target_num = 1,
		target_id = "90"
	},
	[200104] = {
		target_id_2 = "970103",
		sub_type = 302,
		desc = "セイレーン作戦で旗風(META)を含めた艦隊でLv100+の敵を撃破",
		id = 200104,
		target_num = 1,
		target_id = "100"
	},
	[200111] = {
		target_id_2 = "970205",
		sub_type = 302,
		desc = "セイレーン作戦で神通(META)を含めた艦隊で1回勝利する",
		id = 200111,
		target_num = 1,
		target_id = "0"
	},
	[200112] = {
		target_id_2 = "970205",
		sub_type = 302,
		desc = "セイレーン作戦で神通(META)を含めた艦隊でLv70+の敵を撃破",
		id = 200112,
		target_num = 1,
		target_id = "70"
	},
	[200113] = {
		target_id_2 = "970205",
		sub_type = 302,
		desc = "セイレーン作戦で神通(META)を含めた艦隊でLv90+の敵を撃破",
		id = 200113,
		target_num = 1,
		target_id = "90"
	},
	[200114] = {
		target_id_2 = "970205",
		sub_type = 302,
		desc = "セイレーン作戦で神通(META)を含めた艦隊でLv100+の敵を撃破",
		id = 200114,
		target_num = 1,
		target_id = "100"
	},
	[200121] = {
		target_id_2 = "970603",
		sub_type = 302,
		desc = "セイレーン作戦でプリンストン(META)を含めた艦隊で1回勝利する",
		id = 200121,
		target_num = 1,
		target_id = "0"
	},
	[200122] = {
		target_id_2 = "970603",
		sub_type = 302,
		desc = "セイレーン作戦でプリンストン(META)を含めた艦隊でLv70+の敵を撃破",
		id = 200122,
		target_num = 1,
		target_id = "70"
	},
	[200123] = {
		target_id_2 = "970603",
		sub_type = 302,
		desc = "セイレーン作戦でプリンストン(META)を含めた艦隊でLv90+の敵を撃破",
		id = 200123,
		target_num = 1,
		target_id = "90"
	},
	[200124] = {
		target_id_2 = "970603",
		sub_type = 302,
		desc = "セイレーン作戦でプリンストン(META)を含めた艦隊でLv100+の敵を撃破",
		id = 200124,
		target_num = 1,
		target_id = "100"
	},
	[200131] = {
		target_id_2 = "971301",
		sub_type = 302,
		desc = "セイレーン作戦でエレバス(META)を含めた艦隊で1回勝利する",
		id = 200131,
		target_num = 1,
		target_id = "0"
	},
	[200132] = {
		target_id_2 = "971301",
		sub_type = 302,
		desc = "セイレーン作戦でエレバス(META)を含めた艦隊でLv70+の敵を撃破",
		id = 200132,
		target_num = 1,
		target_id = "70"
	},
	[200133] = {
		target_id_2 = "971301",
		sub_type = 302,
		desc = "セイレーン作戦でエレバス(META)を含めた艦隊でLv90+の敵を撃破",
		id = 200133,
		target_num = 1,
		target_id = "90"
	},
	[200134] = {
		target_id_2 = "971301",
		sub_type = 302,
		desc = "セイレーン作戦でエレバス(META)を含めた艦隊でLv100+の敵を撃破",
		id = 200134,
		target_num = 1,
		target_id = "100"
	},
	[200141] = {
		target_id_2 = "970206",
		sub_type = 302,
		desc = "セイレーン作戦でキーロフ(META)を含めた艦隊で1回勝利する",
		id = 200141,
		target_num = 1,
		target_id = "0"
	},
	[200142] = {
		target_id_2 = "970206",
		sub_type = 302,
		desc = "セイレーン作戦でキーロフ(META)を含めた艦隊でLv70+の敵を撃破",
		id = 200142,
		target_num = 1,
		target_id = "70"
	},
	[200143] = {
		target_id_2 = "970206",
		sub_type = 302,
		desc = "セイレーン作戦でキーロフ(META)を含めた艦隊でLv90+の敵を撃破",
		id = 200143,
		target_num = 1,
		target_id = "90"
	},
	[200144] = {
		target_id_2 = "970206",
		sub_type = 302,
		desc = "セイレーン作戦でキーロフ(META)を含めた艦隊でLv100+の敵を撃破",
		id = 200144,
		target_num = 1,
		target_id = "100"
	},
	[200151] = {
		target_id_2 = "970104",
		sub_type = 302,
		desc = "セイレーン作戦でキンバリー(META)を含めた艦隊で1回勝利する",
		id = 200151,
		target_num = 1,
		target_id = "0"
	},
	[200152] = {
		target_id_2 = "970104",
		sub_type = 302,
		desc = "セイレーン作戦でキンバリー(META)を含めた艦隊でLv70+の敵を撃破",
		id = 200152,
		target_num = 1,
		target_id = "70"
	},
	[200153] = {
		target_id_2 = "970104",
		sub_type = 302,
		desc = "セイレーン作戦でキンバリー(META)を含めた艦隊でLv90+の敵を撃破",
		id = 200153,
		target_num = 1,
		target_id = "90"
	},
	[200154] = {
		target_id_2 = "970104",
		sub_type = 302,
		desc = "セイレーン作戦でキンバリー(META)を含めた艦隊でLv100+の敵を撃破",
		id = 200154,
		target_num = 1,
		target_id = "100"
	},
	[200161] = {
		target_id_2 = "970207",
		sub_type = 302,
		desc = "セイレーン作戦でパーミャチ・メルクーリヤ(META)を含めた艦隊で1回勝利する",
		id = 200161,
		target_num = 1,
		target_id = "0"
	},
	[200162] = {
		target_id_2 = "970207",
		sub_type = 302,
		desc = "セイレーン作戦でパーミャチ・メルクーリヤ(META)を含めた艦隊でLv70+の敵を撃破",
		id = 200162,
		target_num = 1,
		target_id = "70"
	},
	[200163] = {
		target_id_2 = "970207",
		sub_type = 302,
		desc = "セイレーン作戦でパーミャチ・メルクーリヤ(META)を含めた艦隊でLv90+の敵を撃破",
		id = 200163,
		target_num = 1,
		target_id = "90"
	},
	[200164] = {
		target_id_2 = "970207",
		sub_type = 302,
		desc = "セイレーン作戦でパーミャチ・メルクーリヤ(META)を含めた艦隊でLv100+の敵を撃破",
		id = 200164,
		target_num = 1,
		target_id = "100"
	},
	[200171] = {
		target_id_2 = "970505",
		sub_type = 302,
		desc = "セイレーン作戦でロドニー(META)を含めた艦隊で1回勝利する",
		id = 200171,
		target_num = 1,
		target_id = "0"
	},
	[200172] = {
		target_id_2 = "970505",
		sub_type = 302,
		desc = "セイレーン作戦でロドニー(META)を含めた艦隊でLv70+の敵を撃破",
		id = 200172,
		target_num = 1,
		target_id = "70"
	},
	[200173] = {
		target_id_2 = "970505",
		sub_type = 302,
		desc = "セイレーン作戦でロドニー(META)を含めた艦隊でLv90+の敵を撃破",
		id = 200173,
		target_num = 1,
		target_id = "90"
	},
	[200174] = {
		target_id_2 = "970505",
		sub_type = 302,
		desc = "セイレーン作戦でロドニー(META)を含めた艦隊でLv100+の敵を撃破",
		id = 200174,
		target_num = 1,
		target_id = "100"
	},
	[200181] = {
		target_id_2 = "970105",
		sub_type = 302,
		desc = "セイレーン作戦でヴァンパイア(META)を含めた艦隊で1回勝利する",
		id = 200181,
		target_num = 1,
		target_id = "0"
	},
	[200182] = {
		target_id_2 = "970105",
		sub_type = 302,
		desc = "セイレーン作戦でヴァンパイア(META)を含めた艦隊でLv70+の敵を撃破",
		id = 200182,
		target_num = 1,
		target_id = "70"
	},
	[200183] = {
		target_id_2 = "970105",
		sub_type = 302,
		desc = "セイレーン作戦でヴァンパイア(META)を含めた艦隊でLv90+の敵を撃破",
		id = 200183,
		target_num = 1,
		target_id = "90"
	},
	[200184] = {
		target_id_2 = "970105",
		sub_type = 302,
		desc = "セイレーン作戦でヴァンパイア(META)を含めた艦隊でLv100+の敵を撃破",
		id = 200184,
		target_num = 1,
		target_id = "100"
	},
	[200191] = {
		target_id_2 = "970704",
		sub_type = 302,
		desc = "セイレーン作戦でベアルン(META)を含めた艦隊で1回勝利する",
		id = 200191,
		target_num = 1,
		target_id = "0"
	},
	[200192] = {
		target_id_2 = "970704",
		sub_type = 302,
		desc = "セイレーン作戦でベアルン(META)を含めた艦隊でLv70+の敵を撃破",
		id = 200192,
		target_num = 1,
		target_id = "70"
	},
	[200193] = {
		target_id_2 = "970704",
		sub_type = 302,
		desc = "セイレーン作戦でベアルン(META)を含めた艦隊でLv90+の敵を撃破",
		id = 200193,
		target_num = 1,
		target_id = "90"
	},
	[200194] = {
		target_id_2 = "970704",
		sub_type = 302,
		desc = "セイレーン作戦でベアルン(META)を含めた艦隊でLv100+の敵を撃破",
		id = 200194,
		target_num = 1,
		target_id = "100"
	},
	[200201] = {
		target_id_2 = "970303",
		sub_type = 302,
		desc = "セイレーン作戦でフォッシュ(META)を含めた艦隊で1回勝利する",
		id = 200201,
		target_num = 1,
		target_id = "0"
	},
	[200202] = {
		target_id_2 = "970303",
		sub_type = 302,
		desc = "セイレーン作戦でフォッシュ(META)を含めた艦隊でLv70+の敵を撃破",
		id = 200202,
		target_num = 1,
		target_id = "70"
	},
	[200203] = {
		target_id_2 = "970303",
		sub_type = 302,
		desc = "セイレーン作戦でフォッシュ(META)を含めた艦隊でLv90+の敵を撃破",
		id = 200203,
		target_num = 1,
		target_id = "90"
	},
	[200204] = {
		target_id_2 = "970303",
		sub_type = 302,
		desc = "セイレーン作戦でフォッシュ(META)を含めた艦隊でLv100+の敵を撃破",
		id = 200204,
		target_num = 1,
		target_id = "100"
	},
	[200211] = {
		target_id_2 = "970304",
		sub_type = 302,
		desc = "セイレーン作戦でウィチタ(META)を含めた艦隊で1回勝利する",
		id = 200211,
		target_num = 1,
		target_id = "0"
	},
	[200212] = {
		target_id_2 = "970304",
		sub_type = 302,
		desc = "セイレーン作戦でウィチタ(META)を含めた艦隊でLv70+の敵を撃破",
		id = 200212,
		target_num = 1,
		target_id = "70"
	},
	[200213] = {
		target_id_2 = "970304",
		sub_type = 302,
		desc = "セイレーン作戦でウィチタ(META)を含めた艦隊でLv90+の敵を撃破",
		id = 200213,
		target_num = 1,
		target_id = "90"
	},
	[200214] = {
		target_id_2 = "970304",
		sub_type = 302,
		desc = "セイレーン作戦でウィチタ(META)を含めた艦隊でLv100+の敵を撃破",
		id = 200214,
		target_num = 1,
		target_id = "100"
	},
	[200221] = {
		target_id_2 = "970106",
		sub_type = 302,
		desc = "セイレーン作戦で霞(META)を含めた艦隊で1回勝利する",
		id = 200221,
		target_num = 1,
		target_id = "0"
	},
	[200222] = {
		target_id_2 = "970106",
		sub_type = 302,
		desc = "セイレーン作戦で霞(META)を含めた艦隊でLv70+の敵を撃破",
		id = 200222,
		target_num = 1,
		target_id = "70"
	},
	[200223] = {
		target_id_2 = "970106",
		sub_type = 302,
		desc = "セイレーン作戦で霞(META)を含めた艦隊でLv90+の敵を撃破",
		id = 200223,
		target_num = 1,
		target_id = "90"
	},
	[200224] = {
		target_id_2 = "970106",
		sub_type = 302,
		desc = "セイレーン作戦で霞(META)を含めた艦隊でLv100+の敵を撃破",
		id = 200224,
		target_num = 1,
		target_id = "100"
	},
	[200231] = {
		target_id_2 = "970506",
		sub_type = 302,
		desc = "セイレーン作戦で長門(META)を含めた艦隊で1回勝利する",
		id = 200231,
		target_num = 1,
		target_id = "0"
	},
	[200232] = {
		target_id_2 = "970506",
		sub_type = 302,
		desc = "セイレーン作戦で長門(META)を含めた艦隊でLv70+の敵を撃破",
		id = 200232,
		target_num = 1,
		target_id = "70"
	},
	[200233] = {
		target_id_2 = "970506",
		sub_type = 302,
		desc = "セイレーン作戦で長門(META)を含めた艦隊でLv90+の敵を撃破",
		id = 200233,
		target_num = 1,
		target_id = "90"
	},
	[200234] = {
		target_id_2 = "970506",
		sub_type = 302,
		desc = "セイレーン作戦で長門(META)を含めた艦隊でLv100+の敵を撃破",
		id = 200234,
		target_num = 1,
		target_id = "100"
	},
	[200241] = {
		target_id_2 = "970405",
		sub_type = 302,
		desc = "セイレーン作戦で比叡(META)を含めた艦隊で1回勝利する",
		id = 200241,
		target_num = 1,
		target_id = "0"
	},
	[200242] = {
		target_id_2 = "970405",
		sub_type = 302,
		desc = "セイレーン作戦で比叡(META)を含めた艦隊でLv70+の敵を撃破",
		id = 200242,
		target_num = 1,
		target_id = "70"
	},
	[200243] = {
		target_id_2 = "970405",
		sub_type = 302,
		desc = "セイレーン作戦で比叡(META)を含めた艦隊でLv90+の敵を撃破",
		id = 200243,
		target_num = 1,
		target_id = "90"
	},
	[200244] = {
		target_id_2 = "970405",
		sub_type = 302,
		desc = "セイレーン作戦で比叡(META)を含めた艦隊でLv100+の敵を撃破",
		id = 200244,
		target_num = 1,
		target_id = "100"
	},
	[200251] = {
		target_id_2 = "970604",
		sub_type = 302,
		desc = "セイレーン作戦で鳳翔(META)を含めた艦隊で1回勝利する",
		id = 200251,
		target_num = 1,
		target_id = "0"
	},
	[200252] = {
		target_id_2 = "970604",
		sub_type = 302,
		desc = "セイレーン作戦で鳳翔(META)を含めた艦隊でLv70+の敵を撃破",
		id = 200252,
		target_num = 1,
		target_id = "70"
	},
	[200253] = {
		target_id_2 = "970604",
		sub_type = 302,
		desc = "セイレーン作戦で鳳翔(META)を含めた艦隊でLv90+の敵を撃破",
		id = 200253,
		target_num = 1,
		target_id = "90"
	},
	[200254] = {
		target_id_2 = "970604",
		sub_type = 302,
		desc = "セイレーン作戦で鳳翔(META)を含めた艦隊でLv100+の敵を撃破",
		id = 200254,
		target_num = 1,
		target_id = "100"
	},
	[200261] = {
		target_id_2 = "970507",
		sub_type = 302,
		desc = "セイレーン作戦でジュリオ・チェザーレ(META)を含む艦隊で1回戦闘に勝利する",
		id = 200261,
		target_num = 1,
		target_id = "0"
	},
	[200262] = {
		target_id_2 = "970507",
		sub_type = 302,
		desc = "<size=24>セイレーン作戦でジュリオ・チェザーレ(META)を含む艦隊でLV70+の敵を撃破する</size>",
		id = 200262,
		target_num = 1,
		target_id = "70"
	},
	[200263] = {
		target_id_2 = "970507",
		sub_type = 302,
		desc = "<size=24>セイレーン作戦でジュリオ・チェザーレ(META)を含む艦隊でLV90+の敵を撃破する</size>",
		id = 200263,
		target_num = 1,
		target_id = "90"
	},
	[200264] = {
		target_id_2 = "970507",
		sub_type = 302,
		desc = "<size=24>セイレーン作戦でジュリオ・チェザーレ(META)を含む艦隊でLV100+の敵を撃破する</size>",
		id = 200264,
		target_num = 1,
		target_id = "100"
	},
	[200271] = {
		target_id_2 = "970705",
		sub_type = 302,
		desc = "セイレーン作戦で大鳳(META)を含めた艦隊で1回勝利する",
		id = 200271,
		target_num = 1,
		target_id = "0"
	},
	[200272] = {
		target_id_2 = "970705",
		sub_type = 302,
		desc = "セイレーン作戦で大鳳(META)を含めた艦隊でLv70+の敵を撃破",
		id = 200272,
		target_num = 1,
		target_id = "70"
	},
	[200273] = {
		target_id_2 = "970705",
		sub_type = 302,
		desc = "セイレーン作戦で大鳳(META)を含めた艦隊でLv90+の敵を撃破",
		id = 200273,
		target_num = 1,
		target_id = "90"
	},
	[200274] = {
		target_id_2 = "970705",
		sub_type = 302,
		desc = "セイレーン作戦で大鳳(META)を含めた艦隊でLv100+の敵を撃破",
		id = 200274,
		target_num = 1,
		target_id = "100"
	},
	[200281] = {
		target_id_2 = "970305",
		sub_type = 302,
		desc = "セイレーン作戦でアドミラル・ヒッパー(META)を含めた艦隊で1回勝利する",
		id = 200281,
		target_num = 1,
		target_id = "0"
	},
	[200282] = {
		target_id_2 = "970305",
		sub_type = 302,
		desc = "セイレーン作戦でアドミラル・ヒッパー(META)を含めた艦隊でLv70+の敵を撃破",
		id = 200282,
		target_num = 1,
		target_id = "70"
	},
	[200283] = {
		target_id_2 = "970305",
		sub_type = 302,
		desc = "セイレーン作戦でアドミラル・ヒッパー(META)を含めた艦隊でLv90+の敵を撃破",
		id = 200283,
		target_num = 1,
		target_id = "90"
	},
	[200284] = {
		target_id_2 = "970305",
		sub_type = 302,
		desc = "セイレーン作戦でアドミラル・ヒッパー(META)を含めた艦隊でLv100+の敵を撃破",
		id = 200284,
		target_num = 1,
		target_id = "100"
	},
	[200291] = {
		target_id_2 = "970306",
		sub_type = 302,
		desc = "セイレーン作戦でボルツァーノ(META)を含めた艦隊で1回勝利する",
		id = 200291,
		target_num = 1,
		target_id = "0"
	},
	[200292] = {
		target_id_2 = "970306",
		sub_type = 302,
		desc = "セイレーン作戦でボルツァーノ(META)を含めた艦隊でLv70+の敵を撃破",
		id = 200292,
		target_num = 1,
		target_id = "70"
	},
	[200293] = {
		target_id_2 = "970306",
		sub_type = 302,
		desc = "セイレーン作戦でボルツァーノ(META)を含めた艦隊でLv90+の敵を撃破",
		id = 200293,
		target_num = 1,
		target_id = "90"
	},
	[200294] = {
		target_id_2 = "970306",
		sub_type = 302,
		desc = "セイレーン作戦でボルツァーノ(META)を含めた艦隊でLv100+の敵を撃破",
		id = 200294,
		target_num = 1,
		target_id = "100"
	},
	[200301] = {
		target_id_2 = "970508",
		sub_type = 302,
		desc = "セイレーン作戦でアンドレア・ドーリア(META)を含めた艦隊で1回勝利する",
		id = 200301,
		target_num = 1,
		target_id = "0"
	},
	[200302] = {
		target_id_2 = "970508",
		sub_type = 302,
		desc = "セイレーン作戦でアンドレア・ドーリア(META)を含めた艦隊でLv70+の敵を撃破",
		id = 200302,
		target_num = 1,
		target_id = "70"
	},
	[200303] = {
		target_id_2 = "970508",
		sub_type = 302,
		desc = "セイレーン作戦でアンドレア・ドーリア(META)を含めた艦隊でLv90+の敵を撃破",
		id = 200303,
		target_num = 1,
		target_id = "90"
	},
	[200304] = {
		target_id_2 = "970508",
		sub_type = 302,
		desc = "セイレーン作戦でアンドレア・ドーリア(META)を含めた艦隊でLv100+の敵を撃破",
		id = 200304,
		target_num = 1,
		target_id = "100"
	},
	[200311] = {
		target_id_2 = "970706",
		sub_type = 302,
		desc = "セイレーン作戦でホーネット(META)を含めた艦隊で1回勝利する",
		id = 200311,
		target_num = 1,
		target_id = "0"
	},
	[200312] = {
		target_id_2 = "970706",
		sub_type = 302,
		desc = "セイレーン作戦でホーネット(META)を含めた艦隊でLv70+の敵を撃破",
		id = 200312,
		target_num = 1,
		target_id = "70"
	},
	[200313] = {
		target_id_2 = "970706",
		sub_type = 302,
		desc = "セイレーン作戦でホーネット(META)を含めた艦隊でLv90+の敵を撃破",
		id = 200313,
		target_num = 1,
		target_id = "90"
	},
	[200314] = {
		target_id_2 = "970706",
		sub_type = 302,
		desc = "セイレーン作戦でホーネット(META)を含めた艦隊でLv100+の敵を撃破",
		id = 200314,
		target_num = 1,
		target_id = "100"
	},
	[200321] = {
		target_id_2 = "970509",
		sub_type = 302,
		desc = "セイレーン作戦でネバダ(META)を含めた艦隊で1回勝利する",
		id = 200321,
		target_num = 1,
		target_id = "0"
	},
	[200322] = {
		target_id_2 = "970509",
		sub_type = 302,
		desc = "セイレーン作戦でネバダ(META)を含めた艦隊でLv70+の敵を撃破",
		id = 200322,
		target_num = 1,
		target_id = "70"
	},
	[200323] = {
		target_id_2 = "970509",
		sub_type = 302,
		desc = "セイレーン作戦でネバダ(META)を含めた艦隊でLv90+の敵を撃破",
		id = 200323,
		target_num = 1,
		target_id = "90"
	},
	[200324] = {
		target_id_2 = "970509",
		sub_type = 302,
		desc = "セイレーン作戦でネバダ(META)を含めた艦隊でLv100+の敵を撃破",
		id = 200324,
		target_num = 1,
		target_id = "100"
	},
	[200331] = {
		target_id_2 = "970107",
		sub_type = 302,
		desc = "セイレーン作戦でグレンヴィル(META)を含めた艦隊で1回勝利する",
		id = 200331,
		target_num = 1,
		target_id = "0"
	},
	[200332] = {
		target_id_2 = "970107",
		sub_type = 302,
		desc = "セイレーン作戦でグレンヴィル(META)を含めた艦隊でLv70+の敵を撃破",
		id = 200332,
		target_num = 1,
		target_id = "70"
	},
	[200333] = {
		target_id_2 = "970107",
		sub_type = 302,
		desc = "セイレーン作戦でグレンヴィル(META)を含めた艦隊でLv90+の敵を撃破",
		id = 200333,
		target_num = 1,
		target_id = "90"
	},
	[200334] = {
		target_id_2 = "970107",
		sub_type = 302,
		desc = "セイレーン作戦でグレンヴィル(META)を含めた艦隊でLv100+の敵を撃破",
		id = 200334,
		target_num = 1,
		target_id = "100"
	},
	[200341] = {
		target_id_2 = "970707",
		sub_type = 302,
		desc = "セイレーン作戦でグロリアス(META)を含めた艦隊で1回勝利する",
		id = 200341,
		target_num = 1,
		target_id = "0"
	},
	[200342] = {
		target_id_2 = "970707",
		sub_type = 302,
		desc = "セイレーン作戦でグロリアス(META)を含めた艦隊でLv70+の敵を撃破",
		id = 200342,
		target_num = 1,
		target_id = "70"
	},
	[200343] = {
		target_id_2 = "970707",
		sub_type = 302,
		desc = "セイレーン作戦でグロリアス(META)を含めた艦隊でLv90+の敵を撃破",
		id = 200343,
		target_num = 1,
		target_id = "90"
	},
	[200344] = {
		target_id_2 = "970707",
		sub_type = 302,
		desc = "セイレーン作戦でグロリアス(META)を含めた艦隊でLv100+の敵を撃破",
		id = 200344,
		target_num = 1,
		target_id = "100"
	},
	[200351] = {
		target_id_2 = "970108",
		sub_type = 302,
		desc = "セイレーン作戦で江風(META)を含めた艦隊で1回勝利する",
		id = 200351,
		target_num = 1,
		target_id = "0"
	},
	[200352] = {
		target_id_2 = "970108",
		sub_type = 302,
		desc = "セイレーン作戦で江風(META)を含めた艦隊でLv70+の敵を撃破",
		id = 200352,
		target_num = 1,
		target_id = "70"
	},
	[200353] = {
		target_id_2 = "970108",
		sub_type = 302,
		desc = "セイレーン作戦で江風(META)を含めた艦隊でLv90+の敵を撃破",
		id = 200353,
		target_num = 1,
		target_id = "90"
	},
	[200354] = {
		target_id_2 = "970108",
		sub_type = 302,
		desc = "セイレーン作戦で江風(META)を含めた艦隊でLv100+の敵を撃破",
		id = 200354,
		target_num = 1,
		target_id = "100"
	},
	[200361] = {
		target_id_2 = "970406",
		sub_type = 302,
		desc = "セイレーン作戦でダンケルク(META)を含めた艦隊で1回勝利する",
		id = 200361,
		target_num = 1,
		target_id = "0"
	},
	[200362] = {
		target_id_2 = "970406",
		sub_type = 302,
		desc = "セイレーン作戦でダンケルク(META)を含めた艦隊でLv70+の敵を撃破",
		id = 200362,
		target_num = 1,
		target_id = "70"
	},
	[200363] = {
		target_id_2 = "970406",
		sub_type = 302,
		desc = "セイレーン作戦でダンケルク(META)を含めた艦隊でLv90+の敵を撃破",
		id = 200363,
		target_num = 1,
		target_id = "90"
	},
	[200364] = {
		target_id_2 = "970406",
		sub_type = 302,
		desc = "セイレーン作戦でダンケルク(META)を含めた艦隊でLv100+の敵を撃破",
		id = 200364,
		target_num = 1,
		target_id = "100"
	},
	[200371] = {
		target_id_2 = "970109",
		sub_type = 302,
		desc = "セイレーン作戦で夕立(META)を含めた艦隊で1回勝利する",
		id = 200371,
		target_num = 1,
		target_id = "0"
	},
	[200372] = {
		target_id_2 = "970109",
		sub_type = 302,
		desc = "セイレーン作戦で夕立(META)を含めた艦隊でLv70+の敵を撃破",
		id = 200372,
		target_num = 1,
		target_id = "70"
	},
	[200373] = {
		target_id_2 = "970109",
		sub_type = 302,
		desc = "セイレーン作戦で夕立(META)を含めた艦隊でLv90+の敵を撃破",
		id = 200373,
		target_num = 1,
		target_id = "90"
	},
	[200374] = {
		target_id_2 = "970109",
		sub_type = 302,
		desc = "セイレーン作戦で夕立(META)を含めた艦隊でLv100+の敵を撃破",
		id = 200374,
		target_num = 1,
		target_id = "100"
	},
	[200381] = {
		target_id_2 = "970110",
		sub_type = 302,
		desc = "セイレーン作戦でデューイ(META)を含めた艦隊で1回勝利する",
		id = 200381,
		target_num = 1,
		target_id = "0"
	},
	[200382] = {
		target_id_2 = "970110",
		sub_type = 302,
		desc = "セイレーン作戦でデューイ(META)を含めた艦隊でLv70+の敵を撃破",
		id = 200382,
		target_num = 1,
		target_id = "70"
	},
	[200383] = {
		target_id_2 = "970110",
		sub_type = 302,
		desc = "セイレーン作戦でデューイ(META)を含めた艦隊でLv90+の敵を撃破",
		id = 200383,
		target_num = 1,
		target_id = "90"
	},
	[200384] = {
		target_id_2 = "970110",
		sub_type = 302,
		desc = "セイレーン作戦でデューイ(META)を含めた艦隊でLv100+の敵を撃破",
		id = 200384,
		target_num = 1,
		target_id = "100"
	},
	[200391] = {
		target_id_2 = "970208",
		sub_type = 302,
		desc = "セイレーン作戦でボイシ(META)を含めた艦隊で1回勝利する",
		id = 200391,
		target_num = 1,
		target_id = "0"
	},
	[200392] = {
		target_id_2 = "970208",
		sub_type = 302,
		desc = "セイレーン作戦でボイシ(META)を含めた艦隊でLv70+の敵を撃破",
		id = 200392,
		target_num = 1,
		target_id = "70"
	},
	[200393] = {
		target_id_2 = "970208",
		sub_type = 302,
		desc = "セイレーン作戦でボイシ(META)を含めた艦隊でLv90+の敵を撃破",
		id = 200393,
		target_num = 1,
		target_id = "90"
	},
	[200394] = {
		target_id_2 = "970208",
		sub_type = 302,
		desc = "セイレーン作戦でボイシ(META)を含めた艦隊でLv100+の敵を撃破",
		id = 200394,
		target_num = 1,
		target_id = "100"
	},
	[200401] = {
		target_id_2 = "970708",
		sub_type = 302,
		desc = "セイレーン作戦でヨークタウン(META)を含めた艦隊で1回勝利する",
		id = 200401,
		target_num = 1,
		target_id = "0"
	},
	[200402] = {
		target_id_2 = "970708",
		sub_type = 302,
		desc = "セイレーン作戦でヨークタウン(META)を含めた艦隊でLv70+の敵を撃破",
		id = 200402,
		target_num = 1,
		target_id = "70"
	},
	[200403] = {
		target_id_2 = "970708",
		sub_type = 302,
		desc = "セイレーン作戦でヨークタウン(META)を含めた艦隊でLv90+の敵を撃破",
		id = 200403,
		target_num = 1,
		target_id = "90"
	},
	[200404] = {
		target_id_2 = "970708",
		sub_type = 302,
		desc = "セイレーン作戦でヨークタウン(META)を含めた艦隊でLv100+の敵を撃破",
		id = 200404,
		target_num = 1,
		target_id = "100"
	},
	[200411] = {
		target_id_2 = "970209",
		sub_type = 302,
		desc = "セイレーン作戦でクリーブランド(META)を含めた艦隊で1回勝利する",
		id = 200411,
		target_num = 1,
		target_id = "0"
	},
	[200412] = {
		target_id_2 = "970209",
		sub_type = 302,
		desc = "セイレーン作戦でクリーブランド(META)を含めた艦隊でLv70+の敵を撃破",
		id = 200412,
		target_num = 1,
		target_id = "70"
	},
	[200413] = {
		target_id_2 = "970209",
		sub_type = 302,
		desc = "セイレーン作戦でクリーブランド(META)を含めた艦隊でLv90+の敵を撃破",
		id = 200413,
		target_num = 1,
		target_id = "90"
	},
	[200414] = {
		target_id_2 = "970209",
		sub_type = 302,
		desc = "セイレーン作戦でクリーブランド(META)を含めた艦隊でLv100+の敵を撃破",
		id = 200414,
		target_num = 1,
		target_id = "100"
	},
	[200421] = {
		target_id_2 = "970111",
		sub_type = 302,
		desc = "セイレーン作戦でカラビニエーレ(META)を含めた艦隊で1回勝利する",
		id = 200421,
		target_num = 1,
		target_id = "0"
	},
	[200422] = {
		target_id_2 = "970111",
		sub_type = 302,
		desc = "セイレーン作戦でカラビニエーレ(META)を含めた艦隊でLv70+の敵を撃破",
		id = 200422,
		target_num = 1,
		target_id = "70"
	},
	[200423] = {
		target_id_2 = "970111",
		sub_type = 302,
		desc = "セイレーン作戦でカラビニエーレ(META)を含めた艦隊でLv90+の敵を撃破",
		id = 200423,
		target_num = 1,
		target_id = "90"
	},
	[200424] = {
		target_id_2 = "970111",
		sub_type = 302,
		desc = "セイレーン作戦でカラビニエーレ(META)を含めた艦隊でLv100+の敵を撃破",
		id = 200424,
		target_num = 1,
		target_id = "100"
	}
}
