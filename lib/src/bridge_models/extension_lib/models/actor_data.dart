import 'package:dart_eval/dart_eval.dart';
import 'package:dart_eval/dart_eval_bridge.dart';
import 'package:dart_eval/stdlib/core.dart';
import 'package:meiyou_extensions_lib/src/bridge_models/extension_lib/types.dart';
import 'package:meiyou_extensions_lib/src/models/actor_data.dart';

class $ActorData implements ActorData, $Instance {
  $ActorData.wrap(this.$value);

  static void configureForRuntime(Runtime runtime) {
    runtime.registerBridgeFunc(
        ExtensionLibTypes.actorData.library, 'ActorData.', $new);
  }

  late final $Instance _superclass = $Object($value);

  static const $type = BridgeTypeRef(ExtensionLibTypes.actorData);

  static const $declaration = BridgeClassDef(BridgeClassType($type),
      constructors: {
        '': BridgeConstructorDef(
          BridgeFunctionDef(
            returns: BridgeTypeAnnotation($type),
            params: [],
            namedParams: [
              BridgeParameter(
                  'name',
                  BridgeTypeAnnotation(BridgeTypeRef(CoreTypes.string),
                      nullable: false),
                  false),
              BridgeParameter(
                  'image',
                  BridgeTypeAnnotation(BridgeTypeRef(CoreTypes.string),
                      nullable: true),
                  true),
              BridgeParameter(
                  'role',
                  BridgeTypeAnnotation(BridgeTypeRef(CoreTypes.string),
                      nullable: true),
                  true),
            ],
          ),
        ),
      },
      fields: {
        'name': BridgeFieldDef(
          BridgeTypeAnnotation(BridgeTypeRef(CoreTypes.string)),
        ),
        'image': BridgeFieldDef(
          BridgeTypeAnnotation(BridgeTypeRef(CoreTypes.string), nullable: true),
        ),
        'role': BridgeFieldDef(
          BridgeTypeAnnotation(BridgeTypeRef(CoreTypes.string), nullable: true),
        ),
      },
      wrap: true);

  @override
  $Value? $getProperty(Runtime runtime, String identifier) {
    switch (identifier) {
      case 'name':
        return $String($value.name);
      case 'image':
        return $value.image != null ? $String($value.image!) : $null();
      case 'role':
        return $value.role != null ? $String($value.role!) : $null();
      default:
        return _superclass.$getProperty(runtime, identifier);
    }
  }

  @override
  int $getRuntimeType(Runtime runtime) => runtime.lookupType($type.spec!);

  static $Value? $new(Runtime runtime, $Value? target, List<$Value?> args) {
    return $ActorData.wrap(ActorData(
      name: args[0]?.$value ?? '',
      image: args[1]?.$value,
      role: args[2]?.$value,
    ));
  }

  @override
  get $reified => $value;

  @override
  void $setProperty(Runtime runtime, String identifier, $Value value) {
    switch (identifier) {
      case 'name':
        $value.name = value.$reified;
        break;
      case 'image':
        $value.image = value.$reified;
        break;
      case 'role':
        $value.role = value.$reified;
        break;
      default:
        _superclass.$setProperty(runtime, identifier, value);
    }
  }

  @override
  final ActorData $value;

  @override
  String? get image => $value.image;

  @override
  String? get role => $value.role;

  @override
  String get name => $value.name;

  @override
  String toString() {
    return $value.toString();
  }

  @override
  set image(String? image) {
    $value.image = image;
  }

  @override
  set name(String name) {
    $value.name = name;
  }

  @override
  set role(String? role) {
    $value.role = role;
  }
}
