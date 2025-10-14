import 'package:flutter/material.dart';

class SavedItemsScreen extends StatefulWidget {
  const SavedItemsScreen({super.key});

  @override
  State<SavedItemsScreen> createState() => _SavedItemsScreenState();
}

class _SavedItemsScreenState extends State<SavedItemsScreen> {
  String selectedFilter = "Tất cả";

  final List<Map<String, String>> savedItems = [
    {
      "title": "Team thiếu thuyền viên...",
      "author": "Cao Quang Khánh",
      "image":
          "https://watv.org/wp-content/uploads/2021/02/another-world-2.jpg", // thay bằng ảnh của bạn
    },
    {
      "title": "Team thiếu thuyền viên...",
      "author": "Lê Đại Hiệp",
      "image":
          "https://cdn2.tuoitre.vn/471584752817336320/2024/6/3/one-piece-manga-remake-animepng-17174025179101502756813.jpg",
    },
    {
      "title": "Team thiếu thuyền viên...",
      "author": "Lê Đình thuận",
      "image":
          "https://gamek.mediacdn.vn/zoom/600_315/133514250583805952/2020/1/14/avata-15790129992981461680642.jpg",
    },
    {
      "title": "Team thiếu thuyền viên...",
      "author": "Cao Quang Khánh",
      "image":
          "https://hoanghamobile.com/tin-tuc/wp-content/uploads/2023/07/anh-luffy.jpg",
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Mục đã lưu", style: TextStyle(color: Colors.black)),
        backgroundColor: Colors.white,
        elevation: 0,
        iconTheme: const IconThemeData(color: Colors.black),
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Dropdown filter
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                DropdownButton<String>(
                  value: selectedFilter,
                  items:
                      ["Tất cả", "Bài viết", "Video"]
                          .map(
                            (String value) => DropdownMenuItem(
                              value: value,
                              child: Text(value),
                            ),
                          )
                          .toList(),
                  onChanged: (value) {
                    setState(() {
                      selectedFilter = value!;
                    });
                  },
                ),
              ],
            ),
            const SizedBox(height: 10),

            // Danh sách mục đã lưu
            Expanded(
              child: ListView.builder(
                itemCount: savedItems.length,
                itemBuilder: (context, index) {
                  final item = savedItems[index];
                  return Container(
                    margin: const EdgeInsets.only(bottom: 12),
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.black26),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Stack(
                      children: [
                        Row(
                          children: [
                            // ảnh
                            ClipRRect(
                              borderRadius: const BorderRadius.only(
                                topLeft: Radius.circular(12),
                                bottomLeft: Radius.circular(12),
                              ),
                              child: Image.network(
                                item["image"]!,
                                width: 90,
                                height: 80,
                                fit: BoxFit.cover,
                              ),
                            ),
                            const SizedBox(width: 10),
                            // thông tin
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  item["title"]!,
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                  style: const TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 15,
                                  ),
                                ),
                                const SizedBox(height: 5),
                                Text(
                                  "Bài viết: ${item["author"]}",
                                  style: const TextStyle(
                                    fontSize: 13,
                                    color: Colors.black54,
                                  ),
                                ),
                                const SizedBox(height: 5),
                              ],
                            ),
                          ],
                        ),
                        // Nút 3 chấm
                        Positioned(
                          top: 0,
                          right: 0,
                          child: PopupMenuButton<String>(
                            icon: const Icon(Icons.more_vert),
                            onSelected: (value) {
                              if (value == 'delete') {
                                print('Chọn xóa: ${item["title"]}');
                              }
                            },
                            itemBuilder:
                                (BuildContext context) => [
                                  const PopupMenuItem(
                                    value: 'delete',
                                    child: Text('Xóa'),
                                  ),
                                ],
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
