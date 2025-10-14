import 'package:flutter/material.dart';

class EditProfileScreen extends StatefulWidget {
  const EditProfileScreen({super.key});

  @override
  State<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  final TextEditingController _nameController = TextEditingController(
    text: "Phạm Thắng",
  );
  final TextEditingController _emailController = TextEditingController(
    text: "23211TT1718@mail.tdc.edu.vn",
  );
  final TextEditingController _addressController = TextEditingController(
    text: "115/16, Hồ Văn Tư, Thủ Đức",
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Chỉnh sửa thông tin",
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
        iconTheme: const IconThemeData(color: Colors.black),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              // avatar.png + camera icon
              Center(
                child: Stack(
                  children: [
                    const CircleAvatar(
                      radius: 50,
                      backgroundImage: NetworkImage(
                        "https://i.pinimg.com/736x/d4/38/25/d43825dd483d634e59838d919c3cf393.jpg",
                      ),
                    ),
                    Positioned(
                      bottom: 0,
                      right: 0,
                      child: CircleAvatar(
                        radius: 18,
                        backgroundColor: Colors.white,
                        child: IconButton(
                          icon: const Icon(
                            Icons.camera_alt,
                            size: 18,
                            color: Colors.blue,
                          ),
                          onPressed: () {
                            // Chọn ảnh mới
                          },
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 30),

              // Họ và tên
              TextField(
                controller: _nameController,
                decoration: const InputDecoration(
                  prefixIcon: Icon(
                    Icons.person_outline,
                    color: Colors.blue,
                    size: 40,
                  ),
                  labelText: "Họ và tên",
                  labelStyle: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontStyle: FontStyle.italic,
                    fontSize: 20,
                    color: Colors.black,
                  ),
                  border: UnderlineInputBorder(),
                ),
              ),
              const SizedBox(height: 20),

              // Email
              TextField(
                controller: _emailController,
                decoration: const InputDecoration(
                  prefixIcon: Icon(
                    Icons.email_outlined,
                    color: Colors.blue,
                    size: 40,
                  ),
                  labelText: "Email",
                  labelStyle: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontStyle: FontStyle.italic,
                    fontSize: 20,
                    color: Colors.black,
                  ),
                  border: UnderlineInputBorder(),
                ),
              ),
              const SizedBox(height: 20),

              // Địa chỉ
              TextField(
                controller: _addressController,
                decoration: const InputDecoration(
                  prefixIcon: Icon(
                    Icons.location_on_outlined,
                    color: Colors.blue,
                    size: 40,
                  ),
                  labelText: "Địa chỉ",
                  labelStyle: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontStyle: FontStyle.italic,
                    fontSize: 20,
                    color: Colors.black,
                  ),
                  border: UnderlineInputBorder(),
                ),
              ),
              const SizedBox(height: 20),

              // Số điện thoại
              TextField(
                controller: _addressController,
                decoration: const InputDecoration(
                  prefixIcon: Icon(Icons.call, color: Colors.blue, size: 40),
                  labelText: "Số điện thoại",
                  labelStyle: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontStyle: FontStyle.italic,
                    fontSize: 20,
                    color: Colors.black,
                  ),
                  border: UnderlineInputBorder(),
                ),
              ),
              const SizedBox(height: 40),

              // Button xác nhận
              SizedBox(
                width: double.infinity,
                height: 48,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.lightBlueAccent,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(25),
                    ),
                  ),
                  onPressed: () {
                    // xử lý lưu thông tin
                    Navigator.pop(context);
                  },
                  child: const Text(
                    "Xác nhận",
                    style: TextStyle(fontSize: 16, color: Colors.white),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
