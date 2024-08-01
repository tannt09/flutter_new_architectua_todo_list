import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

class GraphQLConfig {
  static HttpLink httpLink = HttpLink('https://your-graphql-endpoint.com/graphql');

  static ValueNotifier<GraphQLClient> initClient() {
    ValueNotifier<GraphQLClient> client = ValueNotifier(
      GraphQLClient(link: httpLink, cache: GraphQLCache(store: InMemoryStore()))
    );
    return client;
  }
}