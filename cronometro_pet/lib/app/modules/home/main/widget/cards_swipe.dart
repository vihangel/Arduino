import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../../shared/resources/colors.dart';
import '../main_controller.dart';

MainController controller = Modular.get<MainController>();

class CardsSwipe extends StatelessWidget {
  final String? name;
  final String? userId;
  final int? age;
  final List<String>? photos;
  final List<String>? tags;
  final String? pronoun;
  final String? profileIcon;
  final String? course;
  const CardsSwipe({
    Key? key,
    this.name,
    this.userId,
    this.age,
    this.photos,
    this.profileIcon,
    this.tags,
    this.pronoun,
    this.course,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    controller.updateUser();
    return Observer(builder: (context) {
      return SizedBox(
        height: size.height - 60,
        width: size.width,
        child: Stack(
          alignment: AlignmentDirectional.bottomCenter,
          children: [
            Column(
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  height: 70,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        height: 40,
                        width: 40,
                        decoration: const BoxDecoration(
                          borderRadius: BorderRadius.all(
                            Radius.circular(10),
                          ),
                          //color: Colors.grey,
                        ),
                        child: Image.asset(
                          profileIcon!.toString(),
                          fit: BoxFit.cover,
                        ),
                      ),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                userId!,
                                style: TextStyle(
                                  color: Colors.grey.shade800,
                                  fontSize: 24,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Text(
                                "$pronoun",
                                style: const TextStyle(
                                  color: Colors.grey,
                                  fontSize: 14,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      IconButton(
                        icon: Icon(
                          FontAwesomeIcons.fontAwesome,
                          // FontAwesomeIcons.ellipsisVertical,
                          color: Colors.grey.shade800,
                        ),
                        onPressed: () {},
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: Stack(
                    children: [
                      Container(
                        height: size.height,
                        width: size.width,
                        child: Image.asset(
                          photos![controller.currentIndex],
                          fit: BoxFit.cover,
                        ),
                      ),
                      Container(
                        height: size.height,
                        width: size.width,
                        decoration: const BoxDecoration(
                          gradient: LinearGradient(
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                            colors: [
                              Color.fromARGB(190, 0, 0, 0),
                              Colors.transparent,
                              Colors.transparent,
                              Colors.transparent,
                            ],
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 10.0, horizontal: 20),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              height: 2,
                              child: Row(
                                children: [
                                  Expanded(
                                    child: ListView(
                                      scrollDirection: Axis.horizontal,
                                      physics:
                                          const AlwaysScrollableScrollPhysics(),
                                      // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        ListView.builder(
                                          shrinkWrap: true,
                                          scrollDirection: Axis.horizontal,
                                          physics:
                                              const ClampingScrollPhysics(),
                                          itemCount: photos!.length,
                                          itemBuilder: (context, index) {
                                            return Padding(
                                              padding: index != photos!.length
                                                  ? const EdgeInsets.only(
                                                      right: 10)
                                                  : const EdgeInsets.all(0),
                                              child: Container(
                                                height: 2,
                                                width: (size.width - 40) /
                                                        photos!.length -
                                                    10,
                                                color:
                                                    controller.currentIndex ==
                                                            index
                                                        ? ColorsApp.primary
                                                        : const Color.fromARGB(
                                                            255, 239, 239, 239),
                                              ),
                                            );
                                          },
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            const Padding(
                                padding: const EdgeInsets.only(top: 10)),
                            SizedBox(
                              height: 20,
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Expanded(
                                    child: ListView(
                                      scrollDirection: Axis.horizontal,
                                      physics:
                                          const AlwaysScrollableScrollPhysics(),
                                      // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        ListView.builder(
                                          shrinkWrap: true,
                                          scrollDirection: Axis.horizontal,
                                          physics:
                                              const ClampingScrollPhysics(),
                                          itemCount: tags!.length,
                                          itemBuilder: (context, index) {
                                            return Padding(
                                              padding: index != tags!.length
                                                  ? const EdgeInsets.only(
                                                      right: 10)
                                                  : const EdgeInsets.all(0),
                                              child: Container(
                                                decoration: BoxDecoration(
                                                  borderRadius:
                                                      const BorderRadius.all(
                                                    Radius.circular(5),
                                                  ),
                                                  color: index == 0
                                                      ? Colors.blue
                                                      : index == 1
                                                          ? Colors.purple
                                                          : Colors
                                                              .green.shade700,
                                                ),
                                                width:
                                                    (size.width - 40) / 3 - 15,
                                                child: Text(
                                                  tags![index],
                                                  textAlign: TextAlign.center,
                                                  style: const TextStyle(
                                                    color: Colors.white,
                                                    fontSize: 14,
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                                ),
                                              ),
                                            );
                                          },
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            const Padding(
                                padding: const EdgeInsets.only(top: 10)),
                            Text(
                              "$name $age",
                              style: const TextStyle(
                                color: Color.fromARGB(255, 239, 239, 239),
                                fontSize: 36,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              "$course",
                              style: const TextStyle(
                                color: Color.fromARGB(255, 239, 239, 239),
                                fontSize: 14,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Flex(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          direction: Axis.horizontal,
                          children: [
                            Flexible(
                              flex: 1,
                              child: GestureDetector(
                                onTap: () => controller.decrementIndex(),
                              ),
                            ),
                            Flexible(
                              flex: 1,
                              child: GestureDetector(
                                onTap: () => controller.incrementIndex(),
                              ),
                            ),
                          ]),
                    ],
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.all(
                        Radius.circular(50),
                      ),
                      color: ColorsApp.primary,
                    ),
                    child: IconButton(
                      icon: const Icon(FontAwesomeIcons.xmark),
                      onPressed: () {
                        controller.homeController.updateUserIndex();
                        controller.updateUser();
                      },
                    ),
                  ),
                  Container(
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.all(
                        Radius.circular(50),
                      ),
                      color: ColorsApp.green,
                    ),
                    child: IconButton(
                      icon: const Icon(FontAwesomeIcons.check),
                      onPressed: () {
                        controller.homeController.updateUserIndex();
                        controller.updateUser();
                      },
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      );
    });
  }
}
