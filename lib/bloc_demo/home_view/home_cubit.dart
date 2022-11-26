import 'package:bloc/bloc.dart';
import 'package:http/src/response.dart';
import 'package:meta/meta.dart';
import 'package:untitled/bloc_demo/api/api.dart';
import 'package:untitled/bloc_demo/api/model/api_res.dart';
import 'package:untitled/bloc_demo/api/api.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  Api api = Api();

  HomeCubit() : super(HomeInitial());

  void  apiCall() async {
    emit(LoadingState());

    Response res = await api.getAlbum();
    if (res.statusCode == 200) {
      List<ApiResponse> list = apiResponseFromJson(res.body.toString());
      if (list.isEmpty) {
        emit(ListEmptyState());
      } else {
        emit(ListLoadedState(list: list));
      }
    } else {
      emit(ErrorState(res.body.toString()));
      emit(ListEmptyState());
    }
  }

  void updateTitle(String value, List<ApiResponse> list, int index) {
    list[index].title = value;
    emit(ListLoadedState(list: list));
  }

  void deleteItem(List<ApiResponse> list, int index) {
    list.removeAt(index);
    if (list.isNotEmpty) {
      emit(ListLoadedState(list: list));
    } else {
      emit(ListEmptyState());
    }
  }
}
