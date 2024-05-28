import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';

import '../../../../core/utils/styles/dimensions/ui_dimensions.dart';

class ShowAppSettingMessage extends StatelessWidget {
  const ShowAppSettingMessage({super.key});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      contentPadding: const EdgeInsets.fromLTRB(20, 20, 20, 0.0),
      actionsPadding: const EdgeInsets.all(20),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      content: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          const Text(
            "Use location services",
            style: TextStyle(
              fontSize: 18,
            ),
            textAlign: TextAlign.center,
          ),
          UIDimensions.verticalSpaceMedium,
          Text(
            "Location services are not available.\nPlease turn on location services in ‘Settings > Weather Darwinbox > Location’ on your device.",
            style: TextStyle(
              color: Colors.grey[500],
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
      actions: [
        Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 20,
          ),
          child: TextButton(
            style: ButtonStyle(
              foregroundColor:
                  WidgetStateProperty.all(Theme.of(context).primaryColor),
              textStyle: WidgetStateProperty.all(const TextStyle(fontSize: 16)),
            ),
            onPressed: () {
              Navigator.of(context).pop();
              openAppSettings();
            },
            child: const Text('Go to Settings'),
          ),
        ),
      ],
    );
  }
}
