// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'quotes_table.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class QuotesTableAdapter extends TypeAdapter<QuotesTable> {
  @override
  final int typeId = 0;

  @override
  QuotesTable read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return QuotesTable(
      tags: (fields[0] as List)?.cast<String>(),
      id: fields[1] as String,
      author: fields[2] as String,
      content: fields[3] as String,
    );
  }

  @override
  void write(BinaryWriter writer, QuotesTable obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.tags)
      ..writeByte(1)
      ..write(obj.id)
      ..writeByte(2)
      ..write(obj.author)
      ..writeByte(3)
      ..write(obj.content);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is QuotesTableAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
