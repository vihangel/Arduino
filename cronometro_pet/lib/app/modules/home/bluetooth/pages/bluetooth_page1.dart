import 'package:cronometro_pet/app/modules/home/bluetooth/bluetooth_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

BluetoothController controller = Modular.get<BluetoothController>();

class BluetoothPage1 extends StatelessWidget {
  const BluetoothPage1({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.grey.shade800),
        title: Text(
          'Configuração Bluetooth',
          style: TextStyle(color: Colors.grey.shade800),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: Observer(builder: (context) {
        return Column(
          children: [
            const Padding(
              padding: EdgeInsets.all(30.0),
              child: const Text('Procure a rede do Arduino'),
            ),
            SizedBox(
              height: size.height * 0.6,
              width: size.width,
              child: ListView.builder(
                  itemCount: controller.devices.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Card(
                      child: ListTile(
                        title: Text(controller.devices[index].name),
                        subtitle:
                            Text(controller.devices[index].type.toString()),
                        trailing: const Icon(Icons.bluetooth),
                      ),
                    );
                  }),
            ),
            controller.loading
                ? const Padding(
                    padding: EdgeInsets.all(20.0),
                    child: Center(
                      child: CircularProgressIndicator.adaptive(),
                    ),
                  )
                : Container(),
            SizedBox(
              width: size.width * 0.8,
              child: ElevatedButton(
                onPressed: () {
                  controller.searchDevices();
                },
                child: const Text("Buscar dispositivos"),
              ),
            ),
          ],
        );
      }),
    );
  }
}
