import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../application/bloc/employee_fetch_bloc.dart';
import '../../domain/entities/employee_model.dart';
import 'widgets/custom_list_tile.dart';


class EmployeesScreen extends StatelessWidget {
  const EmployeesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Color secondary = Colors.white;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        foregroundColor: const Color.fromARGB(255, 11, 89, 224),
        shadowColor: Colors.transparent,
        centerTitle: true,
        title: const Text(
          'Employees',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
        ),
      ),
      backgroundColor: secondary,
      body: SafeArea(
          child: BlocConsumer<EmployeeFetchBloc, EmployeeFetchState>(
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
          } else if (state is FetchFailed) {
            return SizedBox(child: Text(state.error));
          }
          return const SizedBox(child: Text('not loading not success'));
        },
        listener: (context, state) {},
      )),
    );
  }
}
