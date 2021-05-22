// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'database.dart';

// **************************************************************************
// FloorGenerator
// **************************************************************************

class $FloorAppDatabase {
  /// Creates a database builder for a persistent database.
  /// Once a database is built, you should keep a reference to it and re-use it.
  static _$AppDatabaseBuilder databaseBuilder(String name) =>
      _$AppDatabaseBuilder(name);

  /// Creates a database builder for an in memory database.
  /// Information stored in an in memory database disappears when the process is killed.
  /// Once a database is built, you should keep a reference to it and re-use it.
  static _$AppDatabaseBuilder inMemoryDatabaseBuilder() =>
      _$AppDatabaseBuilder(null);
}

class _$AppDatabaseBuilder {
  _$AppDatabaseBuilder(this.name);

  final String? name;

  final List<Migration> _migrations = [];

  Callback? _callback;

  /// Adds migrations to the builder.
  _$AppDatabaseBuilder addMigrations(List<Migration> migrations) {
    _migrations.addAll(migrations);
    return this;
  }

  /// Adds a database [Callback] to the builder.
  _$AppDatabaseBuilder addCallback(Callback callback) {
    _callback = callback;
    return this;
  }

  /// Creates the database and initializes it.
  Future<AppDatabase> build() async {
    final path = name != null
        ? await sqfliteDatabaseFactory.getDatabasePath(name!)
        : ':memory:';
    final database = _$AppDatabase();
    database.database = await database.open(
      path,
      _migrations,
      _callback,
    );
    return database;
  }
}

class _$AppDatabase extends AppDatabase {
  _$AppDatabase([StreamController<String>? listener]) {
    changeListener = listener ?? StreamController<String>.broadcast();
  }

  BookModelDao? _bookModelDaoInstance;

  JournalModelDao? _journalModelDaoInstance;

  Future<sqflite.Database> open(String path, List<Migration> migrations,
      [Callback? callback]) async {
    final databaseOptions = sqflite.OpenDatabaseOptions(
      version: 1,
      onConfigure: (database) async {
        await database.execute('PRAGMA foreign_keys = ON');
      },
      onOpen: (database) async {
        await callback?.onOpen?.call(database);
      },
      onUpgrade: (database, startVersion, endVersion) async {
        await MigrationAdapter.runMigrations(
            database, startVersion, endVersion, migrations);

        await callback?.onUpgrade?.call(database, startVersion, endVersion);
      },
      onCreate: (database, version) async {
        await database.execute(
            'CREATE TABLE IF NOT EXISTS `BookModel` (`id` INTEGER NOT NULL, `typeId` INTEGER NOT NULL, `numberOfPages` INTEGER NOT NULL, `isbn` TEXT NOT NULL, `title` TEXT NOT NULL, `subject` TEXT NOT NULL, `publisher` TEXT NOT NULL, `language` TEXT NOT NULL, `publishDate` TEXT NOT NULL, `type` TEXT NOT NULL, `status` TEXT NOT NULL, `bookType` TEXT NOT NULL, `authors` TEXT NOT NULL, PRIMARY KEY (`id`))');
        await database.execute(
            'CREATE TABLE IF NOT EXISTS `JournalModel` (`id` INTEGER NOT NULL, `typeId` INTEGER NOT NULL, `isbn` TEXT NOT NULL, `title` TEXT NOT NULL, `subject` TEXT NOT NULL, `publisher` TEXT NOT NULL, `language` TEXT NOT NULL, `publishDate` TEXT NOT NULL, `type` TEXT NOT NULL, `status` TEXT NOT NULL, `volume` TEXT NOT NULL, `issue` TEXT NOT NULL, PRIMARY KEY (`id`))');

        await callback?.onCreate?.call(database, version);
      },
    );
    return sqfliteDatabaseFactory.openDatabase(path, options: databaseOptions);
  }

  @override
  BookModelDao get bookModelDao {
    return _bookModelDaoInstance ??= _$BookModelDao(database, changeListener);
  }

  @override
  JournalModelDao get journalModelDao {
    return _journalModelDaoInstance ??=
        _$JournalModelDao(database, changeListener);
  }
}

class _$BookModelDao extends BookModelDao {
  _$BookModelDao(this.database, this.changeListener)
      : _queryAdapter = QueryAdapter(database);

  final sqflite.DatabaseExecutor database;

  final StreamController<String> changeListener;

  final QueryAdapter _queryAdapter;

  @override
  Future<List<BookModel>> searchByPubDate(String publishDate) async {
    return _queryAdapter.queryList(
        'SELECT * FROM BookModel WHERE publishDate = ?1',
        mapper: (Map<String, Object?> row) => BookModel(
            id: row['id'] as int,
            typeId: row['typeId'] as int,
            numberOfPages: row['numberOfPages'] as int,
            isbn: row['isbn'] as String,
            title: row['title'] as String,
            subject: row['subject'] as String,
            publisher: row['publisher'] as String,
            language: row['language'] as String,
            publishDate: row['publishDate'] as String,
            type: row['type'] as String,
            status: row['status'] as String,
            bookType: row['bookType'] as String,
            authors: row['authors'] as String),
        arguments: [publishDate]);
  }

  @override
  Future<List<BookModel>> searchBySubject(String subject) async {
    return _queryAdapter.queryList(
        'SELECT * FROM BookModel WHERE subject LIKE ?1',
        mapper: (Map<String, Object?> row) => BookModel(
            id: row['id'] as int,
            typeId: row['typeId'] as int,
            numberOfPages: row['numberOfPages'] as int,
            isbn: row['isbn'] as String,
            title: row['title'] as String,
            subject: row['subject'] as String,
            publisher: row['publisher'] as String,
            language: row['language'] as String,
            publishDate: row['publishDate'] as String,
            type: row['type'] as String,
            status: row['status'] as String,
            bookType: row['bookType'] as String,
            authors: row['authors'] as String),
        arguments: [subject]);
  }

  @override
  Future<List<BookModel>> searchByTitle(String title) async {
    return _queryAdapter.queryList(
        'SELECT * FROM BookModel WHERE title LIKE ?1',
        mapper: (Map<String, Object?> row) => BookModel(
            id: row['id'] as int,
            typeId: row['typeId'] as int,
            numberOfPages: row['numberOfPages'] as int,
            isbn: row['isbn'] as String,
            title: row['title'] as String,
            subject: row['subject'] as String,
            publisher: row['publisher'] as String,
            language: row['language'] as String,
            publishDate: row['publishDate'] as String,
            type: row['type'] as String,
            status: row['status'] as String,
            bookType: row['bookType'] as String,
            authors: row['authors'] as String),
        arguments: [title]);
  }

  @override
  Future<List<BookModel>> searchByType(String type) async {
    return _queryAdapter.queryList('SELECT * FROM BookModel WHERE type = ?1',
        mapper: (Map<String, Object?> row) => BookModel(
            id: row['id'] as int,
            typeId: row['typeId'] as int,
            numberOfPages: row['numberOfPages'] as int,
            isbn: row['isbn'] as String,
            title: row['title'] as String,
            subject: row['subject'] as String,
            publisher: row['publisher'] as String,
            language: row['language'] as String,
            publishDate: row['publishDate'] as String,
            type: row['type'] as String,
            status: row['status'] as String,
            bookType: row['bookType'] as String,
            authors: row['authors'] as String),
        arguments: [type]);
  }
}

class _$JournalModelDao extends JournalModelDao {
  _$JournalModelDao(this.database, this.changeListener)
      : _queryAdapter = QueryAdapter(database);

  final sqflite.DatabaseExecutor database;

  final StreamController<String> changeListener;

  final QueryAdapter _queryAdapter;

  @override
  Future<List<JournalModel>> searchByPubDate(String publishDate) async {
    return _queryAdapter.queryList(
        'SELECT * FROM JournalModel WHERE publishDate = ?1',
        mapper: (Map<String, Object?> row) => JournalModel(
            id: row['id'] as int,
            typeId: row['typeId'] as int,
            isbn: row['isbn'] as String,
            title: row['title'] as String,
            subject: row['subject'] as String,
            publisher: row['publisher'] as String,
            language: row['language'] as String,
            publishDate: row['publishDate'] as String,
            type: row['type'] as String,
            status: row['status'] as String,
            volume: row['volume'] as String,
            issue: row['issue'] as String),
        arguments: [publishDate]);
  }

  @override
  Future<List<JournalModel>> searchBySubject(String subject) async {
    return _queryAdapter.queryList(
        'SELECT * FROM JournalModel WHERE subject LIKE ?1',
        mapper: (Map<String, Object?> row) => JournalModel(
            id: row['id'] as int,
            typeId: row['typeId'] as int,
            isbn: row['isbn'] as String,
            title: row['title'] as String,
            subject: row['subject'] as String,
            publisher: row['publisher'] as String,
            language: row['language'] as String,
            publishDate: row['publishDate'] as String,
            type: row['type'] as String,
            status: row['status'] as String,
            volume: row['volume'] as String,
            issue: row['issue'] as String),
        arguments: [subject]);
  }

  @override
  Future<List<JournalModel>> searchByTitle(String title) async {
    return _queryAdapter.queryList(
        'SELECT * FROM JournalModel WHERE title LIKE ?1',
        mapper: (Map<String, Object?> row) => JournalModel(
            id: row['id'] as int,
            typeId: row['typeId'] as int,
            isbn: row['isbn'] as String,
            title: row['title'] as String,
            subject: row['subject'] as String,
            publisher: row['publisher'] as String,
            language: row['language'] as String,
            publishDate: row['publishDate'] as String,
            type: row['type'] as String,
            status: row['status'] as String,
            volume: row['volume'] as String,
            issue: row['issue'] as String),
        arguments: [title]);
  }

  @override
  Future<List<JournalModel>> searchByType(String type) async {
    return _queryAdapter.queryList('SELECT * FROM JournalModel WHERE type = ?1',
        mapper: (Map<String, Object?> row) => JournalModel(
            id: row['id'] as int,
            typeId: row['typeId'] as int,
            isbn: row['isbn'] as String,
            title: row['title'] as String,
            subject: row['subject'] as String,
            publisher: row['publisher'] as String,
            language: row['language'] as String,
            publishDate: row['publishDate'] as String,
            type: row['type'] as String,
            status: row['status'] as String,
            volume: row['volume'] as String,
            issue: row['issue'] as String),
        arguments: [type]);
  }
}
