import 'package:flutter/material.dart';
import 'package:vc/theme/constant/sized.dart';

class CustomDismissble extends StatelessWidget {
  final Widget child;
  const CustomDismissble({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Dismissible(
      key: const Key('2'),
      direction: DismissDirection.startToEnd,
      confirmDismiss: (direction) async {
        return await showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
              ),
              title: const Text("Confirm"),
              content: const Text("Are you sure you wish to delete this chat?"),
              actions: <Widget>[
                TextButton(
                    onPressed: () => Navigator.of(context).pop(true),
                    child: const Text("DELETE")),
                TextButton(
                  onPressed: () => Navigator.of(context).pop(false),
                  child: const Text("CANCEL"),
                ),
              ],
            );
          },
        );
      },
      background: Container(
        alignment: Alignment.centerLeft,
        margin: const EdgeInsets.symmetric(horizontal: 3),
        padding: const EdgeInsets.only(left: 20),
        decoration: BoxDecoration(
          color: Colors.redAccent.withOpacity(0.8),
          borderRadius: BorderRadius.circular(10),
        ),
        child: const Icon(
          Icons.delete,
          color: Colors.white,
          size: 65,
        ),
      ),
      child: child,
    );
  }
}
