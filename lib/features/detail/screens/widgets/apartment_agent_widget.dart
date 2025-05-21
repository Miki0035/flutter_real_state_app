import 'package:flutter/material.dart';
import 'package:real_state_app/common/widgets/container/avatar_circular_image_container.dart';
import 'package:real_state_app/utilis/constants/sizes.dart';

class MApartmentAgentContainer extends StatelessWidget {
  const MApartmentAgentContainer({
    super.key,
    required this.agentName,
    required this.relation,
    required this.agentImage,
  });

  final String agentName;
  final String relation;
  final String agentImage;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: [
          MAvatarCircular(
            image: agentImage,
            width: 55,
            height: 55,
          ),
          const SizedBox(
            width: 8.0,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(agentName,
                  style: const TextStyle(
                      fontWeight: FontWeight.w600, fontSize: MSize.fontSizeMd)),
              Text(
                relation,
                style: const TextStyle(fontSize: MSize.fontSizeSm),
              ),
            ],
          )
        ],
      ),
    );
  }
}
