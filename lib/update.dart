import 'package:flutter/material.dart';
//import 'package:postgres/postgres.dart';

void main(List<String> args) {
  return runApp(const Update());
}

class Update extends StatefulWidget {
  const Update({Key? key}) : super(key: key);

  @override
  State<Update> createState() => _UpdateState();
}

class _UpdateState extends State<Update> {
  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: const Icon(Icons.edit),
      color: Colors.blue,
      onPressed: openDialog,
    );
  }

  Future<String?> openDialog() => showDialog<String>(
        context: context,
        builder: (context) => AlertDialog(
          title: const Text('Update Field:'),
          content: Column(
            children: const [
              TextField(
                autofocus: true,
                decoration: InputDecoration(
                  hintText: 'Enter updated code',
                  labelText: 'Uom Code',
                ),
                //   controller: controller,
              ),
              SizedBox(
                height: 10,
              ),
              TextField(
                autofocus: true,
                decoration: InputDecoration(
                  hintText: 'Enter updated name',
                  labelText: 'Uom Name',
                ),
                //  controller: controller,
              ),
            ],
          ),
          actions: [
            ElevatedButton(
              child: const Text('Submit'),
              onPressed: () {},
            ),
            TextButton(
              child: const Text('Cancel'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        ),
      );

  // void submit() {
  //   Navigator.of(context).pop(controller.text);
  // }

}
