import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:inteligent_forms/core/constants/app_number_constants.dart';
import 'package:inteligent_forms/core/constants/font_constants.dart';
import 'package:inteligent_forms/core/constants/string_constants.dart';
import 'package:inteligent_forms/core/shared_widgets/my_snack_bar.dart';
import 'package:inteligent_forms/features/authentication/presentation/bloc/authentication_bloc/authentication_bloc.dart';

import '../../../../../core/background_widgets/create_field_background_widget.dart';
import '../../../../../core/constants/other_constants.dart';
import '../../../../../core/shared_widgets/app_sized_boxes.dart';
import '../../bloc/profile_bloc.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          title: const Text('Profile'),
          actions: [
            IconButton(
              icon: const Icon(Icons.logout),
              onPressed: () {
                context.read<AuthenticationBloc>().add(
                      const LogoutEvent(),
                    );
              },
            )
          ],
        ),
        body: CreateFieldBackGroundWidget(
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: AppNumberConstants.pageHorizontalPadding,
              vertical: AppNumberConstants.pageVerticalPadding,
            ),
            child: BlocConsumer<ProfileBloc, ProfileState>(
              listener: (context, state) {
                if (state is ProfileError) {
                  showMySnackBar(context, state.message);
                }
              },
              builder: (context, state) {
                return Column(
                  children: [
                    if (state is ProfileLoading)
                      CircularProgressIndicator(
                        color: Theme.of(context).colorScheme.onSecondary,
                      ),
                    if (state is ProfileLoaded)
                      Card(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(
                            AppNumberConstants.longTileRadius,
                          ),
                        ),
                        child: Padding(
                          padding: EdgeInsets.all(
                              AppNumberConstants.mediumTilePadding),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const SizedBox(
                                width: double.infinity,
                              ),
                              Row(
                                children: [
                                  CircleAvatar(
                                    radius: 27,
                                    backgroundColor:
                                        Theme.of(context).colorScheme.secondary,
                                    child: const CircleAvatar(
                                      radius: 25,
                                      backgroundImage: AssetImage(
                                        OtherConstants.formImage,
                                      ),
                                    ),
                                  ),
                                  AppSizedBoxes.kHSmallBox(),
                                  Text(
                                    '${AppStringConstants.name} ${AppStringConstants.colon} ${state.profileEntity.name}',
                                    style: TextStyle(
                                      fontSize: FontConstants.largeFontSize,
                                    ),
                                  ),
                                ],
                              ),
                              const Divider(
                                thickness: 1,
                              ),
                              AppSizedBoxes.kSmallBox(),
                              Text(
                                '${AppStringConstants.accountType}${AppStringConstants.colon} ${state.profileEntity.accountType}',
                                style: TextStyle(
                                  fontSize: FontConstants.smallFontSize,
                                ),
                              ),
                              Text(
                                '${AppStringConstants.address} ${AppStringConstants.colon} ${state.profileEntity.address}',
                                style: TextStyle(
                                  fontSize: FontConstants.smallFontSize,
                                ),
                              ),
                              Text(
                                '${AppStringConstants.email}${AppStringConstants.colon} ${state.profileEntity.email}',
                                style: TextStyle(
                                  fontSize: FontConstants.smallFontSize,
                                ),
                              ),
                              if (state.profileEntity.fiscalCode.isNotEmpty)
                                Text(
                                  '${AppStringConstants.fiscalCode}${AppStringConstants.colon} ${state.profileEntity.fiscalCode}',
                                  style: TextStyle(
                                    fontSize: FontConstants.smallFontSize,
                                  ),
                                ),
                            ],
                          ),
                        ),
                      ),
                  ],
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
