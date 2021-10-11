import 'package:fichas/controllers/fichas_controller.dart';
import 'package:fichas/controllers/table_controller.dart';
import 'package:fichas/models/ficha.dart';
import 'package:fichas/pages/tabs/visualizar/components/table_item.dart';
import 'package:fichas/utils/date_formater.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FichasTable extends StatelessWidget {
  FichasTable({Key? key}) : super(key: key);

  final FichaController fichaController = Get.put(FichaController());
  final TableController tableController = Get.put(TableController());

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      if (tableController.selected.value) {
        return TableItem(ficha: tableController.fichaAtual);
      }
      return FutureBuilder<List<Ficha>>(
          future: fichaController.getAll(0, 10),
          builder: (context, snapshot) {
            if (!snapshot.hasData) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
            print("ALIMENTO" + snapshot.data!.toString());
            return Align(
              alignment: Alignment.topCenter,
              child: SingleChildScrollView(
                  child: Card(
                child: DataTable(
                  showCheckboxColumn: false,
                  columns: const <DataColumn>[
                    DataColumn(
                      label: Text(
                        'Nome',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                    DataColumn(
                      label: Text(
                        'CPF',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                    DataColumn(
                      label: Text(
                        'Criada em',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                    DataColumn(
                      label: Text(
                        'Modificada em',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                  ],
                  rows: snapshot.data!
                      .map(
                        ((element) => DataRow(
                              onSelectChanged: (selected) {
                                if (selected == true) {
                                  tableController.selected.value = false;
                                  tableController.selectedFicha(element);
                                }
                              },
                              cells: <DataCell>[
                                DataCell(Text(element.nome!.isEmpty
                                    ? "N/A"
                                    : element.nome!)),
                                DataCell(Text(element.cpf!.isEmpty
                                    ? "N/A"
                                    : element.cpf!)),
                                DataCell(Text(DateFormat.dateFromJson(
                                    element.createdDate!))),
                                DataCell(Text(DateFormat.dateFromJson(
                                    element.lastModifiedDate!))),
                              ],
                            )),
                      )
                      .toList(),
                ),
              )),
            );
          });
    });
  }
}
