import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class MyDrawer extends HookConsumerWidget {
  const MyDrawer({Key? key}) : super(key: key);

  Widget movePage(String title, String routeName) {
    final context = useContext();
    return ListTile(
      title: Text(title),
      onTap: () {
        Navigator.pushNamed(context, routeName);
      },
    );
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // widgets
    const Widget header = DrawerHeader(
      child: Text("Valo Tips"),
    );

    // logout button
    final Widget logoutButton = ListTile(
      leading: const Icon(Icons.logout),
      title: const Text("Logout"),
      onTap: () {
        FirebaseAuth.instance.signOut();
        Navigator.of(context).pushReplacementNamed("/login");
      },
    );
    // show logout button only if user is logged in
    final Widget logoutButtonOrEmpty = FirebaseAuth.instance.currentUser == null
        ? const SizedBox()
        : logoutButton;
    // drawer
    return Drawer(
      child: ListView(
        children: [
          header,
          movePage("投稿", "/post"),
          movePage("Tips", "/tips"),
          logoutButtonOrEmpty,
        ],
      ),
    );
  }
}
