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

  MemberModelDao? _memberModelDaoInstance;

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
        await database.execute(
            'CREATE TABLE IF NOT EXISTS `MemberModel` (`memberId` INTEGER NOT NULL, `balanceAmount` INTEGER NOT NULL, `noInvLoaned` INTEGER NOT NULL, `cardId` TEXT NOT NULL, `memberType` TEXT NOT NULL, `name` TEXT NOT NULL, `surname` TEXT NOT NULL, `phone` TEXT NOT NULL, `mail` TEXT NOT NULL, `faculty` TEXT NOT NULL, `department` TEXT NOT NULL, `dateOfMembership` TEXT NOT NULL, PRIMARY KEY (`memberId`))');

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

  @override
  MemberModelDao get memberModelDao {
    return _memberModelDaoInstance ??=
        _$MemberModelDao(database, changeListener);
  }
}

class _$BookModelDao extends BookModelDao {
  _$BookModelDao(this.database, this.changeListener)
      : _queryAdapter = QueryAdapter(database),
        _bookModelInsertionAdapter = InsertionAdapter(
            database,
            'BookModel',
            (BookModel item) => <String, Object?>{
                  'id': item.id,
                  'typeId': item.typeId,
                  'numberOfPages': item.numberOfPages,
                  'isbn': item.isbn,
                  'title': item.title,
                  'subject': item.subject,
                  'publisher': item.publisher,
                  'language': item.language,
                  'publishDate': item.publishDate,
                  'type': item.type,
                  'status': item.status,
                  'bookType': item.bookType,
                  'authors': item.authors
                });

  final sqflite.DatabaseExecutor database;

  final StreamController<String> changeListener;

  final QueryAdapter _queryAdapter;

  final InsertionAdapter<BookModel> _bookModelInsertionAdapter;

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

  @override
  Future<void> saveBook(BookModel game) async {
    await _bookModelInsertionAdapter.insert(game, OnConflictStrategy.replace);
  }
}

class _$JournalModelDao extends JournalModelDao {
  _$JournalModelDao(this.database, this.changeListener)
      : _queryAdapter = QueryAdapter(database),
        _journalModelInsertionAdapter = InsertionAdapter(
      database,
      'JournalModel',
          (JournalModel item) => <String, Object?>{
            'id': item.id,
            'typeId': item.typeId,
            'isbn': item.isbn,
            'title': item.title,
            'subject': item.subject,
            'publisher': item.publisher,
            'language': item.language,
            'publishDate': item.publishDate,
            'type': item.type,
            'status': item.status,
            'volume':item.volume,
            'issue':item.issue,
      });

  final sqflite.DatabaseExecutor database;

  final StreamController<String> changeListener;

  final QueryAdapter _queryAdapter;

  final InsertionAdapter<JournalModel> _journalModelInsertionAdapter;

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

  @override
  Future<void> saveJournal(JournalModel game) async {
    await _journalModelInsertionAdapter.insert(game, OnConflictStrategy.replace);
  }
}

class _$MemberModelDao extends MemberModelDao {
  _$MemberModelDao(this.database, this.changeListener)
      : _memberModelInsertionAdapter = InsertionAdapter(
            database,
            'MemberModel',
            (MemberModel item) => <String, Object?>{
                  'memberId': item.memberId,
                  'balanceAmount': item.balanceAmount,
                  'noInvLoaned': item.noInvLoaned,
                  'cardId': item.cardId,
                  'memberType': item.memberType,
                  'name': item.name,
                  'surname': item.surname,
                  'phone': item.phone,
                  'mail': item.mail,
                  'faculty': item.faculty,
                  'department': item.department,
                  'dateOfMembership': item.dateOfMembership
                });

  final sqflite.DatabaseExecutor database;

  final StreamController<String> changeListener;

  final InsertionAdapter<MemberModel> _memberModelInsertionAdapter;

  @override
  Future<void> saveMember(MemberModel member) async {
    await _memberModelInsertionAdapter.insert(
        member, OnConflictStrategy.replace);
  }
}
