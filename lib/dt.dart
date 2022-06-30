import 'package:flutter/material.dart';
import 'package:postgres/postgres.dart';

void main(List<String> args) {
  return runApp(const SaveRunminutesTable());
}

class SaveRunminutesTable extends StatefulWidget {
  const SaveRunminutesTable({Key? key}) : super(key: key);

  @override
  State<SaveRunminutesTable> createState() => _SaveRunminutesTableState();
}

class _SaveRunminutesTableState extends State<SaveRunminutesTable> {
  List<TableData> runtimeList = [];
  List<WorkCenter> workCenterList = [];
  String productcode = "";
  @override
  void initState() {
    super.initState();
    //getWorkCenterValue();
    getDataForRuntimeTable();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: const Color.fromARGB(255, 188, 214, 222),
        appBar: AppBar(
          leading: IconButton(
            icon: const Icon(Icons.arrow_back_ios, color: Colors.white),
            onPressed: () {
              // Navigator.push(
              //   context,
              //   MaterialPageRoute(builder: (context) {},),
              // );
            },
          ),
          flexibleSpace: Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topRight,
                end: Alignment.bottomLeft,
                colors: [Colors.blue, Colors.red],
              ),
            ),
            child: Row(
              children: [
                Container(
                  padding: const EdgeInsets.only(left: 50, top: 20),
                  height: 250,
                  child: const Center(
                    child: Text("Update runtime table",
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 27)),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.only(left: 845, top: 20),
                  child: IconButton(
                    icon: const Icon(
                      Icons.search_outlined,
                      color: Colors.white,
                      size: 35,
                    ),
                    onPressed: () {
                      // Navigator.push(
                      //   context,
                      //   MaterialPageRoute(builder: (context) => const AddNew()),
                      // );
                    },
                  ),
                ),
                Container(
                  padding: const EdgeInsets.only(top: 20),
                  child: IconButton(
                    icon: const Icon(
                      Icons.account_circle,
                      color: Colors.white,
                      size: 35,
                    ),
                    onPressed: () {
                      // Navigator.push(
                      //   context,
                      //   MaterialPageRoute(builder: (context) => const AddNew()),
                      // );
                    },
                  ),
                ),
                Container(
                  padding: const EdgeInsets.only(top: 20),
                  child: PopupMenuButton(
                    icon: const Icon(
                      Icons.logout_outlined,
                      color: Colors.white,
                      size: 35,
                    ),
                    itemBuilder: (context) {
                      return [
                        PopupMenuItem(
                          value: 'Logout',
                          child: TextButton(
                            child: const Text(
                              "LogOut",
                              style: TextStyle(color: Colors.black),
                            ),
                            onPressed: () {
                              // Navigator.push(
                              //   context,
                              //   MaterialPageRoute(
                              //       builder: (context) => const AddNew()),
                              // );
                            },
                          ),
                        ),
                        PopupMenuItem(
                          value: 'Cancel',
                          child: TextButton(
                            child: const Text(
                              "Cancel",
                              style: TextStyle(color: Colors.black),
                            ),
                            onPressed: () {
                              // Navigator.push(
                              //   context,
                              //   MaterialPageRoute(
                              //       builder: (context) =>
                              //           CheckAvailableTime()),
                              // );
                            },
                          ),
                        ),
                      ];
                    },
                    onSelected: (String value) {},
                  ),
                ),
              ],
            ),
          ),
        ),
        body: Container(
          padding: const EdgeInsets.only(top: 20, left: 20, right: 20),
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: DataTable(
                  border: TableBorder.all(
                    width: 2.0,
                    color: Colors.black,
                  ),
                  //dataTextStyle: TextStyle(fontSize: 2),
                  dataRowColor:
                      MaterialStateColor.resolveWith((states) => Colors.white),
                  headingRowColor: MaterialStateColor.resolveWith(
                      (states) => const Color.fromARGB(255, 98, 144, 170)),
                  headingTextStyle: const TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 13),
                  decoration:
                      BoxDecoration(borderRadius: BorderRadius.circular(15)),
                  columns: const [
                    DataColumn(label: Text("PO Number")),
                    DataColumn(label: Text("Line Number")),
                    DataColumn(label: Text("Product Code")),
                    DataColumn(label: Text("VMC")),
                    DataColumn(label: Text("Hartford")),
                    DataColumn(label: Text("Lathe")),
                    DataColumn(label: Text("DMG")),
                    DataColumn(label: Text("Mazak")),
                    DataColumn(label: Text("Variaxis")),
                    DataColumn(label: Text("CNCLathe")),
                    DataColumn(label: Text("Milling")),
                    DataColumn(label: Text("")),
                  ],
                  rows: runtimeList
                      .map(
                        (tableData) => DataRow(
                          cells: [
                            DataCell(
                              Text(
                                tableData.poNum.toString(),
                              ),
                            ),
                            DataCell(
                              Text(
                                tableData.lineitemnumber.toString(),
                              ),
                            ),
                            DataCell(
                              Text(
                                tableData.productCode.toString(),
                              ),
                            ),
                            DataCell(
                              TextField(
                                controller: TextEditingController(
                                    text: tableData.vmc.toString()),
                                keyboardType: TextInputType.number,
                                onChanged: (value) {
                                  debugPrint(value);
                                },
                              ),
                            ),
                            DataCell(
                              TextField(
                                controller: TextEditingController(
                                    text: tableData.hartford.toString()),
                                keyboardType: TextInputType.number,
                                onChanged: (value) {
                                  debugPrint(value);
                                },
                              ),
                            ),
                            DataCell(
                              TextField(
                                controller: TextEditingController(
                                    text: tableData.lathe.toString()),
                                keyboardType: TextInputType.number,
                                onChanged: (value) {
                                  debugPrint(value);
                                },
                              ),
                            ),
                            DataCell(
                              TextField(
                                controller: TextEditingController(
                                    text: tableData.dmg.toString()),
                                keyboardType: TextInputType.number,
                                onChanged: (value) {
                                  debugPrint(value);
                                },
                              ),
                            ),
                            DataCell(
                              TextField(
                                controller: TextEditingController(
                                    text: tableData.mazak.toString()),
                                keyboardType: TextInputType.number,
                                onChanged: (value) {
                                  debugPrint(value);
                                },
                              ),
                            ),
                            DataCell(
                              TextField(
                                controller: TextEditingController(
                                    text: tableData.variaxis.toString()),
                                keyboardType: TextInputType.number,
                                onChanged: (value) {
                                  debugPrint(value);
                                },
                              ),
                            ),
                            DataCell(
                              TextField(
                                controller: TextEditingController(
                                    text: tableData.cnclathe.toString()),
                                keyboardType: TextInputType.number,
                                onChanged: (value) {
                                  debugPrint(value);
                                },
                              ),
                            ),
                            DataCell(
                              TextField(
                                controller: TextEditingController(
                                    text: tableData.milling.toString()),
                                keyboardType: TextInputType.number,
                                onChanged: (value) {
                                  debugPrint(value);
                                },
                              ),
                            ),
                            DataCell(
                              ElevatedButton(
                                onPressed: () {
                                  // editButtonDialouge();
                                  // productcode =
                                  //     tableData.productCode.toString();
                                },
                                child: const Text("Save"),
                              ),
                            ),
                          ],
                        ),
                      )
                      .toList()),
            ),
          ),
        ),
      ),
    );
  }

  // Edit Button Code
  Future<void> editButtonDialouge() async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return StatefulBuilder(builder: (context, setState) {
          return AlertDialog(
            title: const Text('Assign runtime minutes to workcentre'),
            content: SingleChildScrollView(
              child: SizedBox(
                child: Column(children: [
                  Row(
                    children: [
                      const SizedBox(
                        width: 100,
                        child: Text("Product Code :"),
                      ),
                      SizedBox(
                        width: 300,
                        child: TextFormField(
                          controller: TextEditingController(text: productcode),
                          readOnly: true,
                          keyboardType: TextInputType.number,
                          decoration: const InputDecoration(
                            border: OutlineInputBorder(),
                          ),
                        ),
                      ),
                      Container(
                        width: 115,
                        padding: const EdgeInsets.only(left: 10),
                        child: const Text("Description : "),
                      ),
                      SizedBox(
                        width: 300,
                        child: TextFormField(
                          keyboardType: TextInputType.number,
                          decoration: const InputDecoration(
                            border: OutlineInputBorder(),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: DataTable(
                            border: TableBorder.all(
                              width: 2.0,
                              color: Colors.black,
                            ),
                            //dataTextStyle: TextStyle(fontSize: 2),
                            dataRowColor: MaterialStateColor.resolveWith(
                                (states) =>
                                    const Color.fromARGB(255, 186, 217, 212)),
                            headingRowColor: MaterialStateColor.resolveWith(
                                (states) =>
                                    const Color.fromARGB(255, 12, 187, 178)),
                            headingTextStyle: const TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                                fontSize: 13),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15)),
                            columns: const [
                              DataColumn(label: Text("Sr Number")),
                              DataColumn(label: Text("Work Centre Id")),
                              DataColumn(label: Text("Description")),
                              DataColumn(label: Text("Runtime Minutes")),
                            ],
                            rows: workCenterList
                                .map(
                                  (workCentre) => DataRow(
                                    cells: [
                                      DataCell(
                                        Text(
                                          workCentre.srnumber.toString(),
                                        ),
                                      ),
                                      DataCell(
                                        Text(
                                          workCentre.id,
                                        ),
                                      ),
                                      DataCell(
                                        Text(
                                          workCentre.name,
                                        ),
                                      ),
                                      DataCell(
                                        TextFormField(
                                          keyboardType: TextInputType.number,
                                        ),
                                      )
                                    ],
                                  ),
                                )
                                .toList()),
                      ),
                    ],
                  )
                ]),
              ),
            ),
            actions: <Widget>[
              TextButton(
                child: const Text('Cancel'),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
              TextButton(
                child: const Text('Submit'),
                onPressed: () {},
              ),
            ],
          );
        });
      },
    );
  }

  // For Work Centre list
  Future<void> getWorkCenterValue() async {
    workCenterList = [];
    var connection = PostgreSQLConnection("192.168.0.231", 5432, "ERPDBX",
        username: "postgres", password: "datta@123");

    await connection.open();
    debugPrint("Connected......................!");
    final test = await connection.query(
        "SELECT id, workcentrecode FROM ppc.wr_workcentre ORDER BY id ASC",
        substitutionValues: {"aValues": 2});
    setState(() {
      int i = 10, j = 0;
      for (final row in test) {
        workCenterList
            .add(WorkCenter(id: row[0], name: row[1], srnumber: j + i));
        i += 10;
      }
      debugPrint(workCenterList.toString());
    });
    await connection.close();
    debugPrint("Disconnected");
  }

  // For Assign runtime table data
  Future<void> getDataForRuntimeTable() async {
    runtimeList = [];
    var connection = PostgreSQLConnection("192.168.0.231", 5432, "ERPDBX",
        username: "postgres", password: "datta@123");

    await connection.open();
    debugPrint("Connected......................!");
    final test = await connection.query("""select
          referancedocumentnumber as po_no,
        --  referancedocumentdate as po_date,
          px.lineitemnumber,
          pp.code as product_code,
          orderedqty
        --  pr.runtimemins
         -- (case when wc.workcentrecode = 'Lathe' then pr.runtimemins * px.pendingqty else 0 end) as Lathe,
         -- (case when wc.workcentrecode = 'CNCLathe' then pr.runtimemins * px.pendingqty else 0 end) as CNCLathe,
         -- (case when wc.workcentrecode = 'Milling' then pr.runtimemins * px.pendingqty else 0 end) as Milling,
         -- (case when wc.workcentrecode = 'VMC' then pr.runtimemins * px.pendingqty else 0 end) as VMC,
         -- (case when wc.workcentrecode = 'Variaxis' then pr.runtimemins * px.pendingqty else 0 end) as Variaxis,
         -- (case when wc.workcentrecode = 'Mazak' then pr.runtimemins * px.pendingqty else 0 end) as Mazak,
         -- (case when wc.workcentrecode = 'DMG' then pr.runtimemins * px.pendingqty else 0 end) as DMG,
          --(case when wc.workcentrecode = 'Hartford' then pr.runtimemins * px.pendingqty else 0 end) as Hartford

          from (
          select document_number, documentdate, referancedocumentnumber, referancedocumentdate, lineitemnumber ,product_id, quantity as orderedqty, supplied as suppliedqty, pending as pendingqty
          from data.vw_ss_customer_pendingpo po
          where duedate >= /**/'2022-03-20'/**/ and duedate <= /**/'2022-03-26'/**/
          ) px
          join data.pd_product pp on (pp.id = product_id)
          left outer join ppc.pd_product_workcentreroute pr on (pr.product_id = px.product_id)
          join ppc.wr_workcentre wc on (wc.id = pr.wr_workcentre_id)
          order by po_no
""", substitutionValues: {"aValues": 2});
    setState(() {
      double vmc = 0,
          hartford = 0,
          lathe = 0,
          dmg = 0,
          mazak = 0,
          variaxis = 0,
          cnclathe = 0,
          milling = 0;
      for (final row in test) {
        runtimeList.add(TableData(
            poNum: row[0],
            lineitemnumber: row[1],
            productCode: row[2],
            vmc: vmc,
            hartford: hartford,
            lathe: lathe,
            dmg: dmg,
            mazak: mazak,
            variaxis: variaxis,
            cnclathe: cnclathe,
            milling: milling));
      }
      //debugPrint(runtimeList.toString());
    });
    await connection.close();
    debugPrint("Disconnected");
  }
}

class WorkCenter {
  String id;
  String name;
  int srnumber;

  WorkCenter({required this.id, required this.name, required this.srnumber});

  startsWith(String s) {}

  @override
  String toString() {
    return name;
  }
}

class TableData {
  String poNum, productCode;
  int lineitemnumber;
  double vmc, hartford, lathe, dmg, mazak, variaxis, cnclathe, milling;

  TableData(
      {required this.poNum,
      required this.lineitemnumber,
      required this.productCode,
      required this.vmc,
      required this.hartford,
      required this.lathe,
      required this.dmg,
      required this.mazak,
      required this.variaxis,
      required this.cnclathe,
      required this.milling});
}
