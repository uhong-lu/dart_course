// Exercise
// Implement a simple EmailAddress class that takes an email String as a constructor argument.

// This class should throw a FormatException if:

// it is initialized with an empty email
// the email doesn’t contain a @ character
// Then, test this class with the following code:


// void main() {
//   try {
//     print(EmailAddress('me@example.com'));
//     print(EmailAddress('example.com'));
//     print(EmailAddress(''));
//   } on FormatException catch (e) {
//     print(e);
//   }
//   // Desired output:
//   // me@example.com
//   // FormatException: example.com doesn't contain the @ symbol
// }




class EmailAddress {
  final String email;

  EmailAddress(this.email) {
    if (email.isEmpty) {
      throw FormatException('Email cannot be empty');
    }
    if (!email.contains('@')) {
      throw FormatException('$email doesn\'t contain the @ symbol');
    }
  }

  @override
  String toString() => email;
}

void main() {
  try {
    print(EmailAddress('me@example.com'));
    print(EmailAddress('example.com'));
    print(EmailAddress(''));
  } on FormatException catch (e) {
    print(e);
  }
  // Desired output:
  // me@example.com
  // FormatException: example.com doesn't contain the @ symbol
}






// #1
// class EmailAddress {
//   final String email;

//   EmailAddress(this.email) {
//     if (email.isEmpty) {
//       throw FormatException('Email cannot be empty');
//     }
//     if (!email.contains('@')) {
//       throw FormatException('$email doesn\'t contain the @ symbol');
//     }
//   }
// }

// #2
// class EmailAddress {
//   final String email;

//   assert(email.isNotEmpty, 'Email cannot be empty');
//   assert(email.contains('@'), 'Email must contain the @ symbol');
//   EmailAddress(this.email) {
//     if (email.isEmpty) {
//       throw FormatException('Email cannot be empty');
//     }
//     if (!email.contains('@')) {
//       throw FormatException('$email doesn\'t contain the @ symbol');
//     }
//   }

//   @override
//   String toString() => email;
// }




// void main() {
//   try {
//     print(EmailAddress('me@example.com'));
//     print(EmailAddress('example.com'));
//     print(EmailAddress(''));
//   } on FormatException catch (e) {
//     print(e);
//   }