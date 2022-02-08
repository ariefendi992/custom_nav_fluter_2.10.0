import 'package:custom_bottom_navigation/cubit/page_cubit.dart';
import 'package:custom_bottom_navigation/shared/theme.dart';
import 'package:custom_bottom_navigation/ui/pages/home_page.dart';
import 'package:custom_bottom_navigation/ui/pages/setting_page.dart';
import 'package:custom_bottom_navigation/ui/pages/transaction_page.dart';
import 'package:custom_bottom_navigation/ui/pages/wallet_page.dart';
import 'package:custom_bottom_navigation/ui/widgets/custom_bottom_navigation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MainPage extends StatelessWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Widget content(int currentIndex) {
      switch (currentIndex) {
        case 0:
          return const HomePage();
        case 1:
          return const TransactionPage();
        case 2:
          return const WalletPage();
        case 3:
          return const SettingPage();
        default:
          return const HomePage();
      }
    }

    Widget bottomNavigation() {
      return Align(
        alignment: Alignment.bottomCenter,
        child: Container(
          margin: const EdgeInsets.only(
            left: 24,
            right: 24,
            bottom: 30,
          ),
          width: double.infinity,
          height: 60,
          decoration: BoxDecoration(
            color: kWhiteColor,
            borderRadius: BorderRadius.circular(18),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: const [
              CustomBottomNavigation(
                index: 0,
                iconUrl: 'assets/icon_home.png',
              ),
              CustomBottomNavigation(
                index: 1,
                iconUrl: 'assets/icon_transaction.png',
              ),
              CustomBottomNavigation(
                index: 2,
                iconUrl: 'assets/icon_wallet.png',
              ),
              CustomBottomNavigation(
                index: 3,
                iconUrl: 'assets/icon_settings.png',
              ),
            ],
          ),
        ),
      );
    }

    return BlocBuilder<PageCubit, int>(
      builder: (context, currentIndex) {
        return Scaffold(
          backgroundColor: kSilverColor,
          body: Stack(children: [
            content(currentIndex),
            bottomNavigation(),
          ]),
        );
      },
    );
  }
}
