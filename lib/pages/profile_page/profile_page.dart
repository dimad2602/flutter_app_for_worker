import 'package:flutter/material.dart';
import 'package:flutter_app_for_worker/components/custom_app_bar.dart';

import '../../utils/app_colors.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: AppColors.mainColor,
      appBar: CustomAppBar(label: 'Профиль'),
      body: Center(child: Text('dfgert')),
    );
  }
}