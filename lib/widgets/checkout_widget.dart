import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:lottie/lottie.dart';
import 'package:online_market/utils/screen_size.dart';
import 'package:online_market/widgets/text_widgets/large_text_widget.dart';
import 'package:online_market/widgets/text_widgets/marker_text_widget.dart';
import 'package:online_market/widgets/text_widgets/middle_text_widget.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

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
    final appLoc = AppLocalizations.of(context);
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
                        GestureDetector(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          child: Container(
                              width: 45,
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                color: Theme.of(context).cardColor,
                                borderRadius: BorderRadius.circular(30),
                              ),
                              child: Image.asset(
                                'assets/icons/back.png',
                                color: Theme.of(context).iconTheme.color,
                              )),
                        ),
                        Expanded(
                          child: Center(
                            child: MiddleTextWidget(
                              widgetText: AppLocalizations.of(context)!.my_bag,
                            ),
                          ),
                        ),
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
                            MiddleTextWidget(widgetText: appLoc!.name),
                            const SizedBox(height: 5),
                            _nameTextField(
                              textFieldNameController: nameTextFieldController,
                              hintText: appLoc.name_content,
                            ),
                            const SizedBox(height: 5),
                            MiddleTextWidget(widgetText: appLoc.phone_number),
                            const SizedBox(height: 5),
                            _phoneNumberTextField(
                              phoneNumberController:
                                  phoneNumberTextFieldController,
                            ),
                            const SizedBox(height: 5),
                            MiddleTextWidget(widgetText: appLoc.address),
                            const SizedBox(height: 5),
                            _nameTextField(
                              textFieldNameController:
                                  addressTextFieldController,
                              hintText: appLoc.address_content,
                            ),
                            const SizedBox(height: 5),
                            MiddleTextWidget(widgetText: appLoc.promo_code),
                            const SizedBox(height: 5),
                            _nameTextField(
                              textFieldNameController:
                                  promoCodeTextFieldController,
                              hintText: '',
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
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            MiddleTextWidget(widgetText: appLoc.subtotal),
                            const MarkerTextWidget(widgetText: '\$753.95'),
                          ],
                        ),
                        const SizedBox(height: 10),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            MiddleTextWidget(widgetText: appLoc.delivery),
                            const MarkerTextWidget(widgetText: '\$60.00'),
                          ],
                        ),
                        const Divider(
                          height: 10,
                          thickness: 1,
                          indent: 0,
                          endIndent: 1,
                          color: Colors.grey,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            LargeTextWidget(widgetText: appLoc.total_cost),
                            const MarkerTextWidget(widgetText: '\$813.95'),
                          ],
                        ),
                        const SizedBox(height: 10.0),
                        Expanded(
                          child: ElevatedButton(
                            onPressed: () {
                              if (nameTextFieldController.text.isNotEmpty &&
                                  phoneNumberTextFieldController
                                      .text.isNotEmpty) {
                                _congratulationsAlert(context, appLoc);
                              }
                            },
                            child: SizedBox(
                              width: ScreenUtil.setWidth(context, 0.7),
                              height: 35,
                              child: Center(
                                child: MiddleTextWidget(
                                  widgetText: appLoc.checkout,
                                ),
                              ),
                            ),
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

  Future<dynamic> _congratulationsAlert(
      BuildContext context, AppLocalizations appLoc) {
    return showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: MiddleTextWidget(
            widgetText: appLoc.congratulations,
          ),
          content: SizedBox(
            height: 200,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                LottieBuilder.asset(
                  'assets/lottie/congratulation.json',
                  height: 150,
                  width: 100,
                ),
                const SizedBox(height: 10),
                MiddleTextWidget(
                  widgetText: appLoc.congratulations_content,
                )
              ],
            ),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: MiddleTextWidget(
                widgetText: appLoc.close,
              ),
            ),
          ],
        );
      },
    );
  }
}

class _nameTextField extends StatefulWidget {
  final String hintText;
  const _nameTextField({
    super.key,
    required this.textFieldNameController,
    required this.hintText,
  });

  final TextEditingController textFieldNameController;

  @override
  State<_nameTextField> createState() => _nameTextFieldState();
}

class _nameTextFieldState extends State<_nameTextField> {
  void textFieldClear() {
    widget.textFieldNameController.clear();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: TextField(
        controller: widget.textFieldNameController,
        keyboardType: TextInputType.text,
        inputFormatters: [
          LengthLimitingTextInputFormatter(50),
          FilteringTextInputFormatter.allow(RegExp(r'[a-zA-Z0-9\s]')),
        ],
        decoration: InputDecoration(
          fillColor: Theme.of(context).cardColor,
          border: const OutlineInputBorder(),
          hintText: widget.hintText,
          suffix: GestureDetector(
            onTap: textFieldClear,
            child: const Icon(Icons.clear_rounded),
          ),
        ),
      ),
    );
  }
}

class _phoneNumberTextField extends StatefulWidget {
  const _phoneNumberTextField({
    super.key,
    required this.phoneNumberController,
  });

  final TextEditingController phoneNumberController;

  @override
  State<_phoneNumberTextField> createState() => _phoneNumberTextFieldState();
}

class _phoneNumberTextFieldState extends State<_phoneNumberTextField> {
  void textFieldClear() {
    widget.phoneNumberController.clear();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: TextField(
        controller: widget.phoneNumberController,
        keyboardType: TextInputType.phone,
        inputFormatters: [
          LengthLimitingTextInputFormatter(9),
          FilteringTextInputFormatter.digitsOnly,
          _PhoneNumberFormatter(),
        ],
        decoration: InputDecoration(
          fillColor: Theme.of(context).cardColor,
          border: const OutlineInputBorder(),
          prefix: const Text('+993 '),
          //hintText: '-- -- -- --',
          suffix: GestureDetector(
            onTap: textFieldClear,
            child: const Icon(Icons.clear_rounded),
          ),
        ),
      ),
    );
  }
}

class _PhoneNumberFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    var newText = newValue.text;

    if (newText.length > 2 && !newText.contains(' ')) {
      newText = '${newText.substring(0, 2)} ${newText.substring(2)}';
    }

    return newValue.copyWith(
      text: newText,
      selection: TextSelection.collapsed(offset: newText.length),
    );
  }
}
