import 'package:cronometro_pet/app/modules/home/timer/timer_controller.dart';
import 'package:cronometro_pet/app/shared/resources/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../bluetooth/pages/bluetooth_page1.dart';

TimerController controller = Modular.get<TimerController>();

class TimerPage extends StatelessWidget {
  TimerPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Observer(builder: (context) {
      return GestureDetector(
        onTap: () {
          controller.start();
        },
        child: Scaffold(
          appBar: AppBar(
            centerTitle: true,
            backgroundColor: Colors.white,
            elevation: 0,
            title: Text(
              "Cronometro",
              style: TextStyle(color: Colors.grey.shade800),
            ),
            actions: [
              IconButton(
                icon: Icon(
                  Icons.bluetooth,
                  color: Colors.grey.shade800,
                ),
                onPressed: () {
                  Modular.to.push(MaterialPageRoute(
                      builder: (context) => BluetoothPage1()));
                },
              ),
            ],
          ),
          body: SizedBox(
            height: size.height,
            width: size.width,
            child: Flex(
              direction: Axis.vertical,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Flexible(
                  flex: 8,
                  child: Container(
                    width: size.width * 0.8,
                    height: size.width * 0.8,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(color: ColorsApp.primary, width: 5),
                    ),
                    child: Stack(
                      children: [
                        Center(
                          child: Container(
                            width: size.width * 0.75,
                            height: size.width * 0.75,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              border: Border.all(
                                color: controller.isActived
                                    ? Colors.red.shade400
                                    : Colors.yellow,
                                width: 5,
                              ),
                            ),
                          ),
                        ),
                        Center(
                          child: Text(
                            controller.time,
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontSize: 64,
                                fontWeight: FontWeight.bold,
                                color: Colors.grey.shade800),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                controller.isActived
                    ? Flexible(
                        flex: 4,
                        child: SizedBox(
                          width: size.width * 0.8,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              primary: Colors.red.shade400,
                              elevation: 0,
                              padding: const EdgeInsets.symmetric(
                                vertical: 15,
                              ),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(100),
                              ),
                            ),
                            onPressed: () {
                              controller.start();
                            },
                            child: const Text("Parar"),
                          ),
                        ),
                      )
                    : Flexible(
                        flex: 4,
                        child: SizedBox(
                          width: size.width * 0.8,
                          child: ElevatedButton(
                            onPressed: () {
                              controller.start();
                            },
                            child: const Text("Iniciar"),
                          ),
                        ),
                      ),
                controller.stop
                    ? Flexible(
                        flex: 1,
                        child: Column(
                          children: [
                            SizedBox(
                              width: size.width * 0.8,
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  SizedBox(
                                    width: size.width * 0.2,
                                    child: ElevatedButton(
                                      style: ElevatedButton.styleFrom(
                                        primary: Colors.red.shade400,
                                        elevation: 0,
                                        padding: const EdgeInsets.symmetric(
                                          vertical: 15,
                                        ),
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(100),
                                        ),
                                      ),
                                      onPressed: () {},
                                      child: const Text("+2"),
                                    ),
                                  ),
                                  SizedBox(
                                    width: size.width * 0.2,
                                    child: ElevatedButton(
                                      style: ElevatedButton.styleFrom(
                                        primary: Colors.red.shade400,
                                        elevation: 0,
                                        padding: const EdgeInsets.symmetric(
                                          vertical: 15,
                                        ),
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(100),
                                        ),
                                      ),
                                      onPressed: () {},
                                      child: const Text("DNF"),
                                    ),
                                  ),
                                  SizedBox(
                                    width: size.width * 0.2,
                                    child: ElevatedButton(
                                      style: ElevatedButton.styleFrom(
                                        primary: Colors.green.shade400,
                                        elevation: 0,
                                        padding: const EdgeInsets.symmetric(
                                          vertical: 15,
                                        ),
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(100),
                                        ),
                                      ),
                                      onPressed: () {},
                                      child: const Text("Editar"),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            // SizedBox(
                            //   width: size.width * 0.8,
                            //   child: ElevatedButton(
                            //     style: ElevatedButton.styleFrom(
                            //       primary: Colors.green.shade400,
                            //       elevation: 0,
                            //       padding: const EdgeInsets.symmetric(
                            //         vertical: 15,
                            //       ),
                            //       shape: RoundedRectangleBorder(
                            //         borderRadius: BorderRadius.circular(100),
                            //       ),
                            //     ),
                            //     onPressed: () {},
                            //     child: const Text("Editar"),
                            //   ),
                            // ),
                          ],
                        ),
                      )
                    : Container(),
              ],
            ),
          ),
        ),
      );
    });
  }
}
