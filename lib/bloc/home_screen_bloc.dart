import 'package:app_007_learn_bloc_api/home_screen/model/post.dart';
import 'package:app_007_learn_bloc_api/home_screen/repository/post_repository.dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'home_screen_event.dart';
part 'home_screen_state.dart';

class HomeScreenBloc extends Bloc<HomeScreenEvent, HomeScreenState> {
  final PostRepository _repository;
  HomeScreenBloc(this._repository) : super(HomeScreenInitial()) {
    on<FetchPosts>((event, emit) async {
      try {
        emit(HomeScreenLoading());
        List<Post> data = await _repository.fetchPosts();
        emit(HomeScreenLoaded(posts: data));
      } catch (e) {
        emit(HomeScreenError(message: "something went wrong"));
      }
    });
  }
}
