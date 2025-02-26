import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:vitual_care/data/DMTinh.dart';

class InputTinh extends StatefulWidget {
  const InputTinh({super.key});

  @override
  State<InputTinh> createState() => _InputTinh();
}

class _InputTinh extends State<InputTinh> {
  final List<DMTinh> items = [
    DMTinh(1, "Tp Hồ Chí Minh"),
    DMTinh(2, "Long An"),
    DMTinh(3, "Tiền Giang"),
    DMTinh(4, "Bến Tre"),
    DMTinh(5, "Bạc Liêu"),
    DMTinh(6, "Vĩnh Long"),
    DMTinh(7, "Kiêng Giang"),
    DMTinh(8, "Cà Mau")
  ];
  DMTinh? selectedValue;
  final TextEditingController textEditingController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return DropdownButtonHideUnderline(
      child: DropdownButton2<DMTinh>(
        isExpanded: true,

        hint: Text(
          'Vui lòng nhập tỉnh / thành phố',
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
                    item.tenTinh,
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
            return item.value!.tenTinh
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
