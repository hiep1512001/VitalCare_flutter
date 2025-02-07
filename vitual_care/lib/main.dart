import 'package:flutter/material.dart';
import 'package:vitual_care/ui/DangKyKhamBenh/TaiKhamKhoa.dart';
import './ui/TrangChu/TrangChu.dart';

void main() {
  runApp(MaterialApp(
      home: SafeArea(
        child: TrangChu(),
      ),
      debugShowCheckedModeBanner: false));
}
