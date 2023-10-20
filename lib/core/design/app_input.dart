import 'package:flutter/material.dart';

class AppInput extends StatefulWidget {
  final bool isPassword, isIcon, isEnabled;
  final double bottom;
  final Color fillColor,prefixColor;
  final String image, labelText;
  final FormFieldValidator<String?>? validator;
  final TextInputType inputType;
  final TextEditingController? controller;

  const AppInput({
    super.key,
    this.isPassword = false,
    required this.image,
    this.isIcon = false,
    this.bottom = 16,
    required this.labelText,
    this.isEnabled = true,
    this.controller,
    this.validator,
    this.inputType = TextInputType.text,
    this.fillColor = Colors.white,
    this.prefixColor = Colors.white,
  });

  @override
  State<AppInput> createState() => _AppInputState();
}

class _AppInputState extends State<AppInput> {
  bool isHidden = true;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: widget.bottom),
      child: TextFormField(
        onTapOutside: (event){
          FocusManager.instance.primaryFocus!.unfocus();
        },
        controller: widget.controller,
        validator: widget.validator,
        obscureText: isHidden && widget.isPassword,
        keyboardType: widget.inputType,
        decoration: InputDecoration(
          fillColor: widget.fillColor,
            enabled: widget.isEnabled,
            icon: widget.isIcon
                ? Container(
                    width: 60,
                    height: 60,
                    decoration: BoxDecoration(
                        border: Border.all(
                            width: 1, color: const Color(0xffF3F3F3)),
                        borderRadius: BorderRadius.circular(15),
                        color: Colors.white),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(
                          "assets/images/saudi.png",
                          width: 32,
                          height: 20,
                        ),
                        const SizedBox(
                          height: 4,
                        ),
                        Text(
                          "966+",
                          style: TextStyle(
                              color: Theme.of(context).primaryColor,
                              fontWeight: FontWeight.w400,
                              fontSize: 15),
                        )
                      ],
                    ),
                  )
                : null,
            labelText: widget.labelText,
            suffixIcon: widget.isPassword
                ? IconButton(
                    onPressed: () {
                      isHidden = !isHidden;
                      setState(() {});
                    },
                    icon: Icon(
                        isHidden ? Icons.visibility_off : Icons.visibility),
                  )
                : null,
            prefixIcon: Padding(

              padding: const EdgeInsets.all(12.0),
              child: Image.asset(
              color: widget.prefixColor,  widget.image,
                height: 24,
                width: 24,
              ),
            )),
      ),
    );
  }
}
