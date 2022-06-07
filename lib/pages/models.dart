class Profile {
  String? firstName;
  String? lastName;
  String? location;
  int? numberOfFollowers;
  int? numberFollowing;
  int? totalLikes;

  String get topText => "$firstName";

  String get bottomText => "$lastName";

  String get numberOfFollowersString => _abbreviatedCount(numberOfFollowers!);

  String get numberFollowingString => _abbreviatedCount(numberFollowing!);

  String get totalLikesString => _abbreviatedCount(totalLikes!);

  String _abbreviatedCount(int num) {
    if (num < 1000) return "$num";
    if (num >= 1000 && num < 1000000) {
      String s = (num / 1000).toStringAsFixed(1);
      if (s.endsWith(".0")) {
        int idx = s.indexOf(".0");
        s = s.substring(0, idx);
      }
      return "${s}K";
    } else if (num >= 1000000 && num < 1000000000) {
      String s = (num / 1000000).toStringAsFixed(1);
      if (s.endsWith(".0")) {
        int idx = s.indexOf(".0");
        s = s.substring(0, idx);
      }
      return "${s}M";
    }
    return "";
  }
}

Profile getProfile() {
  return new Profile()
    ..firstName = "The First On-Chain Generative NFTs on Solana"
    ..lastName = "NFTs on Solana"
    ..location = "New York"
    ..numberOfFollowers = 315
    ..numberFollowing = 924
    ..totalLikes = 1700;
}