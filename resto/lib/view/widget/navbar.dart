import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:resto/core/constant/color.dart';

import '../../controller/navbar.dart';
import '../../core/constant/imageasset.dart';

class NavDrawer extends StatelessWidget {
  const NavDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    NavbarControllerImp controller = Get.put(NavbarControllerImp());
    double baseWidth = 377.0;
    double baseHeight = 667.0;
    double fem = MediaQuery.of(context).size.width / baseWidth;
    double femHeight = MediaQuery.of(context).size.height / baseHeight;

    return SafeArea(
      child: ClipRRect(
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(20.0),
          bottomLeft: Radius.circular(20.0),
        ),
        child: Drawer(
          backgroundColor: Colors.transparent,
          child: Container(
            color: const Color.fromARGB(192, 255, 255, 255),
            child: ListView(
              children: <Widget>[
                Material(
                  elevation: 6,
                  child: Container(
                    decoration: BoxDecoration(
                      gradient: ColorApp.radialGradient,
                    ),
                    child: DrawerHeader(
                      child: Stack(
                        children: [
                          Positioned(
                            left: 10 * fem,
                            top: 10 * fem,
                            child: Align(
                              child: SizedBox(
                                width: 206 * fem,
                                height: 25 * fem * femHeight,
                                child: Text(
                                  'Welcome Kat Grem!',
                                  style: Theme.of(context)
                                      .textTheme
                                      .headline5
                                      ?.copyWith(color: ColorApp.white),
                                ),
                              ),
                            ),
                          ),
                          Positioned(
                            left: 90 * fem,
                            top: 50 * fem,
                            child: Align(
                              child: SizedBox(
                                width: 70.02 * fem,
                                height: 70 * fem * femHeight,
                                child: Container(
                                  decoration: const BoxDecoration(
                                    image: DecorationImage(
                                      fit: BoxFit.cover,
                                      image: AssetImage(ImageAsset.recharge),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.all(1),
                  child: Wrap(
                    runSpacing: 16,
                    children: [
                      ListTile(
                        leading:
                            const Icon(Icons.home, color: ColorApp.bleufata7),
                        title: const Text(
                          'Home',
                          style: TextStyle(color: ColorApp.bleufata7),
                        ),
                        onTap: () {
                          controller.gotohomepage();
                        },
                      ),
                      ListTile(
                        leading: const Icon(Icons.change_circle,
                            color: ColorApp.bleufata7),
                        title: const Text(
                          'Recharge',
                          style: TextStyle(color: ColorApp.bleufata7),
                        ),
                        onTap: () {
                          controller.recharge();
                        },
                      ),
                      /* ListTile(
                      leading: Icon(Icons.notifications, color: Colors.white),
                      title: Text(
                        'Notifications',
                        style: TextStyle(color: Colors.white),
                      ),
                      onTap: () {
                        Navigator.of(context).pushReplacement(
                          MaterialPageRoute(builder: (context) => const Notif()),
                        );
                      },
                    ), */
                      const ListTile(
                        leading:
                            Icon(Icons.settings, color: ColorApp.bleufata7),
                        title: Text(
                          'Settings',
                          style: TextStyle(color: ColorApp.bleufata7),
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
