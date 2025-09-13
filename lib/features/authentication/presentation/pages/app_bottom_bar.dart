import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:inteligent_forms/core/constants/string_constants.dart';
import 'package:inteligent_forms/features/forms/presentation/pages/forms_page.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';

import '../../../fill_form/presentation/pages/main_fill_form_options_page.dart';
import '../../../profile/presentation/pages/profile_page/profile_page.dart';
import '../bloc/authentication_bloc/authentication_bloc.dart';
import '../bloc/authentication_bloc/authentication_state.dart';
import 'home_page/home_page.dart';

class AppBottomBar extends StatelessWidget {
  const AppBottomBar({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthenticationBloc, AuthenticationState>(
      listener: (context, state) {
        if (state is LogoutSuccessState) {
          Navigator.of(context).pushAndRemoveUntil(
            MaterialPageRoute<void>(
              builder: (BuildContext context) => const HomePage(),
            ),
            (route) => false,
          );
        }
      },
      child: PersistentTabView(
        context,
        // backgroundColor: Colors.transparent,
        screens: _buildScreens(),
        items: _navBarsItems(context),
      ),
    );
  }

  List<Widget> _buildScreens() {
    return [
      const MainFillFormOptionsPage(),
      const FormsPage(),
      const ProfilePage(),
    ];
  }

  List<PersistentBottomNavBarItem> _navBarsItems(BuildContext context) {
    return [
      PersistentBottomNavBarItem(
        icon: const Icon(Icons.description),
        title: (AppBarStrings.fillForm),
        activeColorPrimary: Theme.of(context).colorScheme.primary,
        inactiveColorPrimary: CupertinoColors.systemGrey,
      ),
      PersistentBottomNavBarItem(
        icon: const Icon(Icons.list),
        title: (AppBarStrings.forms),
        activeColorPrimary: Theme.of(context).colorScheme.primary,
        inactiveColorPrimary: CupertinoColors.systemGrey,
      ),
      PersistentBottomNavBarItem(
        icon: const Icon(Icons.person),
        title: (AppBarStrings.profile),
        activeColorPrimary: Theme.of(context).colorScheme.primary,
        inactiveColorPrimary: CupertinoColors.systemGrey,
      ),
    ];
  }
}
