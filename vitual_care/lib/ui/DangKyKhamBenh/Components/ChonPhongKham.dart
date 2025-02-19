import 'package:flutter/material.dart';
import 'package:vitual_care/data/DMPhongKham.dart';
import 'package:dropdown_button2/dropdown_button2.dart';

class ChonPhongKham extends StatefulWidget {
  const ChonPhongKham({super.key});

  @override
  State<ChonPhongKham> createState() => _ChonPhongKham();
}

class _ChonPhongKham extends State<ChonPhongKham> {
  final List<DMPhongKham> items = [
    DMPhongKham(1, "KYC15 - BS.Ngô Thị Cẩm Hoa"),
    DMPhongKham(2, "Nội thần kinh"),
    DMPhongKham(3, "KYC15 - BS.Ngô Thị Cẩm Hoa"),
    DMPhongKham(4, "NGoại tổng hợp")
  ];

  DMPhongKham? selectedValue;
  final TextEditingController textEditingController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return DropdownButtonHideUnderline(
      child: DropdownButton2<DMPhongKham>(
        isExpanded: true,

        hint: Text(
          'Vui lòng chọn phòng khám',
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
                    item.tenPhongKham,
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
              borderRadius: BorderRadius.circular(10.0),
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
            return item.value!.tenPhongKham
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
