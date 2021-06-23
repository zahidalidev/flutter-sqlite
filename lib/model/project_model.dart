final String tableCredentials = 'credentials';

class CredentialFields {
  static final List<String> values = [id, email, password];

  static final String id = '_id';
  static final String email = 'email';
  static final String name = 'name';
  static final String number = 'number';
  static final String password = 'password';
}

class SignUpModel {
  final int id;
  final String email;
  final String name;
  final String number;
  final String password;

  const SignUpModel(
      {this.id, this.email, this.name, this.number, this.password});

  SignUpModel copy(
          {int id,
          String email,
          String name,
          String number,
          String password}) =>
      SignUpModel(
          id: id ?? this.id,
          email: email ?? this.email,
          name: name ?? this.name,
          number: number ?? this.number,
          password: this.password);

  Map<String, Object> toJson() => {
        CredentialFields.email: email,
        CredentialFields.name: name,
        CredentialFields.number: number,
        CredentialFields.password: password
      };

  static SignUpModel fromJson(Map<String, Object> json) => SignUpModel(
      email: json[CredentialFields.email] as String,
      password: json[CredentialFields.password] as String);
}

final String tableTransaction = 'transactions';

class TransactionFields {
  static final List<String> values = [];

  static final String id = '_id';
  static final String accountId = 'accountId';
  static final String description = 'description';
  static final String drAmount = 'drAmount';
  static final String crAmount = 'crAmount';
  static final String date = 'date';
}

class TransactionsModel {
  final int id;
  final String accountId;
  final String description;
  final String drAmount;
  final String crAmount;
  final DateTime date;

  const TransactionsModel(
      {this.id,
      this.accountId,
      this.description,
      this.drAmount,
      this.crAmount,
      this.date});

  TransactionsModel copy(
          {int id,
          String accountId,
          String description,
          String drAmount,
          String crAmount,
          String date}) =>
      TransactionsModel(
          id: id ?? this.id,
          accountId: accountId ?? this.accountId,
          description: description ?? this.description,
          drAmount: drAmount ?? this.drAmount,
          crAmount: crAmount ?? this.crAmount,
          date: date ?? this.date);

  Map<String, Object> toJson() => {
        TransactionFields.id: id,
        TransactionFields.accountId: accountId,
        TransactionFields.description: description,
        TransactionFields.crAmount: crAmount,
        TransactionFields.drAmount: drAmount,
        TransactionFields.date: date.toIso8601String()
      };

  static TransactionsModel fromJson(Map<String, Object> json) =>
      TransactionsModel(
        accountId: json[TransactionFields.accountId] as String,
        id: json[TransactionFields.id] as int,
        description: json[TransactionFields.description] as String,
        crAmount: json[TransactionFields.crAmount] as String,
        drAmount: json[TransactionFields.drAmount] as String,
        date: DateTime.parse(json[TransactionFields.date] as String),
      );
}
