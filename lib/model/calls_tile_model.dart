class CallsTileModel {
  final String? id;
  final String profilePic;
  final String name;
  final String? miscalls;
  final String date;

  CallsTileModel({
    this.id,
    required this.profilePic,
    required this.name,
    this.miscalls,
    required this.date,
  });
}
