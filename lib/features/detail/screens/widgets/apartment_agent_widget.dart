import 'package:flutter/material.dart';
import 'package:flutter_restate_app/common/widgets/container/avatar_circular_image_container.dart';
import 'package:flutter_restate_app/utilis/constants/sizes.dart';

class MApartmentAgentContainer extends StatelessWidget {
  const MApartmentAgentContainer({
    super.key,
    required this.agentName,
    this.relation = "",
    required this.agentImage,
    this.size = 55,  this.isNetworkImage = false,
  });
  final bool isNetworkImage;
  final String agentName;
  final String relation;
  final String agentImage;
  final double size;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        MAvatarCircular(
          image: agentImage,
          width: size,
          height: size,
          isNetworkImage: isNetworkImage,
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
            if (relation.isNotEmpty)
              Text(
                relation,
                style: const TextStyle(fontSize: MSize.fontSizeSm),
              ),
          ],
        )
      ],
    );
  }
}
