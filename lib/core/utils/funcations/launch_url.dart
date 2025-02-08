import 'package:url_launcher/url_launcher.dart';

import '../custom_snack_bar.dart';

Future<void> launchCustomUrl(context, String? url) async {
  if (url != null) {
    Uri uri = Uri.parse(url);
    if (!await launchUrl(uri)) {
      customSnackBar(context, 'can not launch url');
    }
  }
}
