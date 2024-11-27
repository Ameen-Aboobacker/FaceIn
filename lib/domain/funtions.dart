import 'package:cloud_firestore/cloud_firestore.dart';

import '../data/employee_model.dart';

Future<String> addEmployee(Employee employee) async {
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  try {
    final DocumentReference ref =
        await firestore.collection('employees').add(employee.toJson());
    employee.id = ref.id;
    await firestore
        .collection('employees')
        .doc(employee.id)
        .update(employee.toJson());
    return 'Success';
  } on FirebaseException catch (e) {
    return e.message ?? 'Failed';
  } catch (m) {
    return m.toString();
  }
}
