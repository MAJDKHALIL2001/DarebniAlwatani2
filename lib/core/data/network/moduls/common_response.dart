import 'package:darrebni_exam/ui/shared/custom_widgets/custom_toast.dart';

class CommonResponse<T> {
  int? statusCode;
  late String message;
  late String college_uuid;
  T? data;
// CommonResponse(this.data, this.message, this.statusCode);
  CommonResponse.fromJson(Map<String, dynamic> json) {
    this.statusCode = json['statusCode'];
    if (getStatus) {
      // this.data = json['response']['data'] as T?;
      try {
        this.data = json['response']['data'];
      } catch (e) {
        // هنا يمكنك معالجة الخطأ أو تنفيذ تعليمة أخرى
        // على سبيل المثال، يمكنك تعيين قيمة افتراضية لـ this.data
        this.data = json['data']; // أو أي قيمة افتراضية أخرى ترغب في تعيينها
      }
      ;
      this.college_uuid = json['response']['college_uuid'] ?? "";
    } else {
      if (json['response']['message'][0].toString().isNotEmpty) {
        this.message = json['response']['message'][0] ?? '';
      } else {
        switch (statusCode) {
          case 400:
            message = '400 bad request';
            break;

          case 401:
            message = '401 Not Auth';
            break;
          case 403:
            message = '403 Forbidden';
            break;
          case 404:
            message = '404 Not found';
            break;
          case 405:
            message = '405 Method not allowed';
            break;

          case 500:
            message = '500 Server error';
            break;
          case 503:
            message = '503 Unavalible';
            break;
          default:
            message = 'General Error';
            break;
        }
      }
    }
  }

  bool get getStatus => statusCode.toString().startsWith('2');

  String get getMessage => this.message;
}
