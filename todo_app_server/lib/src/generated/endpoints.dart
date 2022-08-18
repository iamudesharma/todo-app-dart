/* AUTOMATICALLY GENERATED CODE DO NOT MODIFY */
/*   To generate run: "serverpod generate"    */

// ignore_for_file: public_member_api_docs
// ignore_for_file: unnecessary_import
// ignore_for_file: unused_import

import 'dart:typed_data' as typed_data;
import 'package:serverpod/serverpod.dart';

import 'package:serverpod_auth_server/module.dart' as serverpod_auth;

import 'protocol.dart';

import '../endpoints/example_endpoint.dart';
import '../endpoints/todo_endpoint.dart';

class Endpoints extends EndpointDispatch {
  @override
  void initializeEndpoints(Server server) {
    var endpoints = <String, Endpoint>{
      'example': ExampleEndpoint()..initialize(server, 'example', null),
      'todo': TodoEndpoint()..initialize(server, 'todo', null),
    };

    connectors['example'] = EndpointConnector(
      name: 'example',
      endpoint: endpoints['example']!,
      methodConnectors: {
        'hello': MethodConnector(
          name: 'hello',
          params: {
            'name': ParameterDescription(
                name: 'name', type: String, nullable: false),
          },
          call: (Session session, Map<String, dynamic> params) async {
            return (endpoints['example'] as ExampleEndpoint).hello(
              session,
              params['name'],
            );
          },
        ),
      },
    );

    connectors['todo'] = EndpointConnector(
      name: 'todo',
      endpoint: endpoints['todo']!,
      methodConnectors: {
        'getAllTodo': MethodConnector(
          name: 'getAllTodo',
          params: {},
          call: (Session session, Map<String, dynamic> params) async {
            return (endpoints['todo'] as TodoEndpoint).getAllTodo(
              session,
            );
          },
        ),
        'addTodo': MethodConnector(
          name: 'addTodo',
          params: {
            'todo':
                ParameterDescription(name: 'todo', type: Todo, nullable: false),
          },
          call: (Session session, Map<String, dynamic> params) async {
            return (endpoints['todo'] as TodoEndpoint).addTodo(
              session,
              params['todo'],
            );
          },
        ),
        'updateTodo': MethodConnector(
          name: 'updateTodo',
          params: {
            'todo':
                ParameterDescription(name: 'todo', type: Todo, nullable: false),
          },
          call: (Session session, Map<String, dynamic> params) async {
            return (endpoints['todo'] as TodoEndpoint).updateTodo(
              session,
              params['todo'],
            );
          },
        ),
        'deleteTodo': MethodConnector(
          name: 'deleteTodo',
          params: {
            'id': ParameterDescription(
                name: 'id', type: dynamic, nullable: false),
          },
          call: (Session session, Map<String, dynamic> params) async {
            return (endpoints['todo'] as TodoEndpoint).deleteTodo(
              session,
              params['id'],
            );
          },
        ),
      },
    );

    modules['serverpod_auth'] = serverpod_auth.Endpoints()
      ..initializeEndpoints(server);
  }

  @override
  void registerModules(Serverpod pod) {
    pod.registerModule(serverpod_auth.Protocol(), 'auth');
  }
}
