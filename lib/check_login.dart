import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:valo_tips/data/provider/user_auth_state.dart';
import 'package:valo_tips/first_view.dart';
import 'package:valo_tips/view/login/login_view.dart';

class CheckLogin extends HookConsumerWidget {
  const CheckLogin({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final user = ref.watch(userAuthStateProvider);
    return user.when(
      data: (user) {
        if (user == null) {
          return const LoginView();
        } else {
          return const FirstView();
        }
      },
      loading: () => const Center(child: CircularProgressIndicator()),
      error: (error, stack) => const Center(child: Text('Error')),
    );
  }
}
