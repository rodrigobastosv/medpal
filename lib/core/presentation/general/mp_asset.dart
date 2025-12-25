abstract class MPAsset {
  static final images = _MPImages();
  static final animations = _MPAnimations();
}

final class _MPImages {
  static String get imagesPath => 'assets/images';

  String get welcome1 => '$imagesPath/welcome1.png';
  String get welcome2 => '$imagesPath/welcome2.png';
  String get welcome3 => '$imagesPath/welcome3.png';
  String get welcome4 => '$imagesPath/welcome4.png';
}

final class _MPAnimations {
  static String get animationsPath => 'assets/animations';

  String get hospital => '$animationsPath/hospital.json';
}
