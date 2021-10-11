import 'package:fichas/pages/tabs/visualizar/components/table/fichas_table.dart';
import 'package:flutter/material.dart';

class VisualizarTab extends StatelessWidget {
  const VisualizarTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: FichasTable(),
    );
  }
}
