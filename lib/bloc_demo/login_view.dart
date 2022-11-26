import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled/bloc_demo/home_view/home_view.dart';
import 'package:untitled/bloc_demo/login_bloc_cubit.dart';

class BlocLoginView extends StatelessWidget {
  BlocLoginView({Key? key}) : super(key: key);

  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LoginBlocCubit(),
      child: BlocConsumer<LoginBlocCubit, LoginBlocState>(
        builder: (BuildContext context, state) {
          return Scaffold(
            appBar: AppBar(
              title: Text("Login"),
            ),
            body: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  const SizedBox(height: 120),
                  TextField(
                    controller: emailController,
                    decoration: InputDecoration(
                        hintText: "enter login email",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        )),
                  ),
                  const SizedBox(height: 20),
                  TextField(
                    controller: passwordController,
                    decoration: InputDecoration(
                        hintText: "enter login email",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        )),
                  ),
                  const SizedBox(height: 20),
                  state is LoadingState
                      ? const Center(
                          child: CircularProgressIndicator(),
                        )
                      : MaterialButton(
                          onPressed: () {
                            BlocProvider.of<LoginBlocCubit>(context)
                                .validate(emailController.text.trim(), passwordController.text.trim());
                          },
                          minWidth: 250,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(40),
                          ),
                          color: Colors.blue,
                          child: const Text(
                            "Login",
                            style: TextStyle(color: Colors.white),
                          ),
                        )
                ],
              ),
            ),
          );
        },
        listener: (BuildContext context, LoginBlocState? state) {
          if (state is ErrorState) {
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              content: Text(state.msg, style: TextStyle()),
            ));
          }
          if (state is RoutScreen) {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (BuildContext context) => const HomeView()),
            );
          }
        },
      ),
    );
  }
}
