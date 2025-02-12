import 'package:flutter/material.dart';
import 'package:vitual_care/data/DMNgheNghiep.dart';
import 'package:dropdown_button2/dropdown_button2.dart';

class DienThongTinHoSo extends StatelessWidget {
  const DienThongTinHoSo({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(50.0),
        child: Container(
          // padding: EdgeInsets.symmetric(horizontal: 8),
          alignment: Alignment.center,
          decoration: BoxDecoration(
              border: Border(bottom: BorderSide(color: Colors.grey)),
              color: Colors.white),
          child: AppBar(
            bottom: null,
            backgroundColor: Colors.white,
            title: Text('Thông tin bệnh nhân'),
            centerTitle: true,
            leading: IconButton(
              icon: Icon(
                Icons.arrow_back,
                color: Colors.black, // Màu của icon
                size: 30.0, // Kích thước của icon
              ),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ),
        ),
      ),
      backgroundColor: Color(0xffeeeeee),
      body: CustomContentDienThongTin(),
      bottomNavigationBar: PreferredSize(
        preferredSize: Size.fromHeight(60), // Chiều cao của nút
        child: CustomButtonBottom(),
      ),
    );
  }
}

class CustomContentDienThongTin extends StatelessWidget {
  const CustomContentDienThongTin({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 25),
        child: Column(
          children: [
            Container(
              width: double.infinity,
              child: Text(
                'Họ và tên:',
                style: TextStyle(fontSize: 16),
              ),
            ),
            InputHovaTen(),
            SizedBox(
              height: 30,
            ),
            Container(
              width: double.infinity,
              child: Text(
                'Giới tính:',
                style: TextStyle(fontSize: 16),
              ),
            ),
            InputGioiTinh(),
            SizedBox(
              height: 30,
            ),
            Container(
              width: double.infinity,
              child: Text(
                'Ngày sinh:',
                style: TextStyle(fontSize: 16),
              ),
            ),
            InputNgaySinh(),
            SizedBox(
              height: 30,
            ),
            Container(
              width: double.infinity,
              child: Text(
                'Mã bảo hiểm y tế:',
                style: TextStyle(fontSize: 16),
              ),
            ),
            InputBHYT(),
            SizedBox(
              height: 30,
            ),
            Container(
              width: double.infinity,
              child: Text(
                'Căn cước công dân:',
                style: TextStyle(fontSize: 16),
              ),
            ),
            InputCCCD(),
            SizedBox(
              height: 30,
            ),
            Container(
              width: double.infinity,
              child: Text(
                'Số điện thoại:',
                style: TextStyle(fontSize: 16),
              ),
            ),
            InputSDT(),
            SizedBox(
              height: 30,
            ),
            Container(
              width: double.infinity,
              child: Text(
                'Email:',
                style: TextStyle(fontSize: 16),
              ),
            ),
            InputEmail(),
            SizedBox(
              height: 30,
            ),
            Container(
              width: double.infinity,
              child: Text(
                'Nghề nghiệp:',
                style: TextStyle(fontSize: 16),
              ),
            ),
            InputNgheNghiep(),
          ],
        ),
      ),
    );
  }
}

class InputHovaTen extends StatefulWidget {
  const InputHovaTen({super.key});

  @override
  State<InputHovaTen> createState() => _InputHovaTen();
}

class _InputHovaTen extends State<InputHovaTen> {
  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
        filled: true,
        fillColor: Color(0xffe0e0e0),
        // label: Text("Họ và tên"),
        hintText: "Vui lòng nhập họ và tên",
        hintStyle: TextStyle(fontSize: 16),
        // labelText: '    Chọn ngày khám',
        suffixIcon: Icon(Icons.person),
        enabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(
            color: Colors.black, // Màu viền dưới khi không focus
            width: 1.0, // Độ dày của viền dưới
          ),
        ),
      ),
    );
  }
}

class InputGioiTinh extends StatefulWidget {
  const InputGioiTinh({super.key});

  @override
  State<InputGioiTinh> createState() => _InputGioiTinh();
}

class _InputGioiTinh extends State<InputGioiTinh> {
  int? _selectedValue = 0;
  void _handleRadioValueChanged(int? value) {
    setState(() {
      _selectedValue = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Radio<int>(
          value: 0,
          groupValue: _selectedValue,
          onChanged: _handleRadioValueChanged,
        ),
        Text("Nam"),
        SizedBox(width: 20), // Khoảng cách giữa các radio button
        Radio<int>(
          value: 1,
          groupValue: _selectedValue,
          onChanged: _handleRadioValueChanged,
        ),
        Text("Nữ"),
        SizedBox(width: 20), // Khoảng cách giữa các radio button
      ],
    );
  }
}

class InputNgaySinh extends StatefulWidget {
  const InputNgaySinh({super.key});

  @override
  State<InputNgaySinh> createState() => _InputNgaySinh();
}

class _InputNgaySinh extends State<InputNgaySinh> {
  TextEditingController _dateController = TextEditingController();
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
              primary: Colors.blueGrey, // header background color
              onPrimary: Colors.black, // header text color
              onSurface: Color(0xff1565c0), // body text color
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

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: _dateController,
      decoration: InputDecoration(
        filled: true,
        fillColor: Color(0xffe0e0e0),
        hintText: " Vui lòng nhập ngày sinh",
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
}

class InputBHYT extends StatefulWidget {
  const InputBHYT({super.key});

  @override
  State<InputBHYT> createState() => _InputBHYT();
}

class _InputBHYT extends State<InputBHYT> {
  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
        filled: true,
        fillColor: Color(0xffe0e0e0),
        // label: Text("Họ và tên"),
        hintText: "Vui lòng nhập mã bảo hiểm y tế",
        hintStyle: TextStyle(fontSize: 16),
        // labelText: '    Chọn ngày khám',
        suffixIcon: Icon(Icons.medical_information),
        enabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(
            color: Colors.black, // Màu viền dưới khi không focus
            width: 1.0, // Độ dày của viền dưới
          ),
        ),
      ),
    );
  }
}

class InputCCCD extends StatefulWidget {
  const InputCCCD({super.key});

  @override
  State<InputCCCD> createState() => _InputCCCD();
}

class _InputCCCD extends State<InputCCCD> {
  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
        filled: true,
        fillColor: Color(0xffe0e0e0),
        // label: Text("Họ và tên"),
        hintText: "Vui lòng nhập CCCD",
        hintStyle: TextStyle(fontSize: 16),
        // labelText: '    Chọn ngày khám',
        suffixIcon: Icon(Icons.badge),
        enabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(
            color: Colors.black, // Màu viền dưới khi không focus
            width: 1.0, // Độ dày của viền dưới
          ),
        ),
      ),
    );
  }
}

class InputSDT extends StatefulWidget {
  const InputSDT({super.key});

  @override
  State<InputSDT> createState() => _InputSDT();
}

class _InputSDT extends State<InputSDT> {
  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
        filled: true,
        fillColor: Color(0xffe0e0e0),
        // label: Text("Họ và tên"),
        hintText: "Vui lòng nhập số điện thoại",
        hintStyle: TextStyle(fontSize: 16),
        // labelText: '    Chọn ngày khám',
        suffixIcon: Icon(Icons.phone_android),
        enabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(
            color: Colors.black, // Màu viền dưới khi không focus
            width: 1.0, // Độ dày của viền dưới
          ),
        ),
      ),
    );
  }
}

class InputEmail extends StatefulWidget {
  const InputEmail({super.key});

  @override
  State<InputEmail> createState() => _InputEmail();
}

class _InputEmail extends State<InputEmail> {
  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
        filled: true,
        fillColor: Color(0xffe0e0e0),
        // label: Text("Họ và tên"),
        hintText: "Vui lòng nhập email",
        hintStyle: TextStyle(fontSize: 16),
        // labelText: '    Chọn ngày khám',
        suffixIcon: Icon(Icons.mail),
        enabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(
            color: Colors.black, // Màu viền dưới khi không focus
            width: 1.0, // Độ dày của viền dưới
          ),
        ),
      ),
    );
  }
}

class InputNgheNghiep extends StatefulWidget {
  const InputNgheNghiep({super.key});

  @override
  State<InputNgheNghiep> createState() => _InputNgheNghiep();
}

class _InputNgheNghiep extends State<InputNgheNghiep> {
  final List<DMNgheNghiep> items = [
    DMNgheNghiep(1, "Nông dân"),
    DMNgheNghiep(2, "Bác sĩ"),
    DMNgheNghiep(3, "Giáo viên"),
    DMNgheNghiep(4, "Tổng thống")
  ];

  DMNgheNghiep? selectedValue;
  final TextEditingController textEditingController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return DropdownButtonHideUnderline(
      child: DropdownButton2<DMNgheNghiep>(
        isExpanded: true,

        hint: Text(
          'Vui lòng nhập nghề nghiệp',
          style: TextStyle(
            fontSize: 16,
            color: Theme.of(context).hintColor,
          ),
        ),
        items: items
            .map((item) => DropdownMenuItem(
                  value: item,
                  child: Text(
                    item.tenNgheNghiep,
                    style: const TextStyle(
                        fontSize: 16, fontWeight: FontWeight.normal),
                  ),
                ))
            .toList(),
        value: selectedValue,
        onChanged: (value) {
          setState(() {
            selectedValue = value;
          });
        },
        buttonStyleData: ButtonStyleData(
          height: 45,
          decoration: BoxDecoration(
              color: Color(0xffe0e0e0),
              border:
                  Border(bottom: BorderSide(color: Colors.black, width: 1))),
        ),
        dropdownStyleData: DropdownStyleData(
          decoration: BoxDecoration(color: Colors.white),
          maxHeight: 300,
        ),
        menuItemStyleData: MenuItemStyleData(
          height: 40,
        ),
        dropdownSearchData: DropdownSearchData(
          searchController: textEditingController,
          searchInnerWidgetHeight: 50,
          searchInnerWidget: Container(
            height: 50,
            padding: EdgeInsets.only(
              top: 8,
              bottom: 4,
              right: 8,
              left: 8,
            ),
            child: TextField(
              expands: true,
              maxLines: null,
              controller: textEditingController,
              decoration: InputDecoration(
                isDense: true,
                contentPadding: EdgeInsets.symmetric(
                  horizontal: 10,
                  vertical: 8,
                ),
                hintText: 'Tìm kiếm',
                hintStyle: TextStyle(fontSize: 16),
                border: OutlineInputBorder(),
              ),
            ),
          ),
          searchMatchFn: (item, searchValue) {
            return item.value!.tenNgheNghiep
                .toString()
                .toLowerCase()
                .contains(searchValue.toLowerCase());
          },
        ),
        //This to clear the search value when you close the menu
        onMenuStateChange: (isOpen) {
          if (!isOpen) {
            textEditingController.clear();
          }
        },
      ),
    );
  }
}

class CustomButtonBottom extends StatelessWidget {
  const CustomButtonBottom({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(backgroundColor: Color(0xff1565c0)),
        onPressed: () {
          Navigator.pop(context);
          // Chuyển trang với hiệu ứng tùy chỉnh
          // Navigator.push(
          //   context,
          //   PageRouteBuilder(
          //     pageBuilder: (context, animation, secondaryAnimation) {
          //       return ListHoSoBenhNhan();
          //     },
          //     transitionsBuilder:
          //         (context, animation, secondaryAnimation, child) {
          //       // Hiệu ứng chuyển trang từ phải sang trái
          //       const begin = Offset(1.0, 0.0); // bắt đầu từ phải
          //       const end = Offset.zero; // kết thúc tại vị trí ban đầu
          //       const curve = Curves.easeInOut;

          //       var tween = Tween(begin: begin, end: end)
          //           .chain(CurveTween(curve: curve));
          //       var offsetAnimation = animation.drive(tween);

          //       return SlideTransition(position: offsetAnimation, child: child);
          //     },
          //   ),
          // );
        },
        child: Text(
          "Tiếp tục",
          style: TextStyle(color: Colors.white, fontSize: 18),
        ),
      ),
    );
    ;
  }
}
