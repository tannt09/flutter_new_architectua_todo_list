import 'dart:developer';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_new_architectua/core/bloc/profile/profile_bloc.dart';
import 'package:flutter_new_architectua/main.dart';
import 'package:flutter_svg/svg.dart';
import 'package:image_picker/image_picker.dart';
import 'package:logging/logging.dart';

class EditAvatarWidget extends StatefulWidget {
  final String avatarUrl;
  const EditAvatarWidget({super.key, required this.avatarUrl});

  @override
  State<EditAvatarWidget> createState() => _EditAvatarWidgetState();
}

class _EditAvatarWidgetState extends State<EditAvatarWidget> {
  XFile? _mediaFile;

  final ImagePicker _picker = ImagePicker();
  final Logger _logger = Logger('CartPage');

  @override
  void initState() {
    super.initState();
    Logger.root.level = Level.ALL; // Set the root logger level
    Logger.root.onRecord.listen((record) {
      // You can customize the log output format here
      log('${record.level.name}: ${record.time}: ${record.message}');
    });
  }

  void _setImageFileFromFile(XFile? value) {
    if (value == null) return;
    _mediaFile = value;
    blocProfile.add(SaveAvatarPathEvent(path: value.path));
  }

  Future<void> _onImageButtonPressed(
    ImageSource source, {
    required BuildContext context,
  }) async {
    if (context.mounted) {
      try {
        final XFile? pickedFile = await _picker.pickImage(source: source);
        setState(() {
          _setImageFileFromFile(pickedFile);
        });
      } catch (e) {
        _logger.severe('----Error $e');
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 10),
      alignment: Alignment.center,
      child: Stack(
        children: [
          GestureDetector(
            onTap: () {
              _onImageButtonPressed(ImageSource.gallery, context: context);
            },
            child: CircleAvatar(
              radius: 60,
              backgroundImage: _mediaFile != null
                  ? FileImage(File(_mediaFile!.path))
                  : NetworkImage(widget.avatarUrl) as ImageProvider,
            ),
          ),
          Positioned(
            right: 4,
            bottom: 4,
            child: SvgPicture.asset('assets/icons/camera_icon.svg'),
          )
        ],
      ),
    );
  }
}

typedef OnPickImageCallback = void Function(
    double? maxWidth, double? maxHeight, int? quality, int? limit);
