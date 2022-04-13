class Payment {
  Payment({
    required this.name,
    required this.number,
    this.assetPath,
  });

  String name;
  String number;
  List<String>? assetPath;
}
