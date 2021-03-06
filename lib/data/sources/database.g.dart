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

  DvdModelDao? _dvdModelDaoInstance;

  MemberModelDao? _memberModelDaoInstance;

  RuleModelDao? _ruleModelDaoInstance;

  BorrowModelDao? _borrowModelDaoInstance;

  ReservationModelDao? _reservationModelDaoInstance;

  Future<sqflite.Database> open(String path, List<Migration> migrations,
      [Callback? callback]) async {
    final databaseOptions = sqflite.OpenDatabaseOptions(
      version: 1,
      onConfigure: (database) async {
        await database.execute('PRAGMA foreign_keys = ON');
        await callback?.onConfigure?.call(database);
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
            'CREATE TABLE IF NOT EXISTS `BookModel` (`id` INTEGER NOT NULL, `typeId` INTEGER NOT NULL, `numberOfPages` INTEGER NOT NULL, `isbn` TEXT NOT NULL, `title` TEXT NOT NULL, `subject` TEXT NOT NULL, `publisher` TEXT NOT NULL, `language` TEXT NOT NULL, `publishDate` TEXT NOT NULL, `status` TEXT NOT NULL, `bookType` TEXT NOT NULL, `authors` TEXT NOT NULL, PRIMARY KEY (`id`))');
        await database.execute(
            'CREATE TABLE IF NOT EXISTS `JournalModel` (`id` INTEGER NOT NULL, `typeId` INTEGER NOT NULL, `isbn` TEXT NOT NULL, `title` TEXT NOT NULL, `subject` TEXT NOT NULL, `publisher` TEXT NOT NULL, `language` TEXT NOT NULL, `publishDate` TEXT NOT NULL, `status` TEXT NOT NULL, `volume` TEXT NOT NULL, `issue` TEXT NOT NULL, PRIMARY KEY (`id`))');
        await database.execute(
            'CREATE TABLE IF NOT EXISTS `DvdModel` (`id` INTEGER NOT NULL, `typeId` INTEGER NOT NULL, `isbn` TEXT NOT NULL, `title` TEXT NOT NULL, `subject` TEXT NOT NULL, `publisher` TEXT NOT NULL, `language` TEXT NOT NULL, `publishDate` TEXT NOT NULL, `status` TEXT NOT NULL, `director` TEXT NOT NULL, `duration` INTEGER NOT NULL, PRIMARY KEY (`id`))');
        await database.execute(
            'CREATE TABLE IF NOT EXISTS `MemberModel` (`memberId` INTEGER NOT NULL, `balanceAmount` INTEGER NOT NULL, `noInvLoaned` INTEGER NOT NULL, `cardId` TEXT NOT NULL, `memberType` TEXT NOT NULL, `name` TEXT NOT NULL, `surname` TEXT NOT NULL, `phone` TEXT NOT NULL, `mail` TEXT NOT NULL, `faculty` TEXT NOT NULL, `department` TEXT NOT NULL, `dateOfMembership` TEXT NOT NULL, `reservedInventoryList` TEXT NOT NULL, `borrowedInventoryList` TEXT NOT NULL, PRIMARY KEY (`memberId`))');
        await database.execute(
            'CREATE TABLE IF NOT EXISTS `RuleModel` (`ruleId` INTEGER NOT NULL, `invBook` INTEGER NOT NULL, `invDvd` INTEGER NOT NULL, `invJournal` INTEGER NOT NULL, `loanPeriodForAcademic` INTEGER NOT NULL, `loanPeriodForOfficer` INTEGER NOT NULL, `loanPeriodForStudent` INTEGER NOT NULL, `nOfLoanForAcademic` INTEGER NOT NULL, `nOfLoanForOfficer` INTEGER NOT NULL, `nOfLoanForStudent` INTEGER NOT NULL, `penaltyPrice` REAL NOT NULL, PRIMARY KEY (`ruleId`))');
        await database.execute(
            'CREATE TABLE IF NOT EXISTS `BorrowModel` (`memberId` INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, `inventoryId` INTEGER NOT NULL, `title` TEXT NOT NULL, `borrowDate` TEXT NOT NULL, `invType` INTEGER NOT NULL)');
        await database.execute(
            'CREATE TABLE IF NOT EXISTS `ReservationModel` (`reservationId` INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, `memberId` INTEGER NOT NULL, `inventoryId` INTEGER NOT NULL, `reservationDate` INTEGER NOT NULL)');

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
  DvdModelDao get dvdModelDao {
    return _dvdModelDaoInstance ??= _$DvdModelDao(database, changeListener);
  }

  @override
  MemberModelDao get memberModelDao {
    return _memberModelDaoInstance ??=
        _$MemberModelDao(database, changeListener);
  }

  @override
  RuleModelDao get ruleModelDao {
    return _ruleModelDaoInstance ??= _$RuleModelDao(database, changeListener);
  }

  @override
  BorrowModelDao get borrowModelDao {
    return _borrowModelDaoInstance ??=
        _$BorrowModelDao(database, changeListener);
  }

  @override
  ReservationModelDao get reservationModelDao {
    return _reservationModelDaoInstance ??=
        _$ReservationModelDao(database, changeListener);
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
            status: row['status'] as String,
            bookType: row['bookType'] as String,
            authors: row['authors'] as String),
        arguments: [title]);
  }

  @override
  Future<List<BookModel>> searchBook(String queryData) async {
    return _queryAdapter.queryList(
        'SELECT * FROM BookModel WHERE title LIKE ?1 OR subject LIKE ?1 OR publishDate LIKE ?1',
        mapper: (Map<String, Object?> row) => BookModel(id: row['id'] as int, typeId: row['typeId'] as int, numberOfPages: row['numberOfPages'] as int, isbn: row['isbn'] as String, title: row['title'] as String, subject: row['subject'] as String, publisher: row['publisher'] as String, language: row['language'] as String, publishDate: row['publishDate'] as String, status: row['status'] as String, bookType: row['bookType'] as String, authors: row['authors'] as String),
        arguments: [queryData]);
  }

  @override
  Future<List<BookModel>> getBook(int bookId) async {
    return _queryAdapter.queryList('SELECT * FROM BookModel WHERE id= ?1',
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
            status: row['status'] as String,
            bookType: row['bookType'] as String,
            authors: row['authors'] as String),
        arguments: [bookId]);
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
                  'status': item.status,
                  'volume': item.volume,
                  'issue': item.issue
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
            status: row['status'] as String,
            volume: row['volume'] as String,
            issue: row['issue'] as String),
        arguments: [title]);
  }

  @override
  Future<List<JournalModel>> searchJournal(String queryData) async {
    return _queryAdapter.queryList(
        'SELECT * FROM JournalModel WHERE title LIKE ?1 OR subject LIKE ?1 OR publishDate LIKE ?1',
        mapper: (Map<String, Object?> row) => JournalModel(id: row['id'] as int, typeId: row['typeId'] as int, isbn: row['isbn'] as String, title: row['title'] as String, subject: row['subject'] as String, publisher: row['publisher'] as String, language: row['language'] as String, publishDate: row['publishDate'] as String, status: row['status'] as String, volume: row['volume'] as String, issue: row['issue'] as String),
        arguments: [queryData]);
  }

  @override
  Future<void> saveJournal(JournalModel game) async {
    await _journalModelInsertionAdapter.insert(
        game, OnConflictStrategy.replace);
  }
}

class _$DvdModelDao extends DvdModelDao {
  _$DvdModelDao(this.database, this.changeListener)
      : _queryAdapter = QueryAdapter(database),
        _dvdModelInsertionAdapter = InsertionAdapter(
            database,
            'DvdModel',
            (DvdModel item) => <String, Object?>{
                  'id': item.id,
                  'typeId': item.typeId,
                  'isbn': item.isbn,
                  'title': item.title,
                  'subject': item.subject,
                  'publisher': item.publisher,
                  'language': item.language,
                  'publishDate': item.publishDate,
                  'status': item.status,
                  'director': item.director,
                  'duration': item.duration
                });

  final sqflite.DatabaseExecutor database;

  final StreamController<String> changeListener;

  final QueryAdapter _queryAdapter;

  final InsertionAdapter<DvdModel> _dvdModelInsertionAdapter;

  @override
  Future<List<DvdModel>> searchByPubDate(String publishDate) async {
    return _queryAdapter.queryList(
        'SELECT * FROM DvdModel WHERE publishDate = ?1',
        mapper: (Map<String, Object?> row) => DvdModel(
            id: row['id'] as int,
            typeId: row['typeId'] as int,
            isbn: row['isbn'] as String,
            title: row['title'] as String,
            subject: row['subject'] as String,
            publisher: row['publisher'] as String,
            language: row['language'] as String,
            publishDate: row['publishDate'] as String,
            status: row['status'] as String,
            duration: row['duration'] as int,
            director: row['director'] as String),
        arguments: [publishDate]);
  }

  @override
  Future<List<DvdModel>> searchBySubject(String subject) async {
    return _queryAdapter.queryList(
        'SELECT * FROM DvdModel WHERE subject LIKE ?1',
        mapper: (Map<String, Object?> row) => DvdModel(
            id: row['id'] as int,
            typeId: row['typeId'] as int,
            isbn: row['isbn'] as String,
            title: row['title'] as String,
            subject: row['subject'] as String,
            publisher: row['publisher'] as String,
            language: row['language'] as String,
            publishDate: row['publishDate'] as String,
            status: row['status'] as String,
            duration: row['duration'] as int,
            director: row['director'] as String),
        arguments: [subject]);
  }

  @override
  Future<List<DvdModel>> searchByTitle(String title) async {
    return _queryAdapter.queryList('SELECT * FROM DvdModel WHERE title LIKE ?1',
        mapper: (Map<String, Object?> row) => DvdModel(
            id: row['id'] as int,
            typeId: row['typeId'] as int,
            isbn: row['isbn'] as String,
            title: row['title'] as String,
            subject: row['subject'] as String,
            publisher: row['publisher'] as String,
            language: row['language'] as String,
            publishDate: row['publishDate'] as String,
            status: row['status'] as String,
            duration: row['duration'] as int,
            director: row['director'] as String),
        arguments: [title]);
  }

  @override
  Future<List<DvdModel>> searchDvd(String queryData) async {
    return _queryAdapter.queryList(
        'SELECT * FROM DvdModel WHERE title LIKE ?1 OR subject LIKE ?1 OR publishDate LIKE ?1',
        mapper: (Map<String, Object?> row) => DvdModel(id: row['id'] as int, typeId: row['typeId'] as int, isbn: row['isbn'] as String, title: row['title'] as String, subject: row['subject'] as String, publisher: row['publisher'] as String, language: row['language'] as String, publishDate: row['publishDate'] as String, status: row['status'] as String, duration: row['duration'] as int, director: row['director'] as String),
        arguments: [queryData]);
  }

  @override
  Future<void> saveDvd(DvdModel dvd) async {
    await _dvdModelInsertionAdapter.insert(dvd, OnConflictStrategy.replace);
  }
}

class _$MemberModelDao extends MemberModelDao {
  _$MemberModelDao(this.database, this.changeListener)
      : _queryAdapter = QueryAdapter(database),
        _memberModelInsertionAdapter = InsertionAdapter(
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
                  'dateOfMembership': item.dateOfMembership,
                  'reservedInventoryList': item.reservedInventoryList,
                  'borrowedInventoryList': item.borrowedInventoryList
                });

  final sqflite.DatabaseExecutor database;

  final StreamController<String> changeListener;

  final QueryAdapter _queryAdapter;

  final InsertionAdapter<MemberModel> _memberModelInsertionAdapter;

  @override
  Future<MemberModel?> getMemberByCardId(String cardId) async {
    return _queryAdapter.query('SELECT * FROM MemberModel WHERE cardId = ?1',
        mapper: (Map<String, Object?> row) => MemberModel(
            memberId: row['memberId'] as int,
            balanceAmount: row['balanceAmount'] as int,
            noInvLoaned: row['noInvLoaned'] as int,
            cardId: row['cardId'] as String,
            memberType: row['memberType'] as String,
            name: row['name'] as String,
            surname: row['surname'] as String,
            phone: row['phone'] as String,
            mail: row['mail'] as String,
            faculty: row['faculty'] as String,
            department: row['department'] as String,
            dateOfMembership: row['dateOfMembership'] as String,
            reservedInventoryList: row['reservedInventoryList'] as String,
            borrowedInventoryList: row['borrowedInventoryList'] as String),
        arguments: [cardId]);
  }

  @override
  Future<void> saveMember(MemberModel member) async {
    await _memberModelInsertionAdapter.insert(
        member, OnConflictStrategy.replace);
  }
}

class _$RuleModelDao extends RuleModelDao {
  _$RuleModelDao(this.database, this.changeListener)
      : _queryAdapter = QueryAdapter(database),
        _ruleModelInsertionAdapter = InsertionAdapter(
            database,
            'RuleModel',
            (RuleModel item) => <String, Object?>{
                  'ruleId': item.ruleId,
                  'invBook': item.invBook,
                  'invDvd': item.invDvd,
                  'invJournal': item.invJournal,
                  'loanPeriodForAcademic': item.loanPeriodForAcademic,
                  'loanPeriodForOfficer': item.loanPeriodForOfficer,
                  'loanPeriodForStudent': item.loanPeriodForStudent,
                  'nOfLoanForAcademic': item.nOfLoanForAcademic,
                  'nOfLoanForOfficer': item.nOfLoanForOfficer,
                  'nOfLoanForStudent': item.nOfLoanForStudent,
                  'penaltyPrice': item.penaltyPrice
                }),
        _ruleModelUpdateAdapter = UpdateAdapter(
            database,
            'RuleModel',
            ['ruleId'],
            (RuleModel item) => <String, Object?>{
                  'ruleId': item.ruleId,
                  'invBook': item.invBook,
                  'invDvd': item.invDvd,
                  'invJournal': item.invJournal,
                  'loanPeriodForAcademic': item.loanPeriodForAcademic,
                  'loanPeriodForOfficer': item.loanPeriodForOfficer,
                  'loanPeriodForStudent': item.loanPeriodForStudent,
                  'nOfLoanForAcademic': item.nOfLoanForAcademic,
                  'nOfLoanForOfficer': item.nOfLoanForOfficer,
                  'nOfLoanForStudent': item.nOfLoanForStudent,
                  'penaltyPrice': item.penaltyPrice
                });

  final sqflite.DatabaseExecutor database;

  final StreamController<String> changeListener;

  final QueryAdapter _queryAdapter;

  final InsertionAdapter<RuleModel> _ruleModelInsertionAdapter;

  final UpdateAdapter<RuleModel> _ruleModelUpdateAdapter;

  @override
  Future<RuleModel?> getRule(int ruleId) async {
    return _queryAdapter.query('SELECT * FROM RuleModel WHERE ruleId = ?1',
        mapper: (Map<String, Object?> row) => RuleModel(
            ruleId: row['ruleId'] as int,
            invBook: row['invBook'] as int,
            invDvd: row['invDvd'] as int,
            invJournal: row['invJournal'] as int,
            loanPeriodForAcademic: row['loanPeriodForAcademic'] as int,
            loanPeriodForOfficer: row['loanPeriodForOfficer'] as int,
            loanPeriodForStudent: row['loanPeriodForStudent'] as int,
            nOfLoanForAcademic: row['nOfLoanForAcademic'] as int,
            nOfLoanForOfficer: row['nOfLoanForOfficer'] as int,
            nOfLoanForStudent: row['nOfLoanForStudent'] as int,
            penaltyPrice: row['penaltyPrice'] as double),
        arguments: [ruleId]);
  }

  @override
  Future<void> addRule(RuleModel rule) async {
    await _ruleModelInsertionAdapter.insert(rule, OnConflictStrategy.replace);
  }

  @override
  Future<void> updateRule(RuleModel rule) async {
    await _ruleModelUpdateAdapter.update(rule, OnConflictStrategy.replace);
  }
}

class _$BorrowModelDao extends BorrowModelDao {
  _$BorrowModelDao(this.database, this.changeListener)
      : _queryAdapter = QueryAdapter(database),
        _borrowModelInsertionAdapter = InsertionAdapter(
            database,
            'BorrowModel',
            (BorrowModel item) => <String, Object?>{
                  'memberId': item.memberId,
                  'inventoryId': item.inventoryId,
                  'title': item.title,
                  'borrowDate': item.borrowDate,
                  'invType': item.invType
                });

  final sqflite.DatabaseExecutor database;

  final StreamController<String> changeListener;

  final QueryAdapter _queryAdapter;

  final InsertionAdapter<BorrowModel> _borrowModelInsertionAdapter;

  @override
  Future<int?> deleteBorrow(int inventoryId, int invType) async {
    await _queryAdapter.queryNoReturn(
        'Delete FROM BorrowModel WHERE inventoryId = ?1 AND invType = ?2',
        arguments: [inventoryId, invType]);
  }

  @override
  Future<List<BorrowModel>> getBorrows(int memberId) async {
    return _queryAdapter.queryList(
        'SELECT * FROM BorrowModel WHERE memberId = ?1',
        mapper: (Map<String, Object?> row) => BorrowModel(
            memberId: row['memberId'] as int,
            inventoryId: row['inventoryId'] as int,
            title: row['title'] as String,
            borrowDate: row['borrowDate'] as String,
            invType: row['invType'] as int),
        arguments: [memberId]);
  }

  @override
  Future<List<BorrowModel>> getBorrowByInv(int inventoryId, int invType) async {
    return _queryAdapter.queryList(
        'SELECT * FROM BorrowModel WHERE inventoryId = ?1 AND invType = ?2',
        mapper: (Map<String, Object?> row) => BorrowModel(
            memberId: row['memberId'] as int,
            inventoryId: row['inventoryId'] as int,
            title: row['title'] as String,
            borrowDate: row['borrowDate'] as String,
            invType: row['invType'] as int),
        arguments: [inventoryId, invType]);
  }

  @override
  Future<void> saveBorrow(BorrowModel borrow) async {
    await _borrowModelInsertionAdapter.insert(
        borrow, OnConflictStrategy.replace);
  }
}

class _$ReservationModelDao extends ReservationModelDao {
  _$ReservationModelDao(this.database, this.changeListener)
      : _queryAdapter = QueryAdapter(database),
        _reservationModelInsertionAdapter = InsertionAdapter(
            database,
            'ReservationModel',
            (ReservationModel item) => <String, Object?>{
                  'reservationId': item.reservationId,
                  'memberId': item.memberId,
                  'inventoryId': item.inventoryId,
                  'reservationDate': item.reservationDate
                });

  final sqflite.DatabaseExecutor database;

  final StreamController<String> changeListener;

  final QueryAdapter _queryAdapter;

  final InsertionAdapter<ReservationModel> _reservationModelInsertionAdapter;

  @override
  Future<void> deleteReservation(int reservationId) async {
    await _queryAdapter.queryNoReturn(
        'Delete * FROM ReservationModel WHERE reservationId = ?1',
        arguments: [reservationId]);
  }

  @override
  Future<void> saveReservation(ReservationModel reservation) async {
    await _reservationModelInsertionAdapter.insert(
        reservation, OnConflictStrategy.replace);
  }
}
