import 'quotes_model.dart';

/// count : 20
/// totalCount : 1885
/// page : 1
/// totalPages : 95
/// lastItemIndex : 20
/// results : [{"tags":["famous-quotes","inspirational"],"_id":"2xpHvSOQMD","author":"Helmut Schmidt","content":"The biggest room in the world is room for improvement.","authorSlug":"helmut-schmidt","length":54,"dateAdded":"2021-06-18","dateModified":"2021-06-18"},{"tags":["famous-quotes","inspirational"],"_id":"XNLGqepInX","author":"Amy Poehler","content":"There’s power in looking silly and not caring that you do.","authorSlug":"amy-poehler","length":58,"dateAdded":"2021-06-18","dateModified":"2021-06-18"},{"tags":["famous-quotes","inspirational"],"_id":"aEPNVog6sT","author":"Eric Hoffer","content":"In times of change, learners inherit the earth, while the learned find themselves beautifully equipped to deal with a world that no longer exists.","authorSlug":"eric-hoffer","length":146,"dateAdded":"2021-06-18","dateModified":"2021-06-18"},{"tags":["famous-quotes","inspirational"],"_id":"HMBEfGB94i","author":"Henry Ford","content":"Whether you think you can or you think you can't, you are right.","authorSlug":"henry-ford","length":64,"dateAdded":"2021-06-18","dateModified":"2021-06-18"},{"tags":["famous-quotes","inspirational"],"_id":"QdK00IhCNX","author":"Larry Page","content":"If you're changing the world, you're working on important things. You're excited to get up in the morning.","authorSlug":"larry-page","length":106,"dateAdded":"2021-06-18","dateModified":"2021-06-18"},{"tags":["famous-quotes","inspirational"],"_id":"lJ60rOYWci","author":"Neil Gaiman","content":"The one thing that you have that nobody else has is you. Your voice, your mind, your story, your vision. So write and draw and build and play and dance and live as only you can.","authorSlug":"neil-gaiman","length":177,"dateAdded":"2021-06-18","dateModified":"2021-06-18"},{"tags":["famous-quotes"],"_id":"J1amO36TwbX8","content":"You can't blame gravity for falling in love.","author":"Albert Einstein","authorSlug":"albert-einstein","length":44,"dateAdded":"2021-05-12","dateModified":"2021-05-12"},{"tags":["famous-quotes","success","happiness"],"_id":"_XB2MKPzW7dA","content":"Success is not the key to happiness. Happiness is the key to success. If you love what you are doing, you will be successful.","author":"Albert Schweitzer","authorSlug":"albert-schweitzer","length":125,"dateAdded":"2021-05-12","dateModified":"2021-05-12"},{"tags":["famous-quotes"],"_id":"9knYf-nVYu10","content":"The least of things with a meaning is worth more in life than the greatest of things without it.","author":"Carl Jung","authorSlug":"carl-jung","length":96,"dateAdded":"2021-05-12","dateModified":"2021-05-12"},{"tags":["famous-quotes"],"_id":"Oh-e1-oygRPX","content":"To be wronged is nothing unless you continue to remember it.","author":"Confucius","authorSlug":"confucius","length":60,"dateAdded":"2021-05-12","dateModified":"2021-05-12"},{"tags":["famous-quotes"],"_id":"5U3Qdp9L0OId","content":"Friends are those rare people who ask how we are and then wait to hear the answer.","author":"Ed Cunningham","authorSlug":"ed-cunningham","length":82,"dateAdded":"2021-05-12","dateModified":"2021-05-12"},{"tags":["famous-quotes"],"_id":"6c2h-AtqMj6d","content":"You can stand tall without standing on someone. You can be a victor without having victims.","author":"Harriet Woods","authorSlug":"harriet-woods","length":91,"dateAdded":"2021-05-12","dateModified":"2021-05-12"},{"tags":["famous-quotes"],"_id":"2xx4dfKrYVRf","content":"Some people thrive on huge, dramatic change. Some people prefer the slow and steady route. Do what's right for you.","author":"Julie Morgenstern","authorSlug":"julie-morgenstern","length":115,"dateAdded":"2021-05-12","dateModified":"2021-05-12"},{"tags":["famous-quotes"],"_id":"bfpxfIQlqZ_3","content":"He who controls others may be powerful, but he who has mastered himself is mightier still.","author":"Laozi","authorSlug":"laozi","length":90,"dateAdded":"2021-05-12","dateModified":"2021-05-12"},{"tags":["famous-quotes"],"_id":"Log-YUXR2i-","content":"Truth is powerful and it prevails.","author":"Sojourner Truth","authorSlug":"sojourner-truth","length":34,"dateAdded":"2021-05-12","dateModified":"2021-05-12"},{"tags":["famous-quotes"],"_id":"qXO3CA1R5kmS","content":"Take up one idea. Make that one idea your life - think of it, dream of it, live on that idea. Let the brain, muscles, nerves, every part of your body, be full of that idea, and just leave every other idea alone. This is the way to success.","author":"Swami Vivekananda","authorSlug":"swami-vivekananda","length":239,"dateAdded":"2021-05-12","dateModified":"2021-05-12"},{"tags":["famous-quotes"],"_id":"CdL1z3NLSDrN","content":"Don't talk about what you have done or what you are going to do.","author":"Thomas Jefferson","authorSlug":"thomas-jefferson","length":64,"dateAdded":"2021-05-12","dateModified":"2021-05-12"},{"tags":["famous-quotes"],"_id":"2wYjTZiTUSgQ","content":"The things that one most wants to do are the things that are probably most worth doing.","author":"Winifred Holtby","authorSlug":"winifred-holtby","length":87,"dateAdded":"2021-05-12","dateModified":"2021-05-12"},{"tags":["wisdom"],"_id":"6Kl3UT6ULk","content":"Wisdom, compassion, and courage are the three universally recognized moral qualities of men.","author":"Confucius","authorSlug":"confucius","length":92,"dateAdded":"2021-05-12","dateModified":"2021-05-12"},{"tags":["wisdom"],"_id":"wEfrviG0x9r","content":"With age comes wisdom and a high sex drive. And the wisdom to enjoy it.","author":"Amber Valletta","authorSlug":"amber-valletta","length":71,"dateAdded":"2021-05-12","dateModified":"2021-05-12"}]

class QuotesResponseModel {
  int count;
  int totalCount;
  int page;
  int totalPages;
  int lastItemIndex;
  List<QuotesModel> results;

  QuotesResponseModel({
      this.count, 
      this.totalCount, 
      this.page, 
      this.totalPages, 
      this.lastItemIndex, 
      this.results});

  QuotesResponseModel.fromJson(dynamic json) {
    count = json["count"];
    totalCount = json["totalCount"];
    page = json["page"];
    totalPages = json["totalPages"];
    lastItemIndex = json["lastItemIndex"];
    if (json["results"] != null) {
      results = [];
      json["results"].forEach((v) {
        results.add(QuotesModel.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["count"] = count;
    map["totalCount"] = totalCount;
    map["page"] = page;
    map["totalPages"] = totalPages;
    map["lastItemIndex"] = lastItemIndex;
    if (results != null) {
      map["results"] = results.map((v) => v.toJson()).toList();
    }
    return map;
  }

}