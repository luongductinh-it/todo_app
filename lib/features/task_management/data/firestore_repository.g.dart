// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'firestore_repository.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(firestoreRepository)
final firestoreRepositoryProvider = FirestoreRepositoryProvider._();

final class FirestoreRepositoryProvider
    extends
        $FunctionalProvider<
          FirestoreRepository,
          FirestoreRepository,
          FirestoreRepository
        >
    with $Provider<FirestoreRepository> {
  FirestoreRepositoryProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'firestoreRepositoryProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$firestoreRepositoryHash();

  @$internal
  @override
  $ProviderElement<FirestoreRepository> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  FirestoreRepository create(Ref ref) {
    return firestoreRepository(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(FirestoreRepository value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<FirestoreRepository>(value),
    );
  }
}

String _$firestoreRepositoryHash() =>
    r'95c1c445734f56d18e7408d875baf5988563dc72';

@ProviderFor(loadTasks)
final loadTasksProvider = LoadTasksFamily._();

final class LoadTasksProvider
    extends
        $FunctionalProvider<
          AsyncValue<List<Task>>,
          List<Task>,
          Stream<List<Task>>
        >
    with $FutureModifier<List<Task>>, $StreamProvider<List<Task>> {
  LoadTasksProvider._({
    required LoadTasksFamily super.from,
    required String super.argument,
  }) : super(
         retry: null,
         name: r'loadTasksProvider',
         isAutoDispose: false,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$loadTasksHash();

  @override
  String toString() {
    return r'loadTasksProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  $StreamProviderElement<List<Task>> $createElement($ProviderPointer pointer) =>
      $StreamProviderElement(pointer);

  @override
  Stream<List<Task>> create(Ref ref) {
    final argument = this.argument as String;
    return loadTasks(ref, argument);
  }

  @override
  bool operator ==(Object other) {
    return other is LoadTasksProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$loadTasksHash() => r'dbf6dadf48311158dab21deb0ae0423b1cb49155';

final class LoadTasksFamily extends $Family
    with $FunctionalFamilyOverride<Stream<List<Task>>, String> {
  LoadTasksFamily._()
    : super(
        retry: null,
        name: r'loadTasksProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: false,
      );

  LoadTasksProvider call(String userId) =>
      LoadTasksProvider._(argument: userId, from: this);

  @override
  String toString() => r'loadTasksProvider';
}

@ProviderFor(loadCompleteTasks)
final loadCompleteTasksProvider = LoadCompleteTasksFamily._();

final class LoadCompleteTasksProvider
    extends
        $FunctionalProvider<
          AsyncValue<List<Task>>,
          List<Task>,
          Stream<List<Task>>
        >
    with $FutureModifier<List<Task>>, $StreamProvider<List<Task>> {
  LoadCompleteTasksProvider._({
    required LoadCompleteTasksFamily super.from,
    required String super.argument,
  }) : super(
         retry: null,
         name: r'loadCompleteTasksProvider',
         isAutoDispose: false,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$loadCompleteTasksHash();

  @override
  String toString() {
    return r'loadCompleteTasksProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  $StreamProviderElement<List<Task>> $createElement($ProviderPointer pointer) =>
      $StreamProviderElement(pointer);

  @override
  Stream<List<Task>> create(Ref ref) {
    final argument = this.argument as String;
    return loadCompleteTasks(ref, argument);
  }

  @override
  bool operator ==(Object other) {
    return other is LoadCompleteTasksProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$loadCompleteTasksHash() => r'4f79f659e4714a0ca5dc045092875984b430ce50';

final class LoadCompleteTasksFamily extends $Family
    with $FunctionalFamilyOverride<Stream<List<Task>>, String> {
  LoadCompleteTasksFamily._()
    : super(
        retry: null,
        name: r'loadCompleteTasksProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: false,
      );

  LoadCompleteTasksProvider call(String userId) =>
      LoadCompleteTasksProvider._(argument: userId, from: this);

  @override
  String toString() => r'loadCompleteTasksProvider';
}

@ProviderFor(loadInCompleteTasks)
final loadInCompleteTasksProvider = LoadInCompleteTasksFamily._();

final class LoadInCompleteTasksProvider
    extends
        $FunctionalProvider<
          AsyncValue<List<Task>>,
          List<Task>,
          Stream<List<Task>>
        >
    with $FutureModifier<List<Task>>, $StreamProvider<List<Task>> {
  LoadInCompleteTasksProvider._({
    required LoadInCompleteTasksFamily super.from,
    required String super.argument,
  }) : super(
         retry: null,
         name: r'loadInCompleteTasksProvider',
         isAutoDispose: false,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$loadInCompleteTasksHash();

  @override
  String toString() {
    return r'loadInCompleteTasksProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  $StreamProviderElement<List<Task>> $createElement($ProviderPointer pointer) =>
      $StreamProviderElement(pointer);

  @override
  Stream<List<Task>> create(Ref ref) {
    final argument = this.argument as String;
    return loadInCompleteTasks(ref, argument);
  }

  @override
  bool operator ==(Object other) {
    return other is LoadInCompleteTasksProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$loadInCompleteTasksHash() =>
    r'30e9fd21f9130b3622bcb1b416fb818e077f4672';

final class LoadInCompleteTasksFamily extends $Family
    with $FunctionalFamilyOverride<Stream<List<Task>>, String> {
  LoadInCompleteTasksFamily._()
    : super(
        retry: null,
        name: r'loadInCompleteTasksProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: false,
      );

  LoadInCompleteTasksProvider call(String userId) =>
      LoadInCompleteTasksProvider._(argument: userId, from: this);

  @override
  String toString() => r'loadInCompleteTasksProvider';
}
