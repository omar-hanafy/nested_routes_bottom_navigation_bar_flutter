import 'package:flutter_bloc/flutter_bloc.dart';

import '../app.dart';

final List<BlocListener<dynamic, dynamic>> blocListeners = [
  BlocListener<InternetConnectionBloc, InternetConnectionState>(listener: (context, state) {
    final ShowAlert showAlert = ShowAlert(context);
    //todo: replace snackBars instead of showing them as stack
    if (state is InternetConnected) {
      showAlert.showSnackBar(
        alert: "Connected to Internet",
      );
    } else if (state is InternetConnectionInitial) {
      showAlert.showSnackBar(
          alert: "Connecting to Internet...",
          duration: const Duration(days: 365));
    } else {
      showAlert.showSnackBar(
          alert: "Oops No Internet Connection!",
          duration: const Duration(days: 365));
    }
  }),
];
