class Activity {
  //String imageUrl;
  int tokens;
  int minNumParticipants;
  //Users[] friends;
  String name;
  String date;
  String creationDate;
  String description;

  Activity({
    required this.tokens,
    //required this.imageUrl,
    required this.minNumParticipants,
    required this.name,
    required this.description,
    required this.date,
    required this.creationDate,
  });
}

List<Activity> activities = [
  Activity(
    tokens: 100,
    minNumParticipants: 1,
    name: "Recycling",
    description: "jsnakjndis ihabs iunsdi kdhna ou wdjkwe nk kh hj jewnfojeno cwk eihwfniw fje sj fkehw fuienfi ekjhfbiweujf nfheb ",
    date: "05/07/2021",
    creationDate: "30/12/2021",
  ),
  Activity(
    tokens: 300,
    minNumParticipants: 4,
    name: "Beach Cleaning Event",
    description: "jsnakjndis ihabs iunsdi kdhna ou wdjkwe nk kh hj jewnfojeno cwk eihwfniw fje sj fkehw fuienfi ekjhfbiweujf nfheb ",
    date: "05/07/2021",
    creationDate: "30/12/2021",
  ),
  Activity(
    tokens: 200,
    minNumParticipants: 2,
    name: "Walk Dogs",
    description: "jsnakjndis ihabs iunsdi kdhna ou wdjkwe nk kh hj jewnfojeno cwk eihwfniw fje sj fkehw fuienfi ekjhfbiweujf nfheb ",
    date: "05/07/2021",
    creationDate: "30/12/2021",
  ),
  Activity(
    tokens: 100,
    minNumParticipants: 1,
    name: "Recycling Point",
    description: "jsnakjndis ihabs iunsdi kdhna ou wdjkwe nk kh hj jewnfojeno cwk eihwfniw fje sj fkehw fuienfi ekjhfbiweujf nfheb ",
    date: "05/07/2021",
    creationDate: "30/12/2021",
  ),
];