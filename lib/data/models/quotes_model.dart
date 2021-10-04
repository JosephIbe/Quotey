import 'dart:core';
import 'package:hive/hive.dart';
import 'package:quotey/domain/entities/quotes_entity.dart';

// part 'quotes_model.g.dart';

/// tags : ["famous-quotes","inspirational"]
/// _id : "2xpHvSOQMD"
/// author : "Helmut Schmidt"
/// content : "The biggest room in the world is room for improvement."
/// authorSlug : "helmut-schmidt"
/// length : 54
/// dateAdded : "2021-06-18"
/// dateModified : "2021-06-18"

class QuotesModel extends QuotesEntity {

  final List<String> tags;

  final String id;

  final String author;

  final String content;

  final String authorSlug;

  final int length;

  final String dateAdded;

  final String dateModified;

  QuotesModel(
      {this.tags,
      this.id,
      this.author,
      this.content,
      this.authorSlug,
      this.length,
      this.dateAdded,
      this.dateModified})
      : super(tags: tags, id: id, author: author, content: content);

  factory QuotesModel.fromJson(dynamic json) {
    return QuotesModel(
        tags: json["tags"] != null ? json["tags"].cast<String>() : [],
        id: json["_id"],
        author: json["author"],
        content: json['content'],
        authorSlug: json["authorSlug"],
        length: json["length"],
        dateAdded: json["dateAdded"],
        dateModified: json["dateModified"]);
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