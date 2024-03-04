import 'package:dart_eval/dart_eval.dart';
import 'package:dart_eval/dart_eval_bridge.dart';
import 'package:dart_eval/stdlib/core.dart';
import 'package:meiyou_extensions_lib/src/bridge_models/extension_lib/types.dart';
import 'package:meiyou_extensions_lib/src/models/external_id.dart';

class $ExternalId implements ExternalId, $Instance {
  $ExternalId.wrap(this.$value) : _superclass = $Object($value);

  late final $Instance _superclass;

  static const $type = BridgeTypeRef(ExtensionLibTypes.externalId);

  static void configureForRuntime(Runtime runtime) {
    runtime.registerBridgeFunc(
        ExtensionLibTypes.externalId.library, 'ExternalId.', $ExternalId.$new);
  }

  static const $declaration = BridgeClassDef(BridgeClassType($type),
      constructors: {
        '': BridgeConstructorDef(
          BridgeFunctionDef(
            returns: BridgeTypeAnnotation($type),
            params: [],
            namedParams: [
              BridgeParameter('name',
                  BridgeTypeAnnotation(BridgeTypeRef(CoreTypes.string)), true),
              BridgeParameter(
                  'id',
                  BridgeTypeAnnotation(
                    BridgeTypeRef(CoreTypes.string),
                  ),
                  true),
            ],
          ),
        )
      },
      fields: {
        'name': BridgeFieldDef(
          BridgeTypeAnnotation(BridgeTypeRef(CoreTypes.string)),
        ),
        'id': BridgeFieldDef(
          BridgeTypeAnnotation(BridgeTypeRef(CoreTypes.string)),
        ),
      },
      wrap: true);

  @override
  $Value? $getProperty(Runtime runtime, String identifier) {
    switch (identifier) {
      case 'id':
        return $String(id);
      case 'name':
        return $String(name);
      default:
        return _superclass.$getProperty(runtime, identifier);
    }
  }

  @override
  int $getRuntimeType(Runtime runtime) => runtime.lookupType($type.spec!);

  static $Value? $new(Runtime runtime, $Value? target, List<$Value?> args) {
    return $ExternalId.wrap(ExternalId(
      name: args[0]?.$value ?? '',
      id: args[1]?.$value ?? '',
    ));
  }

  @override
  get $reified => $value;

  @override
  void $setProperty(Runtime runtime, String identifier, $Value value) {
    switch (identifier) {
      case 'id':
        id = value.$reified;
        break;
      case 'name':
        name = value.$reified;
        break;
      default:
        _superclass.$setProperty(runtime, identifier, value);
    }
  }

  @override
  final ExternalId $value;

  @override
  String get id => $value.id;

  @override
  String get name => $value.name;

  @override
  String toString() {
    return $value.toString();
  }

  @override
  set id(String id) {
    $value.id = id;
  }

  @override
  set name(String name) {
    $value.name = name;
  }
}
