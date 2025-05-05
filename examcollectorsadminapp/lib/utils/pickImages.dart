import 'package:image_picker/image_picker.dart';

pickedImages(ImageSource source) async {
//initialize image picker
  final ImagePicker pick = ImagePicker();

  XFile? photoshot = await pick.pickImage(
    source: source,
  );
  if (photoshot != null) {
    return photoshot.readAsBytes();
  }
}
