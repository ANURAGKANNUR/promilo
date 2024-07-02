import 'package:flutter/material.dart';
import 'package:promilo_test/home_screen/views/description_page.dart';
import 'package:promilo_test/utils/app_colors.dart';
import 'package:promilo_test/utils/text_styles.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<String> image = [
    'assets/meeting1.jpg',
    'assets/meeting2.jpg',
    'assets/meeting2.jpg',
  ];

  List<String> profileImages = [
    'assets/person1.jpg',
    'assets/person2.jpg',
    'assets/person3.jpg',
  ];

  ValueNotifier<int> meetingImageIndex = ValueNotifier(0);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: const Icon(
          Icons.keyboard_arrow_left,
          size: 32,
        ),
        shadowColor: Colors.white,
        backgroundColor: Colors.white,
        surfaceTintColor: Colors.white,
        elevation: 2,
        title: Text(
          'Individual Meetup',
          style: TextStyles.textStyleBold24,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 18),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextField(
                decoration: InputDecoration(
                  contentPadding: const EdgeInsets.all(10),
                  border: const OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                      borderSide: BorderSide(color: AppColors.grey9)),
                  prefixIcon: const Icon(Icons.search),
                  label: Text(
                    "Search",
                    style: TextStyles.textStyleRegular18
                        .copyWith(color: AppColors.grey7),
                  ),
                  suffixIcon: const Icon(Icons.mic),
                ),
              ),
              const SizedBox(
                height: 16,
              ),
              SizedBox(
                height: 200,
                width: MediaQuery.of(context).size.width,
                child: PageView.builder(
                  itemCount: image.length,
                  onPageChanged: (value) {
                    meetingImageIndex.value = value;
                  },
                  itemBuilder: (context, index) {
                    return Stack(
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(8),
                          child: Image.asset(
                            image[index],
                            fit: BoxFit.fill,
                            width: MediaQuery.of(context).size.width * 0.9,
                            height: 200,
                          ),
                        ),
                        Positioned(
                          bottom: 30,
                          left: 20,
                          child: Text(
                            "Popular Meetups \nin India",
                            textAlign: TextAlign.left,
                            style: TextStyles.textStyleExtraBold18
                                .copyWith(color: Colors.white),
                          ),
                        )
                      ],
                    );
                  },
                ),
              ),
              ValueListenableBuilder(
                  valueListenable: meetingImageIndex,
                  builder: (context, value, child) {
                    return SizedBox(
                      height: 40,
                      width: MediaQuery.of(context).size.width,
                      child: Center(
                        child: ListView.builder(
                          shrinkWrap: true,
                          padding: EdgeInsets.zero,
                          itemCount: image.length,
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context, index) {
                            return Container(
                              margin: const EdgeInsets.symmetric(horizontal: 4),
                              child: CircleAvatar(
                                radius: 5,
                                backgroundColor:
                                    value == index ? Colors.black : Colors.grey,
                              ),
                            );
                          },
                        ),
                      ),
                    );
                  }),
              const SizedBox(
                height: 20,
              ),
              Text(
                "Trending Popular People",
                style: TextStyles.textStyleSemiBold20
                    .copyWith(color: AppColors.secondaryBlue9),
              ),
              const SizedBox(
                height: 10,
              ),
              //_popularPeopleWidget(0)
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.27,
                child: Row(
                  children: [
                    Expanded(
                      child: ListView.builder(
                        itemCount: 4,
                        shrinkWrap: true,
                        scrollDirection: Axis.horizontal,
                        padding: EdgeInsets.zero,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: const EdgeInsets.only(right: 20),
                            child: _popularPeopleWidget(index),
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Text(
                "Top Trending Meetups",
                style: TextStyles.textStyleSemiBold20
                    .copyWith(color: AppColors.secondaryBlue9),
              ),
              const SizedBox(
                height: 10,
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.27,
                child: Row(
                  children: [
                    Expanded(
                      child: ListView.builder(
                        itemCount: 7,
                        shrinkWrap: true,
                        scrollDirection: Axis.horizontal,
                        padding: EdgeInsets.zero,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: const EdgeInsets.only(right: 20),
                            child: trendingMeetupWidget(index + 1),
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(
                height: 10,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _popularPeopleWidget(int index) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.9,
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(
            color: AppColors.grey6,
          )),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            children: [
              Container(
                padding: const EdgeInsets.all(8),
                height: 55,
                width: 55,
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border:
                        Border.all(color: AppColors.secondaryBlue9, width: 3)),
                child: Image.asset(
                  'assets/pen.jpg',
                  height: 30,
                  width: 30,
                ),
              ),
              const SizedBox(
                width: 8,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Author",
                    style: TextStyles.textStyleSemiBold18
                        .copyWith(color: AppColors.secondaryBlue9),
                  ),
                  const SizedBox(
                    height: 1,
                  ),
                  Text(
                    "1,028 Meeting",
                    style: TextStyles.textStyleRegular16
                        .copyWith(color: AppColors.grey9),
                  )
                ],
              )
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          const Divider(
            color: AppColors.grey6,
          ),
          const SizedBox(
            height: 8,
          ),
          SizedBox(
            height: 60,
            child: Stack(
              children: List.generate(image.length, (index) {
                double offset = index * 50.0; // Adjust spacing between icons

                return Positioned(
                  left: offset,
                  child: CircleAvatar(
                    radius: 30,
                    backgroundImage: AssetImage(profileImages[index]),
                  ),
                );
              }),
            ),
          ),
          const SizedBox(
            height: 5,
          ),
          Row(
            children: [
              const Spacer(),
              Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 15, vertical: 8),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: AppColors.secondaryBlue9),
                child: Text(
                  "See more",
                  style: TextStyles.textStyleSemiBold16
                      .copyWith(color: Colors.white),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }

  Widget trendingMeetupWidget(int index) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const DescriptionPage()),
        );
      },
      child: Stack(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Image.asset(
              'assets/person3.jpg',
              fit: BoxFit.cover,
              height: 200,
              width: 180,
            ),
          ),
          Positioned(
            bottom: 0,
            right: 0,
            child: Container(
              padding: const EdgeInsets.only(left: 7, right: 7, bottom: 6),
              decoration: BoxDecoration(
                  color: Colors.white, borderRadius: BorderRadius.circular(10)),
              child: Center(
                child: Text(
                  index < 10 ? "0$index" : index.toString(),
                  style: TextStyles.textStyleExtraBold40.copyWith(fontSize: 60),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
