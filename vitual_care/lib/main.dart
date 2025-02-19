import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:vitual_care/ui/DangKyKhamBenh/KhamYeuCau.dart';
import 'package:vitual_care/ui/DangKyKhamBenh/TaiKhamKhoa.dart';
import 'package:vitual_care/ui/DangKyKhamBenh/TongHopThongTin.dart';
import 'package:vitual_care/ui/ThongTinBenhNhan/DanhSachHoSo.dart';
import 'package:vitual_care/ui/ThongTinBenhNhan/DienThongTinHoSo.dart';
import './ui/TrangChu/TrangChu.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

void main() {
  runApp(ProviderScope(
      child: MaterialApp(
          locale: Locale('vi', 'VN'), // Thiết lập ngôn ngữ Tiếng Việt
          supportedLocales: [
            Locale('en', 'US'),
            Locale('vi', 'VN'), // Thêm Tiếng Việt vào danh sách ngôn ngữ hỗ trợ
          ],
          localizationsDelegates: [
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
          ],
          home: SafeArea(
            child: TrangChu(),
          ),
          debugShowCheckedModeBanner: false)));
}
