return {
	id = "DORM3DVIDEO1102",
	mode = 2,
	shipGroup = 10517,
	label = "dorm3d_VIDEO_CHAT_LABEL",
	scripts = {
		{
			say = "ん？ハニー、電話に出るのが早いね～",
			wait = 1,
			voice = "event:/dorm/drom3d_NewJersey_other/dorm3d_newjersey_telephone25"
		},
		{
			say = "もしかして⋯⋯ずっとあたしの電話を待ってたの～？",
			wait = 1,
			voice = "event:/dorm/drom3d_NewJersey_other/dorm3d_newjersey_telephone26"
		},
		{
			say = "えっ、ほんとに待ってたの？ごめんね、待たせちゃって",
			wait = 1,
			voice = "event:/dorm/drom3d_NewJersey_other/dorm3d_newjersey_telephone27"
		},
		{
			say = "でも、すっごく嬉しいよ～！あたしの電話を待ってくれてるハニー⋯⋯",
			wait = 1,
			voice = "event:/dorm/drom3d_NewJersey_other/dorm3d_newjersey_telephone28"
		},
		{
			say = "じっと待ちながら、あたしが先に動くのを待ってたハニー⋯⋯",
			wait = 1,
			voice = "event:/dorm/drom3d_NewJersey_other/dorm3d_newjersey_telephone29"
		},
		{
			say = "もう可愛すぎるでしょ～♡",
			wait = 1,
			voice = "event:/dorm/drom3d_NewJersey_other/dorm3d_newjersey_telephone30"
		},
		{
			say = "そういえば、あたしも褒められるべきじゃない？",
			wait = 1,
			voice = "event:/dorm/drom3d_NewJersey_other/dorm3d_newjersey_telephone31"
		},
		{
			say = "ちゃんと計画して、辛抱強くタイミングを見計らって⋯⋯",
			wait = 1,
			voice = "event:/dorm/drom3d_NewJersey_other/dorm3d_newjersey_telephone32"
		},
		{
			say = "ハニーが一番あたしを求める瞬間に、キラッと登場する",
			wait = 2,
			voice = "event:/dorm/drom3d_NewJersey_other/dorm3d_newjersey_telephone33"
		},
		{
			say = "ふふん♪なかなか素晴らしかったでしょ？",
			wait = 1,
			voice = "event:/dorm/drom3d_NewJersey_other/dorm3d_newjersey_telephone34"
		},
		{
			say = "ハニーの視線は、ちゃんとあたしに釘付けじゃないとダメよ♪",
			wait = 1,
			voice = "event:/dorm/drom3d_NewJersey_other/dorm3d_newjersey_telephone35"
		},
		{
			say = "これだけ息ピッタリなら⋯",
			wait = 1,
			voice = "event:/dorm/drom3d_NewJersey_other/dorm3d_newjersey_telephone36"
		},
		{
			say = "どんなご褒美をハニーにあげるかちゃんと考えないとね～",
			wait = 1,
			voice = "event:/dorm/drom3d_NewJersey_other/dorm3d_newjersey_telephone37"
		},
		{
			say = "どうしよっかな⋯⋯ご褒美はやっぱりあたしが動くしかないかな～？",
			wait = 1,
			voice = "event:/dorm/drom3d_NewJersey_other/dorm3d_newjersey_telephone38"
		},
		{
			say = "ハニーに、ああしたり⋯こうしたり⋯いろんなことをしたいし⋯⋯",
			wait = 1,
			voice = "event:/dorm/drom3d_NewJersey_other/dorm3d_newjersey_telephone39"
		},
		{
			say = "甘～いアイスクリームみたいに、包み込んじゃいたい⋯⋯",
			wait = 1,
			voice = "event:/dorm/drom3d_NewJersey_other/dorm3d_newjersey_telephone40"
		},
		{
			say = "ふふっ、溶けちゃいそ～♡",
			wait = 1,
			voice = "event:/dorm/drom3d_NewJersey_other/dorm3d_newjersey_telephone41"
		},
		{
			say = "ハニーの今の顔、すっごく面白かった！録画したいくらい♡",
			wait = 2,
			voice = "event:/dorm/drom3d_NewJersey_other/dorm3d_newjersey_telephone42",
			options = {
				{
					content = "自分も今のニュージャージーの顔が好きだ",
					flag = 1
				}
			},
			dispatcher = {
				name = STORY_EVENT.TEST,
				data = {
					op_list = {
						{
							param = "Play",
							name = "shy_01-start",
							time = 0,
							type = "action",
							skip = true
						},
						{
							skip = true,
							name = "face_smile_start",
							type = "action"
						},
						{
							skip = false,
							time = 1.5,
							type = "wait"
						}
					}
				},
				callbackData = {
					hideUI = false,
					name = STORY_EVENT.TEST_DONE
				}
			}
		},
		{
			say = "ん？反撃のチャンスを掴まれた？",
			wait = 0.5,
			voice = "event:/dorm/drom3d_NewJersey_other/dorm3d_newjersey_telephone43"
		},
		{
			say = "さすがハニー、どんな隙も逃さない♪",
			wait = 0.5,
			voice = "event:/dorm/drom3d_NewJersey_other/dorm3d_newjersey_telephone44"
		},
		{
			say = "でもね、今はもっと良いチャンスが目の前にあるわよ⋯⋯",
			wait = 0.5,
			voice = "event:/dorm/drom3d_NewJersey_other/dorm3d_newjersey_telephone45"
		},
		{
			say = "この後のデートのために、特別なキスと⋯⋯さらに甘～いひとときを用意してるから♡",
			wait = 0.5,
			voice = "event:/dorm/drom3d_NewJersey_other/dorm3d_newjersey_telephone46"
		},
		{
			say = "だから、早く会いに来てね！",
			wait = 0.5,
			voice = "event:/dorm/drom3d_NewJersey_other/dorm3d_newjersey_telephone47"
		},
		{
			say = "さもないと⋯⋯あたしが先に仕掛けちゃうから！",
			wait = 0.5,
			voice = "event:/dorm/drom3d_NewJersey_other/dorm3d_newjersey_telephone48"
		}
	}
}
