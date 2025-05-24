import 'package:appwrite/enums.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:real_state_app/data/repository/authentication_repository.dart';
import 'package:real_state_app/utilis/constants/colors.dart';
import 'package:real_state_app/utilis/constants/images.dart';
import 'package:real_state_app/utilis/constants/sizes.dart';
import 'package:real_state_app/utilis/constants/texts.dart';

class MTextIconButton extends StatelessWidget {
  const MTextIconButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final auth = Provider.of<AuthenticationRepository>(context);
    return Container(
      width: 420,
      padding: const EdgeInsets.symmetric(
        vertical: 8.0,
      ),
      decoration: BoxDecoration(
        boxShadow: const [
          BoxShadow(
            color: Color(0x338a8d90), // Adjust opacity and darkness as needed
            blurRadius: 10,
            spreadRadius: 2,
            offset: Offset(0, 4), // Adjust for realistic depth
          )
        ],
        color: Colors.white,
        borderRadius: BorderRadius.circular(50.0),
      ),
      child: TextButton.icon(
        onPressed: () => auth.signInWithProvider(
            provider: OAuthProvider.google, context: context),
        label: const Text(
          MText.signUpGoogle,
          style: TextStyle(
              color: MColor.black,
              fontWeight: FontWeight.w600,
              fontSize: MSize.fontSizeMd),
        ),
        icon: const Image(
          image: AssetImage(MImage.google),
          width: 30,
          height: 30,
        ),
      ),
    );
  }
}
