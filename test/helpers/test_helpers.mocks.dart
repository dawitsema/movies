// Mocks generated by Mockito 5.4.4 from annotations
// in movies/test/helpers/test_helpers.dart.
// Do not manually edit this file.

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i4;

import 'package:dartz/dartz.dart' as _i2;
import 'package:mockito/annotations.dart' as _i7;
import 'package:mockito/mockito.dart' as _i1;
import 'package:movies/core/errors/failure.dart' as _i5;
import 'package:movies/domain/entities/movie.dart' as _i6;
import 'package:movies/domain/repositories/movie_repository.dart' as _i3;

// ignore_for_file: type=lint
// ignore_for_file: avoid_redundant_argument_values
// ignore_for_file: avoid_setters_without_getters
// ignore_for_file: comment_references
// ignore_for_file: deprecated_member_use
// ignore_for_file: deprecated_member_use_from_same_package
// ignore_for_file: implementation_imports
// ignore_for_file: invalid_use_of_visible_for_testing_member
// ignore_for_file: prefer_const_constructors
// ignore_for_file: unnecessary_parenthesis
// ignore_for_file: camel_case_types
// ignore_for_file: subtype_of_sealed_class

class _FakeEither_0<L, R> extends _i1.SmartFake implements _i2.Either<L, R> {
  _FakeEither_0(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

/// A class which mocks [MovieRepository].
///
/// See the documentation for Mockito's code generation for more information.
class MockMovieRepository extends _i1.Mock implements _i3.MovieRepository {
  MockMovieRepository() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i4.Future<_i2.Either<_i5.Failure, List<_i6.Movie>>> getTrendingMovies() =>
      (super.noSuchMethod(
        Invocation.method(
          #getTrendingMovies,
          [],
        ),
        returnValue: _i4.Future<_i2.Either<_i5.Failure, List<_i6.Movie>>>.value(
            _FakeEither_0<_i5.Failure, List<_i6.Movie>>(
          this,
          Invocation.method(
            #getTrendingMovies,
            [],
          ),
        )),
      ) as _i4.Future<_i2.Either<_i5.Failure, List<_i6.Movie>>>);

  @override
  _i4.Future<_i2.Either<_i5.Failure, List<_i6.Movie>>> getPopularMovies() =>
      (super.noSuchMethod(
        Invocation.method(
          #getPopularMovies,
          [],
        ),
        returnValue: _i4.Future<_i2.Either<_i5.Failure, List<_i6.Movie>>>.value(
            _FakeEither_0<_i5.Failure, List<_i6.Movie>>(
          this,
          Invocation.method(
            #getPopularMovies,
            [],
          ),
        )),
      ) as _i4.Future<_i2.Either<_i5.Failure, List<_i6.Movie>>>);

  @override
  _i4.Future<_i2.Either<_i5.Failure, List<_i6.Movie>>> searchMovies(
          String? query) =>
      (super.noSuchMethod(
        Invocation.method(
          #searchMovies,
          [query],
        ),
        returnValue: _i4.Future<_i2.Either<_i5.Failure, List<_i6.Movie>>>.value(
            _FakeEither_0<_i5.Failure, List<_i6.Movie>>(
          this,
          Invocation.method(
            #searchMovies,
            [query],
          ),
        )),
      ) as _i4.Future<_i2.Either<_i5.Failure, List<_i6.Movie>>>);
}

/// A class which mocks [MockSpec].
///
/// See the documentation for Mockito's code generation for more information.
class MockMockSpec<T> extends _i1.Mock implements _i7.MockSpec<T> {
  MockMockSpec() {
    _i1.throwOnMissingStub(this);
  }

  @override
  List<Type> get mixins => (super.noSuchMethod(
        Invocation.getter(#mixins),
        returnValue: <Type>[],
      ) as List<Type>);

  @override
  Set<Symbol> get unsupportedMembers => (super.noSuchMethod(
        Invocation.getter(#unsupportedMembers),
        returnValue: <Symbol>{},
      ) as Set<Symbol>);

  @override
  Map<Symbol, Function> get fallbackGenerators => (super.noSuchMethod(
        Invocation.getter(#fallbackGenerators),
        returnValue: <Symbol, Function>{},
      ) as Map<Symbol, Function>);
}
