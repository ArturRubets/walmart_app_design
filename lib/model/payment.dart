class Payment {
  const Payment({
    required this.name,
    required this.number,
    this.assetPath,
  });

  final String name;
  final String number;
  final List<String>? assetPath;
}
