import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:yenlei_flutter/commons/repository/contact_repository.dart';

import '../../src/models/contact_model.dart';


final contactRepositoryProvider = Provider<ContactRepository>((ref) {
  return ContactRepository();
});

final contactProvider = FutureProvider.family<void, Contact>((ref, contact) async {
  final repository = ref.read(contactRepositoryProvider);
  await repository.sendContact(contact);
});