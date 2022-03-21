class PublicationModel {
  late String image;
  late int likeCount;

  PublicationModel({required image, required likeCount});

  PublicationModel.fromJson(Map<String, dynamic> json) {
    image = json['image'];
    likeCount = json['likeCount'];
  }
}
