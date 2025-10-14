import 'package:flutter/material.dart';

class PersonalPostItem extends StatefulWidget {
  final String name;
  final String faculty;
  final String title;
  final String image;
  final VoidCallback onComment;
  final VoidCallback onLike;
  final VoidCallback onDelete;

  const PersonalPostItem({
    Key? key,
    required this.name,
    required this.faculty,
    required this.title,
    required this.image,
    required this.onComment,
    required this.onLike,
    required this.onDelete,
  }) : super(key: key);

  @override
  State<PersonalPostItem> createState() => _PersonalPostItemState();
}

class _PersonalPostItemState extends State<PersonalPostItem> {
  bool isLiked = false;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 8),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: const EdgeInsets.all(8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Hàng đầu: avatar + tên + khoa + menu
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    const CircleAvatar(
                      backgroundImage: NetworkImage(
                        "https://img4.thuthuatphanmem.vn/uploads/2020/05/07/hinh-nen-dragon-ball-dep-4k_111005819.jpg",
                      ),
                    ),

                    const SizedBox(width: 8),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          widget.name,
                          style: const TextStyle(fontWeight: FontWeight.bold),
                        ),
                        Text("Khoa: ${widget.faculty}"),
                      ],
                    ),
                  ],
                ),
                PopupMenuButton<String>(
                  onSelected: (value) {
                    if (value == 'delete') widget.onDelete();
                  },
                  itemBuilder:
                      (context) => [
                        const PopupMenuItem(
                          value: 'delete',
                          child: Text('Xóa'),
                        ),
                      ],
                  child: const Icon(Icons.more_vert),
                ),
              ],
            ),
            const SizedBox(height: 8),
            // Tiêu đề
            Text(
              "Title: ${widget.title}",
              style: const TextStyle(fontWeight: FontWeight.w500),
            ),

            const SizedBox(height: 8),

            // Ảnh minh họa
            ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Image.network(
                widget.image,
                width: double.infinity,
                height: 150,
                fit: BoxFit.cover,
              ),
            ),

            const SizedBox(height: 8),

            // Nút bình luận và tim
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.grey.shade200,
                    foregroundColor: Colors.black,
                  ),
                  onPressed: widget.onComment,
                  child: const Text("Bình luận"),
                ),
                IconButton(
                  icon: Icon(
                    isLiked ? Icons.favorite : Icons.favorite_border,
                    color: isLiked ? Colors.red : Colors.pink,
                  ),
                  onPressed: () {
                    setState(() {
                      isLiked = !isLiked; // đổi trạng thái
                    });
                    widget.onLike(); // gọi callback từ parent
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
