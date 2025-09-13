import 'package:flutter/material.dart';

import '../../../../../core/constants/string_constants.dart';
import '../../../../create_form/presentation/pages/form_tab_controler_page.dart';

class FormsPage extends StatelessWidget {
  const FormsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => const FormTabController()));
        },
        child: const Icon(
          Icons.add,
          color: Colors.white,
        ),
      ),
      body: const Center(
        child: Text(AppCreateFormString.formPage),
      ),
    );
  }
}
