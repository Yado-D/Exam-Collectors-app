


class answerModel {
  String txt;
  String? image;
  String videoLink;

  answerModel({
    required this.txt,
    required this.videoLink,
    required this.image,
  });

  Map<String, dynamic> toMap() {
    return {
      "txt": txt,
      "image": image, // Convert Uint8List to List<int>
      "videoLink": videoLink,
    };
  }
}