// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'mosca_player.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetMoscaPlayerCollection on Isar {
  IsarCollection<MoscaPlayer> get moscaPlayers => this.collection();
}

const MoscaPlayerSchema = CollectionSchema(
  name: r'MoscaPlayer',
  id: 4051441015628257400,
  properties: {
    r'currentScore': PropertySchema(
      id: 0,
      name: r'currentScore',
      type: IsarType.long,
    ),
    r'name': PropertySchema(
      id: 1,
      name: r'name',
      type: IsarType.string,
    ),
    r'scoreHistory': PropertySchema(
      id: 2,
      name: r'scoreHistory',
      type: IsarType.longList,
    )
  },
  estimateSize: _moscaPlayerEstimateSize,
  serialize: _moscaPlayerSerialize,
  deserialize: _moscaPlayerDeserialize,
  deserializeProp: _moscaPlayerDeserializeProp,
  idName: r'id',
  indexes: {},
  links: {},
  embeddedSchemas: {},
  getId: _moscaPlayerGetId,
  getLinks: _moscaPlayerGetLinks,
  attach: _moscaPlayerAttach,
  version: '3.1.0+1',
);

int _moscaPlayerEstimateSize(
  MoscaPlayer object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  bytesCount += 3 + object.name.length * 3;
  bytesCount += 3 + object.scoreHistory.length * 8;
  return bytesCount;
}

void _moscaPlayerSerialize(
  MoscaPlayer object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeLong(offsets[0], object.currentScore);
  writer.writeString(offsets[1], object.name);
  writer.writeLongList(offsets[2], object.scoreHistory);
}

MoscaPlayer _moscaPlayerDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = MoscaPlayer(
    currentScore: reader.readLongOrNull(offsets[0]) ?? 15,
    name: reader.readStringOrNull(offsets[1]) ?? 'player',
    scoreHistory: reader.readLongList(offsets[2]) ?? const [],
  );
  object.id = id;
  return object;
}

P _moscaPlayerDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readLongOrNull(offset) ?? 15) as P;
    case 1:
      return (reader.readStringOrNull(offset) ?? 'player') as P;
    case 2:
      return (reader.readLongList(offset) ?? const []) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _moscaPlayerGetId(MoscaPlayer object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _moscaPlayerGetLinks(MoscaPlayer object) {
  return [];
}

void _moscaPlayerAttach(
    IsarCollection<dynamic> col, Id id, MoscaPlayer object) {
  object.id = id;
}

extension MoscaPlayerQueryWhereSort
    on QueryBuilder<MoscaPlayer, MoscaPlayer, QWhere> {
  QueryBuilder<MoscaPlayer, MoscaPlayer, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension MoscaPlayerQueryWhere
    on QueryBuilder<MoscaPlayer, MoscaPlayer, QWhereClause> {
  QueryBuilder<MoscaPlayer, MoscaPlayer, QAfterWhereClause> idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<MoscaPlayer, MoscaPlayer, QAfterWhereClause> idNotEqualTo(
      Id id) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(
              IdWhereClause.lessThan(upper: id, includeUpper: false),
            )
            .addWhereClause(
              IdWhereClause.greaterThan(lower: id, includeLower: false),
            );
      } else {
        return query
            .addWhereClause(
              IdWhereClause.greaterThan(lower: id, includeLower: false),
            )
            .addWhereClause(
              IdWhereClause.lessThan(upper: id, includeUpper: false),
            );
      }
    });
  }

  QueryBuilder<MoscaPlayer, MoscaPlayer, QAfterWhereClause> idGreaterThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<MoscaPlayer, MoscaPlayer, QAfterWhereClause> idLessThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<MoscaPlayer, MoscaPlayer, QAfterWhereClause> idBetween(
    Id lowerId,
    Id upperId, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: lowerId,
        includeLower: includeLower,
        upper: upperId,
        includeUpper: includeUpper,
      ));
    });
  }
}

extension MoscaPlayerQueryFilter
    on QueryBuilder<MoscaPlayer, MoscaPlayer, QFilterCondition> {
  QueryBuilder<MoscaPlayer, MoscaPlayer, QAfterFilterCondition>
      currentScoreEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'currentScore',
        value: value,
      ));
    });
  }

  QueryBuilder<MoscaPlayer, MoscaPlayer, QAfterFilterCondition>
      currentScoreGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'currentScore',
        value: value,
      ));
    });
  }

  QueryBuilder<MoscaPlayer, MoscaPlayer, QAfterFilterCondition>
      currentScoreLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'currentScore',
        value: value,
      ));
    });
  }

  QueryBuilder<MoscaPlayer, MoscaPlayer, QAfterFilterCondition>
      currentScoreBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'currentScore',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<MoscaPlayer, MoscaPlayer, QAfterFilterCondition> idEqualTo(
      Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<MoscaPlayer, MoscaPlayer, QAfterFilterCondition> idGreaterThan(
    Id value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<MoscaPlayer, MoscaPlayer, QAfterFilterCondition> idLessThan(
    Id value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<MoscaPlayer, MoscaPlayer, QAfterFilterCondition> idBetween(
    Id lower,
    Id upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'id',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<MoscaPlayer, MoscaPlayer, QAfterFilterCondition> nameEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MoscaPlayer, MoscaPlayer, QAfterFilterCondition> nameGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MoscaPlayer, MoscaPlayer, QAfterFilterCondition> nameLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MoscaPlayer, MoscaPlayer, QAfterFilterCondition> nameBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'name',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MoscaPlayer, MoscaPlayer, QAfterFilterCondition> nameStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MoscaPlayer, MoscaPlayer, QAfterFilterCondition> nameEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MoscaPlayer, MoscaPlayer, QAfterFilterCondition> nameContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MoscaPlayer, MoscaPlayer, QAfterFilterCondition> nameMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'name',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MoscaPlayer, MoscaPlayer, QAfterFilterCondition> nameIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'name',
        value: '',
      ));
    });
  }

  QueryBuilder<MoscaPlayer, MoscaPlayer, QAfterFilterCondition>
      nameIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'name',
        value: '',
      ));
    });
  }

  QueryBuilder<MoscaPlayer, MoscaPlayer, QAfterFilterCondition>
      scoreHistoryElementEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'scoreHistory',
        value: value,
      ));
    });
  }

  QueryBuilder<MoscaPlayer, MoscaPlayer, QAfterFilterCondition>
      scoreHistoryElementGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'scoreHistory',
        value: value,
      ));
    });
  }

  QueryBuilder<MoscaPlayer, MoscaPlayer, QAfterFilterCondition>
      scoreHistoryElementLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'scoreHistory',
        value: value,
      ));
    });
  }

  QueryBuilder<MoscaPlayer, MoscaPlayer, QAfterFilterCondition>
      scoreHistoryElementBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'scoreHistory',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<MoscaPlayer, MoscaPlayer, QAfterFilterCondition>
      scoreHistoryLengthEqualTo(int length) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'scoreHistory',
        length,
        true,
        length,
        true,
      );
    });
  }

  QueryBuilder<MoscaPlayer, MoscaPlayer, QAfterFilterCondition>
      scoreHistoryIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'scoreHistory',
        0,
        true,
        0,
        true,
      );
    });
  }

  QueryBuilder<MoscaPlayer, MoscaPlayer, QAfterFilterCondition>
      scoreHistoryIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'scoreHistory',
        0,
        false,
        999999,
        true,
      );
    });
  }

  QueryBuilder<MoscaPlayer, MoscaPlayer, QAfterFilterCondition>
      scoreHistoryLengthLessThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'scoreHistory',
        0,
        true,
        length,
        include,
      );
    });
  }

  QueryBuilder<MoscaPlayer, MoscaPlayer, QAfterFilterCondition>
      scoreHistoryLengthGreaterThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'scoreHistory',
        length,
        include,
        999999,
        true,
      );
    });
  }

  QueryBuilder<MoscaPlayer, MoscaPlayer, QAfterFilterCondition>
      scoreHistoryLengthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'scoreHistory',
        lower,
        includeLower,
        upper,
        includeUpper,
      );
    });
  }
}

extension MoscaPlayerQueryObject
    on QueryBuilder<MoscaPlayer, MoscaPlayer, QFilterCondition> {}

extension MoscaPlayerQueryLinks
    on QueryBuilder<MoscaPlayer, MoscaPlayer, QFilterCondition> {}

extension MoscaPlayerQuerySortBy
    on QueryBuilder<MoscaPlayer, MoscaPlayer, QSortBy> {
  QueryBuilder<MoscaPlayer, MoscaPlayer, QAfterSortBy> sortByCurrentScore() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'currentScore', Sort.asc);
    });
  }

  QueryBuilder<MoscaPlayer, MoscaPlayer, QAfterSortBy>
      sortByCurrentScoreDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'currentScore', Sort.desc);
    });
  }

  QueryBuilder<MoscaPlayer, MoscaPlayer, QAfterSortBy> sortByName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.asc);
    });
  }

  QueryBuilder<MoscaPlayer, MoscaPlayer, QAfterSortBy> sortByNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.desc);
    });
  }
}

extension MoscaPlayerQuerySortThenBy
    on QueryBuilder<MoscaPlayer, MoscaPlayer, QSortThenBy> {
  QueryBuilder<MoscaPlayer, MoscaPlayer, QAfterSortBy> thenByCurrentScore() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'currentScore', Sort.asc);
    });
  }

  QueryBuilder<MoscaPlayer, MoscaPlayer, QAfterSortBy>
      thenByCurrentScoreDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'currentScore', Sort.desc);
    });
  }

  QueryBuilder<MoscaPlayer, MoscaPlayer, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<MoscaPlayer, MoscaPlayer, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<MoscaPlayer, MoscaPlayer, QAfterSortBy> thenByName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.asc);
    });
  }

  QueryBuilder<MoscaPlayer, MoscaPlayer, QAfterSortBy> thenByNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.desc);
    });
  }
}

extension MoscaPlayerQueryWhereDistinct
    on QueryBuilder<MoscaPlayer, MoscaPlayer, QDistinct> {
  QueryBuilder<MoscaPlayer, MoscaPlayer, QDistinct> distinctByCurrentScore() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'currentScore');
    });
  }

  QueryBuilder<MoscaPlayer, MoscaPlayer, QDistinct> distinctByName(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'name', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<MoscaPlayer, MoscaPlayer, QDistinct> distinctByScoreHistory() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'scoreHistory');
    });
  }
}

extension MoscaPlayerQueryProperty
    on QueryBuilder<MoscaPlayer, MoscaPlayer, QQueryProperty> {
  QueryBuilder<MoscaPlayer, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<MoscaPlayer, int, QQueryOperations> currentScoreProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'currentScore');
    });
  }

  QueryBuilder<MoscaPlayer, String, QQueryOperations> nameProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'name');
    });
  }

  QueryBuilder<MoscaPlayer, List<int>, QQueryOperations>
      scoreHistoryProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'scoreHistory');
    });
  }
}
