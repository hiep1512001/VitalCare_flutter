import 'package:flutter/material.dart';
import 'package:vitual_care/data/DMNgheNghiep.dart';
import 'package:dropdown_button2/dropdown_button2.dart';

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
    DMNgheNghiep(4, "Tổng thống"),
    DMNgheNghiep(5, "Nông dân"),
    DMNgheNghiep(6, "Bác sĩ"),
    DMNgheNghiep(7, "Giáo viên"),
    DMNgheNghiep(8, "Tổng thống")
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
            fontWeight: FontWeight.normal,
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
              borderRadius: BorderRadius.circular(10),
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
