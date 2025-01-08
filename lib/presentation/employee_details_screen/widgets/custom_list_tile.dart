import 'dart:developer';

import 'package:facein/presentation/attendance_report_screen/attendance_report_screen.dart';
import 'package:flutter/material.dart';

import '../../../domain/entities/employee_model.dart';

class CustomListTile extends StatelessWidget {
  const CustomListTile({
    super.key,
    required this.info,
    required this.index,
  });

  final Employee info;

  final int index;
  @override
  Widget build(BuildContext context) {
    Color tcolor = Colors.white;
    return Container(
      height: 180,
      padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 10),
      decoration: BoxDecoration(
          color: const Color.fromARGB(255, 2, 66, 134),
          borderRadius: BorderRadius.circular(10)),
      child: Column(
        children: [
          SizedBox(
            height: 150,
            child: Row(
              children: [
                if (index % 2 == 0)
                  Container(
                    margin: const EdgeInsets.only(right: 14),
                    width: 120,
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.white, width: 2),
                      borderRadius: BorderRadius.circular(10),
                      image: DecorationImage(
                          onError: (exception, stackTrace) {
                            log('imgexception');
                          },
                          fit: BoxFit.fill,
                          image: info.imageUrl),
                    ),
                  ),
                Expanded(
                  child: Container(
                    margin:
                        index % 2 != 0 ? const EdgeInsets.only(left: 10) : null,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          info.name.toUpperCase(),
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: tcolor,
                          ),
                        ),
                        const Spacer(),
                        Text(
                          info.designation.toUpperCase(),
                          style: TextStyle(
                            fontSize: 15,
                            height: 1.2,
                            color: tcolor,
                          ),
                        ),
                        const Spacer(),
                        Text(
                          info.id,
                          style: TextStyle(
                            fontSize: 13,
                            fontWeight: FontWeight.bold,
                            color: tcolor,
                          ),
                        ),
                        const Spacer(),
                        Text(
                          info.contact,
                          style: const TextStyle(
                            fontSize: 13,
                            fontWeight: FontWeight.bold,
                            color: Color.fromARGB(255, 251, 255, 0),
                          ),
                        ),
                        const Spacer(),
                        Text(
                          info.email,
                          style: TextStyle(
                            fontSize: 13,
                            fontWeight: FontWeight.bold,
                            color: tcolor,
                          ),
                        ),
                        const Spacer(),
                        Row(
                          mainAxisAlignment: index % 2 == 0
                              ? MainAxisAlignment.end
                              : MainAxisAlignment.start,
                          children: [
                            InkWell(
                              onTap: () {
                                Navigator.of(context).push(
                                  MaterialPageRoute(
                                    builder: (context) =>
                                        AttendanceReportScreen(employee: info),
                                  ),
                                );
                              },
                              child: Text(
                                'Attendance >',
                                style: TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold,
                                  color: tcolor,
                                ),
                              ),
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                if (index % 2 != 0)
                  Container(
                    // margin: EdgeInsets.only(right: 12),
                    width: 120,
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.white, width: 2),
                      borderRadius: BorderRadius.circular(10),
                      image: DecorationImage(
                          fit: BoxFit.fill, image: info.imageUrl),
                    ),
                  ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
