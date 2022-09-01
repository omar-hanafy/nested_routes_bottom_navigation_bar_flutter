import 'package:flutter/material.dart';

class ShowAlert {
  final BuildContext context;

  ShowAlert(this.context);

  showSnackBar({required String alert, Duration? duration, String? label, void Function()? labelAction}) {
    final snackBar = SnackBar(
      duration: duration ?? const Duration(milliseconds: 4000),
      content: Text(alert),
      action: SnackBarAction(label: label ?? "", onPressed: labelAction ?? () {}),
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  showSuccessDialog(String alert, {bool doublePop = false}) {
    showDialog<void>(
      context: context,
      barrierDismissible: true, // false = user must tap button, true = tap outside dialog
      builder: (BuildContext dialogContext) {
        return AlertDialog(
          title: const Text('Success 👍'),
          content: Text(alert),
          actions: <Widget>[
            TextButton(
              child: const Text('Ok'),
              onPressed: () {
                Navigator.of(dialogContext).pop(); // Dismiss alert dialog
                if (doublePop) Navigator.of(dialogContext).pop();
              },
            ),
          ],
        );
      },
    );
  }

  showFailureDialog(String alert) {
    showDialog<void>(
      context: context,
      barrierDismissible: true, // false = user must tap button, true = tap outside dialog
      builder: (BuildContext dialogContext) {
        return AlertDialog(
          title: const Text('Failed 😢'),
          content: Text(alert),
          actions: <Widget>[
            TextButton(
              child: const Text('Ok'),
              onPressed: () {
                Navigator.of(dialogContext).pop(); // Dismiss alert dialog
              },
            ),
          ],
        );
      },
    );
  }

  showLoadingDialog() {
    showDialog<void>(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext dialogContext) {
        return const AlertDialog(
          scrollable: true,
          title: Text('Loading'),
          content: Center(child: CircularProgressIndicator()),
        );
      },
    );
  }
}
