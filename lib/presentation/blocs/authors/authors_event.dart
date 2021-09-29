import 'package:equatable/equatable.dart';

class AuthorsEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class GetAllAuthorsEvent extends AuthorsEvent {}

class GetQuotesByAuthorEvent extends AuthorsEvent {

  final String authorSlug;
  GetQuotesByAuthorEvent({this.authorSlug});

  @override
  List<Object> get props => [authorSlug];

}