part of 'image_bloc.dart';

abstract class ImageState extends Equatable {
  const ImageState();

  @override
  List<Object> get props => [];
  List<Object> get props2 => [];
}

class ImageInitial extends ImageState {}

class ImageSelectedSuccessState extends ImageState {
  final XFile pickedFile;

  const ImageSelectedSuccessState(this.pickedFile);

  @override
  List<Object> get props => [pickedFile];
}

class ImageSelectedSuccessState2 extends ImageState {
  final XFile pickedFile2;

  const ImageSelectedSuccessState2(this.pickedFile2);

  @override
  List<Object> get props2 => [pickedFile2];
}

class ImageSelectedErrorState extends ImageState {
  final String message;

  const ImageSelectedErrorState(this.message);

  @override
  List<Object> get props => [message];
  List<Object> get props2 => [message];
}
