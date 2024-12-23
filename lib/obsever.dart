import 'dart:developer'; // استيراد مكتبة الـ log للطباعة في الـ console
import 'package:flutter_bloc/flutter_bloc.dart';

class MyBlocObserver extends BlocObserver {

  // عند إنشاء الـ Bloc أو Cubit
  @override
  void onCreate(BlocBase bloc) {
    super.onCreate(bloc);
    log('Bloc created: ${bloc.runtimeType} at ${DateTime.now()}');
  }

  // عند حدوث تغيير في الـ Bloc (تغيير في الحالة)
  @override
  void onChange(BlocBase bloc, Change change) {
    super.onChange(bloc, change);

    // طباعة الحالة السابقة والجديدة بشكل أكثر تفصيلاً
    log('Bloc changed: ${bloc.runtimeType} '
        'from ${change.currentState} to ${change.nextState} at ${DateTime.now()}');
  }

  // عند إغلاق الـ Bloc
  @override
  void onClose(BlocBase bloc) {
    super.onClose(bloc);
    log('Bloc closed: ${bloc.runtimeType} at ${DateTime.now()}');
  }

  // محاولة لإضافة تعاملك مع الأخطاء في الـ Bloc بشكل عام
  @override
  void onError(BlocBase bloc, Object error, StackTrace stackTrace) {
    super.onError(bloc, error, stackTrace);
    log('Error occurred in Bloc ${bloc.runtimeType}: $error\nStackTrace: $stackTrace');
  }
}
