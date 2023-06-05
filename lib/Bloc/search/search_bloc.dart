
// import 'package:bloc/bloc.dart';

// part 'search_state.dart';
// part 'search_event.dart';
// class SearchBloc extends Bloc<SearchEvent, SearchState> {
//   final ProductRepository _productRepository;

//   SearchBloc({required ProductRepository productRepository})
//       : _productRepository = productRepository,
//         super(SearchInitial());

//   @override
//   Stream<SearchState> mapEventToState(SearchEvent event) async* {
//     if (event is QueryChanged) {
//       yield SearchLoading();
//       try {
//         final products = await _productRepository.searchProductsByName(event.query);
//         yield SearchSuccess(products: products);
//       } catch (_) {
//         yield SearchFailure();
//       }
//     }
//   }
// }