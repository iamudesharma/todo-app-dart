/* AUTOMATICALLY GENERATED CODE DO NOT MODIFY */
/*   To generate run: "serverpod generate"    */

// ignore_for_file: public_member_api_docs
// ignore_for_file: unused_import

import 'dart:io';
import 'dart:typed_data' as typed_data;
import 'package:serverpod_client/serverpod_client.dart';
import 'protocol.dart';

import 'package:serverpod_auth_client/module.dart' as serverpod_auth;

class _EndpointExample extends EndpointRef {
  @override
  String get name => 'example';

  _EndpointExample(EndpointCaller caller) : super(caller);

  Future<String> hello(
    String name,
  ) async {
    return await caller.callServerEndpoint('example', 'hello', 'String', {
      'name': name,
    });
  }
}

class _EndpointTodo extends EndpointRef {
  @override
  String get name => 'todo';

  _EndpointTodo(EndpointCaller caller) : super(caller);

  Future<List<Todo>> getAllTodo() async {
    return await caller
        .callServerEndpoint('todo', 'getAllTodo', 'List<Todo>', {});
  }

  Future<void> addTodo(
    Todo todo,
  ) async {
    return await caller.callServerEndpoint('todo', 'addTodo', 'void', {
      'todo': todo,
    });
  }

  Future<void> updateTodo(
    Todo todo,
  ) async {
    return await caller.callServerEndpoint('todo', 'updateTodo', 'void', {
      'todo': todo,
    });
  }

  Future<void> deleteTodo(
    dynamic id,
  ) async {
    return await caller.callServerEndpoint('todo', 'deleteTodo', 'void', {
      'id': id,
    });
  }
}

class _Modules {
  late final serverpod_auth.Caller auth;

  _Modules(Client client) {
    auth = serverpod_auth.Caller(client);
  }
}

class Client extends ServerpodClient {
  late final _EndpointExample example;
  late final _EndpointTodo todo;
  late final _Modules modules;

  Client(String host,
      {SecurityContext? context,
      ServerpodClientErrorCallback? errorHandler,
      AuthenticationKeyManager? authenticationKeyManager})
      : super(host, Protocol.instance,
            context: context,
            errorHandler: errorHandler,
            authenticationKeyManager: authenticationKeyManager) {
    example = _EndpointExample(this);
    todo = _EndpointTodo(this);

    modules = _Modules(this);
    registerModuleProtocol(serverpod_auth.Protocol());
  }

  @override
  Map<String, EndpointRef> get endpointRefLookup => {
        'example': example,
        'todo': todo,
      };

  @override
  Map<String, ModuleEndpointCaller> get moduleLookup => {
        'auth': modules.auth,
      };
}
