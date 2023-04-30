a
4d28f0f
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "My Title",
      home: MainScreen(),
      theme: ThemeData(
        fontFamily: GoogleFonts.lato().fontFamily, // Use the fontFamily property of the TextStyle object
      ),
    );