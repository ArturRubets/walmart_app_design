class Payment {
  const Payment({
    required this.name,
    required this.number,
    this.assetPath,
  }) : assert(number.length == 14);

  final String name;
  final String number;
  final List<String>? assetPath;
}
