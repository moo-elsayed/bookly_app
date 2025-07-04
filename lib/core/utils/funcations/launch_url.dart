import 'package:url_launcher/url_launcher.dart';

import '../../widgets/custom_toast.dart';

Future<void> launchCustomUrl(context, String? url) async {
  if (url != null) {
    Uri uri = Uri.parse(url);
    if (!await launchUrl(uri)) {
      showCustomToast(
        context: context,
        message: 'can not launch url',
        contentType: ContentType.failure,
      );
    }
  }
}
