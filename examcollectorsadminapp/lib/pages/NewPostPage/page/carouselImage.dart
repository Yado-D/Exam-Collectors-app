
import 'package:examcollectorsadminapp/auth/firebaseExamPostingAuth.dart';
import 'package:examcollectorsadminapp/auth/uploadingImage.dart';
import 'package:examcollectorsadminapp/utils/AppColorCollections.dart';
import 'package:examcollectorsadminapp/utils/pickImages.dart';
import 'package:examcollectorsadminapp/widgets/allCommonWidgets.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class carouselPostImage extends StatefulWidget {
  const carouselPostImage({super.key});

  @override
  State<carouselPostImage> createState() => _carouselPostImageState();
}

class _carouselPostImageState extends State<carouselPostImage> {

  List<String> carouselImages= [];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorCollections.PrimaryColor,
      body: Column(
        children: [
          Container(
            margin: const EdgeInsets.only(top: 20),
            height: 80,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
              color: ColorCollections.WhiteColor,
              borderRadius: const BorderRadius.only(
                bottomLeft: Radius.circular(40),
                bottomRight: Radius.circular(40),
              ),
            ),
            child: Row(
              children: [
                IconButton(
                  onPressed: (){
                    Navigator.pop(context);
                  },
                    icon:const Icon(Icons.arrow_back,),
                ),
                Center(
                  child: ReusableText(
                    TextString: 'Carousel Slider Image Post',
                    FontSize: 20,
                    TextColor: ColorCollections.SecondaryColor,
                  ),
                ),
              ],
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                margin: const EdgeInsets.only(right: 15),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: ColorCollections.TeritiaryColor,
                ),
                child: Row(
                  children: [
                    Center(
                      child: ReusableText(
                        TextString: "CarouselImage",
                        FontSize: 20,
                      ),
                    ),
                    IconButton(
                      onPressed: () async {
                        final image = await pickedImages(ImageSource.gallery);
                        if (image != null) {
                          String url = await uploadingimage('product', image);
                          setState(() {
                            carouselImages.add(url);
                          });
                        }
                      },
                      icon: Icon(Icons.add_a_photo, color: ColorCollections.WhiteColor),
                    ),
                  ],
                ),
              ),
            ],
          ),

          // Center(
          //   child: MaterialButton(
          //     color: ColorCollections.WhiteColor,
          //     onPressed: () {
          //       if (carouselImages != null && aModel.txt.isNotEmpty && aModel.videoLink.isNotEmpty) {
          //         setState(() {
          //           print(aModel.image);
          //           print(aModel.videoLink);
          //           ExamAnswer.add(aModel);
          //           aModel = answerModel(txt: '', videoLink: '', image: null); // Reset after adding
          //         });
          //       }
          //     },
          //     child: ReusableText(TextString: 'Add', FontSize: 20),
          //   ),
          // ),
          Container(
            margin: const EdgeInsets.all(10),
            height: 300,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: ColorCollections.GreyColor,
            ),
            child: carouselImages.isNotEmpty
                ? ListView.builder(
              itemCount: carouselImages.length,
              itemBuilder: (context, index) {
                return Container(
                  margin: const EdgeInsets.all(10),
                  height: 100,
                  color: ColorCollections.WhiteColor,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Image.network(carouselImages[index], height: 70, width: 80),
                      IconButton(
                        onPressed: () {
                          setState(() {
                            carouselImages.removeAt(index);
                          });
                        },
                        icon: const Icon(Icons.delete),
                      ),
                    ],
                  ),
                );
              },
            )
                : const Center(
              child: Icon(
                Icons.add_a_photo,
                size: 60,
                color: Colors.white,
              ),
            ),
          ),

          // Submit and cancel buttons
          const SizedBox(height: 40),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              InkWell(
                onTap: () {
                  Navigator.of(context).pop();
                },
                child: Center(
                  child: Container(
                    margin: const EdgeInsets.only(right: 30),
                    height: 50,
                    width: 130,
                    decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                          blurRadius: 7,
                          offset: const Offset(5, 5),
                          color: ColorCollections.TeritiaryColor,
                          blurStyle: BlurStyle.inner,
                        ),
                      ],
                      color: Colors.green,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Center(
                      child: ReusableText(
                        TextString: 'Cancel',
                        FontSize: 20,
                        TextColor: ColorCollections.WhiteColor,
                      ),
                    ),
                  ),
                ),
              ),
              InkWell(
                onTap: () async {
                  if (carouselImages.isNotEmpty) {
                    String res = await AuthMethod().carouselImagePost(
                      carouselImage: carouselImages,
                    );
                    print(res);
                    if (res == "successfull") {
                      Navigator.of(context).pushNamed('/result_page');
                      print("$res posted");
                    }
                  } else {
                    print("No image selected");
                  }
                },
                child: Center(
                  child: Container(
                    margin: const EdgeInsets.only(right: 30),
                    height: 50,
                    width: 130,
                    decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                          blurRadius: 7,
                          offset: const Offset(5, 5),
                          color: ColorCollections.TeritiaryColor,
                          blurStyle: BlurStyle.inner,
                        ),
                      ],
                      color: Colors.red.shade700,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Center(
                      child: ReusableText(
                        TextString: 'SUBMIT',
                        FontSize: 20,
                        TextColor: ColorCollections.WhiteColor,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
