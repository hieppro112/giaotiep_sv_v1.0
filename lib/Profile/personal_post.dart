import 'package:app_giao_tiep_sinh_vien_tdc/Profile/Widgets/personal_post_item.dart';
import 'package:flutter/material.dart';

class PersonalPostScreen extends StatefulWidget {
  const PersonalPostScreen({Key? key}) : super(key: key);

  @override
  State<PersonalPostScreen> createState() => _PersonalPostScreenState();
}

class _PersonalPostScreenState extends State<PersonalPostScreen> {
  final List<Map<String, String>> posts = [
    {
      "name": "Phạm Thắng",
      "faculty": "CNTT",
      "title": "Em xin tài liệu tiếng anh như này",
      "image":
          "https://codingweek.org/wp-content/uploads/2023/09/chris-ried-ieic5Tq8YMk-unsplash-scaled.jpg",
    },
    {
      "name": "Phạm Thắng",
      "faculty": "CNTT",
      "title": "Cần tuyển thành viên lập trình ứng dụng đi giải cứu thế giới",
      "image":
          "https://assets-prd.ignimgs.com/2025/04/10/dragon-ball-super-4480x2520-21218-1744310919473.jpg",
    },
    {
      "name": "Phạm Thắng",
      "faculty": "CNTT",
      "title": "Cần tuyển thành viên lập trình ứng dụng đi giải cứu thế giới",
      "image":
          "https://nipponclass.jp/wp-content/uploads/2024/07/5265_SeriesHeaders_OP_2000x800_wm.0.jpg",
    },
    {
      "name": "Phạm Thắng",
      "faculty": "CNTT",
      "title": "Cần tuyển thành viên lập trình ứng dụng đi giải cứu thế giới",
      "image":
          "https://cdn2.tuoitre.vn/thumb_w/480/471584752817336320/2025/10/8/screenshot20240421at090524-17599639007531328622673.jpeg",
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text("Bài viết"),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Thông tin avatar + tên
            Row(
              children: [
                const CircleAvatar(
                  radius: 35,
                  backgroundImage: NetworkImage(
                    "https://i.pinimg.com/736x/d4/38/25/d43825dd483d634e59838d919c3cf393.jpg",
                  ),
                ),
                const SizedBox(width: 12),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Text(
                      "Phạm Thắng",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 6),
                    Row(
                      children: [
                        Text(
                          "Ngành học: ",
                          style: TextStyle(color: Colors.black54),
                        ),
                        Text(
                          "CNTT",
                          style: TextStyle(fontWeight: FontWeight.w500),
                        ),
                        SizedBox(width: 20),
                        Text(
                          "Niên khóa: ",
                          style: TextStyle(color: Colors.black54),
                        ),
                        Text(
                          "2023",
                          style: TextStyle(fontWeight: FontWeight.w500),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 12),
            const Divider(),
            const Align(
              alignment: Alignment.centerLeft,
              child: Text(
                "Bài viết",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ),
            const SizedBox(height: 10),

            // Dùng PostItem
            ListView.builder(
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: posts.length,
              itemBuilder: (context, index) {
                final item = posts[index];
                return PersonalPostItem(
                  name: item["name"]!,
                  faculty: item["faculty"]!,
                  title: item["title"]!,
                  image: item["image"]!,
                  onComment: () {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text("Nhấn Bình luận")),
                    );
                  },
                  onLike: () {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text("Đã thả tim ❤️")),
                    );
                  },
                  onDelete: () {
                    setState(() {
                      posts.removeAt(index);
                    });
                  },
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
