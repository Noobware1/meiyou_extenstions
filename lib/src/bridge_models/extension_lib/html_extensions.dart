import 'package:dart_eval/dart_eval_bridge.dart';
import 'package:meiyou_extensions_lib/src/bridge_models/crypto_dart/plugin.dart';
import 'package:meiyou_extensions_lib/src/bridge_models/extension_lib/plugin.dart';
import 'package:meiyou_extensions_lib/src/bridge_models/okhttp/plugin.dart';

final htmlExtensionsSource =
    DartSource('package:meiyou_extensions_lib/html_extensions.dart', _source());

String _source() {
  final buffer = StringBuffer();
  CryptoDartPlugin().addAllExports(buffer);
  OkHttpPlugin().addAllExport(buffer);
  ExtensionLibPlugin().addAllExports(buffer, 'html_extensions');

  return buffer.toString();
}
