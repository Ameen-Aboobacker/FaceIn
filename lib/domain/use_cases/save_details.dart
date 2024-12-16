

import '../entities/employee_model.dart';
import '../repositories/employee_repository.dart';



class SaveEmployeeDetails {
  final EmployeeRepository employeeRepository;

  SaveEmployeeDetails(this.employeeRepository);

  Future<void> call(Employee employee) async {
    await employeeRepository.saveEmployeeDetails(employee);
  }
}
