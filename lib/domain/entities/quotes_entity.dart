import 'package:equatable/equatable.dart';

class QuotesEntity extends Equatable {

  final List<String> tags;

  final String id;

  final String author;

  final String content;

  QuotesEntity({this.tags, this.id, this.author, this.content});

  @override
  // TODO: implement props
  List<Object> get props => [id, author];

}