import 'package:flutter/material.dart';
import 'package:prnv_test/controller/onboarding_controller.dart';
import 'package:provider/provider.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Consumer<OnboardingController>(
          builder: (context, value, child) => PageView.builder(
            itemCount: value.onboardImageList.length,
            scrollDirection: Axis.horizontal,
            itemBuilder: (BuildContext context, int index) {
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    height: 250,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                          image: NetworkImage(
                            value.onboardImageList[index],
                          ),
                          fit: BoxFit.fill),
                    ),
                  ),
                  const SizedBox(height: 10),
                  const Text(
                    'Service at your doorstep',
                    style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 10),
                  const Text(
                    'We have great and fast service for you.\nChoose service you want to need',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 10),
                  Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: List.generate(
                        3,
                        (int containerIndex) => Container(
                          margin: const EdgeInsets.only(
                            right: 10,
                          ),
                          height: index == containerIndex ? 15 : 15,
                          width: 15,
                          decoration: BoxDecoration(
                            color: index == containerIndex
                                ? Colors.grey[700]
                                : Colors.grey[400],
                            borderRadius: BorderRadius.circular(
                              10,
                            ),
                          ),
                        ),
                      )),
                  index == 2
                      ? Align(
                          alignment: Alignment.bottomRight,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              const SizedBox(height: 10),
                              TextButton(
                                onPressed: () {
                                  value.setInitialLogin(context);
                                },
                                child: const Text('Start'),
                              )
                            ],
                          ),
                        )
                      : const SizedBox()
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
