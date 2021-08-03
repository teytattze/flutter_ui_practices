class Activity {
  String imageUrl, name, type;
  List<String> startTimes;
  int price, rating;

  Activity(
      {required this.name,
      required this.type,
      required this.imageUrl,
      required this.startTimes,
      required this.price,
      required this.rating});
}
