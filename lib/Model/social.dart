 
class Social {
  String userId;
  String facebook;
  String whatsApp;
  String twitter;
  String instagram;
  String linkdin;
  String youtube;
  String interest;
  List<String> youtubeVideo;

  Social(
      {this.userId,
      this.facebook,
      this.whatsApp,
      this.twitter,
      this.instagram,
      this.linkdin,
      this.youtube,
      this.interest,
      this.youtubeVideo});

  Social.fromJson(Map<String, dynamic> json) {
    userId = json['userId'];
    facebook = json['facebook'];
    whatsApp = json['whatsApp'];
    twitter = json['twitter'];
    instagram = json['instagram'];
    linkdin = json['linkdin'];
    youtube = json['youtube'];
    interest = json['interest'];
    youtubeVideo = json['youtubeVideo'].cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['userId'] = this.userId;
    data['facebook'] = this.facebook;
    data['whatsApp'] = this.whatsApp;
    data['twitter'] = this.twitter;
    data['instagram'] = this.instagram;
    data['linkdin'] = this.linkdin;
    data['youtube'] = this.youtube;
    data['interest'] = this.interest;
    data['youtubeVideo'] = this.youtubeVideo;
    return data;
  }
}