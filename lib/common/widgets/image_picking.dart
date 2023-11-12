import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:image_picker/image_picker.dart';
import 'package:projject/common/reusablealert.dart';
import 'package:projject/provider/profileImageProvider.dart';
import 'package:projject/screens/HomeScreen/three%20pages/profile.dart';
import 'package:provider/provider.dart';

class ImagePickProfile {
  static ImagePicker picker = ImagePicker();
  static XFile? imagePath;

  static BottomSheet(BuildContext context) {
    ProfileImageProvider profileImageProvider =
        Provider.of<ProfileImageProvider>(context, listen: false);

    showModalBottomSheet(
      context: context,
      builder: (context) {
        return Column(
          children: [
            ListTile(
              leading: Icon(Icons.image),
              title: Text("Select Image"),
              onTap: () async {
                imagePath = await picker.pickImage(source: ImageSource.gallery);

                if (imagePath != null) {
                  profileImageProvider.selectImage(imagePath!);

                  if (context.mounted) {
                    Navigator.of(context).pop();
                  }
                } else {
                  if (context.mounted) {
                    reusableSnackbar.showSnackBar(context, "Task failed");
                    Navigator.of(context).pop();
                  }
                }
              },
            ),
          ],
        );
      },
    );
  }
}
