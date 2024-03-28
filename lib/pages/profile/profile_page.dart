import 'package:flutter/material.dart';
import 'package:flutter_app_for_worker/components/custom_app_bar.dart';
import 'package:flutter_app_for_worker/domain/blocs/authentication/authentication_bloc.dart';
import 'package:flutter_app_for_worker/pages/sign_in/sign_In_page.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../components/app_icon.dart';
import '../../components/big_text.dart';
import '../../locator_get.dart';
import '../../utils/app_colors.dart';
import '../../utils/constants.dart';
import '../../widgets/profile_widgets/profile_widget.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    var sizeConstants = locator.get<Constants>();
    return Scaffold(
      backgroundColor: AppColors.mainColor,
      appBar: const CustomAppBar(label: 'Профиль'),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const Divider(
              thickness: 2,
            ),
            //name
            BlocBuilder<AuthenticationBloc, AuthenticationState>(
              builder: (context, state) {
                return state.maybeWhen(authenticated: (user) {
                  return Column(
                    children: [
                      ProfileWidget(
                          appIcon: AppIcon(
                            icon: Icons.drive_file_rename_outline_outlined,
                            backgroundColor: AppColors.alertCheckColor,
                            iconColor: AppColors.redBottonColor,
                            customSize: sizeConstants.getHeight10(),
                            size: sizeConstants.getHeight20(),
                            swadowOff: false,
                          ),
                          bigText: BigText(
                              text: '${user.email} ${user.emailVerified}')),
                      SizedBox(
                        height: sizeConstants.getHeight10(),
                      ),
                      // //mail
                      ProfileWidget(
                          appIcon: AppIcon(
                            icon: Icons.mail_rounded,
                            backgroundColor: AppColors.lightGreenColor,
                            iconColor: AppColors.mainColor,
                            customSize: sizeConstants.getHeight10(),
                            size: sizeConstants.getHeight20(),
                            swadowOff: false,
                          ),
                          bigText: BigText(
                              text: '${user.email} ${user.restaurantId}')),
                      SizedBox(
                        height: sizeConstants.getHeight10(),
                      ),
                    ],
                  );
                }, orElse: () {
                  return Center(
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const BigText(text: "Вы не вошли в аккаунт"),
                          const SizedBox(
                            height: 12,
                          ),
                          FilledButton(
                            onPressed: () {
                              Navigator.of(context).push(
                                MaterialPageRoute(
                                  builder: (context) => const SignInPage(),
                                ),
                              );
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: AppColors.lightGreenColor,
                            ),
                            child: const BigText(
                              text: 'Войти в аккаунт',
                              color: Colors.black,
                            ),
                          ),
                        ]),
                  );
                });
              },
            ),
            // //telephone
            ProfileWidget(
                appIcon: AppIcon(
                  icon: Icons.phone,
                  backgroundColor: AppColors.alertCheckColor,
                  iconColor: Colors.black,
                  customSize: sizeConstants.getHeight10(),
                  size: sizeConstants.getHeight20(),
                  swadowOff: false,
                ),
                bigText: const BigText(text: 'Phone number')),
            SizedBox(
              height: sizeConstants.getHeight10(),
            ),
          ],
        ),
      ),
    );
  }
}
