pg = pg or {}
pg.island_action = {
	[1000] = {
		tech_id = 0,
		name = "Greet",
		respond_point = "",
		type = 1,
		feedback_type = 1,
		desc = "Character action to [Greet], it shows the character's emotion and attitude.",
		resource = "hi",
		id = 1000,
		responder_feedback = "",
		jump_page = {}
	},
	[1001] = {
		tech_id = 0,
		name = "Goodbye",
		respond_point = "",
		type = 1,
		feedback_type = 1,
		desc = "Character action to [Goodbye], it shows the character's emotion and attitude.",
		resource = "bye",
		id = 1001,
		responder_feedback = "",
		jump_page = {}
	},
	[1002] = {
		tech_id = 0,
		name = "Nod",
		respond_point = "",
		type = 1,
		feedback_type = 1,
		desc = "Character action to [Nod], it shows the character's emotion and attitude.",
		resource = "nod",
		id = 1002,
		responder_feedback = "",
		jump_page = {}
	},
	[1003] = {
		tech_id = 0,
		name = "Shake Head",
		respond_point = "",
		type = 1,
		feedback_type = 1,
		desc = "Character action to [Shake Head], it shows the character's emotion and attitude.",
		resource = "shakehead",
		id = 1003,
		responder_feedback = "",
		jump_page = {}
	},
	[1004] = {
		tech_id = 0,
		name = "Clap",
		respond_point = "",
		type = 1,
		feedback_type = 1,
		desc = "Character action to [Clap], it shows the character's emotion and attitude.",
		resource = "clap",
		id = 1004,
		responder_feedback = "",
		jump_page = {}
	},
	[1005] = {
		tech_id = 0,
		name = "Praise the Sun",
		respond_point = "",
		type = 1,
		feedback_type = 1,
		desc = "Character action to [Praise the Sun], it shows the character's emotion and attitude.",
		resource = "handsup",
		id = 1005,
		responder_feedback = "",
		jump_page = {}
	},
	[1006] = {
		tech_id = 0,
		name = "Hands on Hips",
		respond_point = "",
		type = 1,
		feedback_type = 1,
		desc = "Character action to [Hands on Hips], it shows the character's emotion and attitude.",
		resource = "akimbo",
		id = 1006,
		responder_feedback = "",
		jump_page = {}
	},
	[1007] = {
		tech_id = 0,
		name = "Bow",
		respond_point = "",
		type = 1,
		feedback_type = 1,
		desc = "Character action to [Bow], it shows the character's emotion and attitude.",
		resource = "bow",
		id = 1007,
		responder_feedback = "",
		jump_page = {
			{
				"Island Collection",
				{}
			}
		}
	},
	[1008] = {
		tech_id = 0,
		name = "Excited Jump",
		respond_point = "",
		type = 1,
		feedback_type = 1,
		desc = "Character action to [Excited Jump], it shows the character's emotion and attitude.",
		resource = "vjump",
		id = 1008,
		responder_feedback = "",
		jump_page = {
			{
				"Island Seasonal Shop",
				{}
			}
		}
	},
	[1009] = {
		tech_id = 0,
		name = "Stamp Feet",
		respond_point = "",
		type = 1,
		feedback_type = 1,
		desc = "Character action to [Stamp Feet], it shows the character's emotion and attitude.",
		resource = "stomp",
		id = 1009,
		responder_feedback = "",
		jump_page = {}
	},
	[1011] = {
		tech_id = 0,
		name = "Flaunt Muscles",
		respond_point = "",
		type = 1,
		feedback_type = 1,
		desc = "Character action to [Flaunt Muscles], it shows the character's emotion and attitude.",
		resource = "muscle",
		id = 1011,
		responder_feedback = "",
		jump_page = {
			{
				"Island Seasonal Shop",
				{}
			}
		}
	},
	[1012] = {
		tech_id = 0,
		name = "Dance",
		respond_point = "",
		type = 1,
		feedback_type = 1,
		desc = "Character action to [Dance], it shows the character's emotion and attitude.",
		resource = "dance",
		id = 1012,
		responder_feedback = "",
		jump_page = {}
	},
	[2000] = {
		tech_id = 0,
		name = "High Five",
		desc = "Character action to [High Five], it shows the character's emotion and attitude.",
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
		name = "Shake Hands",
		desc = "Character action to [Shake Hands], it shows the character's emotion and attitude.",
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
				"Island Seasonal Shop",
				{}
			}
		}
	},
	[2002] = {
		tech_id = 0,
		name = "Hug",
		desc = "Character action to [Hug], it shows the character's emotion and attitude.",
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
