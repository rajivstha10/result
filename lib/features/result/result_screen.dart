// ignore_for_file: public_member_api_docs, lines_longer_than_80_chars

import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:result_e/core/theme/colors.dart';
import 'package:result_e/widgets/custom_app_bar.dart';

class ResultScreen extends StatefulWidget {
  const ResultScreen({super.key});

  @override
  State<ResultScreen> createState() => _ResultScreenState();
}

class _ResultScreenState extends State<ResultScreen> {
  @override
  Widget build(BuildContext context) {
    // final size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: const CustomAppBar(
        showLogout: true,
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        children: [
          const Gap(10),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              GestureDetector(
                onTap: () {},
                child: Container(
                  padding: const EdgeInsets.all(4),
                  decoration: BoxDecoration(
                    color: lightShadeColor,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: const Text(
                    'Semester',
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      color: Colors.black,
                    ),
                  ),
                ),
              ),
            ],
          ),
          const Gap(20),
          const Text('Semester 1'),
          const Gap(20),
          FittedBox(
            child: Table(
              border: TableBorder.all(),
              defaultColumnWidth: const FixedColumnWidth(100),
              columnWidths: const {
                // Use IntrinsicColumnWidth to make columns take the space they need
                0: IntrinsicColumnWidth(),
                1: IntrinsicColumnWidth(),
                2: IntrinsicColumnWidth(),
                3: IntrinsicColumnWidth(),
                4: IntrinsicColumnWidth(),
                5: IntrinsicColumnWidth(),
              },
              children: [
                // Table Headers
                TableRow(
                  children: [
                    headerCell('S.N.'),
                    headerCell('Course Code'),
                    headerCell('Subject'),
                    headerCell('Full Marks'),
                    headerCell('Pass Marks'),
                    Column(
                      children: [
                        headerCell('Marks Obtained'),
                        const Divider(
                          height: 1,
                          color: blackColor,
                        ),
                        Row(
                          children: [
                            Expanded(child: headerCell('Asst')),
                            Expanded(child: headerCell('Sem')),
                            Expanded(child: headerCell('Total')),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
                // Data Rows
                tableRow('0', 'CSC 202', 'IOT', '80', '32', '20', '26', '46'),
                tableRow(
                  '1',
                  'CSC 203',
                  'Cloud Computing and infrastructure ',
                  '80',
                  '32',
                  '20',
                  '31',
                  '51',
                ),
                tableRow('2', 'CSC 205', 'DSA', '80', '32', '18', '31', '49'),
                tableRow('3', 'CSC 209', 'WEB', '80', '32', '19', '34', '53'),
                // Total Row
                TableRow(
                  decoration: const BoxDecoration(
                    color: Colors.grey,
                  ),
                  children: [
                    totalCell(''),
                    tableCell(''), // Empty for Course Code
                    tableCell('GRAND TOTAL'), // Empty for Subject
                    tableCell('320'), // Full Marks
                    tableCell('128'), // Pass Marks
                    Row(
                      children: [
                        Expanded(child: tableCell('')),
                        Expanded(child: tableCell('')),
                        Expanded(child: tableCell('199')),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget headerCell(String text) {
    return Padding(
      padding: const EdgeInsets.all(8),
      child: Text(
        text,
        style: const TextStyle(fontWeight: FontWeight.bold),
        textAlign: TextAlign.center,
        maxLines: 2,
      ),
    );
  }

  TableRow tableRow(
    String sn,
    String code,
    String subject,
    String fullMarks,
    String passMarks,
    String asst,
    String sem,
    String total,
  ) {
    final size = MediaQuery.of(context).size;
    return TableRow(
      children: [
        tableCell(sn),
        tableCell(code),
        SizedBox(width: size.width * 0.5, child: tableCell(subject)),
        tableCell(fullMarks),
        tableCell(passMarks),
        Row(
          children: [
            Expanded(child: tableCell(asst)),
            Expanded(child: tableCell(sem)),
            Expanded(child: tableCell(total)),
          ],
        ),
      ],
    );
  }

  Widget tableCell(String text) {
    return Padding(
      padding: const EdgeInsets.all(8),
      child: Text(
        text,
        textAlign: TextAlign.center,
      ),
    );
  }

  Widget totalCell(String text) {
    return TableCell(
      verticalAlignment: TableCellVerticalAlignment.middle,
      child: Padding(
        padding: const EdgeInsets.all(8),
        child: Text(
          text,
          textAlign: TextAlign.center,
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
