import 'package:hive/hive.dart';

import 'package:quotey/data/models/quotes_model.dart';

part 'quotes_table.g.dart';

@HiveType(typeId: 0)
class QuotesTable extends QuotesModel {

  @HiveField(0)
  List<String> tags;

  @HiveField(1)
  String id;

  @HiveField(2)
  String author;

  @HiveField(3)
  String content;

  QuotesTable({
    this.tags,
    this.id,
    this.author,
    this.content,
  });

  QuotesTable.fromJson(dynamic json) {
    tags = json["tags"] != null ? json["tags"].cast<String>() : [];
    id = json["_id"];
    author = json["author"];
    content = json["content"];
    authorSlug = json["authorSlug"];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["tags"] = tags;
    map["_id"] = id;
    map["author"] = author;
    map["content"] = content;
    return map;
  }
}