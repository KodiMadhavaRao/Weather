import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../../../../core/utils/styles/dimensions/ui_dimensions.dart';
import '../../../../../../../domain/models/weather/weather.dart';
import '../../../../../widgets/custom_network_image.dart';
import '../../../../../widgets/custom_text.dart';

class WeatherCard extends ConsumerWidget {
  final Hour hour;
  const WeatherCard({required this.hour, super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Card(
      // elevation: 0,
      // color: context.colorScheme.surfaceVariant,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(UIDimensions.radius(12))),
      child: UIDimensions.padding(
        padding: const EdgeInsets.only(left: 16, right: 8),
        child: Row(
          children: [
            Expanded(
              flex: 2,
              child: UIDimensions.padding(
                padding: const EdgeInsets.only(top: 8, bottom: 8, right: 12),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CustomText.titleMedium(
                      getTimeWithAMPM(hour.time!) ?? "",
                      maxLines: 2,
                    ),
                    CustomText.titleSmall(
                      hour.condition?.text ?? "",
                      maxLines: 1,
                    ),
                    Column(
                      children: [
                        SizedBox(
                          width: 40,
                          height: 40,
                          child: CustomNetworkImage(
                            imageUrl: "http:${hour.condition!.icon!}" ?? "",
                          ),
                        ),
                        CustomText.titleSmall(
                          "${hour.tempC}°C" ?? "",
                          maxLines: 1,
                        )
                      ],
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  String getTimeWithAMPM(String dateTimeString) {
    final parts = dateTimeString.split(' ');
    if (parts.length >= 2) {
      final time = parts[1];
      if (time.contains(':')) {
        final hour = int.tryParse(time.split(':')[0]);
        if (hour != null) {
          final meridian = hour >= 12 ? (hour == 12 ? 'PM' : 'AM') : 'AM';
          final minutes = time.split(':')[1];
          return '$hour:$minutes $meridian';
        }
      }
    }
    return "";
  }
}
