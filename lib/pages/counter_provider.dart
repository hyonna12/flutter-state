import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_state/pages/counter_repository.dart';

final counterProvider = StateNotifierProvider<CounterRepository, int>((_) {
  return CounterRepository();
});
