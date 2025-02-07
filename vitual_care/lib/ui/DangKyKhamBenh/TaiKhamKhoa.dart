import "package:flutter/material.dart";
import "package:vitual_care/ui/DangKyKhamBenh/Components/ChonChuyenKHoa.dart";

class TaiKhamKhoa extends StatelessWidget {
  const TaiKhamKhoa({super.key});

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
            title: Text('Tái khám tại khoa'),
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
      body: CustomContentTaiKhamKhoa(),
    ));
  }
}

class CustomContentTaiKhamKhoa extends StatelessWidget {
  const CustomContentTaiKhamKhoa({super.key});
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white, // Màu nền của container
          borderRadius: BorderRadius.circular(10), // Bo góc với bán kính 20
        ),
        margin: const EdgeInsets.all(10.0),
        padding: const EdgeInsets.all(15.0),
        child: Column(
          spacing: 20,
          children: [
            TextField(
              decoration: InputDecoration(
                label: Text("Chọn chuyên khoa"),
                hintText: 'Vui lòng chọn chuyên khoa',
                border: OutlineInputBorder(),
              ),
            ),
            ChonChuyenKhoa()
          ],
        ),
      ),
    );
  }
}
