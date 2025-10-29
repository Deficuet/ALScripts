pg = pg or {}
pg.island_action = {
	[1000] = {
		tech_id = 0,
		name = "あいさつ",
		respond_point = "",
		type = 1,
		feedback_type = 1,
		desc = "キャラクターアクションあいさつ。自分の感情をアピールしましょう！",
		resource = "hi",
		id = 1000,
		responder_feedback = "",
		jump_page = {}
	},
	[1001] = {
		tech_id = 0,
		name = "別れ",
		respond_point = "",
		type = 1,
		feedback_type = 1,
		desc = "キャラクターアクション別れ。自分の感情をアピールしましょう！",
		resource = "bye",
		id = 1001,
		responder_feedback = "",
		jump_page = {}
	},
	[1002] = {
		tech_id = 0,
		name = "頷く",
		respond_point = "",
		type = 1,
		feedback_type = 1,
		desc = "キャラクターアクション頷く。自分の感情をアピールしましょう！",
		resource = "nod",
		id = 1002,
		responder_feedback = "",
		jump_page = {}
	},
	[1003] = {
		tech_id = 0,
		name = "頭を振る",
		respond_point = "",
		type = 1,
		feedback_type = 1,
		desc = "キャラクターアクション頭を振る。自分の感情をアピールしましょう！",
		resource = "shakehead",
		id = 1003,
		responder_feedback = "",
		jump_page = {}
	},
	[1004] = {
		tech_id = 0,
		name = "拍手",
		respond_point = "",
		type = 1,
		feedback_type = 1,
		desc = "キャラクターアクション拍手。自分の感情をアピールしましょう！",
		resource = "clap",
		id = 1004,
		responder_feedback = "",
		jump_page = {}
	},
	[1005] = {
		tech_id = 0,
		name = "太陽ポーズ",
		respond_point = "",
		type = 1,
		feedback_type = 1,
		desc = "キャラクターアクション太陽ポーズ。自分の感情をアピールしましょう！",
		resource = "handsup",
		id = 1005,
		responder_feedback = "",
		jump_page = {}
	},
	[1006] = {
		tech_id = 0,
		name = "両手を腰に",
		respond_point = "",
		type = 1,
		feedback_type = 1,
		desc = "キャラクターアクション両手を腰に。自分の感情をアピールしましょう！",
		resource = "akimbo",
		id = 1006,
		responder_feedback = "",
		jump_page = {}
	},
	[1007] = {
		tech_id = 0,
		name = "お辞儀",
		respond_point = "",
		type = 1,
		feedback_type = 1,
		desc = "キャラクターアクションお辞儀。自分の感情をアピールしましょう！",
		resource = "bow",
		id = 1007,
		responder_feedback = "",
		jump_page = {
			{
				"図鑑",
				{}
			}
		}
	},
	[1008] = {
		tech_id = 0,
		name = "元気ジャンプ",
		respond_point = "",
		type = 1,
		feedback_type = 1,
		desc = "キャラクターアクション元気ジャンプ。自分の感情をアピールしましょう！",
		resource = "vjump",
		id = 1008,
		responder_feedback = "",
		jump_page = {
			{
				"ショップ",
				{}
			}
		}
	},
	[1009] = {
		tech_id = 0,
		name = "地団駄踏む",
		respond_point = "",
		type = 1,
		feedback_type = 1,
		desc = "キャラクターアクション地団駄踏む。自分の感情をアピールしましょう！",
		resource = "stomp",
		id = 1009,
		responder_feedback = "",
		jump_page = {}
	},
	[1011] = {
		tech_id = 0,
		name = "筋肉自慢",
		respond_point = "",
		type = 1,
		feedback_type = 1,
		desc = "キャラクターアクション筋肉自慢。自分の感情をアピールしましょう！",
		resource = "muscle",
		id = 1011,
		responder_feedback = "",
		jump_page = {
			{
				"ショップ",
				{}
			}
		}
	},
	[1012] = {
		tech_id = 0,
		name = "踊る",
		respond_point = "",
		type = 1,
		feedback_type = 1,
		desc = "キャラクターアクション踊る。自分の感情をアピールしましょう！",
		resource = "dance",
		id = 1012,
		responder_feedback = "",
		jump_page = {}
	},
	[2000] = {
		tech_id = 0,
		name = "ハイタッチ",
		desc = "キャラクターアクションハイタッチ。自分の感情をアピールしましょう！",
		type = 2,
		feedback_type = 0,
		responder_feedback = "givemefive_end",
		id = 2000,
		resource = "givemefive",
		respond_point = {
			0.07173,
			0,
			1.28364
		},
		jump_page = {}
	},
	[2001] = {
		tech_id = 0,
		name = "握手",
		desc = "キャラクターアクション握手。自分の感情をアピールしましょう！",
		type = 2,
		feedback_type = 0,
		responder_feedback = "handshake_end",
		id = 2001,
		resource = "handshake",
		respond_point = {
			0.03018,
			0,
			1.35235
		},
		jump_page = {
			{
				"ショップ",
				{}
			}
		}
	},
	[2002] = {
		tech_id = 0,
		name = "ハグ",
		desc = "キャラクターアクションハグ。自分の感情をアピールしましょう！",
		type = 2,
		feedback_type = 0,
		responder_feedback = "hug_end",
		id = 2002,
		resource = "hug",
		respond_point = {
			0.05431,
			0,
			0.62654
		},
		jump_page = {}
	},
	get_id_list_by_type = {
		{
			1000,
			1001,
			1002,
			1003,
			1004,
			1005,
			1006,
			1007,
			1008,
			1009,
			1011,
			1012
		},
		{
			2000,
			2001,
			2002
		}
	},
	all = {
		1000,
		1001,
		1002,
		1003,
		1004,
		1005,
		1006,
		1007,
		1008,
		1009,
		1011,
		1012,
		2000,
		2001,
		2002
	}
}
