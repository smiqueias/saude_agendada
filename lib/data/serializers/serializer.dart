abstract interface class Serializer<T extends Object, S> {
  T from(S json);
  S to(T object);
}
