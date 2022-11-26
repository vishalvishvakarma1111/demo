import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled/bloc_demo/api/model/api_res.dart';
import 'package:untitled/bloc_demo/edit_title/edit_title.dart';
import 'package:untitled/bloc_demo/home_view/home_cubit.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Home view "),
      ),
      body: BlocProvider(
        create: (context) => HomeCubit()..apiCall(),
        child: BlocConsumer<HomeCubit, HomeState>(
          builder: (BuildContext context, HomeState state) {
            return state is LoadingState
                ? const Center(
                    child: CircularProgressIndicator(),
                  )
                : state is ListLoadedState
                    ? ListView.builder(
                        itemCount: state.list.length,
                        itemBuilder: (BuildContext context, int index) {
                          ApiResponse item = state.list[index];
                          return ListTile(
                            minVerticalPadding: 5,
                            trailing: IconButton(
                              onPressed: () {
                                BlocProvider.of<HomeCubit>(context).deleteItem(state.list, index);


                                /*  Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (BuildContext context) => EditTitle(),
                                      settings: RouteSettings(arguments: item.title)),
                                ).then((value) {
                                  if (value != null) {
                                    BlocProvider.of<HomeCubit>(context).updateTitle(value, state.list, index);
                                  }
                                });*/
                              },
                              icon: Icon(
                                Icons.delete,
                              ),
                            ),
                            title: Text("$index  ${item.title}",
                                style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20,
                                )),
                          );
                        },
                      )
                    : state is ListEmptyState
                        ? const Center(
                            child: Text("No Item found"),
                          )
                        : Container();
          },
          listener: (BuildContext context, HomeState state) {
            if (state is ErrorState) {
              Util.showError(context, state.msg);
            }
          },
        ),
      ),
    );
  }
}

class Util {
  static showError(BuildContext context, String msg) {
    ScaffoldMessenger.of(context).removeCurrentSnackBar();
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text(msg, style: TextStyle()),
    ));
  }
}
