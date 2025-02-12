import 'package:dropdown_button2/dropdown_button2.dart';
import "package:flutter/material.dart";
import 'package:vitual_care/data/DMGioiKham.dart';

class ChonGioKham extends StatefulWidget {
  const ChonGioKham({super.key});

  @override
  State<ChonGioKham> createState() => _ChonGioKham();
}

class _ChonGioKham extends State<ChonGioKham> {
  final List<DMGioiKham> items = [
    DMGioiKham(1, "7h-8h"),
    DMGioiKham(2, "8h-9h"),
    DMGioiKham(3, "9h-10h"),
    DMGioiKham(4, "10h-11h"),
  ];
  DMGioiKham? selectedValue;
  final TextEditingController textEditingController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return DropdownButtonHideUnderline(
      child: DropdownButton2<DMGioiKham>(
        isExpanded: true,
        hint: Text(
          'Vui lòng chọn giờ khám',
          style: TextStyle(
            fontSize: 16,
            color: Theme.of(context).hintColor,
          ),
        ),

        items: items
            .map((item) => DropdownMenuItem<DMGioiKham>(
                  value: item,
                  child: Text(
                    item.gioiKham,
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
                hintStyle: TextStyle(fontSize: 12),
                border: OutlineInputBorder(),
              ),
            ),
          ),
          searchMatchFn: (item, searchValue) {
            return item.value!.gioiKham
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
