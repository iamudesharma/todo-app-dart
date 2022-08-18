import 'dart:ffi';
import 'dart:indexed_db';

import 'package:serverpod/serverpod.dart';
import 'package:todo_app_server/src/generated/protocol.dart';

// This is an example endpoint of your server. It's best practice to use the
// `Endpoint` ending of the class name, but it will be removed when accessing
// the endpoint from the client. I.e., this endpoint can be accessed through
// `client.example` on the client side.

// After adding or modifying an endpoint, you will need to run
// `serverpod generate` to update the server and client code.
class TodoEndpoint extends Endpoint {
  // You create methods in your endpoint which are accessible from the client by
  // creating a public method with `Session` as its first parameter. Supported
  // parameter types are `bool`, `int`, `double`, `String`, `DateTime`, and any
  // objects that are generated from your `protocol` directory. The methods
  // should return a typed future; the same types as for the parameters are
  // supported. The `session` object provides access to the database, logging,
  // passwords, and information about the request being made to the server.
  // Future<List<Todo>> getAllTodo(Session session,) async {

  //   final  todo= await Todo().

  // }
  Future<List<Todo>> getAllTodo(
    Session session,
  ) async {
    final todo = await Todo.find(session, orderDescending: true);
    return todo;
  }

  Future<void> addTodo(Session session, Todo todo) async {
    await Todo.insert(session, todo);
  }

  Future<void> updateTodo(Session session, Todo todo) async {
    await Todo.update(
      session,
      todo,
    );
  }

  Future<void> deleteTodo(Session session, id) async {
    await Todo.delete(
      session,
      where: (t) => t.id.equals(id),
    );
  }
}
