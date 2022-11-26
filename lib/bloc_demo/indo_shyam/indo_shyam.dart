import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled/bloc_demo/indo_shyam/customer_reg_bloc/customer_reg_bloc.dart';

class CustomerRegistrationView extends StatelessWidget {
  final mobileController = TextEditingController();

  CustomerRegistrationView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CustomerRegBloc()..add(CustomerInitialEvent()),
      child: BlocConsumer<CustomerRegBloc, CustomerRegState>(
          builder: (BuildContext context, state) {
            if (state is CustomerRegLoaded) {
              return Scaffold(
                appBar: myAppBar(),
                body: Container(
                  height: double.maxFinite,
                  color: greenColor.withOpacity(0.1),
                  child: SingleChildScrollView(
                    padding: const EdgeInsets.only(left: 10, top: 10, right: 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          child: TextField(
                            cursorColor: Colors.white,
                            style: const TextStyle(
                              color: Colors.white,
                            ),
                            textAlignVertical: TextAlignVertical.center,
                            decoration: const InputDecoration().getTextFieldDeco("*******", 90, "Mobile"),
                          ),
                        ),
                        const SizedBox(height: 8),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          child: TextField(
                            cursorColor: Colors.white,
                            style: const TextStyle(
                              color: Colors.white,
                            ),
                            decoration: const InputDecoration().getTextFieldDeco("*******", 90, "Name"),
                          ),
                        ),
                        const SizedBox(height: 15),
                        InkWell(
                          onTap: () {
                            BlocProvider.of<CustomerRegBloc>(context).add(BillingAddressEvent());
                          },
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              SizedBox(
                                width: 10,
                                height: 15,
                                child: Checkbox(
                                  value: state.isBillingChecked,
                                  onChanged: (bool? value) {
                                    BlocProvider.of<CustomerRegBloc>(context).add(BillingAddressEvent());
                                  },
                                ),
                              ),
                              const SizedBox(width: 15),
                              const Text("Billing Address",
                                  style: TextStyle(
                                    color: Colors.red,
                                    fontSize: 18,
                                    fontWeight: FontWeight.w600,
                                  )),
                            ],
                          ),
                        ),
                        const SizedBox(height: 15),
                        InkWell(
                            child: addressTile(),
                            onTap: () {
                              BlocProvider.of<CustomerRegBloc>(context).add(CustomerHideBillingEvent());
                            }),
                        Visibility(
                          visible: !(state.showBillingAddFields ?? false),
                          child: billingAddressColum(state),
                        ),
                        const SizedBox(height: 15),
                        InkWell(
                          onTap: () => BlocProvider.of<CustomerRegBloc>(context).add(DeliveryAddressEvent()),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              SizedBox(
                                width: 10,
                                height: 15,
                                child: Checkbox(
                                  value: state.isDeliveryAddressChecked,
                                  onChanged: (bool? value) {
                                    BlocProvider.of<CustomerRegBloc>(context).add(DeliveryAddressEvent());
                                  },
                                ),
                              ),
                              const SizedBox(width: 15),
                              const Text("Delivery Address",
                                  style: TextStyle(
                                    color: Colors.red,
                                    fontSize: 18,
                                    fontWeight: FontWeight.w600,
                                  )),
                              const Text(" (Same as above)",
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 14,
                                  )),
                            ],
                          ),
                        ),
                        const SizedBox(height: 15),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          child: TextField(
                            cursorColor: Colors.white,
                            decoration: const InputDecoration().getTextFieldDeco("*******", 90, "Mobile"),
                          ),
                        ),
                        const SizedBox(height: 8),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          child: TextField(
                            cursorColor: Colors.white,
                            decoration: const InputDecoration().getTextFieldDeco("*******", 90, "Mobile"),
                          ),
                        ),
                        const SizedBox(height: 8),
                        InkWell(
                            child: addressTile(),
                            onTap: () {
                              BlocProvider.of<CustomerRegBloc>(context).add(CustomerHideDeliveryEvent());
                            }),
                        Visibility(
                          visible:! (state.showDeliveryAddFields ?? false),
                          child: deliveryAddressColumn(state),
                        ),
                        const SizedBox(height: 8),
                        gstBtn(),
                        const SizedBox(height: 8),
                        submitBtn(),
                        const SizedBox(height: 70),
                      ],
                    ),
                  ),
                ),
              );
            } else {
              return const SizedBox.shrink();
            }
          },
          listener: (BuildContext context, CustomerRegState? state) {}),
    );
  }

  myAppBar() => AppBar(
        backgroundColor: greenColor,
        title: const Text(
          "Customer Registration",
          style: TextStyle(
            color: Colors.white,
            fontSize: 17,
            fontWeight: FontWeight.bold,
          ),
        ),
      );

  Widget submitBtn() {
    return Container(
      width: double.maxFinite,
      height: 45,
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: ElevatedButton(
        onPressed: () {},
        style: ElevatedButton.styleFrom(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            backgroundColor: Colors.amberAccent.withOpacity(
              0.2,
            )),
        child: Text(
          "SUBMIT",
          style: TextStyle(
            color: greenColor,
          ),
        ),
      ),
    );
  }

  Widget gstBtn() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: TextField(
        cursorColor: Colors.white,
        decoration: InputDecoration(
          constraints: const BoxConstraints(minHeight: 45, maxHeight: 45),
          fillColor: Colors.red,
          hintText: "****",
          hintStyle: const TextStyle(color: Colors.white),
          prefixIconConstraints: const BoxConstraints(minWidth: 0, maxWidth: 100),
          prefixIcon: Container(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              alignment: Alignment.centerLeft,
              child: const Text("GSTN",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 17,
                  ))),
          filled: true,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
      ),
    );
  }

  Widget addressTile() {
    return Container(
      padding: const EdgeInsets.only(left: 20),
      margin: const EdgeInsets.symmetric(horizontal: 20),
      decoration: BoxDecoration(
        color: greenColor,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        children: const [
          Text(
            "Address",
            style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.w500, color: Colors.white),
          ),
          SizedBox(width: 20),
          Text(
            "*******",
            style: TextStyle(
              fontSize: 16.0,
              fontWeight: FontWeight.w500,
              color: Colors.white,
            ),
          ),
          Spacer(),
          Icon(
            Icons.arrow_drop_down_outlined,
            color: Colors.white,
            size: 50,
          ),
        ],
      ),
    );
  }

  Widget billingAddressColum(CustomerRegLoaded state) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        const SizedBox(height: 8),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: TextField(
            cursorColor: Colors.white,
            decoration: const InputDecoration().getTextFieldDeco("*******", 90, "Floor", isGreenAlpha: true),
          ),
        ),
        const SizedBox(height: 8),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: TextField(
            cursorColor: Colors.white,
            decoration: const InputDecoration().getTextFieldDeco("*******", 140, "Colony / State", isGreenAlpha: true),
          ),
        ),
        const SizedBox(height: 8),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: TextField(
            cursorColor: Colors.white,
            decoration: const InputDecoration().getTextFieldDeco("*******", 150, "Locality / Road", isGreenAlpha: true),
          ),
        ),
        const SizedBox(height: 8),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: TextField(
            cursorColor: Colors.white,
            decoration: const InputDecoration().getTextFieldDeco("*******", 90, "City", isGreenAlpha: true),
          ),
        ),
        const SizedBox(height: 9),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: TextField(
            cursorColor: Colors.white,
            decoration: const InputDecoration().getTextFieldDeco("*******", 90, "State", isGreenAlpha: true),
          ),
        ),
        const SizedBox(height: 8),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: TextField(
            cursorColor: Colors.white,
            decoration: const InputDecoration().getTextFieldDeco("*******", 90, "Email", isGreenAlpha: true),
          ),
        ),
      ],
    );
  }

  Widget deliveryAddressColumn(CustomerRegLoaded state) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        const SizedBox(height: 8),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: TextField(
            cursorColor: Colors.white,
            decoration: const InputDecoration().getTextFieldDeco("*******", 90, "Floor", isGreenAlpha: true),
          ),
        ),
        const SizedBox(height: 8),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: TextField(
            cursorColor: Colors.white,
            decoration: const InputDecoration().getTextFieldDeco("*******", 140, "Colony / State", isGreenAlpha: true),
          ),
        ),
        const SizedBox(height: 8),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: TextField(
            cursorColor: Colors.white,
            decoration: const InputDecoration().getTextFieldDeco("*******", 150, "Locality / Road", isGreenAlpha: true),
          ),
        ),
        const SizedBox(height: 8),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: TextField(
            cursorColor: Colors.white,
            decoration: const InputDecoration().getTextFieldDeco("*******", 90, "City", isGreenAlpha: true),
          ),
        ),
        const SizedBox(height: 8),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: TextField(
            cursorColor: Colors.white,
            decoration: const InputDecoration().getTextFieldDeco("*******", 90, "State", isGreenAlpha: true),
          ),
        ),
        const SizedBox(height: 8),
        Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 20,
          ),
          child: TextField(
            cursorColor: Colors.white,
            decoration: const InputDecoration().getTextFieldDeco("*******", 90, "Email", isGreenAlpha: true),
          ),
        ),
      ],
    );
  }
}

Color greenColor = const Color(0xff2B5745);

extension on InputDecoration {
  InputDecoration getTextFieldDeco(String hint, double maxWidth, String prefix, {bool? isGreenAlpha}) {
    return InputDecoration(
      fillColor: (isGreenAlpha ?? false) ? greenColor.withOpacity(0.4) : greenColor,
      hintText: hint,
      contentPadding: EdgeInsets.zero,
      constraints: const BoxConstraints(minHeight: 50, maxHeight: 50),
      hintStyle: const TextStyle(color: Colors.white),
      prefixIconConstraints: BoxConstraints(minWidth: 0, maxWidth: maxWidth),
      prefixIcon: Container(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          alignment: Alignment.centerLeft,
          child: Text(prefix,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 17,
              ))),
      filled: true,
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: BorderSide(
          color: (isGreenAlpha ?? false) ? greenColor.withOpacity(0.4) : greenColor,
        ),
      ),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: BorderSide(
          color: (isGreenAlpha ?? false) ? greenColor.withOpacity(0.4) : greenColor,
        ),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: BorderSide(
          color: (isGreenAlpha ?? false) ? greenColor.withOpacity(0.4) : greenColor,
        ),
      ),
    );
  }
}
