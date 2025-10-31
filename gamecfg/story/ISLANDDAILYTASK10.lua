return {
	id = "ISLANDDAILYTASK10",
	mode = 10,
	map = {
		{
			100800,
			10060002
		}
	},
	look_weight = {
		{
			0.7,
			0
		},
		{
			0.3,
			0
		}
	},
	scripts = {
		{
			animation = "talk",
			characterId = 100800,
			subName = "Commercial Area Supervisor",
			say = "As always, you work fast, Commander.",
			face2Face = {
				{
					0,
					100800
				}
			},
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			subName = "Commercial Area Supervisor",
			characterId = 100800,
			say = "This is precisely what the commercial area was lacking, and in the perfect amount, too.",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			animation = "clap",
			characterId = 100800,
			subName = "Commercial Area Supervisor",
			say = "You've really helped us out. We owe our prosperity entirely to you.",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		}
	}
}
