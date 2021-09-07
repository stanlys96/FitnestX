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
          Icon(
            Icons.person_outline,
            size: 20,
          ),
          Expanded(
            child: DropdownButtonFormField<String>(
              value: provider.selectedGender,
              isExpanded: true,
              hint: Text(
                'Choose Gender',
              ),
              icon: const Icon(
                Icons.keyboard_arrow_down_sharp,
                color: Colors.blue,
              ),
              iconSize: 24,
              elevation: 16,
              style: const TextStyle(color: Colors.black),
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
                provider.setSelectedGender(value!);
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
