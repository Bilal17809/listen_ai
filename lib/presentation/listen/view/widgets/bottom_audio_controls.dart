import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../../core/theme/app_colors.dart';
import '../../controller/listen_controller.dart';

class BottomAudioControls extends StatelessWidget {
  final ListenController controller;

  const BottomAudioControls({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 60),
      child: Obx(() {
        return Container(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          decoration: BoxDecoration(
            color: kWhite,
            border: Border(
              top: BorderSide(color: greyBorderColor, width: 1),
            ),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              SizedBox(
                height: 4,
                child: LinearProgressIndicator(
                  value: 1,
                  backgroundColor: greyBorderColor,
                  valueColor: const AlwaysStoppedAnimation<Color>(Colors.amber),
                ),
              ),
              const SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  IconButton(
                    icon: const Icon(Icons.stop, size: 30),
                    onPressed: () async {
                      await controller.stop();
                    },
                  ),
                  const SizedBox(width: 16),
                  CircleAvatar(
                    radius: 28,
                    backgroundColor: Colors.amber,
                    child: IconButton(
                      icon: Icon(
                        controller.isPlaying.value
                            ? Icons.pause
                            : Icons.play_arrow,
                        size: 32,
                        color: kWhite,
                      ),
                      onPressed: () {
                        if (controller.isPlaying.value) {
                          controller.pause();
                        } else {
                          controller.play();
                        }
                      },
                    ),
                  ),
                  const SizedBox(width: 16),
                  IconButton(
                    icon: const Icon(Icons.skip_next, size: 30),
                    onPressed: () async {
                      await controller.stop();
                    },
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