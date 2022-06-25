class Collection {
  bool? isNsfw;
  String? name;
  String? thumbnail;
  bool? verifeyed;

  Collection({this.isNsfw, this.name, this.thumbnail, this.verifeyed});

  Collection.fromJson(Map<String, dynamic> json) {
    isNsfw = json['isNsfw'];
    name = json['name'];
    thumbnail = json['thumbnail'];
    verifeyed = json['verifeyed'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['isNsfw'] = isNsfw;
    data['name'] = name;
    data['thumbnail'] = thumbnail;
    data['verifeyed'] = verifeyed;
    return data;
  }
}
