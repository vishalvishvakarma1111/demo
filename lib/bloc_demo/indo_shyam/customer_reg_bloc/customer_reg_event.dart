part of 'customer_reg_bloc.dart';

@immutable
abstract class CustomerRegEvent {}

class CustomerInitialEvent extends CustomerRegEvent {}
class BillingAddressEvent extends CustomerRegEvent {}
class DeliveryAddressEvent extends CustomerRegEvent {}
class CustomerLoadingEvent extends CustomerRegEvent {}
class CustomerHideBillingEvent extends CustomerRegEvent {}
class CustomerHideDeliveryEvent extends CustomerRegEvent {}
