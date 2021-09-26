/// _id : "M83oc3scg"
/// name : "business"
/// dateAdded : "2019-08-03"
/// dateModified : "2019-08-03"
/// quoteCount : 1

class CategoryModel {
  String id;
  String name;
  String dateAdded;
  String dateModified;
  int quoteCount;

  CategoryModel({
      this.id, 
      this.name, 
      this.dateAdded, 
      this.dateModified, 
      this.quoteCount});

  CategoryModel.fromJson(dynamic json) {
    id = json["_id"];
    name = json["name"];
    dateAdded = json["dateAdded"];
    dateModified = json["dateModified"];
    quoteCount = json["quoteCount"];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["_id"] = id;
    map["name"] = name;
    map["dateAdded"] = dateAdded;
    map["dateModified"] = dateModified;
    map["quoteCount"] = quoteCount;
    return map;
  }

}