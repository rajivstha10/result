import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:result_e/core/extensions/app_theme_extensions.dart';
import 'package:result_e/features/exam/widget/exam_card_widget.dart';
import 'package:result_e/widgets/custom_app_bar.dart';
import 'package:result_e/widgets/standard_app_bar.dart';

class ExamScreen extends StatefulWidget {
  const ExamScreen({super.key});

  @override
  State<ExamScreen> createState() => _ExamScreenState();
}

class _ExamScreenState extends State<ExamScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        showLogout: true,
      ),
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: 20),
        children: [
          const Gap(10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Center Name',
                style: context.textTheme.bodySmall?.copyWith(
                  fontWeight: FontWeight.w400,
                  fontSize: 14,
                ),
              ),
              Text(
                'Start Date',
                style: context.textTheme.bodySmall?.copyWith(
                  fontWeight: FontWeight.w400,
                  fontSize: 14,
                ),
              ),
            ],
          ),
          Gap(20),
          ExamCardWidget(),
          Gap(20),
          ExamCardWidget(),
          Gap(20),
          ExamCardWidget(),
          Gap(20),
          ExamCardWidget(),
          Gap(20),
          ExamCardWidget(),
          Gap(20),
          ExamCardWidget(),
          Gap(20),
        ],
      ),
    );
  }
}
