class GetSocial {
    GetSocial({
        this.companydetails,
        this.success,
        this.msg,
    });

    List<Companydetail> companydetails;
    bool success;
    String msg;

    factory GetSocial.fromJson(Map<String, dynamic> json) => GetSocial(
        companydetails: List<Companydetail>.from(json["companydetails"].map((x) => Companydetail.fromJson(x))),
        success: json["success"],
        msg: json["msg"],
    );

    Map<String, dynamic> toJson() => {
        "companydetails": List<dynamic>.from(companydetails.map((x) => x.toJson())),
        "success": success,
        "msg": msg,
    };
}

class Companydetail {
    Companydetail({
        this.youtubeVideo,
        this.id,
        this.userId,
        this.facebook,
        this.whatsApp,
        this.twitter,
        this.instagram,
        this.linkdin,
        this.youtube,
        this.interest,
        this.v,
    });

    List<String> youtubeVideo;
    String id;
    String userId;
    String facebook;
    String whatsApp;
    dynamic twitter;
    dynamic instagram;
    String linkdin;
    String youtube;
    String interest;
    int v;

    factory Companydetail.fromJson(Map<String, dynamic> json) => Companydetail(
        youtubeVideo: List<String>.from(json["youtubeVideo"].map((x) => x)),
        id: json["_id"],
        userId: json["userId"],
        facebook: json["facebook"],
        whatsApp: json["whatsApp"],
        twitter: json["twitter"],
        instagram: json["instagram"],
        linkdin: json["linkdin"],
        youtube: json["youtube"],
        interest: json["interest"],
        v: json["__v"],
    );

    Map<String, dynamic> toJson() => {
        "youtubeVideo": List<dynamic>.from(youtubeVideo.map((x) => x)),
        "_id": id,
        "userId": userId,
        "facebook": facebook,
        "whatsApp": whatsApp,
        "twitter": twitter,
        "instagram": instagram,
        "linkdin": linkdin,
        "youtube": youtube,
        "interest": interest,
        "__v": v,
    };
}
