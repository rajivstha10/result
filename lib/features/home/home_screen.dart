import 'dart:math';

import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:intl/intl.dart';
import 'package:result_e/core/extensions/app_theme_extensions.dart';
import 'package:result_e/core/theme/colors.dart';
import 'package:result_e/features/home/widgets/color_box_widget.dart';
import 'package:result_e/features/home/widgets/pichart_widget.dart';
import 'package:result_e/gen/assets.gen.dart';
import 'package:result_e/widgets/custom_app_bar.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

Color _getRandomColor() {
  final random = Random();
  return Color.fromARGB(
    255,
    random.nextInt(256),
    random.nextInt(256),
    random.nextInt(256),
  );
}

class _HomeScreenState extends State<HomeScreen> {
  String _formatDate(String dateTimeString) {
    final dateTime = DateTime.tryParse(dateTimeString);
    if (dateTime != null) {
      final formattedDate = DateFormat('MMM d').format(dateTime);
      final formattedTime = DateFormat('h:mm a').format(dateTime);
      return '$formattedDate at $formattedTime';
    }
    return '';
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: CustomAppBar(
        showLogout: true,
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        children: [
          const Gap(10),
          const Text(
            'Upcoming Exams',
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w400,
              color: blackColor,
            ),
          ),
          const Gap(20),
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: lightShadeColor,
            ),
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  RichText(
                    text: TextSpan(
                      children: [
                        const TextSpan(
                          text: 'Exam Starts in:  ',
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                            color: blackColor,
                          ),
                        ),
                        TextSpan(
                          text: _formatDate('2024-10-04T12:34:56'),
                          style: const TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                            color: blackColor,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const Gap(8),
                  const Text('- CSIT Mid Terminal Exams.'),
                  const Gap(10),
                  const ColorBoxWidget(
                    color: errorShadeColor,
                    label: 'View Notice',
                  ),
                ],
              ),
            ),
          ),
          const Gap(20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'Your Goal: 100%',
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                  color: blackColor,
                ),
              ),
              GestureDetector(
                onTap: () {},
                child: Container(
                  padding: const EdgeInsets.all(4),
                  decoration: BoxDecoration(
                    color: lightShadeColor,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: const Text(
                    'Change Goal',
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      color: blackColor,
                    ),
                  ),
                ),
              ),
            ],
          ),
          const Gap(20),
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: lightShadeColor,
            ),
            padding: const EdgeInsets.all(10),
            child: const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Column(
                      children: [
                        Text(
                          'Goal',
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        SizedBox(
                            height: 100,
                            width: 100,
                            child: PieChartWidget(
                              pyValue: 100,
                            )),
                      ],
                    ),
                    Column(
                      children: [
                        Text(
                          'Progress',
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        SizedBox(
                            height: 100,
                            width: 100,
                            child: PieChartWidget(
                              pyValue: 75,
                            )),
                      ],
                    ),
                    Column(
                      children: [
                        Text(
                          'Target',
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        SizedBox(
                            height: 100,
                            width: 100,
                            child: PieChartWidget(
                              pyValue: 55,
                            )),
                      ],
                    ),
                  ],
                ),
                Divider(
                  height: 1,
                  color: midShadeColor,
                ),
                Center(
                  child: Text(
                    'Last Semester:',
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
                Gap(4),
                IntrinsicHeight(
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: Column(
                          children: [
                            Text(
                              'Best Score',
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                            Text(
                              'Subject',
                              style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                            Text(
                              '65 %',
                              style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ],
                        ),
                      ),
                      VerticalDivider(
                        color: midShadeColor,
                        thickness: 1,
                      ),
                      Expanded(
                        child: Column(
                          children: [
                            Text(
                              'Bad Score',
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                            Text(
                              'Subject',
                              style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                            Text(
                              '55 %',
                              style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          const Gap(10),
          Text('Recent Notice'),
          ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: 8,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.only(right: 8),
                child: Image.asset(
                  Assets.images.wallpaper.keyName,
                  scale: 6,
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
