part of 'internet_connection_bloc.dart';abstract class InternetConnectionState extends Equatable {  const InternetConnectionState();}class InternetConnectionInitial extends InternetConnectionState {  @override  List<Object> get props => [];}class InternetConnected extends InternetConnectionState {  @override  List<Object> get props => [];}class InternetDisconnected extends InternetConnectionState {  @override  List<Object> get props => [];}class InternetConnectionError extends InternetConnectionState{  final String? message;  const InternetConnectionError(this.message);  @override  List<Object?> get props => [];}