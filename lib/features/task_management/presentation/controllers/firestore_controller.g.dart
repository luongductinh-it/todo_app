// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'firestore_controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(FirestoreController)
final firestoreControllerProvider = FirestoreControllerProvider._();

final class FirestoreControllerProvider
    extends $AsyncNotifierProvider<FirestoreController, dynamic> {
  FirestoreControllerProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'firestoreControllerProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$firestoreControllerHash();

  @$internal
  @override
  FirestoreController create() => FirestoreController();
}

String _$firestoreControllerHash() =>
    r'90696dd71be613f294e72bf5318da7efcb72c32f';

abstract class _$FirestoreController extends $AsyncNotifier<dynamic> {
  FutureOr<dynamic> build();
  @$mustCallSuper
  @override
  WhenComplete runBuild() {
    final ref = this.ref as $Ref<AsyncValue<dynamic>, dynamic>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AsyncValue<dynamic>, dynamic>,
              AsyncValue<dynamic>,
              Object?,
              Object?
            >;
    return element.handleCreate(ref, build);
  }
}
