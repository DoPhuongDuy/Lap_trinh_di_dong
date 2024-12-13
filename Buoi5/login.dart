import 'package:flutter/material.dart';

import 'Home.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});

  // Tạo TextEditingController để điều khiển các ô nhập liệu
  static final TextEditingController _usernameController = TextEditingController();
  static final TextEditingController _passwordController = TextEditingController();

  // Hàm kiểm tra thông tin đăng nhập
  void _checkLogin(BuildContext context) {
    String username = _usernameController.text;
    String password = _passwordController.text;

    if (username.isEmpty || password.isEmpty) {
      // Hiển thị thông báo lỗi nếu trống
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Vui lòng nhập đầy đủ thông tin đăng nhập!'),
          backgroundColor: Colors.red,
        ),
      );
    } else {
      // Chuyển về HomeScreen nếu thông tin hợp lệ
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => HomeScreen()),
      );
      print('Chuyển về home');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Đăng nhập'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Ô nhập username
            TextField(
              controller: _usernameController,
              decoration: const InputDecoration(
                labelText: 'Tên đăng nhập',
                border: OutlineInputBorder(),
              ),
            ),

            const SizedBox(height: 20),

            // Ô nhập password
            TextField(
              controller: _passwordController,
              obscureText: true,
              decoration: const InputDecoration(
                labelText: 'Mật khẩu',
                border: OutlineInputBorder(),
              ),
            ),

            const SizedBox(height: 30),

            // Nút đăng nhập
            ElevatedButton(
              onPressed: () => _checkLogin(context),
              child: const Text('Đăng nhập'),
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
