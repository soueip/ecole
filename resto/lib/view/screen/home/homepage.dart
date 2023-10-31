import 'package:flutter/material.dart';
import '../../../core/constant/imageasset.dart';
import '../../../core/functions/alertexitapp.dart';
import '../../../core/functions/navigationtodetails.dart';
import '../../../data/model/kidmodel.dart';
import '../../widget/appbar.dart';
import '../../widget/home/card.dart';
import '../../widget/navbar.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      endDrawer: const NavDrawer(),
      appBar: const CustomAppBar(title: 'Sélectionnez votre enfant'),
      body: WillPopScope(
        onWillPop: alertExitApp,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SizedBox(
              height: 145,
              child: Image.asset(
                ImageAsset.appbar,
                fit: BoxFit.fitWidth,
              ),
            ),
            Expanded(
              child: ListView.builder(
                scrollDirection: Axis.vertical,
                itemCount: kids.length,
                itemBuilder: (context, index) {
                  Kid kid = kids[index];
                  return AnimatedContainer(
                    duration: const Duration(milliseconds: 500),
                    margin:
                        const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                    child: InkWell(
                      onTap: () {
                        navigateToProductDetails(context, kid);
                      },
                      child: CardWidget(
                        kid: kid,
                        index: index,
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
