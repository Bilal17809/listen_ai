import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../../core/constant/constant.dart';
import '../../../../../core/theme/app_styles.dart';
import '../../controller/listen_controller.dart';

class BottomAudioControls extends StatelessWidget {
  final ListenController controller;

  const BottomAudioControls({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        bottom: MediaQuery.of(context).padding.bottom + mobileHeight(context) * 0.02,
      ),
      child: Obx(() {
        return Container(
          padding: EdgeInsets.symmetric(
            horizontal: mobileWidth(context) * 0.04,
            vertical: mobileHeight(context) * 0.015,
          ),
          decoration: bottomControlsDecoration(context),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              SizedBox(
                height: mobileHeight(context) * 0.005,
                child: LinearProgressIndicator(
                  value: 1,
                  backgroundColor: linearProgressBackground(context),
                  valueColor: AlwaysStoppedAnimation<Color>(
                    Theme.of(context).colorScheme.primary,
                  ),
                ),
              ),
              SizedBox(height: mobileHeight(context) * 0.02),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  IconButton(
                    icon: Icon(
                      Icons.stop,
                      size: mobileWidth(context) * 0.075,
                      color: Theme.of(context).iconTheme.color,
                    ),
                    onPressed: controller.stop,
                  ),
                  SizedBox(width: mobileWidth(context) * 0.04),
                  CircleAvatar(
                    radius: mobileWidth(context) * 0.082,
                    backgroundColor: Theme.of(context).colorScheme.primary,
                    child: IconButton(
                      icon: Icon(
                        controller.isPlaying.value
                            ? Icons.pause
                            : Icons.play_arrow,
                        size: mobileWidth(context) * 0.075,
                        color: Theme.of(context).colorScheme.onPrimary,
                      ),
                      onPressed: controller.togglePlayPause,
                    ),
                  ),
                  SizedBox(width: mobileWidth(context) * 0.04),
                  IconButton(
                    icon: Icon(
                      Icons.skip_next,
                      size: mobileWidth(context) * 0.075,
                      color: Theme.of(context).iconTheme.color,
                    ),
                    onPressed: controller.stop,
                  ),
                ],
              ),
            ],
          ),
        );
      }),
    );
  }
}
