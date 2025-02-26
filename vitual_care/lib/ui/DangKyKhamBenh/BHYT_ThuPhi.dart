import 'package:flutter/material.dart';
import 'package:vitual_care/ui/DangKyKhamBenh/Components/ChonChuyenKhoa.dart';
import 'package:vitual_care/ui/DangKyKhamBenh/Components/ChonGioKham.dart';
import 'package:vitual_care/ui/DangKyKhamBenh/Components/ChonNgayKham.dart';
import 'package:vitual_care/ui/DangKyKhamBenh/Components/ChonPhongKham.dart';
import 'package:vitual_care/ui/ThongTinBenhNhan/DanhSachHoSo.dart';

class BHYTThuPhi extends StatelessWidget {
  const BHYTThuPhi({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
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
            title: Text('BHYT, thu phí'),
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
      body: CustomBHYTThuPhi(),
      bottomNavigationBar: PreferredSize(
        preferredSize: Size.fromHeight(60), // Chiều cao của nút
        child: CustomButtonBottom(),
      ),
    ));
  }
}

class CustomBHYTThuPhi extends StatelessWidget {
  const CustomBHYTThuPhi({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
        padding: EdgeInsets.symmetric(horizontal: 10, vertical: 20),
        decoration: BoxDecoration(
          color: Colors.white, // Màu nền của container
          borderRadius: BorderRadius.circular(10), // Bo góc với bán kính 20
        ),
        child: Column(
          children: [
            Container(
              width: double.infinity,
              padding: EdgeInsets.symmetric(horizontal: 5),
              child: Text(
                'Chọn chuyên khoa',
                style: TextStyle(fontSize: 16),
              ),
            ),
            ChonChuyenKhoa(),
            SizedBox(
              height: 30,
            ),
            Container(
              width: double.infinity,
              padding: EdgeInsets.symmetric(horizontal: 5),
              child: Text(
                'Chọn phòng khám - bác sĩ khám',
                style: TextStyle(fontSize: 16),
              ),
            ),
            ChonPhongKham(),
            SizedBox(
              height: 30,
            ),
            Container(
              width: double.infinity,
              padding: EdgeInsets.symmetric(horizontal: 5),
              child: Text(
                'Chọn ngày khám',
                style: TextStyle(fontSize: 16),
              ),
            ),
            ChonNgayKham(),
            SizedBox(
              height: 30,
            ),
            Container(
              width: double.infinity,
              padding: EdgeInsets.symmetric(horizontal: 5),
              child: Text(
                'Chọn giờ khám',
                style: TextStyle(fontSize: 16),
              ),
            ),
            ChonGioKham(),
          ],
        ),
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
          // Chuyển trang với hiệu ứng tùy chỉnh
          Navigator.push(
            context,
            PageRouteBuilder(
              pageBuilder: (context, animation, secondaryAnimation) {
                return DanhSachHoSo();
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

                return SlideTransition(position: offsetAnimation, child: child);
              },
            ),
          );
        },
        child: Text(
          "Tiếp tục",
          style: TextStyle(color: Colors.white, fontSize: 18),
        ),
      ),
    );
  }
}
