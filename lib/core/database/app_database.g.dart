// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_database.dart';

// ignore_for_file: type=lint
class $TasksTable extends Tasks with TableInfo<$TasksTable, TaskData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $TasksTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
      'id', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _titleMeta = const VerificationMeta('title');
  @override
  late final GeneratedColumn<String> title = GeneratedColumn<String>(
      'title', aliasedName, false,
      additionalChecks:
          GeneratedColumn.checkTextLength(minTextLength: 1, maxTextLength: 255),
      type: DriftSqlType.string,
      requiredDuringInsert: true);
  static const VerificationMeta _descriptionMeta =
      const VerificationMeta('description');
  @override
  late final GeneratedColumn<String> description = GeneratedColumn<String>(
      'description', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _dateMeta = const VerificationMeta('date');
  @override
  late final GeneratedColumn<DateTime> date = GeneratedColumn<DateTime>(
      'date', aliasedName, false,
      type: DriftSqlType.dateTime, requiredDuringInsert: true);
  static const VerificationMeta _startTimeMeta =
      const VerificationMeta('startTime');
  @override
  late final GeneratedColumn<DateTime> startTime = GeneratedColumn<DateTime>(
      'start_time', aliasedName, false,
      type: DriftSqlType.dateTime, requiredDuringInsert: true);
  static const VerificationMeta _endTimeMeta =
      const VerificationMeta('endTime');
  @override
  late final GeneratedColumn<DateTime> endTime = GeneratedColumn<DateTime>(
      'end_time', aliasedName, false,
      type: DriftSqlType.dateTime, requiredDuringInsert: true);
  static const VerificationMeta _actualStartTimeMeta =
      const VerificationMeta('actualStartTime');
  @override
  late final GeneratedColumn<DateTime> actualStartTime =
      GeneratedColumn<DateTime>('actual_start_time', aliasedName, true,
          type: DriftSqlType.dateTime, requiredDuringInsert: false);
  static const VerificationMeta _actualEndTimeMeta =
      const VerificationMeta('actualEndTime');
  @override
  late final GeneratedColumn<DateTime> actualEndTime =
      GeneratedColumn<DateTime>('actual_end_time', aliasedName, true,
          type: DriftSqlType.dateTime, requiredDuringInsert: false);
  static const VerificationMeta _priorityMeta =
      const VerificationMeta('priority');
  @override
  late final GeneratedColumnWithTypeConverter<TaskPriority, int> priority =
      GeneratedColumn<int>('priority', aliasedName, false,
              type: DriftSqlType.int, requiredDuringInsert: true)
          .withConverter<TaskPriority>($TasksTable.$converterpriority);
  static const VerificationMeta _categoryMeta =
      const VerificationMeta('category');
  @override
  late final GeneratedColumnWithTypeConverter<TaskCategory, int> category =
      GeneratedColumn<int>('category', aliasedName, false,
              type: DriftSqlType.int, requiredDuringInsert: true)
          .withConverter<TaskCategory>($TasksTable.$convertercategory);
  static const VerificationMeta _statusMeta = const VerificationMeta('status');
  @override
  late final GeneratedColumnWithTypeConverter<TaskStatus, int> status =
      GeneratedColumn<int>('status', aliasedName, false,
              type: DriftSqlType.int, requiredDuringInsert: true)
          .withConverter<TaskStatus>($TasksTable.$converterstatus);
  static const VerificationMeta _isRecurringMeta =
      const VerificationMeta('isRecurring');
  @override
  late final GeneratedColumn<bool> isRecurring = GeneratedColumn<bool>(
      'is_recurring', aliasedName, false,
      type: DriftSqlType.bool,
      requiredDuringInsert: false,
      defaultConstraints: GeneratedColumn.constraintIsAlways(
          'CHECK ("is_recurring" IN (0, 1))'),
      defaultValue: const Constant(false));
  static const VerificationMeta _recurrenceRuleMeta =
      const VerificationMeta('recurrenceRule');
  @override
  late final GeneratedColumn<String> recurrenceRule = GeneratedColumn<String>(
      'recurrence_rule', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _createdAtMeta =
      const VerificationMeta('createdAt');
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
      'created_at', aliasedName, false,
      type: DriftSqlType.dateTime, requiredDuringInsert: true);
  static const VerificationMeta _updatedAtMeta =
      const VerificationMeta('updatedAt');
  @override
  late final GeneratedColumn<DateTime> updatedAt = GeneratedColumn<DateTime>(
      'updated_at', aliasedName, false,
      type: DriftSqlType.dateTime, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns => [
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
        updatedAt
      ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'tasks';
  @override
  VerificationContext validateIntegrity(Insertable<TaskData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('title')) {
      context.handle(
          _titleMeta, title.isAcceptableOrUnknown(data['title']!, _titleMeta));
    } else if (isInserting) {
      context.missing(_titleMeta);
    }
    if (data.containsKey('description')) {
      context.handle(
          _descriptionMeta,
          description.isAcceptableOrUnknown(
              data['description']!, _descriptionMeta));
    } else if (isInserting) {
      context.missing(_descriptionMeta);
    }
    if (data.containsKey('date')) {
      context.handle(
          _dateMeta, date.isAcceptableOrUnknown(data['date']!, _dateMeta));
    } else if (isInserting) {
      context.missing(_dateMeta);
    }
    if (data.containsKey('start_time')) {
      context.handle(_startTimeMeta,
          startTime.isAcceptableOrUnknown(data['start_time']!, _startTimeMeta));
    } else if (isInserting) {
      context.missing(_startTimeMeta);
    }
    if (data.containsKey('end_time')) {
      context.handle(_endTimeMeta,
          endTime.isAcceptableOrUnknown(data['end_time']!, _endTimeMeta));
    } else if (isInserting) {
      context.missing(_endTimeMeta);
    }
    if (data.containsKey('actual_start_time')) {
      context.handle(
          _actualStartTimeMeta,
          actualStartTime.isAcceptableOrUnknown(
              data['actual_start_time']!, _actualStartTimeMeta));
    }
    if (data.containsKey('actual_end_time')) {
      context.handle(
          _actualEndTimeMeta,
          actualEndTime.isAcceptableOrUnknown(
              data['actual_end_time']!, _actualEndTimeMeta));
    }
    context.handle(_priorityMeta, const VerificationResult.success());
    context.handle(_categoryMeta, const VerificationResult.success());
    context.handle(_statusMeta, const VerificationResult.success());
    if (data.containsKey('is_recurring')) {
      context.handle(
          _isRecurringMeta,
          isRecurring.isAcceptableOrUnknown(
              data['is_recurring']!, _isRecurringMeta));
    }
    if (data.containsKey('recurrence_rule')) {
      context.handle(
          _recurrenceRuleMeta,
          recurrenceRule.isAcceptableOrUnknown(
              data['recurrence_rule']!, _recurrenceRuleMeta));
    }
    if (data.containsKey('created_at')) {
      context.handle(_createdAtMeta,
          createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta));
    } else if (isInserting) {
      context.missing(_createdAtMeta);
    }
    if (data.containsKey('updated_at')) {
      context.handle(_updatedAtMeta,
          updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta));
    } else if (isInserting) {
      context.missing(_updatedAtMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  TaskData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return TaskData(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}id'])!,
      title: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}title'])!,
      description: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}description'])!,
      date: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}date'])!,
      startTime: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}start_time'])!,
      endTime: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}end_time'])!,
      actualStartTime: attachedDatabase.typeMapping.read(
          DriftSqlType.dateTime, data['${effectivePrefix}actual_start_time']),
      actualEndTime: attachedDatabase.typeMapping.read(
          DriftSqlType.dateTime, data['${effectivePrefix}actual_end_time']),
      priority: $TasksTable.$converterpriority.fromSql(attachedDatabase
          .typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}priority'])!),
      category: $TasksTable.$convertercategory.fromSql(attachedDatabase
          .typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}category'])!),
      status: $TasksTable.$converterstatus.fromSql(attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}status'])!),
      isRecurring: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}is_recurring'])!,
      recurrenceRule: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}recurrence_rule']),
      createdAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}created_at'])!,
      updatedAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}updated_at'])!,
    );
  }

  @override
  $TasksTable createAlias(String alias) {
    return $TasksTable(attachedDatabase, alias);
  }

  static JsonTypeConverter2<TaskPriority, int, int> $converterpriority =
      const EnumIndexConverter<TaskPriority>(TaskPriority.values);
  static JsonTypeConverter2<TaskCategory, int, int> $convertercategory =
      const EnumIndexConverter<TaskCategory>(TaskCategory.values);
  static JsonTypeConverter2<TaskStatus, int, int> $converterstatus =
      const EnumIndexConverter<TaskStatus>(TaskStatus.values);
}

class TaskData extends DataClass implements Insertable<TaskData> {
  final String id;
  final String title;
  final String description;
  final DateTime date;
  final DateTime startTime;
  final DateTime endTime;
  final DateTime? actualStartTime;
  final DateTime? actualEndTime;
  final TaskPriority priority;
  final TaskCategory category;
  final TaskStatus status;
  final bool isRecurring;
  final String? recurrenceRule;
  final DateTime createdAt;
  final DateTime updatedAt;
  const TaskData(
      {required this.id,
      required this.title,
      required this.description,
      required this.date,
      required this.startTime,
      required this.endTime,
      this.actualStartTime,
      this.actualEndTime,
      required this.priority,
      required this.category,
      required this.status,
      required this.isRecurring,
      this.recurrenceRule,
      required this.createdAt,
      required this.updatedAt});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['title'] = Variable<String>(title);
    map['description'] = Variable<String>(description);
    map['date'] = Variable<DateTime>(date);
    map['start_time'] = Variable<DateTime>(startTime);
    map['end_time'] = Variable<DateTime>(endTime);
    if (!nullToAbsent || actualStartTime != null) {
      map['actual_start_time'] = Variable<DateTime>(actualStartTime);
    }
    if (!nullToAbsent || actualEndTime != null) {
      map['actual_end_time'] = Variable<DateTime>(actualEndTime);
    }
    {
      final converter = $TasksTable.$converterpriority;
      map['priority'] = Variable<int>(converter.toSql(priority));
    }
    {
      final converter = $TasksTable.$convertercategory;
      map['category'] = Variable<int>(converter.toSql(category));
    }
    {
      final converter = $TasksTable.$converterstatus;
      map['status'] = Variable<int>(converter.toSql(status));
    }
    map['is_recurring'] = Variable<bool>(isRecurring);
    if (!nullToAbsent || recurrenceRule != null) {
      map['recurrence_rule'] = Variable<String>(recurrenceRule);
    }
    map['created_at'] = Variable<DateTime>(createdAt);
    map['updated_at'] = Variable<DateTime>(updatedAt);
    return map;
  }

  TasksCompanion toCompanion(bool nullToAbsent) {
    return TasksCompanion(
      id: Value(id),
      title: Value(title),
      description: Value(description),
      date: Value(date),
      startTime: Value(startTime),
      endTime: Value(endTime),
      actualStartTime: actualStartTime == null && nullToAbsent
          ? const Value.absent()
          : Value(actualStartTime),
      actualEndTime: actualEndTime == null && nullToAbsent
          ? const Value.absent()
          : Value(actualEndTime),
      priority: Value(priority),
      category: Value(category),
      status: Value(status),
      isRecurring: Value(isRecurring),
      recurrenceRule: recurrenceRule == null && nullToAbsent
          ? const Value.absent()
          : Value(recurrenceRule),
      createdAt: Value(createdAt),
      updatedAt: Value(updatedAt),
    );
  }

  factory TaskData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return TaskData(
      id: serializer.fromJson<String>(json['id']),
      title: serializer.fromJson<String>(json['title']),
      description: serializer.fromJson<String>(json['description']),
      date: serializer.fromJson<DateTime>(json['date']),
      startTime: serializer.fromJson<DateTime>(json['startTime']),
      endTime: serializer.fromJson<DateTime>(json['endTime']),
      actualStartTime: serializer.fromJson<DateTime?>(json['actualStartTime']),
      actualEndTime: serializer.fromJson<DateTime?>(json['actualEndTime']),
      priority: $TasksTable.$converterpriority
          .fromJson(serializer.fromJson<int>(json['priority'])),
      category: $TasksTable.$convertercategory
          .fromJson(serializer.fromJson<int>(json['category'])),
      status: $TasksTable.$converterstatus
          .fromJson(serializer.fromJson<int>(json['status'])),
      isRecurring: serializer.fromJson<bool>(json['isRecurring']),
      recurrenceRule: serializer.fromJson<String?>(json['recurrenceRule']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
      updatedAt: serializer.fromJson<DateTime>(json['updatedAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'title': serializer.toJson<String>(title),
      'description': serializer.toJson<String>(description),
      'date': serializer.toJson<DateTime>(date),
      'startTime': serializer.toJson<DateTime>(startTime),
      'endTime': serializer.toJson<DateTime>(endTime),
      'actualStartTime': serializer.toJson<DateTime?>(actualStartTime),
      'actualEndTime': serializer.toJson<DateTime?>(actualEndTime),
      'priority': serializer
          .toJson<int>($TasksTable.$converterpriority.toJson(priority)),
      'category': serializer
          .toJson<int>($TasksTable.$convertercategory.toJson(category)),
      'status':
          serializer.toJson<int>($TasksTable.$converterstatus.toJson(status)),
      'isRecurring': serializer.toJson<bool>(isRecurring),
      'recurrenceRule': serializer.toJson<String?>(recurrenceRule),
      'createdAt': serializer.toJson<DateTime>(createdAt),
      'updatedAt': serializer.toJson<DateTime>(updatedAt),
    };
  }

  TaskData copyWith(
          {String? id,
          String? title,
          String? description,
          DateTime? date,
          DateTime? startTime,
          DateTime? endTime,
          Value<DateTime?> actualStartTime = const Value.absent(),
          Value<DateTime?> actualEndTime = const Value.absent(),
          TaskPriority? priority,
          TaskCategory? category,
          TaskStatus? status,
          bool? isRecurring,
          Value<String?> recurrenceRule = const Value.absent(),
          DateTime? createdAt,
          DateTime? updatedAt}) =>
      TaskData(
        id: id ?? this.id,
        title: title ?? this.title,
        description: description ?? this.description,
        date: date ?? this.date,
        startTime: startTime ?? this.startTime,
        endTime: endTime ?? this.endTime,
        actualStartTime: actualStartTime.present
            ? actualStartTime.value
            : this.actualStartTime,
        actualEndTime:
            actualEndTime.present ? actualEndTime.value : this.actualEndTime,
        priority: priority ?? this.priority,
        category: category ?? this.category,
        status: status ?? this.status,
        isRecurring: isRecurring ?? this.isRecurring,
        recurrenceRule:
            recurrenceRule.present ? recurrenceRule.value : this.recurrenceRule,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
      );
  @override
  String toString() {
    return (StringBuffer('TaskData(')
          ..write('id: $id, ')
          ..write('title: $title, ')
          ..write('description: $description, ')
          ..write('date: $date, ')
          ..write('startTime: $startTime, ')
          ..write('endTime: $endTime, ')
          ..write('actualStartTime: $actualStartTime, ')
          ..write('actualEndTime: $actualEndTime, ')
          ..write('priority: $priority, ')
          ..write('category: $category, ')
          ..write('status: $status, ')
          ..write('isRecurring: $isRecurring, ')
          ..write('recurrenceRule: $recurrenceRule, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
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
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is TaskData &&
          other.id == this.id &&
          other.title == this.title &&
          other.description == this.description &&
          other.date == this.date &&
          other.startTime == this.startTime &&
          other.endTime == this.endTime &&
          other.actualStartTime == this.actualStartTime &&
          other.actualEndTime == this.actualEndTime &&
          other.priority == this.priority &&
          other.category == this.category &&
          other.status == this.status &&
          other.isRecurring == this.isRecurring &&
          other.recurrenceRule == this.recurrenceRule &&
          other.createdAt == this.createdAt &&
          other.updatedAt == this.updatedAt);
}

class TasksCompanion extends UpdateCompanion<TaskData> {
  final Value<String> id;
  final Value<String> title;
  final Value<String> description;
  final Value<DateTime> date;
  final Value<DateTime> startTime;
  final Value<DateTime> endTime;
  final Value<DateTime?> actualStartTime;
  final Value<DateTime?> actualEndTime;
  final Value<TaskPriority> priority;
  final Value<TaskCategory> category;
  final Value<TaskStatus> status;
  final Value<bool> isRecurring;
  final Value<String?> recurrenceRule;
  final Value<DateTime> createdAt;
  final Value<DateTime> updatedAt;
  final Value<int> rowid;
  const TasksCompanion({
    this.id = const Value.absent(),
    this.title = const Value.absent(),
    this.description = const Value.absent(),
    this.date = const Value.absent(),
    this.startTime = const Value.absent(),
    this.endTime = const Value.absent(),
    this.actualStartTime = const Value.absent(),
    this.actualEndTime = const Value.absent(),
    this.priority = const Value.absent(),
    this.category = const Value.absent(),
    this.status = const Value.absent(),
    this.isRecurring = const Value.absent(),
    this.recurrenceRule = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  TasksCompanion.insert({
    required String id,
    required String title,
    required String description,
    required DateTime date,
    required DateTime startTime,
    required DateTime endTime,
    this.actualStartTime = const Value.absent(),
    this.actualEndTime = const Value.absent(),
    required TaskPriority priority,
    required TaskCategory category,
    required TaskStatus status,
    this.isRecurring = const Value.absent(),
    this.recurrenceRule = const Value.absent(),
    required DateTime createdAt,
    required DateTime updatedAt,
    this.rowid = const Value.absent(),
  })  : id = Value(id),
        title = Value(title),
        description = Value(description),
        date = Value(date),
        startTime = Value(startTime),
        endTime = Value(endTime),
        priority = Value(priority),
        category = Value(category),
        status = Value(status),
        createdAt = Value(createdAt),
        updatedAt = Value(updatedAt);
  static Insertable<TaskData> custom({
    Expression<String>? id,
    Expression<String>? title,
    Expression<String>? description,
    Expression<DateTime>? date,
    Expression<DateTime>? startTime,
    Expression<DateTime>? endTime,
    Expression<DateTime>? actualStartTime,
    Expression<DateTime>? actualEndTime,
    Expression<int>? priority,
    Expression<int>? category,
    Expression<int>? status,
    Expression<bool>? isRecurring,
    Expression<String>? recurrenceRule,
    Expression<DateTime>? createdAt,
    Expression<DateTime>? updatedAt,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (title != null) 'title': title,
      if (description != null) 'description': description,
      if (date != null) 'date': date,
      if (startTime != null) 'start_time': startTime,
      if (endTime != null) 'end_time': endTime,
      if (actualStartTime != null) 'actual_start_time': actualStartTime,
      if (actualEndTime != null) 'actual_end_time': actualEndTime,
      if (priority != null) 'priority': priority,
      if (category != null) 'category': category,
      if (status != null) 'status': status,
      if (isRecurring != null) 'is_recurring': isRecurring,
      if (recurrenceRule != null) 'recurrence_rule': recurrenceRule,
      if (createdAt != null) 'created_at': createdAt,
      if (updatedAt != null) 'updated_at': updatedAt,
      if (rowid != null) 'rowid': rowid,
    });
  }

  TasksCompanion copyWith(
      {Value<String>? id,
      Value<String>? title,
      Value<String>? description,
      Value<DateTime>? date,
      Value<DateTime>? startTime,
      Value<DateTime>? endTime,
      Value<DateTime?>? actualStartTime,
      Value<DateTime?>? actualEndTime,
      Value<TaskPriority>? priority,
      Value<TaskCategory>? category,
      Value<TaskStatus>? status,
      Value<bool>? isRecurring,
      Value<String?>? recurrenceRule,
      Value<DateTime>? createdAt,
      Value<DateTime>? updatedAt,
      Value<int>? rowid}) {
    return TasksCompanion(
      id: id ?? this.id,
      title: title ?? this.title,
      description: description ?? this.description,
      date: date ?? this.date,
      startTime: startTime ?? this.startTime,
      endTime: endTime ?? this.endTime,
      actualStartTime: actualStartTime ?? this.actualStartTime,
      actualEndTime: actualEndTime ?? this.actualEndTime,
      priority: priority ?? this.priority,
      category: category ?? this.category,
      status: status ?? this.status,
      isRecurring: isRecurring ?? this.isRecurring,
      recurrenceRule: recurrenceRule ?? this.recurrenceRule,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (title.present) {
      map['title'] = Variable<String>(title.value);
    }
    if (description.present) {
      map['description'] = Variable<String>(description.value);
    }
    if (date.present) {
      map['date'] = Variable<DateTime>(date.value);
    }
    if (startTime.present) {
      map['start_time'] = Variable<DateTime>(startTime.value);
    }
    if (endTime.present) {
      map['end_time'] = Variable<DateTime>(endTime.value);
    }
    if (actualStartTime.present) {
      map['actual_start_time'] = Variable<DateTime>(actualStartTime.value);
    }
    if (actualEndTime.present) {
      map['actual_end_time'] = Variable<DateTime>(actualEndTime.value);
    }
    if (priority.present) {
      final converter = $TasksTable.$converterpriority;

      map['priority'] = Variable<int>(converter.toSql(priority.value));
    }
    if (category.present) {
      final converter = $TasksTable.$convertercategory;

      map['category'] = Variable<int>(converter.toSql(category.value));
    }
    if (status.present) {
      final converter = $TasksTable.$converterstatus;

      map['status'] = Variable<int>(converter.toSql(status.value));
    }
    if (isRecurring.present) {
      map['is_recurring'] = Variable<bool>(isRecurring.value);
    }
    if (recurrenceRule.present) {
      map['recurrence_rule'] = Variable<String>(recurrenceRule.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<DateTime>(updatedAt.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('TasksCompanion(')
          ..write('id: $id, ')
          ..write('title: $title, ')
          ..write('description: $description, ')
          ..write('date: $date, ')
          ..write('startTime: $startTime, ')
          ..write('endTime: $endTime, ')
          ..write('actualStartTime: $actualStartTime, ')
          ..write('actualEndTime: $actualEndTime, ')
          ..write('priority: $priority, ')
          ..write('category: $category, ')
          ..write('status: $status, ')
          ..write('isRecurring: $isRecurring, ')
          ..write('recurrenceRule: $recurrenceRule, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(e);
  late final $TasksTable tasks = $TasksTable(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [tasks];
}
