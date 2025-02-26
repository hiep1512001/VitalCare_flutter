import 'package:flutter/material.dart';
import 'package:vitual_care/ui/TrangChu/TrangChu.dart';

class DangNhap extends StatelessWidget {
  const DangNhap({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Color(0xffeeeeee),
      body: CustomDanhNhap(),
      bottomNavigationBar: CustomButtonBottom(),
    );
  }
}

class CustomDanhNhap extends StatelessWidget {
  const CustomDanhNhap({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 30),
      decoration: BoxDecoration(
        color: Colors.white, // Màu nền của container
        borderRadius: BorderRadius.circular(10), // Bo góc với bán kính 20
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
              alignment: Alignment.center,
              child: Image.network(
                "https://theme.hstatic.net/200000736895/1001102506/14/logo.png?v=515",
                height: 70,
              )),
          SizedBox(
            height: 40,
          ),
          Container(
            width: double.infinity,
            child: Text(
              "Tài khoản:",
              style: TextStyle(fontSize: 16),
            ),
          ),
          InputAccount(),
          SizedBox(
            height: 20,
          ),
          Container(
            width: double.infinity,
            child: Text(
              "Mật khẩu:",
              style: TextStyle(fontSize: 16),
            ),
          ),
          InputPassword(),
          SizedBox(
            height: 4,
          ),
          Container(
              alignment: Alignment.topRight,
              child: InkWell(
                onTap: () {
                  print('TextButton Pressed');
                },
                child: Text(
                  'Quên mật khẩu?',
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.blue,
                    decoration: TextDecoration.underline,
                  ),
                ),
              )),
          SizedBox(
            height: 25,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Bạn chưa có tài khoản? ",
                style: TextStyle(fontSize: 16),
              ),
              InkWell(
                onTap: () {},
                child: Text(
                  "Đăng ký",
                  style: TextStyle(
                      fontSize: 16,
                      color: Colors.orange,
                      decoration: TextDecoration.underline),
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}

class InputAccount extends StatefulWidget {
  const InputAccount({super.key});

  @override
  State<InputAccount> createState() => _InputAccount();
}

class _InputAccount extends State<InputAccount> {
  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
        contentPadding: EdgeInsets.symmetric(vertical: 12.0, horizontal: 14.0),
        filled: true,
        fillColor: Color(0xffe0e0e0),
        // label: Text("Họ và tên"),
        hintText: "Vui lòng nhập tài khoản",
        hintStyle: TextStyle(fontSize: 16),
        // labelText: '    Chọn ngày khám',
        suffixIcon: Icon(Icons.account_circle),
        enabledBorder: UnderlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(
            color: Colors.black, // Màu viền dưới khi không focus
            width: 1.0, // Độ dày của viền dưới
          ),
        ),
      ),
    );
  }
}

class InputPassword extends StatefulWidget {
  const InputPassword({super.key});

  @override
  State<InputPassword> createState() => _InputPassword();
}

class _InputPassword extends State<InputPassword> {
  @override
  Widget build(BuildContext context) {
    return TextField(
      obscureText: true,
      decoration: InputDecoration(
        contentPadding: EdgeInsets.symmetric(vertical: 12.0, horizontal: 14.0),
        filled: true,
        fillColor: Color(0xffe0e0e0),
        // label: Text("Họ và tên"),
        hintText: "Vui lòng nhập mật khẩu",
        hintStyle: TextStyle(fontSize: 16),
        // labelText: '    Chọn ngày khám',
        suffixIcon: Icon(Icons.lock),
        enabledBorder: UnderlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(
            color: Colors.black, // Màu viền dưới khi không focus
            width: 1.0, // Độ dày của viền dưới
          ),
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
          // Navigator.pop(context);
          // Chuyển trang với hiệu ứng tùy chỉnh
          Navigator.push(
            context,
            PageRouteBuilder(
              pageBuilder: (context, animation, secondaryAnimation) {
                return TrangChu();
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
          "Đăng nhập",
          style: TextStyle(color: Colors.white, fontSize: 18),
        ),
      ),
    );
  }
}
