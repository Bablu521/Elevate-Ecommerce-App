part of 'track_order_view_model_cubit.dart';

class TrackOrderViewModelState extends Equatable {
  const TrackOrderViewModelState({this.orderFromFireBase});
  final BaseState<OrderFirestoreEntity>? orderFromFireBase;
  TrackOrderViewModelState copyWith({
    BaseState<OrderFirestoreEntity>? orderEntity,
  }) {
    return TrackOrderViewModelState(
      orderFromFireBase: orderEntity ?? orderFromFireBase,
    );
  }

  @override
  List<Object?> get props => [orderFromFireBase];
}
