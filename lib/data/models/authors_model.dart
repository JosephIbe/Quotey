/// link : "https://en.wikipedia.org/wiki/A._A._Milne"
/// bio : "Alan Alexander Milne (18 January 1882 – 31 January 1956) was an English author, best known for his books about the teddy bear Winnie-the-Pooh and for various poems. Milne was a noted writer, primarily as a playwright, before the huge success of Pooh overshadowed all his previous work."
/// description : "British author"
/// _id : "-yBDYq_Vtnuw"
/// name : "A. A. Milne"
/// quoteCount : 2
/// slug : "a-a-milne"
/// dateAdded : "2019-08-08"
/// dateModified : "2019-08-08"

class AuthorsModel {
  String link;
  String bio;
  String description;
  String id;
  String name;
  int quoteCount;
  String slug;
  String dateAdded;
  String dateModified;

  AuthorsModel({
    this.link,
    this.bio,
    this.description,
    this.id,
    this.name,
    this.quoteCount,
    this.slug,
    this.dateAdded,
    this.dateModified});

  AuthorsModel.fromJson(dynamic json) {
    link = json["link"];
    bio = json["bio"];
    description = json["description"];
    id = json["_id"];
    name = json["name"];
    quoteCount = json["quoteCount"];
    slug = json["slug"];
    dateAdded = json["dateAdded"];
    dateModified = json["dateModified"];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["link"] = link;
    map["bio"] = bio;
    map["description"] = description;
    map["_id"] = id;
    map["name"] = name;
    map["quoteCount"] = quoteCount;
    map["slug"] = slug;
    map["dateAdded"] = dateAdded;
    map["dateModified"] = dateModified;
    return map;
  }

}