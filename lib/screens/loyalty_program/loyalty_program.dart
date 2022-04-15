import 'package:flutter/material.dart';
import 'package:walmart_app_design/constants.dart';
import 'package:walmart_app_design/screens/home/home.dart';
import 'package:walmart_app_design/screens/splash/splash.dart';

class LoyaltyProgram extends StatelessWidget {
  const LoyaltyProgram({Key? key}) : super(key: key);

  static const routeName = '/loyalty_program';

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      body: Stack(
        children: [
          Image.asset('assets/images/loyalty_program.png'),
          Positioned(
            left: 25,
            top: 56,
            child: Row(
              children: [
                Image.asset(
                  'assets/icons/avatar.png',
                  width: 32,
                  height: 32,
                ),
                const SizedBox(width: 8),
                Text(
                  'Hi, John',
                  style: Theme.of(context).textTheme.headline3,
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          ),
          Positioned(
            right: size.width * 0.15,
            top: size.height * 0.55,
            child: Image.asset(
              'assets/images/holiday.png',
              width: 33,
              height: 38,
            ),
          ),
          Column(
            children: [
              const Spacer(flex: 7),
              const Center(
                child: Text(
                  '172 Point',
                  style: TextStyle(
                    color: kWhite,
                    fontSize: 35,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const SizedBox(height: 8),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 37),
                child: Text(
                  'Congratulations, you'
                  've just earned 179 loyalty points with the BNPL purchase!',
                  style: TextStyle(
                    color: kWhite,
                    fontSize: 14,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              const SizedBox(height: 41),
              OutlinedButton(
                onPressed: () => Navigator.pushNamedAndRemoveUntil(
                  context,
                  SplashPage.routeName,
                  (route) => false,
                ),
                child: const Text(
                  'CONTINUE',
                  style: TextStyle(
                    color: kBlue600,
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(kWhite),
                  shape: MaterialStateProperty.all(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30.0),
                    ),
                  ),
                  padding: MaterialStateProperty.all(
                    const EdgeInsets.symmetric(
                      horizontal: 24,
                      vertical: 2,
                    ),
                  ),
                ),
              ),
              const Spacer(flex: 1),
              Text(
                'More Information About Loyalty Program',
                style: TextStyle(
                  fontSize: 14,
                  decoration: TextDecoration.underline,
                  color: kWhite.withOpacity(0.4),
                ),
              ),
              const Spacer(flex: 1),
            ],
          ),
        ],
      ),
    );
  }
}
