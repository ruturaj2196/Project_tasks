import 'package:flutter/material.dart';
// import 'package:postgres/postgres.dart';

void main(List<String> args) {
  return runApp(const Delete());
}

class Delete extends StatefulWidget {
  const Delete({Key? key}) : super(key: key);

  @override
  State<Delete> createState() => _DeleteState();
}

class _DeleteState extends State<Delete> {
  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: const Icon(Icons.delete),
      color: Colors.red,
      onPressed: deleteDialog,
    );
  }

  Future<String?> deleteDialog() => showDialog<String>(
        context: context,
        builder: (context) => AlertDialog(
          title: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              Text(
                'Delete Data.',
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
              ),
              Text('Are you sure ?'),
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
            )
          ],
        ),
      );
}
