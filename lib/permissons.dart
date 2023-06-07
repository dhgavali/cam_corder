import 'package:permission_handler/permission_handler.dart';

class PerHandler {
  Future<void> getCam() async {
    var status = await Permission.camera.status;
    if (status.isDenied) {
      // We didn't ask for permission yet or the permission has been denied before but not permanently.
      await Permission.camera.request();
    }

// You can can also directly ask the permission about its status.
    if (await Permission.microphone.isDenied) {
      // The OS restricts access, for example because of parental controls.
      await Permission.microphone.request();
    }
  }
}
