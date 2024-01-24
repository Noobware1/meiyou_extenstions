// import 'package:dart_eval/dart_eval.dart';
// import 'package:dart_eval/dart_eval_bridge.dart';
// import 'package:meiyou_extensions_lib/src/bridge_models/dartx/plugin.dart';
// import 'package:test/test.dart';

import 'package:dart_eval/dart_eval.dart';
import 'package:dart_eval/dart_eval_bridge.dart';

import 'package:test/test.dart';
import 'package:meiyou_extensions_lib/src/bridge_models/dartx/plugin.dart';

void main() {
  group('\$Iterableutils', () {
    late Compiler compiler;
    setUp(() {
      compiler = Compiler()..addPlugin(DartxPlugin());
    });
    test('buildString', () {
      var compiled = compiler.compile({
        'example': {
          'main.dart': '''
import 'package:meiyou_extensions_lib/utils.dart';

String main() {
  final str = buildString((it) {
    it as StringBuffer;
    it.write('hello');
    it.write(' ');
    it.write('world');
  });

  return str;
}
          ''',
        },
      });

      var runtime = Runtime.ofProgram(compiled)..addPlugin(DartxPlugin());
      var value = runtime.executeLib('package:example/main.dart', 'main');
      expect((value as $Value).$value, 'hello world');
    });

    test('buildList', () {
      var compiled = compiler.compile({
        'example': {
          'main.dart': '''  
import 'package:meiyou_extensions_lib/utils.dart';

List<int> main() {
  final list = buildList<int>((it) {
    it as List<int>;
    it.add(1);
    it.add(2);
    it.add(3);
  });

  return list;
}
          ''',
        },
      });

      var runtime = Runtime.ofProgram(compiled)..addPlugin(DartxPlugin());
      var value = runtime.executeLib('package:example/main.dart', 'main');
      expect((value as List).map((e) => e is $Value ? e.$reified : e).toList(),
          [1, 2, 3]);
    });
  });
}