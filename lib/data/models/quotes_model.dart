/// tags : ["famous-quotes","inspirational"]
/// _id : "2xpHvSOQMD"
/// author : "Helmut Schmidt"
/// content : "The biggest room in the world is room for improvement."
/// authorSlug : "helmut-schmidt"
/// length : 54
/// dateAdded : "2021-06-18"
/// dateModified : "2021-06-18"

class QuotesModel {

  List<String> tags;
  String id;
  String author;
  String content;
  String authorSlug;
  int length;
  String dateAdded;
  String dateModified;

  QuotesModel({
    this.tags,
    this.id,
    this.author,
    this.content,
    this.authorSlug,
    this.length,
    this.dateAdded,
    this.dateModified});

  QuotesModel.fromJson(dynamic json) {
    tags = json["tags"] != null ? json["tags"].cast<String>() : [];
    id = json["_id"];
    author = json["author"];
    content = json["content"];
    authorSlug = json["authorSlug"];
    length = json["length"];
    dateAdded = json["dateAdded"];
    dateModified = json["dateModified"];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["tags"] = tags;
    map["_id"] = id;
    map["author"] = author;
    map["content"] = content;
    map["authorSlug"] = authorSlug;
    map["length"] = length;
    map["dateAdded"] = dateAdded;
    map["dateModified"] = dateModified;
    return map;
  }

}