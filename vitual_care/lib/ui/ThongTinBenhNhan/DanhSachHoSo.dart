import 'package:flutter/material.dart';
import 'package:vitual_care/ui/DangKyKhamBenh/TongHopThongTin.dart';
import 'package:vitual_care/ui/ThongTinBenhNhan/DienThongTinHoSo.dart';

class DanhSachHoSo extends StatelessWidget {
  const DanhSachHoSo({super.key});

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
            actions: [
              IconButton(
                icon: const Icon(Icons.create_new_folder),
                tooltip: 'Thêm hồ sơ',
                onPressed: () {
                  Navigator.push(
                    context,
                    PageRouteBuilder(
                      pageBuilder: (context, animation, secondaryAnimation) {
                        return DienThongTinHoSo();
                      },
                      transitionsBuilder:
                          (context, animation, secondaryAnimation, child) {
                        // Hiệu ứng chuyển trang từ phải sang trái
                        const begin = Offset(1.0, 0.0); // bắt đầu từ phải
                        const end = Offset.zero; // kết thúc tại vị trí ban đầu
                        const curve = Curves.easeInOut;

                        var tween = Tween(begin: begin, end: end)
                            .chain(CurveTween(curve: curve));
                        var offsetAnimation = animation.drive(tween);

                        return SlideTransition(
                            position: offsetAnimation, child: child);
                      },
                    ),
                  );
                },
              ),
            ],
            bottom: null,
            backgroundColor: Colors.white,
            title: Text('Danh sách hồ sơ'),
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
      body: CustomContentDanhSachHoSo(),
      // bottomNavigationBar: PreferredSize(
      //   preferredSize: Size.fromHeight(60), // Chiều cao của nút
      //   child: CustomButtonBottom(),
      // ),
    );
  }
}

class CustomContentDanhSachHoSo extends StatefulWidget {
  const CustomContentDanhSachHoSo({super.key});

  @override
  State<CustomContentDanhSachHoSo> createState() =>
      _CustomContentDanhSachHoSo();
}

class _CustomContentDanhSachHoSo extends State<CustomContentDanhSachHoSo> {
  final List<Map<String, dynamic>> items = [
    {'HoVaTen': 'Nguyễn Văn A', 'NamSinh': 2001},
    {'HoVaTen': 'Nguyễn Văn B', 'NamSinh': 2002},
    {'HoVaTen': 'Nguyễn Văn C', 'NamSinh': 2003},
  ];
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: items.length,
      itemBuilder: (context, index) {
        var item = items[index];
        return CustomItemListView(item['HoVaTen'], item['NamSinh']);
      },
    );
  }
}

class CustomItemListView extends StatefulWidget {
  final String hoVaTen;
  final int namSinh;
  // final int namSinh;
  CustomItemListView(this.hoVaTen, this.namSinh);
  @override
  State<CustomItemListView> createState() => _CustomItemListView();
}

class _CustomItemListView extends State<CustomItemListView> {
  @override
  Widget build(BuildContext context) {
    String _hoVaTen = widget.hoVaTen;
    int _namSinh = widget.namSinh;
    return Container(
      height: 60,
      margin: EdgeInsets.symmetric(vertical: 5),
      child: ElevatedButton(
          style: ElevatedButton.styleFrom(
              backgroundColor: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
                // Bo góc
              ),
              iconColor: Colors.black),
          onPressed: () {
            // Chuyển trang với hiệu ứng tùy chỉnh
            Navigator.push(
              context,
              PageRouteBuilder(
                pageBuilder: (context, animation, secondaryAnimation) {
                  return TongHopThongTin();
                },
                transitionsBuilder:
                    (context, animation, secondaryAnimation, child) {
                  // Hiệu ứng chuyển trang từ phải sang trái
                  const begin = Offset(1.0, 0.0); // bắt đầu từ phải
                  const end = Offset.zero; // kết thúc tại vị trí ban đầu
                  const curve = Curves.easeInOut;

                  var tween = Tween(begin: begin, end: end)
                      .chain(CurveTween(curve: curve));
                  var offsetAnimation = animation.drive(tween);

                  return SlideTransition(
                      position: offsetAnimation, child: child);
                },
              ),
            );
          },
          child: Row(
            spacing: 10,
            children: [
              Icon(
                Icons.folder,
              ),
              Text(
                "Hồ sơ " + _hoVaTen + " - " + _namSinh.toString(),
                style: TextStyle(
                    fontSize: 16,
                    color: Colors.black,
                    fontWeight: FontWeight.normal),
              )
            ],
          )),
    );
  }
}
