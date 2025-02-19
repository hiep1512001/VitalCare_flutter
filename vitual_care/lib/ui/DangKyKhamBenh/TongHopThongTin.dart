import 'package:flutter/material.dart';

class TongHopThongTin extends StatelessWidget {
  const TongHopThongTin({super.key});

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
            title: Text('Tổng hợp thông tin'),
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
      body: CustomContentTongHopThongTin(),
      bottomNavigationBar: PreferredSize(
        preferredSize: Size.fromHeight(60), // Chiều cao của nút
        child: CustomButtonBottom(),
      ),
    );
  }
}

class CustomContentTongHopThongTin extends StatelessWidget {
  const CustomContentTongHopThongTin({super.key});
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        child: Column(
          spacing: 2,
          children: [
            Container(
              margin: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
              padding: EdgeInsets.symmetric(horizontal: 10, vertical: 20),
              decoration: BoxDecoration(
                color: Colors.white, // Màu nền của container
                borderRadius:
                    BorderRadius.circular(10), // Bo góc với bán kính 20
              ),
              child: Column(
                children: [
                  Text(
                    "Hình thức khám: Tái khám khoa",
                    style: TextStyle(
                      fontSize: 18,
                      color: Color(0xff0d47a1),
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Row(
                    spacing: 10,
                    mainAxisAlignment: MainAxisAlignment.start, //ngang
                    crossAxisAlignment: CrossAxisAlignment.start, //dọc
                    children: [
                      Icon(Icons.location_on_outlined),
                      Expanded(
                          child: Text(
                        "527 Sư Vạn Hạnh, phường 12, quận 10, TP.HCM",
                        style: TextStyle(fontSize: 16),
                      ))
                    ],
                  ),
                ],
              ),
            ),
            Container(
              decoration: BoxDecoration(
                color: Colors.white, // Màu nền của container
                borderRadius:
                    BorderRadius.circular(10), // Bo góc với bán kính 20
              ),
              margin: EdgeInsets.symmetric(horizontal: 10),
              padding: EdgeInsets.symmetric(horizontal: 10, vertical: 20),
              child: Column(
                spacing: 2,
                children: [
                  Text(
                    "Thông tin bệnh nhân",
                    style: TextStyle(
                      fontSize: 18,
                      color: Color(0xff0d47a1),
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start, //ngang
                    crossAxisAlignment: CrossAxisAlignment.start, //dọc
                    spacing: 10,
                    children: [
                      Icon(Icons.person_outline),
                      Expanded(
                          child: Text(
                        "Họ và tên: Nguyễn Hoàng Hiệp",
                        style: TextStyle(fontSize: 16),
                      ))
                    ],
                  ),
                  Row(
                    spacing: 10,
                    mainAxisAlignment: MainAxisAlignment.start, //ngang
                    crossAxisAlignment: CrossAxisAlignment.start, //dọc
                    children: [
                      Icon(Icons.calendar_month_outlined),
                      Expanded(
                          child: Text(
                        "Ngày sinh: 15/01/2001",
                        style: TextStyle(fontSize: 16),
                      ))
                    ],
                  ),
                  Row(
                    spacing: 10,
                    mainAxisAlignment: MainAxisAlignment.start, //ngang
                    crossAxisAlignment: CrossAxisAlignment.start, //dọc
                    children: [
                      Icon(Icons.transgender_outlined),
                      Expanded(
                          child: Text(
                        "Giới tính: Nam",
                        style: TextStyle(fontSize: 16),
                      ))
                    ],
                  )
                ],
              ),
            ),
            Container(
              decoration: BoxDecoration(
                color: Colors.white, // Màu nền của container
                borderRadius:
                    BorderRadius.circular(10), // Bo góc với bán kính 20
              ),
              margin: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
              padding: EdgeInsets.symmetric(horizontal: 10, vertical: 20),
              child: Column(
                spacing: 2,
                children: [
                  Text(
                    "Thông tin đặt khám",
                    style: TextStyle(
                      fontSize: 18,
                      color: Color(0xff0d47a1),
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Row(
                    spacing: 10,
                    mainAxisAlignment: MainAxisAlignment.start, //ngang
                    crossAxisAlignment: CrossAxisAlignment.start, //dọc
                    children: [
                      Icon(Icons.list_alt_outlined),
                      Expanded(
                          child: Text(
                        "Hình thức khám: Tái khám khoa",
                        style: TextStyle(fontSize: 16),
                      ))
                    ],
                  ),
                  Row(
                    spacing: 10,
                    mainAxisAlignment: MainAxisAlignment.start, //ngang
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Icon(Icons.health_and_safety_outlined),
                      Expanded(
                          child: Text(
                        "Chuyên khoa: Cơ xương khớp",
                        style: TextStyle(fontSize: 16),
                      ))
                    ],
                  ),
                  Row(
                    spacing: 10,
                    mainAxisAlignment: MainAxisAlignment.start, //ngang
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Icon(Icons.meeting_room_outlined),
                      Expanded(
                          child: Text(
                        "Phòng khám: PK.Dịch vụ cơ xương khớp",
                        style: TextStyle(fontSize: 16),
                      ))
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start, //ngang
                    crossAxisAlignment: CrossAxisAlignment.start,
                    spacing: 10,

                    children: [
                      Icon(Icons.local_hospital_outlined),
                      Expanded(
                          child: Text(
                        "Bác sĩ: Nguyễn Văn A",
                        style: TextStyle(fontSize: 16),
                      ))
                    ],
                  ),
                  Row(
                    spacing: 10,
                    mainAxisAlignment: MainAxisAlignment.start, //ngang
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Icon(Icons.calendar_month_outlined),
                      Expanded(
                          child: Text(
                        "Ngày khám: 12/22/1111",
                        style: TextStyle(fontSize: 16),
                      ))
                    ],
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 10),
                    width: double.infinity,
                    child: Text(
                      "Tiền khám: 150.000 VND",
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.red),
                      textAlign: TextAlign.end,
                    ),
                  )
                ],
              ),
            )
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
          "Thanh toán",
          style: TextStyle(color: Colors.white, fontSize: 18),
        ),
      ),
    );
  }
}
