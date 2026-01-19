// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'task.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

Task _$TaskFromJson(Map<String, dynamic> json) {
  return _Task.fromJson(json);
}

/// @nodoc
mixin _$Task {
  String get id => throw _privateConstructorUsedError;
  String get title => throw _privateConstructorUsedError;
  String get description => throw _privateConstructorUsedError;
  DateTime get date => throw _privateConstructorUsedError;
  DateTime get startTime => throw _privateConstructorUsedError;
  DateTime get endTime => throw _privateConstructorUsedError;
  DateTime? get actualStartTime => throw _privateConstructorUsedError;
  DateTime? get actualEndTime => throw _privateConstructorUsedError;
  TaskPriority get priority => throw _privateConstructorUsedError;
  TaskCategory get category => throw _privateConstructorUsedError;
  TaskStatus get status => throw _privateConstructorUsedError;
  bool get isRecurring => throw _privateConstructorUsedError;
  String? get recurrenceRule => throw _privateConstructorUsedError;
  DateTime get createdAt => throw _privateConstructorUsedError;
  DateTime get updatedAt => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $TaskCopyWith<Task> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TaskCopyWith<$Res> {
  factory $TaskCopyWith(Task value, $Res Function(Task) then) =
      _$TaskCopyWithImpl<$Res, Task>;
  @useResult
  $Res call(
      {String id,
      String title,
      String description,
      DateTime date,
      DateTime startTime,
      DateTime endTime,
      DateTime? actualStartTime,
      DateTime? actualEndTime,
      TaskPriority priority,
      TaskCategory category,
      TaskStatus status,
      bool isRecurring,
      String? recurrenceRule,
      DateTime createdAt,
      DateTime updatedAt});
}

/// @nodoc
class _$TaskCopyWithImpl<$Res, $Val extends Task>
    implements $TaskCopyWith<$Res> {
  _$TaskCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? title = null,
    Object? description = null,
    Object? date = null,
    Object? startTime = null,
    Object? endTime = null,
    Object? actualStartTime = freezed,
    Object? actualEndTime = freezed,
    Object? priority = null,
    Object? category = null,
    Object? status = null,
    Object? isRecurring = null,
    Object? recurrenceRule = freezed,
    Object? createdAt = null,
    Object? updatedAt = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      date: null == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as DateTime,
      startTime: null == startTime
          ? _value.startTime
          : startTime // ignore: cast_nullable_to_non_nullable
              as DateTime,
      endTime: null == endTime
          ? _value.endTime
          : endTime // ignore: cast_nullable_to_non_nullable
              as DateTime,
      actualStartTime: freezed == actualStartTime
          ? _value.actualStartTime
          : actualStartTime // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      actualEndTime: freezed == actualEndTime
          ? _value.actualEndTime
          : actualEndTime // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      priority: null == priority
          ? _value.priority
          : priority // ignore: cast_nullable_to_non_nullable
              as TaskPriority,
      category: null == category
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as TaskCategory,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as TaskStatus,
      isRecurring: null == isRecurring
          ? _value.isRecurring
          : isRecurring // ignore: cast_nullable_to_non_nullable
              as bool,
      recurrenceRule: freezed == recurrenceRule
          ? _value.recurrenceRule
          : recurrenceRule // ignore: cast_nullable_to_non_nullable
              as String?,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      updatedAt: null == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$TaskImplCopyWith<$Res> implements $TaskCopyWith<$Res> {
  factory _$$TaskImplCopyWith(
          _$TaskImpl value, $Res Function(_$TaskImpl) then) =
      __$$TaskImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String title,
      String description,
      DateTime date,
      DateTime startTime,
      DateTime endTime,
      DateTime? actualStartTime,
      DateTime? actualEndTime,
      TaskPriority priority,
      TaskCategory category,
      TaskStatus status,
      bool isRecurring,
      String? recurrenceRule,
      DateTime createdAt,
      DateTime updatedAt});
}

/// @nodoc
class __$$TaskImplCopyWithImpl<$Res>
    extends _$TaskCopyWithImpl<$Res, _$TaskImpl>
    implements _$$TaskImplCopyWith<$Res> {
  __$$TaskImplCopyWithImpl(_$TaskImpl _value, $Res Function(_$TaskImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? title = null,
    Object? description = null,
    Object? date = null,
    Object? startTime = null,
    Object? endTime = null,
    Object? actualStartTime = freezed,
    Object? actualEndTime = freezed,
    Object? priority = null,
    Object? category = null,
    Object? status = null,
    Object? isRecurring = null,
    Object? recurrenceRule = freezed,
    Object? createdAt = null,
    Object? updatedAt = null,
  }) {
    return _then(_$TaskImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      date: null == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as DateTime,
      startTime: null == startTime
          ? _value.startTime
          : startTime // ignore: cast_nullable_to_non_nullable
              as DateTime,
      endTime: null == endTime
          ? _value.endTime
          : endTime // ignore: cast_nullable_to_non_nullable
              as DateTime,
      actualStartTime: freezed == actualStartTime
          ? _value.actualStartTime
          : actualStartTime // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      actualEndTime: freezed == actualEndTime
          ? _value.actualEndTime
          : actualEndTime // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      priority: null == priority
          ? _value.priority
          : priority // ignore: cast_nullable_to_non_nullable
              as TaskPriority,
      category: null == category
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as TaskCategory,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as TaskStatus,
      isRecurring: null == isRecurring
          ? _value.isRecurring
          : isRecurring // ignore: cast_nullable_to_non_nullable
              as bool,
      recurrenceRule: freezed == recurrenceRule
          ? _value.recurrenceRule
          : recurrenceRule // ignore: cast_nullable_to_non_nullable
              as String?,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      updatedAt: null == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$TaskImpl implements _Task {
  const _$TaskImpl(
      {required this.id,
      required this.title,
      this.description = '',
      required this.date,
      required this.startTime,
      required this.endTime,
      this.actualStartTime,
      this.actualEndTime,
      this.priority = TaskPriority.medium,
      this.category = TaskCategory.other,
      this.status = TaskStatus.planned,
      this.isRecurring = false,
      this.recurrenceRule,
      required this.createdAt,
      required this.updatedAt});

  factory _$TaskImpl.fromJson(Map<String, dynamic> json) =>
      _$$TaskImplFromJson(json);

  @override
  final String id;
  @override
  final String title;
  @override
  @JsonKey()
  final String description;
  @override
  final DateTime date;
  @override
  final DateTime startTime;
  @override
  final DateTime endTime;
  @override
  final DateTime? actualStartTime;
  @override
  final DateTime? actualEndTime;
  @override
  @JsonKey()
  final TaskPriority priority;
  @override
  @JsonKey()
  final TaskCategory category;
  @override
  @JsonKey()
  final TaskStatus status;
  @override
  @JsonKey()
  final bool isRecurring;
  @override
  final String? recurrenceRule;
  @override
  final DateTime createdAt;
  @override
  final DateTime updatedAt;

  @override
  String toString() {
    return 'Task(id: $id, title: $title, description: $description, date: $date, startTime: $startTime, endTime: $endTime, actualStartTime: $actualStartTime, actualEndTime: $actualEndTime, priority: $priority, category: $category, status: $status, isRecurring: $isRecurring, recurrenceRule: $recurrenceRule, createdAt: $createdAt, updatedAt: $updatedAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TaskImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.date, date) || other.date == date) &&
            (identical(other.startTime, startTime) ||
                other.startTime == startTime) &&
            (identical(other.endTime, endTime) || other.endTime == endTime) &&
            (identical(other.actualStartTime, actualStartTime) ||
                other.actualStartTime == actualStartTime) &&
            (identical(other.actualEndTime, actualEndTime) ||
                other.actualEndTime == actualEndTime) &&
            (identical(other.priority, priority) ||
                other.priority == priority) &&
            (identical(other.category, category) ||
                other.category == category) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.isRecurring, isRecurring) ||
                other.isRecurring == isRecurring) &&
            (identical(other.recurrenceRule, recurrenceRule) ||
                other.recurrenceRule == recurrenceRule) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      title,
      description,
      date,
      startTime,
      endTime,
      actualStartTime,
      actualEndTime,
      priority,
      category,
      status,
      isRecurring,
      recurrenceRule,
      createdAt,
      updatedAt);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$TaskImplCopyWith<_$TaskImpl> get copyWith =>
      __$$TaskImplCopyWithImpl<_$TaskImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$TaskImplToJson(
      this,
    );
  }
}

abstract class _Task implements Task {
  const factory _Task(
      {required final String id,
      required final String title,
      final String description,
      required final DateTime date,
      required final DateTime startTime,
      required final DateTime endTime,
      final DateTime? actualStartTime,
      final DateTime? actualEndTime,
      final TaskPriority priority,
      final TaskCategory category,
      final TaskStatus status,
      final bool isRecurring,
      final String? recurrenceRule,
      required final DateTime createdAt,
      required final DateTime updatedAt}) = _$TaskImpl;

  factory _Task.fromJson(Map<String, dynamic> json) = _$TaskImpl.fromJson;

  @override
  String get id;
  @override
  String get title;
  @override
  String get description;
  @override
  DateTime get date;
  @override
  DateTime get startTime;
  @override
  DateTime get endTime;
  @override
  DateTime? get actualStartTime;
  @override
  DateTime? get actualEndTime;
  @override
  TaskPriority get priority;
  @override
  TaskCategory get category;
  @override
  TaskStatus get status;
  @override
  bool get isRecurring;
  @override
  String? get recurrenceRule;
  @override
  DateTime get createdAt;
  @override
  DateTime get updatedAt;
  @override
  @JsonKey(ignore: true)
  _$$TaskImplCopyWith<_$TaskImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
