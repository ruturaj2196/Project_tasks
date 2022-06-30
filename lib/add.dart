import 'package:flutter/material.dart';
//import 'package:postgres/postgres.dart';

void main(List<String> args) {
  return runApp(const Dailog());
}

class Dailog extends StatefulWidget {
  const Dailog({Key? key}) : super(key: key);

  @override
  State<Dailog> createState() => _DailogState();
}

class _DailogState extends State<Dailog> {
  // late TextEditingController controller;

  // @override
  // void initState() {
  //   super.initState();

  //   controller = TextEditingController();
  // }

  // @override
  // void dispose() {
  //   controller.dispose();
  //   super.dispose();
  // }

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all<Color>(Colors.green),
      ),
      onPressed: addData,
      child: Row(
        children: const [
          Icon(Icons.add),
          Text(
            'Add',
            style: TextStyle(fontSize: 20),
          ),
        ],
      ),
    );
  }

  Future<String?> addData() => showDialog<String>(
        context: context,
        builder: (context) => AlertDialog(
          title: const Text('Update Field:'),
          content: Column(
            children: const [
              TextField(
                autofocus: true,
                decoration: InputDecoration(
                  hintText: 'Enter new code',
                  labelText: 'New uom Code',
                ),
                //   controller: controller,
              ),
              SizedBox(
                height: 10,
              ),
              TextField(
                autofocus: true,
                decoration: InputDecoration(
                  hintText: 'Enter new name',
                  labelText: 'New uom Name',
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
