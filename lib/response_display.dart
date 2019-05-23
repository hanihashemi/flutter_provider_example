import 'package:flutter/material.dart';
import 'package:flutter_demo_provider/shared_state/app_state.dart';
import 'package:provider/provider.dart';

import 'model/User.dart';

class ResponseDisplay extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final appState = Provider.of<AppState>(context);
    print("====> build ResponseDisplay");

    return Container(
      padding: const EdgeInsets.all(16.0),
      child: appState.isFetching
          ? CircularProgressIndicator()
          : appState.users.isNotEmpty
              ? buildList(appState)
              : Text("Press Button above to fetch data"),
    );
  }

  ListView buildList(AppState appState) {
    print("====> build buildList");

    return ListView.builder(
      primary: false,
      shrinkWrap: true,
      itemCount: appState.users.length,
      itemBuilder: (context, index) {
        return ChangeNotifierProvider<User>.value(
          notifier: appState.users[index],
          child: UserItem(),
        );
      },
    );
  }
}

class UserItem extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    print("====> build item");

    var user = Provider.of<User>(context);

    return ListTile(
        leading: CircleAvatar(
          backgroundImage: NetworkImage(user.avatar),
        ),
        title: Text(
          user.firstName,
        ),
        trailing:
            Switch(value: user.isSelected, onChanged: (value) => user.like()));
  }
}
