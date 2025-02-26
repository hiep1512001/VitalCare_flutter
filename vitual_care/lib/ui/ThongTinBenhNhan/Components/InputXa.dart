import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:vitual_care/data/DMXa.dart';

class InputXa extends StatefulWidget {
  const InputXa({super.key});

  @override
  State<InputXa> createState() => _InputXa();
}

class _InputXa extends State<InputXa> {
  final List<DMXa> items = [
    DMXa(1, 1, "phường 12"),
    DMXa(2, 2, "xã Mỹ Yên"),
    DMXa(3, 3, "xã Gò Công"),
    DMXa(4, 4, "xã Bình Đại"),
    DMXa(5, 5, "xã Phước Hải"),
    DMXa(6, 6, "xã Phú Mỹ"),
    DMXa(7, 7, "xã Kiến Tường"),
    DMXa(8, 8, "xã Tân An")
  ];
  DMXa? selectedValue;
  final TextEditingController textEditingController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return DropdownButtonHideUnderline(
      child: DropdownButton2<DMXa>(
        isExpanded: true,

        hint: Text(
          'Vui lòng nhập xã / phường',
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
                    item.tenXa,
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
            return item.value!.tenXa
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
