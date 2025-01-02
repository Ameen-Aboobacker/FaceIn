import 'dart:developer';

import 'package:facein/application/bloc/employee_fetch_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
    return BlocConsumer<EmployeeFetchBloc, EmployeeFetchState>(
      builder: (context, state) {
        if (state is FetchLoading) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else if (state is FetchSuccess) {
          if (state.employeeList.isEmpty) {
            return const Center(
              child: Text('No Employess Registered'),
            );
          }
          log(state.employeeList.length.toString());
          final employeesData = state.employeeList;
          return ListView.separated(
            padding: const EdgeInsets.fromLTRB(10, 20, 10, 0),
            itemBuilder: (context, index) {
              final Employee employeeInfo = employeesData[index];

              return CustomListTile(
                index: index,
                info: employeeInfo,
              );
            },
            separatorBuilder: (context, index) => const SizedBox(height: 15),
            itemCount: employeesData.length,
          );
        }
        return const SizedBox(child: Text('not loading not success'));
      },
      listener: (context, state) {},
    );
  }
}
