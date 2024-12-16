import 'package:cloud_firestore/cloud_firestore.dart';

import 'entities/employee_model.dart';


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


// ...

/*Future<Uint8List> captureImage({required ImageSource source}) async {
  final XFile? pickedFile = await ImagePicker().pickImage(source: source);
  Uint8List rebytes;
  if (pickedFile != null) {
    final bytes = await pickedFile.readAsBytes();
    log('leninit:${bytes.length}');
    if (bytes.length >= 5242880) {
      rebytes = await resizeImage(bytes, 768, 480);
    }
    rebytes = bytes;
    log('len:${rebytes.length}');
    return bytes;
  } else {
    return Uint8List(0);
  }
}*/

/*Future<Uint8List> resizeImage(
    Uint8List imageBytes, int maxWidth, int maxHeight) async {
  final decodedImage = img.decodeImage(imageBytes);
  final resizedImage =
      img.copyResize(decodedImage!, width: maxWidth, height: maxHeight);
  return Uint8List.fromList(
      img.encodeJpg(resizedImage)); // Adjust format as needed
}*/



/*Future<ResModel> compareFace(Uint8List imageBytes) async {
  try {
    final response = await rekognition.searchFacesByImage(
      collectionId: 'employee_faces',
      image: Image(bytes: imageBytes),
    );
    if (response.faceMatches!.isNotEmpty) {
      // Match found, handle the match (e.g., allow access)
      return ResModel(
          match: true, faceId: response.faceMatches![0].face!.faceId!);
    } else {
      // No match found
      return ResModel(match: false, faceId: 'No Matching faces found');
    }
  } catch (e) {
    log('Error comparing faces: $e');
    return ResModel(match: false, faceId: 'Error comparing faces: $e');
  }
}*/
