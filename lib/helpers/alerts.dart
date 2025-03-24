part of 'helpers.dart';

showLoader(BuildContext context) {
  showDialog(
    context: context,
    barrierDismissible: false,
    builder: (_) {
      return AlertDialog(
        title: const Text('Wait please...'),
        content: const LinearProgressIndicator(),
      );
    },
  );
}

showAlert(BuildContext context, String title, String msg) {
  showDialog(
    context: context,
    barrierDismissible: false,
    builder: (_) {
      return AlertDialog(
        title: Text(title),
        content: Text(msg),
        actions: [
          MaterialButton(
            child: Text('Ok'),
            onPressed: () => Navigator.pop(context),
          )
        ],
      );
    },
  );
}
