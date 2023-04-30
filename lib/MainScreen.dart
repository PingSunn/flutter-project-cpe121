}

class _MainScreenState extends State<MainScreen> {
  @override
  void initState() {
    super.initState();
            "รักคนที่เขารักเรามันยากตรงไหนวะ",
            style: TextStyle(color: Colors.white),
          ),
          flexibleSpace: Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(begin: Alignment.centerLeft, end: Alignment.centerRight, colors: [
                Color(0xffeeaeca),
                Color(0xff94bbe9)
              ]),
            ),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(10.0),
                child: HomeBox(
                  "Weight control",
                  "{STATUS BMI}",
                  Color(0xffeeaeca),
                ),
              ),
              SizedBox(
                    MaterialPageRoute(builder: (context) => Diet()),
                  );
                },
                child: HomeBox("Diet", "0", Color(0xff94bbe9)),
              ),
              SizedBox(
                height: 30,
                child: HomeBox(
                  "Sodium",
                  "0",
                  Color(0xffeeaeca),
                ),
              )
            ],