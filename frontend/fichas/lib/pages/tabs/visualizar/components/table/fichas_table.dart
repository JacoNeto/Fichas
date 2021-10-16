import 'package:fichas/controllers/fichas_controller.dart';
import 'package:fichas/controllers/table_controller.dart';
import 'package:fichas/models/ficha.dart';
import 'package:fichas/pages/tabs/visualizar/components/table_item.dart';
import 'package:fichas/utils/date_formater.dart';
import 'package:fichas/utils/my_colors.dart';
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
          future: fichaController.getAll(fichaController.pageAtual.value),
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
                  child: Column(
                children: [
                  Card(
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
                            'Email',
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
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Obx(() => IconButton(
                            onPressed: fichaController.pageAtual.value > 0
                                ? () => fichaController.previousPage()
                                : null,
                            icon: const Icon(
                              Icons.arrow_left,
                            ),
                            focusColor: colorC1,
                          )),
                      Obx(() => Text(
                            '${fichaController.pageAtual.value + 1}/${fichaController.pageData.totalPages}',
                            style: TextStyle(color: colorC1),
                          )),
                      Obx(() => IconButton(
                            onPressed: fichaController.pageAtual.value <
                                    fichaController.pageData.totalPages! - 1
                                ? () => fichaController.nextPage()
                                : null,
                            icon: const Icon(
                              Icons.arrow_right,
                            ),
                            focusColor: colorC1,
                          )),
                    ],
                  )
                ],
              )),
            );
          });
    });
  }
}
