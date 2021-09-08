part of 'widgets.dart';

class TextFieldCustom extends StatelessWidget {
  dynamic icon;
  String? hintText;
  dynamic suffixIcon;
  TextEditingController? controller;
  bool? obscure;
  Function? changeIsObscure;
  Function? suffixOnPressed;
  bool? readOnly;
  String? value;
  bool? inputNumber;

  TextFieldCustom({
    @required this.icon,
    this.hintText,
    this.suffixIcon,
    this.controller = null,
    this.obscure,
    this.changeIsObscure = null,
    this.suffixOnPressed,
    this.readOnly,
    this.value = "",
    this.inputNumber = false,
  });
  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height / 16,
      padding: const EdgeInsets.symmetric(
        horizontal: 12.5,
      ),
      decoration: BoxDecoration(
        color: const Color(0xFFDDDADA),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: [
          icon!,
          const SizedBox(
            width: 12,
          ),
          Expanded(
            child: Center(
              child: TextFormField(
                readOnly: readOnly ?? false,
                obscureText: obscure ?? false,
                controller: controller,
                onChanged: (val) {},
                decoration: InputDecoration(
                  prefixIconConstraints: const BoxConstraints(
                    minWidth: 10,
                    minHeight: 2,
                  ),
                  border: InputBorder.none,
                  focusedBorder: InputBorder.none,
                  enabledBorder: InputBorder.none,
                  errorBorder: InputBorder.none,
                  disabledBorder: InputBorder.none,
                  hintText: hintText ?? "",
                  hintStyle: GoogleFonts.poppins(fontSize: 14),
                ),
                keyboardType:
                    !inputNumber! ? TextInputType.text : TextInputType.number,
              ),
            ),
          ),
          suffixIcon != null
              ? GestureDetector(
                  onTap: () {
                    if (hintText == "Password") {
                      changeIsObscure!();
                    }
                    if (suffixOnPressed != null) {
                      suffixOnPressed!();
                    }
                  },
                  child: suffixIcon,
                )
              : SizedBox(),
        ],
      ),
    );
  }
}
