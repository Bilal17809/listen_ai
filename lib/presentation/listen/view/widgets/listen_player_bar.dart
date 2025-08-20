import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../core/theme/theme.dart';
import '../../controller/listen_controller.dart';

class ListenPlayerBar extends StatelessWidget {
  const ListenPlayerBar({super.key});

  @override
  Widget build(BuildContext context) {
    final ListenController controller = Get.find<ListenController>();

    return Obx(() {
      final currentPosition = Duration(seconds: controller.position.value.toInt());
      final progress = controller.duration.value > 0
          ? (controller.position.value / controller.duration.value).clamp(0.0, 1.0)
          : 0.0;

      return Container(
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: Colors.yellow.withAlpha(100),
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
          ),
          boxShadow: [
            BoxShadow(
              color: greyColor.withAlpha(80),
              blurRadius: 6,
              offset: const Offset(0, -2),
            ),
          ],
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            LinearProgressIndicator(
              value: progress,
              backgroundColor: greyColor.withAlpha(50),
              color: Colors.yellow.shade700,
              minHeight: 5,
            ),
            const SizedBox(height: 10),
            Row(
              children: [
                Text(
                  "${currentPosition.inMinutes.toString().padLeft(2, '0')}:${(currentPosition.inSeconds % 60).toString().padLeft(2, '0')}",
                  style: bodySmallStyle.copyWith(color: blackTextColor),
                ),
                const Spacer(),
                IconButton(
                  icon: Icon(
                    controller.isPlaying.value ? Icons.pause_circle : Icons.play_circle,
                    size: 50,
                    color: Colors.yellow.shade700,
                  ),
                  onPressed: () {
                    if (controller.isPlaying.value) {
                      controller.pause();
                    } else {
                      controller.play();
                    }
                  },
                ),
                const Spacer(flex: 2),
              ],
            ),
          ],
        ),
      );
    });
  }
}
