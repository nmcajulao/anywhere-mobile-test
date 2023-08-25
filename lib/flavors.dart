enum Flavor {
  simpsons,
  theWire,
}

class F {
  static Flavor? appFlavor;

  static String get name => appFlavor?.name ?? '';

  static String get title {
    switch (appFlavor) {
      case Flavor.simpsons:
        return 'Simpsons Character Viewer';
      case Flavor.theWire:
        return 'The Wire Character Viewer';
      default:
        return 'title';
    }
  }

  static String get getCharacterUrl {
    switch (appFlavor) {
      case Flavor.simpsons:
        return "http://api.duckduckgo.com/?q=simpsons+characters&format=json";
      case Flavor.theWire:
        return "http://api.duckduckgo.com/?q=the+wire+characters&format=json";
      default:
        throw Exception("Unknown Flavor");
    }
  }

  static String getCharacterUrlFlavorSpecified(Flavor flavor) {
    switch (flavor) {
      case Flavor.simpsons:
        return "http://api.duckduckgo.com/?q=simpsons+characters&format=json";
      case Flavor.theWire:
        return "http://api.duckduckgo.com/?q=the+wire+characters&format=json";
      default:
        throw Exception("Unknown Flavor");
    }
  }
}
