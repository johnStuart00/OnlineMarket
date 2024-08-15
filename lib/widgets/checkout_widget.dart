import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:online_market/utils/screen_size.dart';
import 'package:online_market/widgets/name_textfield_widget.dart';
import 'package:online_market/widgets/phone_number_widget.dart';
import 'package:online_market/widgets/text_widgets/large_text_widget.dart';
import 'package:online_market/widgets/text_widgets/marker_text_widget.dart';
import 'package:online_market/widgets/text_widgets/middle_text_widget.dart';

class BagPageWidget extends StatefulWidget {
  const BagPageWidget({super.key});

  @override
  State<BagPageWidget> createState() => _BagPageWidgetState();
}

class _BagPageWidgetState extends State<BagPageWidget> {
  final nameTextFieldController = TextEditingController();
  final phoneNumberTextFieldController = TextEditingController();
  final addressTextFieldController = TextEditingController();
  final promoCodeTextFieldController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Theme.of(context).primaryColor,
        body: Padding(
            padding: const EdgeInsets.only(left: 10.0, top: 10.0, right: 10.0),
            child: Stack(
              children: <Widget>[
                Positioned(
                  top: 0,
                  left: 0,
                  right: 0,
                  child: SizedBox(
                    height: 40,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            color: Theme.of(context).cardColor,
                            borderRadius: BorderRadius.circular(30),
                          ),
                          child: IconButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            icon: const Icon(Icons.keyboard_arrow_left_rounded),
                          ),
                        ),
                        const Expanded(
                            child: Center(
                                child: MiddleTextWidget(widgetText: 'My Bag'))),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    top: 60.0,
                    bottom: 200,
                  ),
                  child: SingleChildScrollView(
                    child: Container(
                      decoration: const BoxDecoration(
                        borderRadius: BorderRadius.all(
                          Radius.circular(10),
                        ),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const MiddleTextWidget(widgetText: 'Name'),
                            const SizedBox(height: 5),
                            NameTextField(
                              textFieldNameController: nameTextFieldController,
                            ),
                            const SizedBox(height: 5),
                            const MiddleTextWidget(widgetText: 'Phone Number'),
                            const SizedBox(height: 5),
                            PhoneNumberTextField(
                              phoneNumberController:
                                  phoneNumberTextFieldController,
                            ),
                            const SizedBox(height: 5),
                            const MiddleTextWidget(widgetText: 'Address'),
                            const SizedBox(height: 5),
                            NameTextField(
                              textFieldNameController:
                                  addressTextFieldController,
                            ),
                            const SizedBox(height: 5),
                            const MiddleTextWidget(widgetText: 'Promo Code'),
                            const SizedBox(height: 5),
                            NameTextField(
                              textFieldNameController:
                                  promoCodeTextFieldController,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                Positioned(
                  left: 0,
                  right: 0,
                  bottom: 0,
                  child: Container(
                    padding: const EdgeInsets.all(18.0),
                    height: 200,
                    width: ScreenUtil.screenWidth(context),
                    color: Theme.of(context).cardColor,
                    child: Column(
                      children: [
                        const Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            MiddleTextWidget(widgetText: 'Subtotal'),
                            MarkerTextWidget(widgetText: '\$753.95'),
                          ],
                        ),
                        const SizedBox(height: 10),
                        const Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            MiddleTextWidget(widgetText: 'Delivery'),
                            MarkerTextWidget(widgetText: '\$60.00'),
                          ],
                        ),
                        const Divider(
                          height: 10,
                          thickness: 1,
                          indent: 0,
                          endIndent: 1,
                          color: Colors.grey,
                        ),
                        const Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            LargeTextWidget(widgetText: 'Total Cost:'),
                            MarkerTextWidget(widgetText: '\$813.95'),
                          ],
                        ),
                        const SizedBox(height: 10.0),
                        ElevatedButton(
                          onPressed: () {
                            if (nameTextFieldController.text.isNotEmpty &&
                                phoneNumberTextFieldController
                                    .text.isNotEmpty) {
                              showDialog(
                                context: context,
                                builder: (BuildContext context) {
                                  return AlertDialog(
                                    title: const Text('Congratulations!'),
                                    content: SizedBox(
                                      height: 200,
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          LottieBuilder.asset(
                                            'assets/lottie/congratulation.json',
                                            height: 150,
                                            width: 100,
                                          ),
                                          const SizedBox(height: 10),
                                          const Text(
                                            'Thank you for shopping with us! Your order has been placed successfully.',
                                          ),
                                        ],
                                      ),
                                    ),
                                    actions: [
                                      TextButton(
                                        onPressed: () {
                                          Navigator.of(context)
                                              .pop(); // Close the dialog
                                        },
                                        child: const Text('Close'),
                                      ),
                                    ],
                                  );
                                },
                              );
                            }
                          },
                          child: SizedBox(
                            width: ScreenUtil.setWidth(context, 0.7),
                            height: 40,
                            child: const Center(child: Text('Checkout')),
                          ),
                        ),
                      ],
                    ),
                  ),
                )
              ],
            )),
      ),
    );
  }
}
