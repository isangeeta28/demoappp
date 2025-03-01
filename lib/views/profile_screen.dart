import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  String profileImage;
  ProfileScreen({super.key, required this.profileImage});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        // leading: IconButton(
        //   icon: const Icon(Icons.arrow_back, color: Colors.black),
        //   onPressed: () {},
        // ),
        title: const Text("베스트 리뷰어", style: TextStyle(color: Colors.black)),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 20),
            CircleAvatar(
              radius: 50,
              backgroundImage: AssetImage(profileImage),
            ),
            const SizedBox(height: 10),
            const Text(
              'Name01',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 5),
            const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.emoji_events, color: Colors.amber, size: 16),
                SizedBox(width: 5),
                Text('골드', style: TextStyle(color: Colors.amber)),
              ],
            ),
            const SizedBox(height: 10),
            Container(
              padding: const EdgeInsets.all(10),
              margin: const EdgeInsets.symmetric(horizontal: 20),
              decoration: BoxDecoration(
                color: Colors.grey[200],
                borderRadius: BorderRadius.circular(10),
              ),
              child: const Text(
                '조립컴 업체를 운영하며 리뷰를 작성합니다.',
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.black54),
              ),
            ),
            const SizedBox(height: 20),
            const Divider(
              color: Color(0xffF0F0F0),
              thickness: 20,
            ),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text("작성한 리뷰 총 35개", style: TextStyle(fontWeight: FontWeight.bold)),
                  DropdownButton(
                    items: [const DropdownMenuItem(child: Text("최신순"))],
                    onChanged: (value) {},
                    underline: const SizedBox(),
                  ),
                ],
              ),
            ),

            const Divider(
              color: Color(0xffF0F0F0),
              thickness: 2,
            ),
            const SizedBox(height: 10),
            Card(
              margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
              elevation: 0,
              color: Colors.white,
              child: Padding(
                padding: const EdgeInsets.all(10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(6.0),
                            border: Border.all(color: Colors.grey)
                          ),
                            child: Image.asset('assets/images/1000055537829_i1_1200 2.png',
                                width: 100, height: 100)),

                        const SizedBox(width: 10),
                        const Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("AMD 라이젠 5 5600X 버미어", style: TextStyle(fontWeight: FontWeight.bold)),
                            SizedBox(height: 5),
                            Row(
                              children: [
                                Icon(Icons.star, color: Colors.amber, size: 16),
                                Icon(Icons.star, color: Colors.amber, size: 16),
                                Icon(Icons.star, color: Colors.amber, size: 16),
                                Icon(Icons.star, color: Colors.amber, size: 16),
                                Icon(Icons.star_half, color: Colors.amber, size: 16),
                                SizedBox(width: 5),
                                Text("4.07", style: TextStyle(fontWeight: FontWeight.bold)),
                              ],
                            )
                          ],
                        )
                      ],
                    ),
                    const SizedBox(height: 10),
                    const Divider(),
                    const SizedBox(height: 10),
                    Row(
                      children: [
                        CircleAvatar(radius: 15, backgroundImage: AssetImage(profileImage)),
                        const SizedBox(width: 10),
                        const Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("Name01"),
                            Text("2022.12.09", style: TextStyle(color: Colors.grey)),
                          ],
                        ),

                        const Spacer(),
                        const Icon(Icons.safety_check)
                      ],
                    ),
                    const SizedBox(height: 10),
                    const Text("멀티 작업도 잘 되고 꽤 괜찮습니다. 저희 회사 고객님들에게도 추천 가능한 제품인 듯 합니다."),
                    const SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset('assets/images/Frame 27.png', height: 100, fit: BoxFit.fill,),
                        const SizedBox(width: 5),
                        Image.asset('assets/images/Frame 30.png', height: 100, fit: BoxFit.fill,),
                        const SizedBox(width: 5),
                        Image.asset('assets/images/image 13.png', height: 100, fit: BoxFit.fill,),
                      ],
                    ),
                    const SizedBox(height: 10),
                    const Divider()
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
