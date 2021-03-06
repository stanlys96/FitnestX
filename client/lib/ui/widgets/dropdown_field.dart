part of 'widgets.dart';

class DropdownField extends StatelessWidget {
  const DropdownField({
    required this.data,
    required this.provider,
  });

  final RegisterChangeNotifier provider;
  final List<String> data;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height / 16,
      padding: const EdgeInsets.only(
        left: 12.5,
      ),
      decoration: BoxDecoration(
        color: Color(0xFFDDDADA),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: [
          Image.asset(
            'assets/icons/ic_gender.png',
            height: 20,
            width: 20,
          ),
          Expanded(
            child: DropdownButtonFormField<String>(
              isExpanded: true,
              hint: Text(
                provider.genderHint,
              ),
              icon: const Icon(
                Icons.keyboard_arrow_down_sharp,
                color: Colors.blue,
              ),
              iconSize: 24,
              elevation: 16,
              style: GoogleFonts.poppins(fontSize: 14, color: Colors.black),
              decoration: InputDecoration(
                filled: true,
                fillColor: Colors.transparent,
                border: InputBorder.none,
                focusedBorder: InputBorder.none,
                enabledBorder: InputBorder.none,
                errorBorder: InputBorder.none,
                disabledBorder: InputBorder.none,
                hintStyle: GoogleFonts.poppins(fontSize: 14),
              ),
              onChanged: (String? value) {
                provider.genderHint = value!;
                provider.setSelectedGender(value);
              },
              items: data.map<DropdownMenuItem<String>>(
                (String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                },
              ).toList(),
            ),
          ),
        ],
      ),
    );
  }
}
