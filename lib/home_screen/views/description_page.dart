import 'package:flutter/material.dart';
import 'package:promilo_test/utils/app_colors.dart';
import 'package:promilo_test/utils/text_styles.dart';
import 'package:share_plus/share_plus.dart';

class DescriptionPage extends StatefulWidget {
  const DescriptionPage({super.key});

  @override
  State<DescriptionPage> createState() => _DescriptionPageState();
}

class _DescriptionPageState extends State<DescriptionPage> {
  List<String> images = [
    'assets/meeting1.jpg',
    'assets/meeting2.jpg',
    'assets/meeting2.jpg',
  ];

  ValueNotifier<int> imageIndex = ValueNotifier(0);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
          'Description',
          style: TextStyles.textStyleBold24,
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(13.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: const EdgeInsets.only(bottom: 14),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(9),
                    color: AppColors.grey3),
                child: Column(
                  children: [
                    SizedBox(
                      height: 200,
                      width: MediaQuery.of(context).size.width,
                      child: Stack(
                        children: [
                          PageView.builder(
                            itemCount: images.length,
                            onPageChanged: (value) {
                              imageIndex.value = value;
                            },
                            itemBuilder: (context, index) {
                              return ClipRRect(
                                borderRadius: BorderRadius.circular(8),
                                child: Image.asset(
                                  images[index],
                                  fit: BoxFit.fill,
                                  width: MediaQuery.of(context).size.width,
                                  height: 200,
                                ),
                              );
                            },
                          ),
                          Positioned(
                            bottom: 0,
                            child: ValueListenableBuilder(
                                valueListenable: imageIndex,
                                builder: (context, value, child) {
                                  return SizedBox(
                                    height: 40,
                                    width: MediaQuery.of(context).size.width,
                                    child: Center(
                                      child: ListView.builder(
                                        shrinkWrap: true,
                                        padding: EdgeInsets.zero,
                                        itemCount: images.length,
                                        scrollDirection: Axis.horizontal,
                                        itemBuilder: (context, index) {
                                          return Container(
                                            margin: const EdgeInsets.symmetric(
                                                horizontal: 4),
                                            child: CircleAvatar(
                                              radius: 5,
                                              backgroundColor: value == index
                                                  ? Colors.white
                                                  : Colors.white60,
                                            ),
                                          );
                                        },
                                      ),
                                    ),
                                  );
                                }),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Icon(
                            Icons.file_download,
                            color: AppColors.grey10,
                          ),
                          const Icon(
                            Icons.bookmark_outline,
                            color: AppColors.grey10,
                          ),
                          const Icon(
                            Icons.favorite_outline,
                            color: AppColors.grey10,
                          ),
                          const Icon(
                            Icons.fullscreen_outlined,
                            color: AppColors.black,
                          ),
                          const Icon(
                            Icons.star_outline,
                            color: AppColors.black,
                          ),
                          InkWell(
                            onTap: () {
                              Share.share('Check out this cool content!');
                            },
                            child: const Icon(
                              Icons.share_outlined,
                              color: AppColors.black,
                            ),
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  const Icon(
                    Icons.bookmark_outline,
                    color: AppColors.secondaryBlue9,
                  ),
                  const SizedBox(
                    width: 3,
                  ),
                  Text(
                    "1034",
                    style: TextStyles.textStyleSemiBold16,
                  ),
                  const SizedBox(
                    width: 12,
                  ),
                  const Icon(
                    Icons.favorite_outline,
                    color: AppColors.secondaryBlue9,
                  ),
                  const SizedBox(
                    width: 3,
                  ),
                  Text(
                    "1034",
                    style: TextStyles.textStyleSemiBold16,
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Container(
                    padding: const EdgeInsets.all(3),
                    decoration: BoxDecoration(
                        color: AppColors.grey3,
                        borderRadius: BorderRadius.circular(8)),
                    child: const Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Icon(
                          Icons.star,
                          size: 15,
                          color: Colors.blueAccent,
                        ),
                        Icon(
                          Icons.star,
                          size: 15,
                          color: Colors.blueAccent,
                        ),
                        Icon(
                          Icons.star,
                          size: 15,
                          color: Colors.blueAccent,
                        ),
                        Icon(
                          Icons.star,
                          size: 15,
                          color: Colors.lightBlueAccent,
                        ),
                        Icon(
                          Icons.star,
                          size: 15,
                          color: Colors.white,
                        )
                      ],
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Text(
                    "3.2",
                    style: TextStyles.textStyleRegular16,
                  )
                ],
              ),
              const SizedBox(
                height: 22,
              ),
              Text(
                "Actor Name",
                style: TextStyles.textStyleSemiBold18,
              ),
              const SizedBox(
                height: 6,
              ),
              Text(
                "Indian Actress",
                style: TextStyles.textStyleRegular14
                    .copyWith(color: AppColors.grey10),
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  const Icon(
                    Icons.access_time,
                    size: 18,
                  ),
                  const SizedBox(
                    width: 4,
                  ),
                  Text(
                    "Duration 20 Mins",
                    style: TextStyles.textStyleRegular14
                        .copyWith(color: AppColors.grey10),
                  )
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  const Icon(
                    Icons.wallet,
                    size: 18,
                  ),
                  const SizedBox(
                    width: 4,
                  ),
                  Text(
                    "Total Average Fees \$9,999",
                    style: TextStyles.textStyleRegular14
                        .copyWith(color: AppColors.grey10),
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              Text(
                "About",
                style: TextStyles.textStyleSemiBold18,
              ),
              const SizedBox(
                height: 8,
              ),
              Text(
                "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.",
                style: TextStyles.textStyleRegular14
                    .copyWith(color: AppColors.grey10),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
