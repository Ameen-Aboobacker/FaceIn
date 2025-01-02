// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'failures.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$Failure {
  String get message => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String message) rekognition,
    required TResult Function(String message) firestore,
    required TResult Function(String message) network,
    required TResult Function(String message) firebaseAuth,
    required TResult Function(String message) verification,
    required TResult Function(String message) unexpected,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String message)? rekognition,
    TResult? Function(String message)? firestore,
    TResult? Function(String message)? network,
    TResult? Function(String message)? firebaseAuth,
    TResult? Function(String message)? verification,
    TResult? Function(String message)? unexpected,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String message)? rekognition,
    TResult Function(String message)? firestore,
    TResult Function(String message)? network,
    TResult Function(String message)? firebaseAuth,
    TResult Function(String message)? verification,
    TResult Function(String message)? unexpected,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(RekognitionFailure value) rekognition,
    required TResult Function(FirestoreFailure value) firestore,
    required TResult Function(NetworkFailure value) network,
    required TResult Function(FirebaseAuthFailure value) firebaseAuth,
    required TResult Function(VerificationFailure value) verification,
    required TResult Function(UnexpectedFailure value) unexpected,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(RekognitionFailure value)? rekognition,
    TResult? Function(FirestoreFailure value)? firestore,
    TResult? Function(NetworkFailure value)? network,
    TResult? Function(FirebaseAuthFailure value)? firebaseAuth,
    TResult? Function(VerificationFailure value)? verification,
    TResult? Function(UnexpectedFailure value)? unexpected,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(RekognitionFailure value)? rekognition,
    TResult Function(FirestoreFailure value)? firestore,
    TResult Function(NetworkFailure value)? network,
    TResult Function(FirebaseAuthFailure value)? firebaseAuth,
    TResult Function(VerificationFailure value)? verification,
    TResult Function(UnexpectedFailure value)? unexpected,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  /// Create a copy of Failure
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $FailureCopyWith<Failure> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FailureCopyWith<$Res> {
  factory $FailureCopyWith(Failure value, $Res Function(Failure) then) =
      _$FailureCopyWithImpl<$Res, Failure>;
  @useResult
  $Res call({String message});
}

/// @nodoc
class _$FailureCopyWithImpl<$Res, $Val extends Failure>
    implements $FailureCopyWith<$Res> {
  _$FailureCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Failure
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = null,
  }) {
    return _then(_value.copyWith(
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$RekognitionFailureImplCopyWith<$Res>
    implements $FailureCopyWith<$Res> {
  factory _$$RekognitionFailureImplCopyWith(_$RekognitionFailureImpl value,
          $Res Function(_$RekognitionFailureImpl) then) =
      __$$RekognitionFailureImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String message});
}

/// @nodoc
class __$$RekognitionFailureImplCopyWithImpl<$Res>
    extends _$FailureCopyWithImpl<$Res, _$RekognitionFailureImpl>
    implements _$$RekognitionFailureImplCopyWith<$Res> {
  __$$RekognitionFailureImplCopyWithImpl(_$RekognitionFailureImpl _value,
      $Res Function(_$RekognitionFailureImpl) _then)
      : super(_value, _then);

  /// Create a copy of Failure
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = null,
  }) {
    return _then(_$RekognitionFailureImpl(
      null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$RekognitionFailureImpl implements RekognitionFailure {
  const _$RekognitionFailureImpl(this.message);

  @override
  final String message;

  @override
  String toString() {
    return 'Failure.rekognition(message: $message)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RekognitionFailureImpl &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message);

  /// Create a copy of Failure
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$RekognitionFailureImplCopyWith<_$RekognitionFailureImpl> get copyWith =>
      __$$RekognitionFailureImplCopyWithImpl<_$RekognitionFailureImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String message) rekognition,
    required TResult Function(String message) firestore,
    required TResult Function(String message) network,
    required TResult Function(String message) firebaseAuth,
    required TResult Function(String message) verification,
    required TResult Function(String message) unexpected,
  }) {
    return rekognition(message);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String message)? rekognition,
    TResult? Function(String message)? firestore,
    TResult? Function(String message)? network,
    TResult? Function(String message)? firebaseAuth,
    TResult? Function(String message)? verification,
    TResult? Function(String message)? unexpected,
  }) {
    return rekognition?.call(message);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String message)? rekognition,
    TResult Function(String message)? firestore,
    TResult Function(String message)? network,
    TResult Function(String message)? firebaseAuth,
    TResult Function(String message)? verification,
    TResult Function(String message)? unexpected,
    required TResult orElse(),
  }) {
    if (rekognition != null) {
      return rekognition(message);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(RekognitionFailure value) rekognition,
    required TResult Function(FirestoreFailure value) firestore,
    required TResult Function(NetworkFailure value) network,
    required TResult Function(FirebaseAuthFailure value) firebaseAuth,
    required TResult Function(VerificationFailure value) verification,
    required TResult Function(UnexpectedFailure value) unexpected,
  }) {
    return rekognition(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(RekognitionFailure value)? rekognition,
    TResult? Function(FirestoreFailure value)? firestore,
    TResult? Function(NetworkFailure value)? network,
    TResult? Function(FirebaseAuthFailure value)? firebaseAuth,
    TResult? Function(VerificationFailure value)? verification,
    TResult? Function(UnexpectedFailure value)? unexpected,
  }) {
    return rekognition?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(RekognitionFailure value)? rekognition,
    TResult Function(FirestoreFailure value)? firestore,
    TResult Function(NetworkFailure value)? network,
    TResult Function(FirebaseAuthFailure value)? firebaseAuth,
    TResult Function(VerificationFailure value)? verification,
    TResult Function(UnexpectedFailure value)? unexpected,
    required TResult orElse(),
  }) {
    if (rekognition != null) {
      return rekognition(this);
    }
    return orElse();
  }
}

abstract class RekognitionFailure implements Failure {
  const factory RekognitionFailure(final String message) =
      _$RekognitionFailureImpl;

  @override
  String get message;

  /// Create a copy of Failure
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$RekognitionFailureImplCopyWith<_$RekognitionFailureImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$FirestoreFailureImplCopyWith<$Res>
    implements $FailureCopyWith<$Res> {
  factory _$$FirestoreFailureImplCopyWith(_$FirestoreFailureImpl value,
          $Res Function(_$FirestoreFailureImpl) then) =
      __$$FirestoreFailureImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String message});
}

/// @nodoc
class __$$FirestoreFailureImplCopyWithImpl<$Res>
    extends _$FailureCopyWithImpl<$Res, _$FirestoreFailureImpl>
    implements _$$FirestoreFailureImplCopyWith<$Res> {
  __$$FirestoreFailureImplCopyWithImpl(_$FirestoreFailureImpl _value,
      $Res Function(_$FirestoreFailureImpl) _then)
      : super(_value, _then);

  /// Create a copy of Failure
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = null,
  }) {
    return _then(_$FirestoreFailureImpl(
      null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$FirestoreFailureImpl implements FirestoreFailure {
  const _$FirestoreFailureImpl(this.message);

  @override
  final String message;

  @override
  String toString() {
    return 'Failure.firestore(message: $message)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FirestoreFailureImpl &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message);

  /// Create a copy of Failure
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$FirestoreFailureImplCopyWith<_$FirestoreFailureImpl> get copyWith =>
      __$$FirestoreFailureImplCopyWithImpl<_$FirestoreFailureImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String message) rekognition,
    required TResult Function(String message) firestore,
    required TResult Function(String message) network,
    required TResult Function(String message) firebaseAuth,
    required TResult Function(String message) verification,
    required TResult Function(String message) unexpected,
  }) {
    return firestore(message);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String message)? rekognition,
    TResult? Function(String message)? firestore,
    TResult? Function(String message)? network,
    TResult? Function(String message)? firebaseAuth,
    TResult? Function(String message)? verification,
    TResult? Function(String message)? unexpected,
  }) {
    return firestore?.call(message);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String message)? rekognition,
    TResult Function(String message)? firestore,
    TResult Function(String message)? network,
    TResult Function(String message)? firebaseAuth,
    TResult Function(String message)? verification,
    TResult Function(String message)? unexpected,
    required TResult orElse(),
  }) {
    if (firestore != null) {
      return firestore(message);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(RekognitionFailure value) rekognition,
    required TResult Function(FirestoreFailure value) firestore,
    required TResult Function(NetworkFailure value) network,
    required TResult Function(FirebaseAuthFailure value) firebaseAuth,
    required TResult Function(VerificationFailure value) verification,
    required TResult Function(UnexpectedFailure value) unexpected,
  }) {
    return firestore(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(RekognitionFailure value)? rekognition,
    TResult? Function(FirestoreFailure value)? firestore,
    TResult? Function(NetworkFailure value)? network,
    TResult? Function(FirebaseAuthFailure value)? firebaseAuth,
    TResult? Function(VerificationFailure value)? verification,
    TResult? Function(UnexpectedFailure value)? unexpected,
  }) {
    return firestore?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(RekognitionFailure value)? rekognition,
    TResult Function(FirestoreFailure value)? firestore,
    TResult Function(NetworkFailure value)? network,
    TResult Function(FirebaseAuthFailure value)? firebaseAuth,
    TResult Function(VerificationFailure value)? verification,
    TResult Function(UnexpectedFailure value)? unexpected,
    required TResult orElse(),
  }) {
    if (firestore != null) {
      return firestore(this);
    }
    return orElse();
  }
}

abstract class FirestoreFailure implements Failure {
  const factory FirestoreFailure(final String message) = _$FirestoreFailureImpl;

  @override
  String get message;

  /// Create a copy of Failure
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$FirestoreFailureImplCopyWith<_$FirestoreFailureImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$NetworkFailureImplCopyWith<$Res>
    implements $FailureCopyWith<$Res> {
  factory _$$NetworkFailureImplCopyWith(_$NetworkFailureImpl value,
          $Res Function(_$NetworkFailureImpl) then) =
      __$$NetworkFailureImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String message});
}

/// @nodoc
class __$$NetworkFailureImplCopyWithImpl<$Res>
    extends _$FailureCopyWithImpl<$Res, _$NetworkFailureImpl>
    implements _$$NetworkFailureImplCopyWith<$Res> {
  __$$NetworkFailureImplCopyWithImpl(
      _$NetworkFailureImpl _value, $Res Function(_$NetworkFailureImpl) _then)
      : super(_value, _then);

  /// Create a copy of Failure
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = null,
  }) {
    return _then(_$NetworkFailureImpl(
      null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$NetworkFailureImpl implements NetworkFailure {
  const _$NetworkFailureImpl(this.message);

  @override
  final String message;

  @override
  String toString() {
    return 'Failure.network(message: $message)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$NetworkFailureImpl &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message);

  /// Create a copy of Failure
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$NetworkFailureImplCopyWith<_$NetworkFailureImpl> get copyWith =>
      __$$NetworkFailureImplCopyWithImpl<_$NetworkFailureImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String message) rekognition,
    required TResult Function(String message) firestore,
    required TResult Function(String message) network,
    required TResult Function(String message) firebaseAuth,
    required TResult Function(String message) verification,
    required TResult Function(String message) unexpected,
  }) {
    return network(message);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String message)? rekognition,
    TResult? Function(String message)? firestore,
    TResult? Function(String message)? network,
    TResult? Function(String message)? firebaseAuth,
    TResult? Function(String message)? verification,
    TResult? Function(String message)? unexpected,
  }) {
    return network?.call(message);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String message)? rekognition,
    TResult Function(String message)? firestore,
    TResult Function(String message)? network,
    TResult Function(String message)? firebaseAuth,
    TResult Function(String message)? verification,
    TResult Function(String message)? unexpected,
    required TResult orElse(),
  }) {
    if (network != null) {
      return network(message);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(RekognitionFailure value) rekognition,
    required TResult Function(FirestoreFailure value) firestore,
    required TResult Function(NetworkFailure value) network,
    required TResult Function(FirebaseAuthFailure value) firebaseAuth,
    required TResult Function(VerificationFailure value) verification,
    required TResult Function(UnexpectedFailure value) unexpected,
  }) {
    return network(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(RekognitionFailure value)? rekognition,
    TResult? Function(FirestoreFailure value)? firestore,
    TResult? Function(NetworkFailure value)? network,
    TResult? Function(FirebaseAuthFailure value)? firebaseAuth,
    TResult? Function(VerificationFailure value)? verification,
    TResult? Function(UnexpectedFailure value)? unexpected,
  }) {
    return network?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(RekognitionFailure value)? rekognition,
    TResult Function(FirestoreFailure value)? firestore,
    TResult Function(NetworkFailure value)? network,
    TResult Function(FirebaseAuthFailure value)? firebaseAuth,
    TResult Function(VerificationFailure value)? verification,
    TResult Function(UnexpectedFailure value)? unexpected,
    required TResult orElse(),
  }) {
    if (network != null) {
      return network(this);
    }
    return orElse();
  }
}

abstract class NetworkFailure implements Failure {
  const factory NetworkFailure(final String message) = _$NetworkFailureImpl;

  @override
  String get message;

  /// Create a copy of Failure
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$NetworkFailureImplCopyWith<_$NetworkFailureImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$FirebaseAuthFailureImplCopyWith<$Res>
    implements $FailureCopyWith<$Res> {
  factory _$$FirebaseAuthFailureImplCopyWith(_$FirebaseAuthFailureImpl value,
          $Res Function(_$FirebaseAuthFailureImpl) then) =
      __$$FirebaseAuthFailureImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String message});
}

/// @nodoc
class __$$FirebaseAuthFailureImplCopyWithImpl<$Res>
    extends _$FailureCopyWithImpl<$Res, _$FirebaseAuthFailureImpl>
    implements _$$FirebaseAuthFailureImplCopyWith<$Res> {
  __$$FirebaseAuthFailureImplCopyWithImpl(_$FirebaseAuthFailureImpl _value,
      $Res Function(_$FirebaseAuthFailureImpl) _then)
      : super(_value, _then);

  /// Create a copy of Failure
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = null,
  }) {
    return _then(_$FirebaseAuthFailureImpl(
      null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$FirebaseAuthFailureImpl implements FirebaseAuthFailure {
  const _$FirebaseAuthFailureImpl(this.message);

  @override
  final String message;

  @override
  String toString() {
    return 'Failure.firebaseAuth(message: $message)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FirebaseAuthFailureImpl &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message);

  /// Create a copy of Failure
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$FirebaseAuthFailureImplCopyWith<_$FirebaseAuthFailureImpl> get copyWith =>
      __$$FirebaseAuthFailureImplCopyWithImpl<_$FirebaseAuthFailureImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String message) rekognition,
    required TResult Function(String message) firestore,
    required TResult Function(String message) network,
    required TResult Function(String message) firebaseAuth,
    required TResult Function(String message) verification,
    required TResult Function(String message) unexpected,
  }) {
    return firebaseAuth(message);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String message)? rekognition,
    TResult? Function(String message)? firestore,
    TResult? Function(String message)? network,
    TResult? Function(String message)? firebaseAuth,
    TResult? Function(String message)? verification,
    TResult? Function(String message)? unexpected,
  }) {
    return firebaseAuth?.call(message);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String message)? rekognition,
    TResult Function(String message)? firestore,
    TResult Function(String message)? network,
    TResult Function(String message)? firebaseAuth,
    TResult Function(String message)? verification,
    TResult Function(String message)? unexpected,
    required TResult orElse(),
  }) {
    if (firebaseAuth != null) {
      return firebaseAuth(message);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(RekognitionFailure value) rekognition,
    required TResult Function(FirestoreFailure value) firestore,
    required TResult Function(NetworkFailure value) network,
    required TResult Function(FirebaseAuthFailure value) firebaseAuth,
    required TResult Function(VerificationFailure value) verification,
    required TResult Function(UnexpectedFailure value) unexpected,
  }) {
    return firebaseAuth(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(RekognitionFailure value)? rekognition,
    TResult? Function(FirestoreFailure value)? firestore,
    TResult? Function(NetworkFailure value)? network,
    TResult? Function(FirebaseAuthFailure value)? firebaseAuth,
    TResult? Function(VerificationFailure value)? verification,
    TResult? Function(UnexpectedFailure value)? unexpected,
  }) {
    return firebaseAuth?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(RekognitionFailure value)? rekognition,
    TResult Function(FirestoreFailure value)? firestore,
    TResult Function(NetworkFailure value)? network,
    TResult Function(FirebaseAuthFailure value)? firebaseAuth,
    TResult Function(VerificationFailure value)? verification,
    TResult Function(UnexpectedFailure value)? unexpected,
    required TResult orElse(),
  }) {
    if (firebaseAuth != null) {
      return firebaseAuth(this);
    }
    return orElse();
  }
}

abstract class FirebaseAuthFailure implements Failure {
  const factory FirebaseAuthFailure(final String message) =
      _$FirebaseAuthFailureImpl;

  @override
  String get message;

  /// Create a copy of Failure
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$FirebaseAuthFailureImplCopyWith<_$FirebaseAuthFailureImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$VerificationFailureImplCopyWith<$Res>
    implements $FailureCopyWith<$Res> {
  factory _$$VerificationFailureImplCopyWith(_$VerificationFailureImpl value,
          $Res Function(_$VerificationFailureImpl) then) =
      __$$VerificationFailureImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String message});
}

/// @nodoc
class __$$VerificationFailureImplCopyWithImpl<$Res>
    extends _$FailureCopyWithImpl<$Res, _$VerificationFailureImpl>
    implements _$$VerificationFailureImplCopyWith<$Res> {
  __$$VerificationFailureImplCopyWithImpl(_$VerificationFailureImpl _value,
      $Res Function(_$VerificationFailureImpl) _then)
      : super(_value, _then);

  /// Create a copy of Failure
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = null,
  }) {
    return _then(_$VerificationFailureImpl(
      null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$VerificationFailureImpl implements VerificationFailure {
  const _$VerificationFailureImpl(this.message);

  @override
  final String message;

  @override
  String toString() {
    return 'Failure.verification(message: $message)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$VerificationFailureImpl &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message);

  /// Create a copy of Failure
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$VerificationFailureImplCopyWith<_$VerificationFailureImpl> get copyWith =>
      __$$VerificationFailureImplCopyWithImpl<_$VerificationFailureImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String message) rekognition,
    required TResult Function(String message) firestore,
    required TResult Function(String message) network,
    required TResult Function(String message) firebaseAuth,
    required TResult Function(String message) verification,
    required TResult Function(String message) unexpected,
  }) {
    return verification(message);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String message)? rekognition,
    TResult? Function(String message)? firestore,
    TResult? Function(String message)? network,
    TResult? Function(String message)? firebaseAuth,
    TResult? Function(String message)? verification,
    TResult? Function(String message)? unexpected,
  }) {
    return verification?.call(message);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String message)? rekognition,
    TResult Function(String message)? firestore,
    TResult Function(String message)? network,
    TResult Function(String message)? firebaseAuth,
    TResult Function(String message)? verification,
    TResult Function(String message)? unexpected,
    required TResult orElse(),
  }) {
    if (verification != null) {
      return verification(message);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(RekognitionFailure value) rekognition,
    required TResult Function(FirestoreFailure value) firestore,
    required TResult Function(NetworkFailure value) network,
    required TResult Function(FirebaseAuthFailure value) firebaseAuth,
    required TResult Function(VerificationFailure value) verification,
    required TResult Function(UnexpectedFailure value) unexpected,
  }) {
    return verification(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(RekognitionFailure value)? rekognition,
    TResult? Function(FirestoreFailure value)? firestore,
    TResult? Function(NetworkFailure value)? network,
    TResult? Function(FirebaseAuthFailure value)? firebaseAuth,
    TResult? Function(VerificationFailure value)? verification,
    TResult? Function(UnexpectedFailure value)? unexpected,
  }) {
    return verification?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(RekognitionFailure value)? rekognition,
    TResult Function(FirestoreFailure value)? firestore,
    TResult Function(NetworkFailure value)? network,
    TResult Function(FirebaseAuthFailure value)? firebaseAuth,
    TResult Function(VerificationFailure value)? verification,
    TResult Function(UnexpectedFailure value)? unexpected,
    required TResult orElse(),
  }) {
    if (verification != null) {
      return verification(this);
    }
    return orElse();
  }
}

abstract class VerificationFailure implements Failure {
  const factory VerificationFailure(final String message) =
      _$VerificationFailureImpl;

  @override
  String get message;

  /// Create a copy of Failure
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$VerificationFailureImplCopyWith<_$VerificationFailureImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$UnexpectedFailureImplCopyWith<$Res>
    implements $FailureCopyWith<$Res> {
  factory _$$UnexpectedFailureImplCopyWith(_$UnexpectedFailureImpl value,
          $Res Function(_$UnexpectedFailureImpl) then) =
      __$$UnexpectedFailureImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String message});
}

/// @nodoc
class __$$UnexpectedFailureImplCopyWithImpl<$Res>
    extends _$FailureCopyWithImpl<$Res, _$UnexpectedFailureImpl>
    implements _$$UnexpectedFailureImplCopyWith<$Res> {
  __$$UnexpectedFailureImplCopyWithImpl(_$UnexpectedFailureImpl _value,
      $Res Function(_$UnexpectedFailureImpl) _then)
      : super(_value, _then);

  /// Create a copy of Failure
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = null,
  }) {
    return _then(_$UnexpectedFailureImpl(
      null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$UnexpectedFailureImpl implements UnexpectedFailure {
  const _$UnexpectedFailureImpl(this.message);

  @override
  final String message;

  @override
  String toString() {
    return 'Failure.unexpected(message: $message)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UnexpectedFailureImpl &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message);

  /// Create a copy of Failure
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$UnexpectedFailureImplCopyWith<_$UnexpectedFailureImpl> get copyWith =>
      __$$UnexpectedFailureImplCopyWithImpl<_$UnexpectedFailureImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String message) rekognition,
    required TResult Function(String message) firestore,
    required TResult Function(String message) network,
    required TResult Function(String message) firebaseAuth,
    required TResult Function(String message) verification,
    required TResult Function(String message) unexpected,
  }) {
    return unexpected(message);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String message)? rekognition,
    TResult? Function(String message)? firestore,
    TResult? Function(String message)? network,
    TResult? Function(String message)? firebaseAuth,
    TResult? Function(String message)? verification,
    TResult? Function(String message)? unexpected,
  }) {
    return unexpected?.call(message);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String message)? rekognition,
    TResult Function(String message)? firestore,
    TResult Function(String message)? network,
    TResult Function(String message)? firebaseAuth,
    TResult Function(String message)? verification,
    TResult Function(String message)? unexpected,
    required TResult orElse(),
  }) {
    if (unexpected != null) {
      return unexpected(message);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(RekognitionFailure value) rekognition,
    required TResult Function(FirestoreFailure value) firestore,
    required TResult Function(NetworkFailure value) network,
    required TResult Function(FirebaseAuthFailure value) firebaseAuth,
    required TResult Function(VerificationFailure value) verification,
    required TResult Function(UnexpectedFailure value) unexpected,
  }) {
    return unexpected(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(RekognitionFailure value)? rekognition,
    TResult? Function(FirestoreFailure value)? firestore,
    TResult? Function(NetworkFailure value)? network,
    TResult? Function(FirebaseAuthFailure value)? firebaseAuth,
    TResult? Function(VerificationFailure value)? verification,
    TResult? Function(UnexpectedFailure value)? unexpected,
  }) {
    return unexpected?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(RekognitionFailure value)? rekognition,
    TResult Function(FirestoreFailure value)? firestore,
    TResult Function(NetworkFailure value)? network,
    TResult Function(FirebaseAuthFailure value)? firebaseAuth,
    TResult Function(VerificationFailure value)? verification,
    TResult Function(UnexpectedFailure value)? unexpected,
    required TResult orElse(),
  }) {
    if (unexpected != null) {
      return unexpected(this);
    }
    return orElse();
  }
}

abstract class UnexpectedFailure implements Failure {
  const factory UnexpectedFailure(final String message) =
      _$UnexpectedFailureImpl;

  @override
  String get message;

  /// Create a copy of Failure
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$UnexpectedFailureImplCopyWith<_$UnexpectedFailureImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
