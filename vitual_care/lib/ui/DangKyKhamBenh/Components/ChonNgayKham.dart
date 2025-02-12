import "package:flutter/material.dart";

class ChonNgayKham extends StatefulWidget {
  const ChonNgayKham({super.key});

  @override
  State<ChonNgayKham> createState() => _ChonNgayKham();
}

class _ChonNgayKham extends State<ChonNgayKham> {
  TextEditingController _dateController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: _dateController,
      decoration: InputDecoration(
        filled: true,
        fillColor: Color(0xffe0e0e0),
        hintText: " Vui lòng chọn ngày khám",
        hintStyle: TextStyle(fontSize: 16),
        // labelText: '    Chọn ngày khám',
        suffixIcon: Icon(Icons.calendar_month),
        enabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(
            color: Colors.black, // Màu viền dưới khi không focus
            width: 1.0, // Độ dày của viền dưới
          ),
        ),
        focusedBorder:
            UnderlineInputBorder(borderSide: BorderSide(color: Colors.black)),
      ),
      readOnly: true,
      onTap: () {
        _selectDate();
      },
    );
  }

  Future<void> _selectDate() async {
    DateTime? _picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2100),
      initialDatePickerMode: DatePickerMode.day,
      cancelText: "Đóng", // Custom cancel button text
      confirmText: "Chọn",
      locale: Locale('vi', 'VN'),
      builder: (context, child) {
        return Theme(
          data: Theme.of(context).copyWith(
            colorScheme: ColorScheme.light(
              primary: Color(0xff1565c0), // header background color
              onPrimary: Colors.white, // header text color
              onSurface: Colors.black, // body text color
            ),
            textButtonTheme: TextButtonThemeData(
              style: TextButton.styleFrom(
                foregroundColor: Colors.black, // button text color
              ),
            ),
          ),
          child: child!,
        );
      },
    );

    if (_picked != null) {
      setState(() {
        _dateController.text = _picked.toString().split(" ")[0];
      });
    }
  }
}
