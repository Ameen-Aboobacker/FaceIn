import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../../../domain/entities/employee_model.dart';
import 'custom_list_tile.dart';

class EmployeeListWidget extends StatelessWidget {
  const EmployeeListWidget({
    super.key,
    required this.secondary,
    required this.primarycolor,
    required this.onTap,
  });

  final Color secondary;
  final Color primarycolor;
  final Function(Employee employee) onTap;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: getEmployee(),
      builder: (context, snapshot) {
        if (snapshot.data == null) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
        log(snapshot.data!.length.toString());
        return ListView.separated(
          padding: const EdgeInsets.fromLTRB(25, 20, 25, 0),
          itemBuilder: (context, index) {
            final Employee employee = snapshot.data![index];
            return CustomListTile(
              onTap: () {
                onTap(employee);
              },
              tileColor: secondary,
              leading: CircleAvatar(
                radius: 24,
                backgroundColor: primarycolor,
                foregroundImage: NetworkImage(employee.imageUrl),
              ),
              title: employee.name,
              titleTextStyle: TextStyle(
                  color: primarycolor,
                  fontSize: 16,
                  fontWeight: FontWeight.w500),
              subtitle: employee.employeeId,
              subtitleTextStyle: TextStyle(color: primarycolor),
              trailing: IconButton(
                onPressed: () {},
                icon: const Icon(Icons.settings),
              ),
            );
          },
          separatorBuilder: (context, index) => const SizedBox(height: 15),
          itemCount: snapshot.data!.length,
        );
      },
    );
  }
}

Future<List<Employee>> getEmployee() async {
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  final QuerySnapshot<Map<String, dynamic>> querySnapshot = await firestore
      .collection('employees')
      .orderBy('createdAt', descending: true)
      .get();
  log(querySnapshot.docs.length.toString());
  List<Employee> employeesData = [];
  for (DocumentSnapshot<Map<String, dynamic>> doc in querySnapshot.docs) {
    employeesData.add(Employee.fromSnapshot(doc));
  }
  return employeesData;
}

class Routes {
  static const String dashboard = '/dashboard';
  static const String addEmployee = '/addEmployee';
  static const String employeesInfo = '/employeesInfo';
  static const String employeeDetails = '/employeeDetails';
}
