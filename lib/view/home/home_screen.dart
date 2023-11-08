import 'package:flutter/material.dart';
import 'package:mvvm/utils/routes/routes.dart';
import 'package:mvvm/view_model/user_view_model.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final userPreferences = Provider.of<UserViewModel>(context);
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        actions: [
          InkWell(
            onTap: () {
              userPreferences.remove().then((value) {
                Navigator.pushNamed(context, RouteName.login);
              });
            },
            child: const Center(
              child: Text('Logout'),
            ),
          ),
          SizedBox(width: 20)
        ],
      ),
      body: const Center(
        child: Text("Home"),
      ),
    );
  }
}
