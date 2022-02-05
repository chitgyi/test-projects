abstract class DatabaseExcetpion implements Exception {
  final String message;
  DatabaseExcetpion([this.message = "Database Error"]);

  @override
  String toString() {
    return message;
  }
}

class InsertException extends DatabaseExcetpion {
  InsertException([String message = 'Unable to create']) : super(message);
}

class ReadException extends DatabaseExcetpion {
  ReadException([String message = "Unable to read"]) : super(message);
}

class UpdateException extends DatabaseExcetpion {
  UpdateException([String message = 'Unable to update']) : super(message);
}

class DeleteException extends DatabaseExcetpion {
  DeleteException([String message = 'Unable to delete']) : super(message);
}
