import 'package:fichas/pages/tabs/criar/criar_tab.dart';
import 'package:fichas/pages/tabs/visualizar/visualizar_tab.dart';
import 'package:fichas/utils/my_colors.dart';
import 'package:flutter/material.dart';

import 'components/profile.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var currentTab = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // barra de cima
        Expanded(
          flex: 2,
          child: Row(
            children: [
              // perfil
              Expanded(
                child: Container(
                  color: colorC1,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: const [
                      Profile(),
                      Text(
                        "Paulo de Paiva Brasil",
                        style: TextStyle(color: Colors.white, fontSize: 20),
                      )
                    ],
                  ),
                ),
                flex: 2,
              ),
              // imagens da prefeitura
              Expanded(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: const [
                      Image(
                          image: AssetImage('assets/prefeitura_caraubas.png')),
                      Image(
                          image: AssetImage('assets/secretaria_caraubas.png')),
                    ],
                  ),
                  flex: 8)
            ],
          ),
        ),

        // informações de baixo
        Expanded(
          flex: 7,
          child: Row(
            children: [
              // sidebar
              Expanded(
                child: Container(
                  color: colorC2,
                  child: Column(
                    children: [
                      InkWell(
                        onTap: () {
                          setState(() {
                            currentTab = 0;
                          });
                        },
                        child: Padding(
                          padding: const EdgeInsets.all(5.0),
                          child: Container(
                              width: double.infinity,
                              padding: const EdgeInsets.only(left: 35),
                              color: currentTab == 0 ? Colors.white : null,
                              child: Row(
                                children: [
                                  Icon(
                                    Icons.add,
                                    color: (currentTab == 0
                                        ? colorC1
                                        : Colors.white),
                                  ),
                                  Text(
                                    '  Cadastrar Ficha',
                                    style: TextStyle(
                                        fontSize: 24,
                                        color: (currentTab == 0
                                            ? colorC1
                                            : Colors.white)),
                                  ),
                                ],
                              )),
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          setState(() {
                            currentTab = 1;
                          });
                        },
                        child: Padding(
                          padding: const EdgeInsets.all(5.0),
                          child: Container(
                              width: double.infinity,
                              padding: const EdgeInsets.only(left: 35),
                              color: currentTab == 1 ? Colors.white : null,
                              child: Row(
                                children: [
                                  Icon(
                                    Icons.table_view,
                                    color: (currentTab == 1
                                        ? colorC1
                                        : Colors.white),
                                  ),
                                  Text('  Visualizar Fichas',
                                      style: TextStyle(
                                          fontSize: 24,
                                          color: (currentTab == 1
                                              ? colorC1
                                              : Colors.white))),
                                ],
                              )),
                        ),
                      )
                    ],
                  ),
                ),
                flex: 2,
              ),
              // content
              Expanded(
                child: Stack(
                  children: [
                    Container(
                      color: colorC3,
                    ),
                    currentTab == 0 ? CriarForm() : const VisualizarTab()
                  ],
                ),
                flex: 8,
              ),
            ],
          ),
        )
      ],
    );
  }
}
