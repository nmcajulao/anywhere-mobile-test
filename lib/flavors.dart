enum Flavor {
  versionone,
  versiontwo,
}

class F {
  static Flavor? appFlavor;

  static String get name => appFlavor?.name ?? '';

  static String get title {
    switch (appFlavor) {
      case Flavor.versionone:
        return 'Simpsons Character Viewer';
      case Flavor.versiontwo:
        return 'The Wire Character Viewer';
      default:
        return 'title';
    }
  }

  static String get getCharacterUrl {
    switch (appFlavor) {
      case Flavor.versionone:
        return "http://api.duckduckgo.com/?q=simpsons+characters&format=json";
      case Flavor.versiontwo:
        return "http://api.duckduckgo.com/?q=the+wire+characters&format=json";
      default:
        throw Exception("Unknown Flavor");
    }
  }
}
