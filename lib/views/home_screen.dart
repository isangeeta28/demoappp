import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:logoapp/views/profile_screen.dart';

import '../widget/custom_appbar.dart';

class HomeScreen extends StatefulWidget {
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final List<String> bannerImages = [
    'assets/images/332710d746ac31cd6d4c6ec93a16cc8d 1.png',
    'assets/images/배너 (1).png',
    'assets/images/배너.png',
    'assets/images/스크린샷 2022-06-07 오후 3.06 1.png',
  ];

  final List<Map<String, String>> productList = [
    {'title': 'LG Monitor',
      'image': 'assets/images/14751218_1 1.png',
      'line1': 'LG전자 스탠바이미 27ART10AKPL (스탠',
    'line2': '화면을 이동할 수 있고 전환도 편리하다는 점이 제일 마음에 들었어요. 배송도 빠르고 친절하게 받을 수 있어서 좋았습니다',
    'line3': '스탠바이미는 사랑입니다!️'
    },
    {'title': 'Samsung TV',
      'image': 'assets/images/15093074_1 1.png',
      'line1': 'LG전자  울트라HD 75UP8300KNA (스탠드)',
      'line2': '화면 잘 나오고... 리모컨 기능 좋습니다.',
      'line3': '넷플 아마존 등 버튼하나로 바로 접속 되고디스플레이는 액정문제 없어보이고소리는 살짝 약간 감이 있으나 ^^; 시끄러울까봐 그냥 블루투스 헤드폰 구매 예정이라 문제는 없네요. 아주 만족입니다!!'},
    {'title': 'Rainbow Keyboard',
      'image': 'assets/images/16439303_1 1.png',
      'line1': '라익미 스마트 DS4001L NETRANGE (스탠드)GX30K WIN10 (SSD 256GB)',
      'line2': '반응속도 및 화질이나 여러면에서도 부족함을  느끼기에는 커녕 이정도에 이 정도 성능이면 차고 넘칠만 합니다',
      'line3': '중소기업TV 라익미 제품을 사용해보았는데 뛰어난 가성비와 더불어 OTT 서비스에 오픈 브라우저 까지 너무 마음에 들게끔 기능들을 사용 가능했고'
    },
  ];

  final List<String> reviewerImages = [
    'assets/images/Ellipse 26.png',
    'assets/images/Ellipse 27.png',
    'assets/images/Ellipse 28.png',
    'assets/images/Ellipse 29.png',
    'assets/images/Ellipse 30.png',
    'assets/images/Ellipse 31.png',
    'assets/images/Ellipse 32.png',
    'assets/images/Ellipse 33.png',
    'assets/images/Ellipse 34.png',
    'assets/images/Ellipse 35.png',
  ];

  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: CustomAppBar(),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 15.0,),

            searchBar(),

            const SizedBox(height: 15.0,),

            Stack(
              children: [
                CarouselSlider(
                  options: CarouselOptions(
                    height: 250, // Increase the height of the carousel
                    viewportFraction: 1.0,
                    autoPlay: true,
                    enlargeCenterPage: true,
                    onPageChanged: (index, reason) {
                      setState(() {
                        _currentIndex = index;
                      });
                    },
                  ),
                  items: bannerImages.map((image) {
                    return SizedBox(
                      height: 250, // Adjust height as needed
                      child: Image.asset(
                        image,
                        fit: BoxFit.fill,),
                    );
                  }).toList(),
                ),
                Positioned(
                  bottom: 6.0, // Move dots to the bottom
                  left: 0,
                  right: 0,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: bannerImages.map((url) {
                      int index = bannerImages.indexOf(url);
                      return Container(
                        width: _currentIndex == index ? 14.0 :8.0,
                        height: 8.0,
                        margin: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 4.0),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10.0),
                          // shape: BoxShape.circle,
                          color: _currentIndex == index ? Colors.white : Colors.grey,
                        ),
                      );
                    }).toList(),
                  ),
                ),
              ],
            ),

            const Padding(
              padding: EdgeInsets.only(right: 8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(left: 8.0, top: 20.0),
                        child: Text("제일 핫한 리뷰를 만나보세요"),
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 8.0, bottom: 8.0, top: 4.0),
                        child: Text('리뷰 랭킹 ⭐ Top3', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                      ),
                    ],
                  ),

                  Icon(Icons.arrow_forward_ios_sharp)
                ],
              ),
            ),


            const SizedBox(height: 15.0,),

            ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: productList.length,
              itemBuilder: (context, index) {
                return productCard(
                    bannerImgae : productList[index]['image'] ,
                line1:  productList[index]['line1'],
                line2:  productList[index]['line2'],
                line3:  productList[index]['line3']
                );
              },
            ),

            const SizedBox(height: 15.0,),

            const Divider(
              color: Color(0xffF0F0F0),
              thickness: 20,
            ),

            const Padding(
              padding: EdgeInsets.only(left: 8.0, top: 20.0),
              child: Text("골드 계급 사용자들이예요"),
            ),

            const Padding(
              padding: EdgeInsets.only(left: 8.0, bottom: 15.0, top: 4.0),
              child: Text('베스트 리뷰어 ⭐ Top10', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            ),


            SizedBox(
              height: 130,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: reviewerImages.length,
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: (){
                      Navigator.push(context,
                      MaterialPageRoute(builder: (context){
                        return ProfileScreen(
                          profileImage: reviewerImages[index],
                        );
                      }));
                    },
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: Column(
                        children: [
                          CircleAvatar(
                            backgroundImage: AssetImage(reviewerImages[index]),
                            radius: 30,
                          ),
                          const SizedBox(height: 10),
                          Text('Name0${index + 1}', style: const TextStyle(fontSize: 12))
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),

            customFooter(),

          ],
        ),
      ),
    );
  }

  Widget searchBar(){
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30),
          border: Border.all(
            width: 2,
            color: Colors.transparent, // Transparent border to avoid artifacts
          ),
          gradient: const LinearGradient(
            colors: [
              Color(0xff74FBDE),
              Color(0xff3C41BF)],
          ),
        ),
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(30),
          ),
          child: const Row(
            children: [
              Expanded(
                child: TextField(
                  decoration: InputDecoration(
                    hintText: "검색어를 입력하세요",
                    hintStyle: TextStyle(color: Colors.grey),
                    border: InputBorder.none,
                  ),
                ),
              ),
              Icon(Icons.search, color:  Color(0xff3C41BF)),
            ],
          ),
        ),
      ),
    );
  }

  Widget productCard({String? bannerImgae, String? line1 , String? line2, String? line3}){
    return Card(
      elevation: 0,
      color: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Row(
          children: [
            // Product Image
            Container(
              padding: EdgeInsets.symmetric(horizontal: 8.0, vertical: 6.0),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey),
                borderRadius: BorderRadius.circular(6.0)
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Image.asset("assets/images/fa-solid_crown.png"),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: Image.asset(
                      bannerImgae!, // Replace with your image
                      width: 80,
                      height: 80,
                      fit: BoxFit.cover,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(width: 10),

            // Product Details
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Crown Icon and Title
                   Row(
                    children: [
                      const Icon(Icons.emoji_events, color: Colors.yellow, size: 18),
                      const SizedBox(width: 5),
                      Expanded(
                        child: Text(
                          line1??"",
                          style: const TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                          ),
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 5),

                  // Description
                   Text(
                    '• ${line2??""}',
                    style: const TextStyle(
                      color: Colors.black,
                      fontSize: 12,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),

                   Text(
                    '• ${line3??""}',
                    style: const TextStyle(
                      color: Colors.black,
                      fontSize: 12,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 5),

                  // Rating Section
                  const Row(
                    children: [
                      Icon(Icons.star, color: Colors.yellow, size: 16),
                      Text(
                        ' 4.80 ',
                        style: TextStyle(
                          color: Colors.yellow,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        '(216)',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 12,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 5),

                  // Tags
                  Row(
                    children: [
                      _buildTag('LG전자'),
                      const SizedBox(width: 5),
                      _buildTag('편리성'),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTag(String text) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.grey.shade300,
      ),
      child: Text(
        text,
        style:  TextStyle(color: Colors.grey.shade700, fontSize: 12),
      ),
    );
  }

  Widget customFooter(){
    return Container(
      padding: const EdgeInsets.all(16),
      color: const Color(0xffF0F0F0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Company Name
          const Text(
            "LOGO Inc.",
            style: TextStyle(color: Color(0xff868686), fontSize: 16, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 10),

          // Navigation Links
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              _buildFooterLink("회사 소개"),
              _divider(),
              _buildFooterLink("인재 채용"),
              _divider(),
              _buildFooterLink("기술 블로그"),
              _divider(),
              _buildFooterLink("리뷰 저작권"),
            ],
          ),
          const SizedBox(height: 10),

          // Email Row
          Row(
            children: [
              const Icon(Icons.share, color: Color(0xff868686), size: 16),
              const SizedBox(width: 8),
              const Text(
                "review@logo.com",
                style: TextStyle(color: Color(0xff868686)),
              ),
              const Spacer(),
              // Language Dropdown
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                decoration: BoxDecoration(
                  border: Border.all(color: const Color(0xff868686)),
                  borderRadius: BorderRadius.circular(5),
                ),
                child: const Row(
                  children: [
                    Text("KOR", style: TextStyle(color: Color(0xff868686))),
                    Icon(Icons.arrow_drop_down, color: Color(0xff868686)),
                  ],
                ),
              ),
            ],
          ),

          const Divider(color: Color(0xff868686)),
          const SizedBox(height: 10),

          // Copyright
          const Text(
            "©2022-2022 LOGO Lab, Inc. (주)어무개 서울시 강남구",
            style: TextStyle(color: Color(0xff868686), fontSize: 12),
          ),

          const SizedBox(height: 10),
        ],
      ),
    );
  }

  Widget _buildFooterLink(String text) {
    return Text(
      text,
      style: const TextStyle(color: Color(0xff868686)),
    );
  }

  Widget _divider() {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 8),
      child: Text("|", style: TextStyle(color: Color(0xff868686))),
    );
  }
}