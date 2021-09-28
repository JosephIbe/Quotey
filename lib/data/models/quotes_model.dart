import 'dart:core';
import 'package:hive/hive.dart';

part 'quotes_model.g.dart';

/// tags : ["famous-quotes","inspirational"]
/// _id : "2xpHvSOQMD"
/// author : "Helmut Schmidt"
/// content : "The biggest room in the world is room for improvement."
/// authorSlug : "helmut-schmidt"
/// length : 54
/// dateAdded : "2021-06-18"
/// dateModified : "2021-06-18"

@HiveType(typeId: 0)
class QuotesModel {

  @HiveField(0)
  List<String> tags;

  @HiveField(1)
  String id;

  @HiveField(2)
  String author;

  @HiveField(3)
  String content;

  @HiveField(4)
  String authorSlug;

  @HiveField(5)
  int length;

  @HiveField(6)
  String dateAdded;

  @HiveField(7)
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