part of 'search_bloc.dart';
abstract class SearchEvent {
  const SearchEvent();

  List<Object> get props => [];
}

class QueryChanged extends SearchEvent {
  final String query;

  const QueryChanged({required this.query});

  @override
  List<Object> get props => [query];

  @override
  String toString() => 'QueryChanged { query: $query }';
}