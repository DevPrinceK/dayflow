// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tasks_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$weeklyTasksHash() => r'3e52dfac8e1e18e9c1b52f329080992d68a64e81';

/// See also [weeklyTasks].
@ProviderFor(weeklyTasks)
final weeklyTasksProvider = AutoDisposeFutureProvider<List<Task>>.internal(
  weeklyTasks,
  name: r'weeklyTasksProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$weeklyTasksHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef WeeklyTasksRef = AutoDisposeFutureProviderRef<List<Task>>;
String _$dailyTasksHash() => r'7863b0101d37c96aaac3e83150b71133677d300f';

/// Copied from Dart SDK
class _SystemHash {
  _SystemHash._();

  static int combine(int hash, int value) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + value);
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x0007ffff & hash) << 10));
    return hash ^ (hash >> 6);
  }

  static int finish(int hash) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x03ffffff & hash) << 3));
    // ignore: parameter_assignments
    hash = hash ^ (hash >> 11);
    return 0x1fffffff & (hash + ((0x00003fff & hash) << 15));
  }
}

abstract class _$DailyTasks
    extends BuildlessAutoDisposeStreamNotifier<List<Task>> {
  late final DateTime date;

  Stream<List<Task>> build(
    DateTime date,
  );
}

/// See also [DailyTasks].
@ProviderFor(DailyTasks)
const dailyTasksProvider = DailyTasksFamily();

/// See also [DailyTasks].
class DailyTasksFamily extends Family<AsyncValue<List<Task>>> {
  /// See also [DailyTasks].
  const DailyTasksFamily();

  /// See also [DailyTasks].
  DailyTasksProvider call(
    DateTime date,
  ) {
    return DailyTasksProvider(
      date,
    );
  }

  @override
  DailyTasksProvider getProviderOverride(
    covariant DailyTasksProvider provider,
  ) {
    return call(
      provider.date,
    );
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'dailyTasksProvider';
}

/// See also [DailyTasks].
class DailyTasksProvider
    extends AutoDisposeStreamNotifierProviderImpl<DailyTasks, List<Task>> {
  /// See also [DailyTasks].
  DailyTasksProvider(
    DateTime date,
  ) : this._internal(
          () => DailyTasks()..date = date,
          from: dailyTasksProvider,
          name: r'dailyTasksProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$dailyTasksHash,
          dependencies: DailyTasksFamily._dependencies,
          allTransitiveDependencies:
              DailyTasksFamily._allTransitiveDependencies,
          date: date,
        );

  DailyTasksProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.date,
  }) : super.internal();

  final DateTime date;

  @override
  Stream<List<Task>> runNotifierBuild(
    covariant DailyTasks notifier,
  ) {
    return notifier.build(
      date,
    );
  }

  @override
  Override overrideWith(DailyTasks Function() create) {
    return ProviderOverride(
      origin: this,
      override: DailyTasksProvider._internal(
        () => create()..date = date,
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        date: date,
      ),
    );
  }

  @override
  AutoDisposeStreamNotifierProviderElement<DailyTasks, List<Task>>
      createElement() {
    return _DailyTasksProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is DailyTasksProvider && other.date == date;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, date.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin DailyTasksRef on AutoDisposeStreamNotifierProviderRef<List<Task>> {
  /// The parameter `date` of this provider.
  DateTime get date;
}

class _DailyTasksProviderElement
    extends AutoDisposeStreamNotifierProviderElement<DailyTasks, List<Task>>
    with DailyTasksRef {
  _DailyTasksProviderElement(super.provider);

  @override
  DateTime get date => (origin as DailyTasksProvider).date;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
