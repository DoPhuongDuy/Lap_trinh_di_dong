import 'package:flutter/material.dart';

String calculateBMI(double weight, double height, double gender) {
  double bmi = weight / (height * height);
  String result;

  if (gender == 0) {
    if (bmi < 20) {
      result = 'Thiếu cân';
    } else if (bmi < 25) {
      result = 'Bình thường';
    } else if (bmi < 30) {
      result = 'Thừa cân';
    } else {
      result = 'Béo phì';
    }
  } else if (gender == 1) {
    if (bmi < 18) {
      result = 'Thiếu cân';
    } else if (bmi < 24) {
      result = 'Bình thường';
    } else if (bmi < 30) {
      result = 'Thừa cân';
    } else {
      result = 'Béo phì';
    }
  } else {
    result = 'Giới tính không hợp lệ';
  }

  return 'BMI: ${bmi.toStringAsFixed(2)}, Kết quả: $result';
}

class TinhBMI extends StatelessWidget {
  TinhBMI({super.key});

  // Tạo TextEditingController như biến tĩnh
  static final TextEditingController _celsiusController = TextEditingController();
  static final TextEditingController _celsiusController1 = TextEditingController();
  static final TextEditingController _celsiusController2 = TextEditingController();
  static final TextEditingController _fahrenheitController = TextEditingController();

  // Hàm chuyển đổi từ C sang F
  void BMI() {
    if (_celsiusController.text.isNotEmpty && _celsiusController1.text.isNotEmpty) {
      try {
        double weight = double.parse(_celsiusController.text);
        double height = double.parse(_celsiusController1.text);
        double gender = double.parse(_celsiusController2.text);

        _fahrenheitController.text = calculateBMI(weight,height,gender);

      } catch (e) {
        _fahrenheitController.text = 'Lỗi: Vui lòng nhập số';
      }
    } else {
      _fahrenheitController.text = '';
    }
  }

  // Hàm xóa giá trị
  void _clearAll() {
    _celsiusController.clear();
    _celsiusController1.clear();
    _celsiusController2.clear();
    _fahrenheitController.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Chuyển đổi nhiệt độ'),
        backgroundColor: Colors.blue,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Input độ C
            TextField(
              controller: _celsiusController2,
              keyboardType: TextInputType.numberWithOptions(decimal: true),
              decoration: InputDecoration(
                labelText: 'Nhập Giới tính(Nam = 0 , Nữ = 1)',
                border: OutlineInputBorder(),
                suffixIcon: IconButton(
                  icon: Icon(Icons.clear),
                  onPressed: _clearAll,
                ),
              ),
              onChanged: (value) => BMI(),
            ),


            SizedBox(height: 20),
            TextField(
              controller: _celsiusController,
              keyboardType: TextInputType.numberWithOptions(decimal: true),
              decoration: InputDecoration(
                labelText: 'Nhập cân nặng',
                border: OutlineInputBorder(),
                suffixIcon: IconButton(
                  icon: Icon(Icons.clear),
                  onPressed: _clearAll,
                ),
              ),
              onChanged: (value) => BMI(),
            ),
            SizedBox(height: 20),
            TextField(
              controller: _celsiusController1,
              keyboardType: TextInputType.numberWithOptions(decimal: true),
              decoration: InputDecoration(
                labelText: 'nhập chiều cao',
                border: OutlineInputBorder(),
                suffixIcon: IconButton(
                  icon: Icon(Icons.clear),
                  onPressed: _clearAll,
                ),
              ),
              onChanged: (value) => BMI(),
            ),
            SizedBox(height: 20),
            Icon(
              Icons.arrow_downward,
              size: 40,
              color: Colors.blue,
            ),

            SizedBox(height: 20),

            // Input độ F
            TextField(
              controller: _fahrenheitController,
              keyboardType: TextInputType.numberWithOptions(decimal: true),
              decoration: InputDecoration(
                labelText: 'Kết Quả',
                border: OutlineInputBorder(),
                suffixIcon: IconButton(
                  icon: Icon(Icons.clear),
                  onPressed: _clearAll,
                ),
              ),
              onChanged: (value) => BMI(),
            ),

            SizedBox(height: 30),

            // Nút xóa tất cả
            ElevatedButton.icon(
              onPressed: _clearAll,
              icon: Icon(Icons.refresh),
              label: Text('Xóa tất cả'),
              style: ElevatedButton.styleFrom(
                padding: EdgeInsets.symmetric(horizontal: 30, vertical: 15),
              ),
            ),

            SizedBox(height: 20),

            // Container hiển thị công thức
            Container(
              padding: EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.grey[200],
                borderRadius: BorderRadius.circular(8),
              ),
              child: Column(
                children: [
                  Text(
                    'Độ đo BMI',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 8),
                  Text('Nam Dưới 20: Thiếu cân | 20 - 24.9: Bình thường | 25 - 29.9: Thừa cân | 30 trở lên: Béo phì'),
                  Text('Nữ Dưới Dưới 18: Thiếu | cân 18 - 23.9: Bình thường | 24 - 29.9: Thừa cân | 30 trở lên: Béo phì'),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}