import 'package:flutter/material.dart';
import 'package:login_app/db/db_function.dart';
import 'package:login_app/screen/screen_login.dart';

import '../model/data_model.dart';

class ScreenHome extends StatelessWidget {
  const ScreenHome({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => const ScreenLogin(),
              ));
            },
            icon: const Icon(
              Icons.logout,
              size: 30,
            ),
          ),
        ],
      ),
      body: ValueListenableBuilder(
        valueListenable: userListNotifier,
        builder: (BuildContext ctx, List<UserModel> userList, Widget? child) {
          return ListView.separated(
              itemBuilder: (BuildContext context, int index) {
                final data = userList[index];
                return Card(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ListTile(
                      title: Text(data.name),
                    ),
                  ),
                );
              },
              separatorBuilder: (ctx, index) {
                return const SizedBox(
                  height: 10,
                );
              },
              itemCount: userList.length);
        },
      ),
    );
  }
}
