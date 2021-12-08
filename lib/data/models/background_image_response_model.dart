import 'background_images_model.dart';

/// id : "KBmMwcxnsq4"
/// width : 6240
/// height : 3565
/// color : "#262626"
/// urls : {"raw":"https://images.unsplash.com/photo-1632779273781-d7127c1a887d?ixid=MnwyNzA0MDF8MHwxfHJhbmRvbXx8fHx8fHx8fDE2MzUxNTQ5ODM&ixlib=rb-1.2.1","full":"https://images.unsplash.com/photo-1632779273781-d7127c1a887d?crop=entropy&cs=srgb&fm=jpg&ixid=MnwyNzA0MDF8MHwxfHJhbmRvbXx8fHx8fHx8fDE2MzUxNTQ5ODM&ixlib=rb-1.2.1&q=85","regular":"https://images.unsplash.com/photo-1632779273781-d7127c1a887d?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=MnwyNzA0MDF8MHwxfHJhbmRvbXx8fHx8fHx8fDE2MzUxNTQ5ODM&ixlib=rb-1.2.1&q=80&w=1080","small":"https://images.unsplash.com/photo-1632779273781-d7127c1a887d?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=MnwyNzA0MDF8MHwxfHJhbmRvbXx8fHx8fHx8fDE2MzUxNTQ5ODM&ixlib=rb-1.2.1&q=80&w=400","thumb":"https://images.unsplash.com/photo-1632779273781-d7127c1a887d?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=MnwyNzA0MDF8MHwxfHJhbmRvbXx8fHx8fHx8fDE2MzUxNTQ5ODM&ixlib=rb-1.2.1&q=80&w=200"}

class BackgroundResponseModel {
  BackgroundImages urls;

  BackgroundResponseModel({
      this.urls,
      });

  BackgroundResponseModel.fromJson(dynamic json) {
    urls = json["urls"] != null ? BackgroundImages.fromJson(json["urls"]) : null;
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    if (urls != null) {
      map["urls"] = urls.toJson();
    }
    return map;
  }

}