import "package:flutter/material.dart";
import "package:vitual_care/ui/DangKyKhamBenh/BHYT_ThuPhi.dart";
import "package:vitual_care/ui/DangKyKhamBenh/KhamVIP.dart";
import "package:vitual_care/ui/DangKyKhamBenh/KhamYeuCau.dart";
import "package:vitual_care/ui/DangKyKhamBenh/TaiKhamKhoa.dart";

class TrangChu extends StatelessWidget {
  const TrangChu({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(70.0),
        child: Container(
          // padding: EdgeInsets.symmetric(horizontal: 8),
          alignment: Alignment.center,
          decoration: BoxDecoration(
              border: Border(bottom: BorderSide(color: Colors.grey)),
              color: Colors.white),
          child: AppBar(
            bottom: null,
            backgroundColor: Colors.white,
            title: Title(),
            centerTitle: true,
          ),
        ),
      ),
      body: CustomContent(),
      drawer: Drawer(
        // Add a ListView to the drawer. This ensures the user can scroll
        // through the options in the drawer if there isn't enough vertical
        // space to fit everything.
        child: ListView(
          // Important: Remove any padding from the ListView.
          padding: EdgeInsets.zero,
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(color: Color(0xff0d47a1)),
              child: Text(
                'Bệnh viện nhân dân 115',
                style: TextStyle(color: Colors.white),
              ),
            ),
            ListTile(
              title: const Text('Home'),
              // selected: _selectedIndex == 0,
              onTap: () {
                // Update the state of the app
                // _onItemTapped(0);
                // Then close the drawer
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: const Text('Business'),
              // selected: _selectedIndex == 1,
              onTap: () {
                // Update the state of the app
                // _onItemTapped(1);
                // Then close the drawer
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: const Text('School'),
              // selected: _selectedIndex == 2,
              onTap: () {
                // Update the state of the app
                // _onItemTapped(2);
                // Then close the drawer
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
    );
  }
}

//app bar
class Title extends StatelessWidget {
  const Title({super.key});
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(
          height: 15,
        ),
        Text(
          'Bệnh viện nhân dân 115',
          style: TextStyle(
              color: Color(0xff0d47a1),
              fontSize: 22,
              fontWeight: FontWeight.bold),
        ),
        Text(
          'Trao yêu thương - trao sức khỏe',
          style: TextStyle(
              color: Color(0xff0d47a1),
              fontSize: 14,
              fontWeight: FontWeight.bold),
        ),
        SizedBox(
          height: 5,
        ),
      ],
    );
  }
}

//content
class CustomContent extends StatelessWidget {
  const CustomContent({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: BouncingScrollPhysics(),
      child: Container(
        color: Color(0xffeeeeee),
        child: Column(
          children: [
            SizedBox(
              height: 5,
            ),
            CustomBanner(),
            CustomDKKB(),
            CustomThanhToan(),
            CustomKetQuaCLS(),
            CustomLichSuKham(),
            SizedBox(
              height: 15,
            ),
            CustomFooter(),
          ],
        ),
      ),
    );
  }
}

class CustomBanner extends StatelessWidget {
  const CustomBanner({super.key});
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      color: Color(0xff1565c0),
      padding: const EdgeInsets.all(15.0),
      child: Column(
        spacing: 15,
        children: [
          Text(
            'Chăm sóc sức khỏe',
            style: TextStyle(color: Colors.white, fontSize: 28),
          ),
          Text(
            "Đặt lịch khám và chăm sóc sức khỏe mọi lúc, mọi nơi",
            style: TextStyle(color: Colors.white, fontSize: 20),
            textAlign: TextAlign.center,
          ),
          ElevatedButton(
            onPressed: () => {},
            child: Text(
              'Đặt lịch ngay',
              style: TextStyle(color: Colors.black),
            ),
          )
        ],
      ),
    );
  }
}

class CustomDKKB extends StatelessWidget {
  const CustomDKKB({super.key});
  final urlDKKB = "assets/icons/calendar.png";
  final urlTaiKhamKhoa = "assets/icons/exchange.png";
  final urlKYC = "assets/icons/star.png";
  final urlBHYT = "assets/icons/credit-card.png";
  final urlKhamVip = "assets/icons/crown.png";
  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
          color: Colors.white, // Màu nền của container
          borderRadius: BorderRadius.circular(10), // Bo góc với bán kính 20
        ),
        margin: const EdgeInsets.all(10.0),
        padding: const EdgeInsets.all(25.0),
        child: Column(
          spacing: 15,
          children: [
            Column(
              children: [
                Image.asset(
                  urlDKKB,
                  width: 50,
                ),
                Text(
                  "Đăng ký khám bệnh",
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                )
              ],
            ),
            Row(
              spacing: 15,
              children: [
                Expanded(
                    flex: 1,
                    child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Color(0xffeeeeee),
                          padding: EdgeInsets.symmetric(
                              horizontal: 10, vertical: 20), // Padding
                          textStyle: TextStyle(
                            fontSize: 18,
                          ), // Kiểu chữ
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10), // Bo góc
                          ),
                        ),
                        onPressed: () {
                          // Chuyển trang với hiệu ứng tùy chỉnh
                          Navigator.push(
                            context,
                            PageRouteBuilder(
                              pageBuilder:
                                  (context, animation, secondaryAnimation) {
                                return TaiKhamKhoa();
                              },
                              transitionsBuilder: (context, animation,
                                  secondaryAnimation, child) {
                                // Hiệu ứng chuyển trang từ phải sang trái
                                const begin =
                                    Offset(1.0, 0.0); // bắt đầu từ phải
                                const end =
                                    Offset.zero; // kết thúc tại vị trí ban đầu
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
                        // onPressed: () {
                        //   Navigator.push(
                        //       context,
                        //       MaterialPageRoute(
                        //           builder: (context) => TaiKhamKhoa()));
                        // },
                        child: Column(
                          children: [
                            Image.asset(
                              urlTaiKhamKhoa,
                              width: 30,
                            ),
                            Text(
                              "Tái khám tại khoa",
                              overflow: TextOverflow
                                  .ellipsis, // Thêm dấu ba chấm nếu văn bản vượt quá chiều rộng
                              softWrap: false,
                              textAlign: TextAlign.center,
                              style: TextStyle(color: Colors.black),
                            ),
                          ],
                        ))),
                Expanded(
                    flex: 1,
                    child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Color(0xffeeeeee),
                          padding: EdgeInsets.symmetric(
                              horizontal: 10, vertical: 20), // Padding
                          textStyle: TextStyle(
                            color: Colors.black,
                            fontSize: 18,
                          ), // Kiểu chữ
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10), // Bo góc
                          ),
                        ),
                        onPressed: () {
                          Navigator.push(
                            context,
                            PageRouteBuilder(
                              pageBuilder:
                                  (context, animation, secondaryAnimation) {
                                return KhamYeuCau();
                              },
                              transitionsBuilder: (context, animation,
                                  secondaryAnimation, child) {
                                // Hiệu ứng chuyển trang từ phải sang trái
                                const begin =
                                    Offset(1.0, 0.0); // bắt đầu từ phải
                                const end =
                                    Offset.zero; // kết thúc tại vị trí ban đầu
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
                        child: Column(
                          children: [
                            Image.asset(
                              urlKYC,
                              width: 30,
                            ),
                            Text(
                              "Khám theo yêu cầu",
                              overflow: TextOverflow
                                  .ellipsis, // Thêm dấu ba chấm nếu văn bản vượt quá chiều rộng
                              softWrap: false,
                              textAlign: TextAlign.center,
                              style: TextStyle(color: Colors.black),
                            ),
                          ],
                        )))
              ],
            ),
            Row(
              spacing: 15,
              children: [
                Expanded(
                    flex: 1,
                    child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Color(0xffeeeeee),
                          padding: EdgeInsets.symmetric(
                              horizontal: 10, vertical: 20), // Padding
                          textStyle: TextStyle(
                            color: Colors.black,
                            fontSize: 18,
                          ), // Kiểu chữ
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10), // Bo góc
                          ),
                        ),
                        onPressed: () {
                          Navigator.push(
                            context,
                            PageRouteBuilder(
                              pageBuilder:
                                  (context, animation, secondaryAnimation) {
                                return BHYTThuPhi();
                              },
                              transitionsBuilder: (context, animation,
                                  secondaryAnimation, child) {
                                // Hiệu ứng chuyển trang từ phải sang trái
                                const begin =
                                    Offset(1.0, 0.0); // bắt đầu từ phải
                                const end =
                                    Offset.zero; // kết thúc tại vị trí ban đầu
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
                        child: Column(
                          children: [
                            Image.asset(
                              urlBHYT,
                              width: 30,
                            ),
                            Text(
                              "BHYT, thu phí",
                              overflow: TextOverflow
                                  .ellipsis, // Thêm dấu ba chấm nếu văn bản vượt quá chiều rộng
                              softWrap: false,
                              textAlign: TextAlign.center,
                              style: TextStyle(color: Colors.black),
                            ),
                          ],
                        ))),
                Expanded(
                    flex: 1,
                    child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Color(0xffeeeeee),
                          padding: EdgeInsets.symmetric(
                              horizontal: 10, vertical: 20), // Padding
                          textStyle: TextStyle(
                            color: Colors.black,
                            fontSize: 18,
                          ), // Kiểu chữ
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10), // Bo góc
                          ),
                        ),
                        onPressed: () {
                          Navigator.push(
                            context,
                            PageRouteBuilder(
                              pageBuilder:
                                  (context, animation, secondaryAnimation) {
                                return KhamVIP();
                              },
                              transitionsBuilder: (context, animation,
                                  secondaryAnimation, child) {
                                // Hiệu ứng chuyển trang từ phải sang trái
                                const begin =
                                    Offset(1.0, 0.0); // bắt đầu từ phải
                                const end =
                                    Offset.zero; // kết thúc tại vị trí ban đầu
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
                        child: Column(
                          children: [
                            Image.asset(
                              urlKhamVip,
                              width: 30,
                            ),
                            Text(
                              "Khám VIP",
                              overflow: TextOverflow
                                  .ellipsis, // Thêm dấu ba chấm nếu văn bản vượt quá chiều rộng
                              softWrap: false,
                              textAlign: TextAlign.center,
                              style: TextStyle(color: Colors.black),
                            ),
                          ],
                        )))
              ],
            )
          ],
        ));
  }
}

class CustomThanhToan extends StatelessWidget {
  const CustomThanhToan({super.key});
  final urlThanhToan = 'assets/icons/thanhtoan.png';
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.symmetric(horizontal: 10),
      child: ElevatedButton(
          onPressed: () => {},
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.white,
            padding:
                EdgeInsets.symmetric(vertical: 20, horizontal: 35), // Padding
            textStyle: TextStyle(
              color: Colors.black,
              fontSize: 18,
            ), // Kiểu chữ
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10), // Bo góc
            ),
          ),
          child: Column(
            children: [
              Image.asset(
                urlThanhToan,
                width: 50,
              ),
              Text(
                "Thanh toán",
                style: TextStyle(
                    fontSize: 20,
                    color: Colors.black,
                    fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
              Text(
                "Thanh toán viện phí trực tuyến an toàn và tiện lợi",
                style: TextStyle(fontSize: 18, color: Colors.black),
                textAlign: TextAlign.center,
              )
            ],
          )),
    );
  }
}

class CustomKetQuaCLS extends StatelessWidget {
  const CustomKetQuaCLS({super.key});
  final urlKetQuaCLS = "assets/icons/document-file.png";
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      child: ElevatedButton(
          onPressed: () => {},
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.white,
            padding:
                EdgeInsets.symmetric(vertical: 20, horizontal: 35), // Padding
            textStyle: TextStyle(
              color: Colors.black,
              fontSize: 18,
            ), // Kiểu chữ
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10), // Bo góc
            ),
          ),
          child: Column(
            children: [
              Image.asset(
                urlKetQuaCLS,
                width: 50,
              ),
              Text(
                "Kết quả cận lâm sàng",
                style: TextStyle(
                    fontSize: 20,
                    color: Colors.black,
                    fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
              Text(
                "Xem và rải kết quả xét nghiệm, chẩn đoán hình ảnh",
                style: TextStyle(fontSize: 18, color: Colors.black),
                textAlign: TextAlign.center,
              )
            ],
          )),
    );
  }
}

class CustomLichSuKham extends StatelessWidget {
  const CustomLichSuKham({super.key});
  final urlLichSuKham = "assets/icons/clock.png";
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.symmetric(horizontal: 10),
      child: ElevatedButton(
          onPressed: () => {},
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.white,
            padding:
                EdgeInsets.symmetric(vertical: 20, horizontal: 35), // Padding
            textStyle: TextStyle(
              color: Colors.black,
              fontSize: 18,
            ), // Kiểu chữ
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10), // Bo góc
            ),
          ),
          child: Column(
            children: [
              Image.asset(
                urlLichSuKham,
                width: 50,
              ),
              Text(
                "Lịch sử khám",
                style: TextStyle(
                    fontSize: 20,
                    color: Colors.black,
                    fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
              Text(
                "Xem lịch sử khám bệnh và đơn thuốc",
                style: TextStyle(fontSize: 18, color: Colors.black),
                textAlign: TextAlign.center,
              )
            ],
          )),
    );
  }
}

class CustomFooter extends StatelessWidget {
  const CustomFooter({super.key});
  final urlImage = 'assets/images/logobvnd115.jpg';
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(vertical: 20, horizontal: 10),
      color: Color(0xff37474f),
      child: Column(
        spacing: 5,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(40), // Thiết lập bo tròn góc
            child: Image.asset(
              urlImage,
              width: 80,
              height: 80,
              fit: BoxFit
                  .cover, // Đảm bảo hình ảnh chiếm đủ không gian mà không bị méo
            ),
          ),
          Text(
            "BỆNH VIỆN NHÂN DÂN 115",
            textAlign: TextAlign.center,
            style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 22,
                color: Color(0xff1de9b6)),
          ),
          Text(
            "Đại chỉ: 527 Sư Vạn Hạnh, phường 12, quận 10, thành phố Hồ Chí Minh",
            textAlign: TextAlign.center,
            style: TextStyle(color: Colors.white, fontSize: 16),
          ),
          Text(
            "Số điện thoại: 028 3865 2368 - 028 2865 4139 -028 3865 5110, Fax 028 3865 5193",
            textAlign: TextAlign.center,
            style: TextStyle(color: Colors.white, fontSize: 16),
          )
        ],
      ),
    );
  }
}
