import 'package:quotey/data/core/api_constants.dart';

/// raw : "https://images.unsplash.com/photo-1632779273781-d7127c1a887d?ixid=MnwyNzA0MDF8MHwxfHJhbmRvbXx8fHx8fHx8fDE2MzUxNTQ5ODM&ixlib=rb-1.2.1"
/// full : "https://images.unsplash.com/photo-1632779273781-d7127c1a887d?crop=entropy&cs=srgb&fm=jpg&ixid=MnwyNzA0MDF8MHwxfHJhbmRvbXx8fHx8fHx8fDE2MzUxNTQ5ODM&ixlib=rb-1.2.1&q=85"
/// regular : "https://images.unsplash.com/photo-1632779273781-d7127c1a887d?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=MnwyNzA0MDF8MHwxfHJhbmRvbXx8fHx8fHx8fDE2MzUxNTQ5ODM&ixlib=rb-1.2.1&q=80&w=1080"
/// small : "https://images.unsplash.com/photo-1632779273781-d7127c1a887d?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=MnwyNzA0MDF8MHwxfHJhbmRvbXx8fHx8fHx8fDE2MzUxNTQ5ODM&ixlib=rb-1.2.1&q=80&w=400"
/// thumb : "https://images.unsplash.com/photo-1632779273781-d7127c1a887d?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=MnwyNzA0MDF8MHwxfHJhbmRvbXx8fHx8fHx8fDE2MzUxNTQ5ODM&ixlib=rb-1.2.1&q=80&w=200"

class BackgroundImages {
  String raw;
  String full;
  String regular;
  String small;
  String thumb;

  BackgroundImages({
    this.raw,
    this.full,
    this.regular,
    this.small,
    this.thumb});

  BackgroundImages.fromJson(dynamic json) {
    raw = json["raw"] ?? APIConstants.PLACEHOLDER_IMAGE;
    full = json["full"] ?? APIConstants.PLACEHOLDER_IMAGE;
    regular = json["regular"] ?? APIConstants.PLACEHOLDER_IMAGE;
    small = json["small"] ?? APIConstants.PLACEHOLDER_IMAGE;
    thumb = json["thumb"] ?? APIConstants.PLACEHOLDER_IMAGE;
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["raw"] = raw;
    map["full"] = full;
    map["regular"] = regular;
    map["small"] = small;
    map["thumb"] = thumb;
    return map;
  }

}