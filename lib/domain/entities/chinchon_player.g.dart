// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'chinchon_player.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetChinchonPlayerCollection on Isar {
  IsarCollection<ChinchonPlayer> get chinchonPlayers => this.collection();
}

const ChinchonPlayerSchema = CollectionSchema(
  name: r'ChinchonPlayer',
  id: -9135302877481937986,
  properties: {
    r'currentScore': PropertySchema(
      id: 0,
      name: r'currentScore',
      type: IsarType.long,
    ),
    r'isPlayerAbove100': PropertySchema(
      id: 1,
      name: r'isPlayerAbove100',
      type: IsarType.bool,
    ),
    r'isPlayerAbove50': PropertySchema(
      id: 2,
      name: r'isPlayerAbove50',
      type: IsarType.bool,
    ),
    r'name': PropertySchema(
      id: 3,
      name: r'name',
      type: IsarType.string,
    ),
    r'scoreHistory': PropertySchema(
      id: 4,
      name: r'scoreHistory',
      type: IsarType.longList,
    )
  },
  estimateSize: _chinchonPlayerEstimateSize,
  serialize: _chinchonPlayerSerialize,
  deserialize: _chinchonPlayerDeserialize,
  deserializeProp: _chinchonPlayerDeserializeProp,
  idName: r'id',
  indexes: {},
  links: {},
  embeddedSchemas: {},
  getId: _chinchonPlayerGetId,
  getLinks: _chinchonPlayerGetLinks,
  attach: _chinchonPlayerAttach,
  version: '3.1.0+1',
);

int _chinchonPlayerEstimateSize(
  ChinchonPlayer object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  bytesCount += 3 + object.name.length * 3;
  bytesCount += 3 + object.scoreHistory.length * 8;
  return bytesCount;
}

void _chinchonPlayerSerialize(
  ChinchonPlayer object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeLong(offsets[0], object.currentScore);
  writer.writeBool(offsets[1], object.isPlayerAbove100);
  writer.writeBool(offsets[2], object.isPlayerAbove50);
  writer.writeString(offsets[3], object.name);
  writer.writeLongList(offsets[4], object.scoreHistory);
}

ChinchonPlayer _chinchonPlayerDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = ChinchonPlayer(
    currentScore: reader.readLongOrNull(offsets[0]) ?? 0,
    name: reader.readStringOrNull(offsets[3]) ?? 'player',
    scoreHistory: reader.readLongList(offsets[4]) ?? const [],
  );
  object.id = id;
  return object;
}

P _chinchonPlayerDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readLongOrNull(offset) ?? 0) as P;
    case 1:
      return (reader.readBool(offset)) as P;
    case 2:
      return (reader.readBool(offset)) as P;
    case 3:
      return (reader.readStringOrNull(offset) ?? 'player') as P;
    case 4:
      return (reader.readLongList(offset) ?? const []) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _chinchonPlayerGetId(ChinchonPlayer object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _chinchonPlayerGetLinks(ChinchonPlayer object) {
  return [];
}

void _chinchonPlayerAttach(
    IsarCollection<dynamic> col, Id id, ChinchonPlayer object) {
  object.id = id;
}

extension ChinchonPlayerQueryWhereSort
    on QueryBuilder<ChinchonPlayer, ChinchonPlayer, QWhere> {
  QueryBuilder<ChinchonPlayer, ChinchonPlayer, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension ChinchonPlayerQueryWhere
    on QueryBuilder<ChinchonPlayer, ChinchonPlayer, QWhereClause> {
  QueryBuilder<ChinchonPlayer, ChinchonPlayer, QAfterWhereClause> idEqualTo(
      Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<ChinchonPlayer, ChinchonPlayer, QAfterWhereClause> idNotEqualTo(
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

  QueryBuilder<ChinchonPlayer, ChinchonPlayer, QAfterWhereClause> idGreaterThan(
      Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<ChinchonPlayer, ChinchonPlayer, QAfterWhereClause> idLessThan(
      Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<ChinchonPlayer, ChinchonPlayer, QAfterWhereClause> idBetween(
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

extension ChinchonPlayerQueryFilter
    on QueryBuilder<ChinchonPlayer, ChinchonPlayer, QFilterCondition> {
  QueryBuilder<ChinchonPlayer, ChinchonPlayer, QAfterFilterCondition>
      currentScoreEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'currentScore',
        value: value,
      ));
    });
  }

  QueryBuilder<ChinchonPlayer, ChinchonPlayer, QAfterFilterCondition>
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

  QueryBuilder<ChinchonPlayer, ChinchonPlayer, QAfterFilterCondition>
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

  QueryBuilder<ChinchonPlayer, ChinchonPlayer, QAfterFilterCondition>
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

  QueryBuilder<ChinchonPlayer, ChinchonPlayer, QAfterFilterCondition> idEqualTo(
      Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<ChinchonPlayer, ChinchonPlayer, QAfterFilterCondition>
      idGreaterThan(
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

  QueryBuilder<ChinchonPlayer, ChinchonPlayer, QAfterFilterCondition>
      idLessThan(
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

  QueryBuilder<ChinchonPlayer, ChinchonPlayer, QAfterFilterCondition> idBetween(
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

  QueryBuilder<ChinchonPlayer, ChinchonPlayer, QAfterFilterCondition>
      isPlayerAbove100EqualTo(bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'isPlayerAbove100',
        value: value,
      ));
    });
  }

  QueryBuilder<ChinchonPlayer, ChinchonPlayer, QAfterFilterCondition>
      isPlayerAbove50EqualTo(bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'isPlayerAbove50',
        value: value,
      ));
    });
  }

  QueryBuilder<ChinchonPlayer, ChinchonPlayer, QAfterFilterCondition>
      nameEqualTo(
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

  QueryBuilder<ChinchonPlayer, ChinchonPlayer, QAfterFilterCondition>
      nameGreaterThan(
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

  QueryBuilder<ChinchonPlayer, ChinchonPlayer, QAfterFilterCondition>
      nameLessThan(
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

  QueryBuilder<ChinchonPlayer, ChinchonPlayer, QAfterFilterCondition>
      nameBetween(
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

  QueryBuilder<ChinchonPlayer, ChinchonPlayer, QAfterFilterCondition>
      nameStartsWith(
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

  QueryBuilder<ChinchonPlayer, ChinchonPlayer, QAfterFilterCondition>
      nameEndsWith(
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

  QueryBuilder<ChinchonPlayer, ChinchonPlayer, QAfterFilterCondition>
      nameContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ChinchonPlayer, ChinchonPlayer, QAfterFilterCondition>
      nameMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'name',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ChinchonPlayer, ChinchonPlayer, QAfterFilterCondition>
      nameIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'name',
        value: '',
      ));
    });
  }

  QueryBuilder<ChinchonPlayer, ChinchonPlayer, QAfterFilterCondition>
      nameIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'name',
        value: '',
      ));
    });
  }

  QueryBuilder<ChinchonPlayer, ChinchonPlayer, QAfterFilterCondition>
      scoreHistoryElementEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'scoreHistory',
        value: value,
      ));
    });
  }

  QueryBuilder<ChinchonPlayer, ChinchonPlayer, QAfterFilterCondition>
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

  QueryBuilder<ChinchonPlayer, ChinchonPlayer, QAfterFilterCondition>
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

  QueryBuilder<ChinchonPlayer, ChinchonPlayer, QAfterFilterCondition>
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

  QueryBuilder<ChinchonPlayer, ChinchonPlayer, QAfterFilterCondition>
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

  QueryBuilder<ChinchonPlayer, ChinchonPlayer, QAfterFilterCondition>
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

  QueryBuilder<ChinchonPlayer, ChinchonPlayer, QAfterFilterCondition>
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

  QueryBuilder<ChinchonPlayer, ChinchonPlayer, QAfterFilterCondition>
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

  QueryBuilder<ChinchonPlayer, ChinchonPlayer, QAfterFilterCondition>
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

  QueryBuilder<ChinchonPlayer, ChinchonPlayer, QAfterFilterCondition>
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

extension ChinchonPlayerQueryObject
    on QueryBuilder<ChinchonPlayer, ChinchonPlayer, QFilterCondition> {}

extension ChinchonPlayerQueryLinks
    on QueryBuilder<ChinchonPlayer, ChinchonPlayer, QFilterCondition> {}

extension ChinchonPlayerQuerySortBy
    on QueryBuilder<ChinchonPlayer, ChinchonPlayer, QSortBy> {
  QueryBuilder<ChinchonPlayer, ChinchonPlayer, QAfterSortBy>
      sortByCurrentScore() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'currentScore', Sort.asc);
    });
  }

  QueryBuilder<ChinchonPlayer, ChinchonPlayer, QAfterSortBy>
      sortByCurrentScoreDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'currentScore', Sort.desc);
    });
  }

  QueryBuilder<ChinchonPlayer, ChinchonPlayer, QAfterSortBy>
      sortByIsPlayerAbove100() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isPlayerAbove100', Sort.asc);
    });
  }

  QueryBuilder<ChinchonPlayer, ChinchonPlayer, QAfterSortBy>
      sortByIsPlayerAbove100Desc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isPlayerAbove100', Sort.desc);
    });
  }

  QueryBuilder<ChinchonPlayer, ChinchonPlayer, QAfterSortBy>
      sortByIsPlayerAbove50() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isPlayerAbove50', Sort.asc);
    });
  }

  QueryBuilder<ChinchonPlayer, ChinchonPlayer, QAfterSortBy>
      sortByIsPlayerAbove50Desc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isPlayerAbove50', Sort.desc);
    });
  }

  QueryBuilder<ChinchonPlayer, ChinchonPlayer, QAfterSortBy> sortByName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.asc);
    });
  }

  QueryBuilder<ChinchonPlayer, ChinchonPlayer, QAfterSortBy> sortByNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.desc);
    });
  }
}

extension ChinchonPlayerQuerySortThenBy
    on QueryBuilder<ChinchonPlayer, ChinchonPlayer, QSortThenBy> {
  QueryBuilder<ChinchonPlayer, ChinchonPlayer, QAfterSortBy>
      thenByCurrentScore() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'currentScore', Sort.asc);
    });
  }

  QueryBuilder<ChinchonPlayer, ChinchonPlayer, QAfterSortBy>
      thenByCurrentScoreDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'currentScore', Sort.desc);
    });
  }

  QueryBuilder<ChinchonPlayer, ChinchonPlayer, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<ChinchonPlayer, ChinchonPlayer, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<ChinchonPlayer, ChinchonPlayer, QAfterSortBy>
      thenByIsPlayerAbove100() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isPlayerAbove100', Sort.asc);
    });
  }

  QueryBuilder<ChinchonPlayer, ChinchonPlayer, QAfterSortBy>
      thenByIsPlayerAbove100Desc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isPlayerAbove100', Sort.desc);
    });
  }

  QueryBuilder<ChinchonPlayer, ChinchonPlayer, QAfterSortBy>
      thenByIsPlayerAbove50() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isPlayerAbove50', Sort.asc);
    });
  }

  QueryBuilder<ChinchonPlayer, ChinchonPlayer, QAfterSortBy>
      thenByIsPlayerAbove50Desc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isPlayerAbove50', Sort.desc);
    });
  }

  QueryBuilder<ChinchonPlayer, ChinchonPlayer, QAfterSortBy> thenByName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.asc);
    });
  }

  QueryBuilder<ChinchonPlayer, ChinchonPlayer, QAfterSortBy> thenByNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.desc);
    });
  }
}

extension ChinchonPlayerQueryWhereDistinct
    on QueryBuilder<ChinchonPlayer, ChinchonPlayer, QDistinct> {
  QueryBuilder<ChinchonPlayer, ChinchonPlayer, QDistinct>
      distinctByCurrentScore() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'currentScore');
    });
  }

  QueryBuilder<ChinchonPlayer, ChinchonPlayer, QDistinct>
      distinctByIsPlayerAbove100() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'isPlayerAbove100');
    });
  }

  QueryBuilder<ChinchonPlayer, ChinchonPlayer, QDistinct>
      distinctByIsPlayerAbove50() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'isPlayerAbove50');
    });
  }

  QueryBuilder<ChinchonPlayer, ChinchonPlayer, QDistinct> distinctByName(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'name', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<ChinchonPlayer, ChinchonPlayer, QDistinct>
      distinctByScoreHistory() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'scoreHistory');
    });
  }
}

extension ChinchonPlayerQueryProperty
    on QueryBuilder<ChinchonPlayer, ChinchonPlayer, QQueryProperty> {
  QueryBuilder<ChinchonPlayer, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<ChinchonPlayer, int, QQueryOperations> currentScoreProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'currentScore');
    });
  }

  QueryBuilder<ChinchonPlayer, bool, QQueryOperations>
      isPlayerAbove100Property() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'isPlayerAbove100');
    });
  }

  QueryBuilder<ChinchonPlayer, bool, QQueryOperations>
      isPlayerAbove50Property() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'isPlayerAbove50');
    });
  }

  QueryBuilder<ChinchonPlayer, String, QQueryOperations> nameProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'name');
    });
  }

  QueryBuilder<ChinchonPlayer, List<int>, QQueryOperations>
      scoreHistoryProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'scoreHistory');
    });
  }
}
