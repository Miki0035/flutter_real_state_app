import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_restate_app/data/repository/authentication_repository.dart';
import 'package:flutter_restate_app/utilis/constants/colors.dart';
import 'package:flutter_restate_app/utilis/constants/images.dart';
import 'package:flutter_restate_app/utilis/constants/sizes.dart';
import 'package:flutter_restate_app/utilis/constants/texts.dart';
import 'package:flutter_restate_app/utilis/networks/network_manager.dart';
import 'package:flutter_restate_app/utilis/popups/full_screen_loader.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class MTextIconButton extends StatelessWidget {
  const MTextIconButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
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
        onPressed: () async {
          MScreenNotifier.openLoadingDialog(context);
          try {
            final authRepo =
                Provider.of<AuthenticationRepository>(context, listen: false);
            final isConnected =
                await Provider.of<NetworkManager>(context, listen: false)
                    .isConnected();
            // NO INTERNET CONNECTION
            if (!isConnected && context.mounted) {
              MScreenNotifier.showSnackBar(
                  context, "Please connect to the internet",
                  backgroundColor: Colors.red);
              return;
            }
            // STARTS AUTHENTICATION
            final response = await authRepo.signInWithProvider(
                provider: OAuthProvider.google);
            if (response && context.mounted) {
              MScreenNotifier.showSnackBar(context, "Logged in successfully",
                  backgroundColor: Colors.green);
              return;
            }
          } catch (e) {
            if (context.mounted) {
              MScreenNotifier.showSnackBar(context,
                  "Problem occured while signing you in, please try again",
                  backgroundColor: Colors.redAccent);
            }
          } finally {
            if (context.mounted) {
              MScreenNotifier.stopLoadingDialog(context);
            }
          }
        },
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
