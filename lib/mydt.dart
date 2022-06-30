import 'package:erpxmobile/add.dart';
import 'package:erpxmobile/delete.dart';
import 'package:erpxmobile/update.dart';
import 'package:flutter/material.dart';
import 'package:postgres/postgres.dart';

void main(List<String> args) {
  return runApp(const MyDt());
}

class MyDt extends StatefulWidget {
  const MyDt({Key? key}) : super(key: key);

  @override
  State<MyDt> createState() => _MyDtState();
}

class _MyDtState extends State<MyDt> {
  List<TableData> runtimeList = [];
  // late TextEditingController controller;

  @override
  void initState() {
    super.initState();
    getDataformTable();
    // controller = TextEditingController();
  }

  // @override
  // void dispose() {
  //   controller.dispose();
  //   super.dispose();
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        leading: const FlutterLogo(
          size: 50,
          style: FlutterLogoStyle.markOnly,
          // curve: Curves.bounceInOut,
          // duration: Duration(seconds: 5),
        ),
        flexibleSpace: Container(
          decoration: const BoxDecoration(
              gradient: LinearGradient(
            begin: Alignment.topRight,
            end: Alignment.bottomLeft,
            colors: [Colors.blue, Colors.red],
          )),
          child: Container(
            padding: const EdgeInsets.only(left: 50, top: 20),
            height: 250,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: const [
                Text(
                  "Database table",
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 27),
                ),
                Dailog(),
              ],
            ),
          ),
        ),
      ),
      body: Container(
        padding:
            const EdgeInsets.only(top: 20, left: 20, right: 20, bottom: 10),
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            children: [
              const Center(
                child: Text(
                  "Postgres Datatable",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w900),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              DataTable(
                horizontalMargin: 0,
                border: TableBorder.symmetric(),
                //dataTextStyle: TextStyle(fontSize: 2),
                // dataRowColor:
                //     MaterialStateColor.resolveWith((states) => Colors.white),
                headingRowColor:
                    MaterialStateColor.resolveWith((states) => Colors.white),
                headingTextStyle: const TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 13),
                decoration:
                    BoxDecoration(borderRadius: BorderRadius.circular(15)),
                columns: const [
                  DataColumn(label: Text("Code")),
                  DataColumn(label: Text("Name")),
                  DataColumn(label: Text("Actions")),
                ],
                rows: runtimeList
                    .map(
                      (TableData) => DataRow(
                        cells: [
                          DataCell(
                            Text(
                              TableData.code.toString(),
                            ),
                          ),
                          DataCell(
                            Text(
                              TableData.name.toString(),
                            ),
                          ),
                          DataCell(
                            Row(
                              children: const [
                                Update(),
                                SizedBox(
                                  width: 2,
                                ),
                                Delete()
                              ],
                            ),
                          ),
                        ],
                      ),
                    )
                    .toList(),
              ),
              const FlutterLogo(
                size: 100,
                style: FlutterLogoStyle.horizontal,
                curve: Curves.bounceInOut,
                duration: Duration(seconds: 5),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> getDataformTable() async {
    runtimeList = [];
    var connection = PostgreSQLConnection(
      "192.168.1.45",
      5432,
      "ERPDBX",
      username: "postgres",
      password: "RtD2?+~De1779",
    );
    await connection.open();
    debugPrint("Database Connected...");

    final test = await connection.query(
        '''select TRIM(code),TRIM(name) from data.cm_uom''',
        substitutionValues: {"aValues": 2});

    for (final row in test) {
      setState(() {
        runtimeList.add(TableData(code: row[0], name: row[1]));
      });
    }

    print(test);

    await connection.close();
    debugPrint("Disconnected");
  }
}

class TableData {
  String code, name;

  TableData({
    required this.code,
    required this.name,
  });
}
