part of 'widgets.dart';

class DateTimeField extends StatelessWidget {
  dynamic icon;
  dynamic suffixIcon;
  Function? suffixOnPressed;
  String? title;
  DateTimeField(
      {this.icon, this.suffixIcon, this.suffixOnPressed = null, this.title});
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
            child: Text(
              title!,
              style: GoogleFonts.poppins(
                  fontSize: 14,
                  color: title == "Select Date of Birth"
                      ? Color(0xFF636161)
                      : Colors.black),
            ),
          ),
          suffixIcon != null
              ? GestureDetector(
                  onTap: () {
                    suffixOnPressed!();
                  },
                  child: suffixIcon,
                )
              : SizedBox(),
        ],
      ),
    );
  }
}
