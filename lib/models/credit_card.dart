class CreditCard {
  final String _cardNo, _holder, _expiryDate, _cvv;
  CreditCard(this._cardNo, this._holder, this._expiryDate, this._cvv);
      

  // String get cardNo {
  //   var letters = [];
  //   for (int i = 0; i < _cardNo.length;) {
  //     letters.add(_cardNo.substring(i, ((i ~/ 4) + 1) * 4));
  //     i += 4;
  //   }
  //   var fakeNo = "";
  //   for (int i = 0; i < letters.length; i++) {
  //     if (i == letters.length - 1) {
  //       fakeNo += letters[i];
  //       break;
  //     }
  //     fakeNo += "****   ";
  //   }
  //   return fakeNo;
  // }

  String get cardNo => _cardNo;
  String get holder => _holder;

  String get cvv => _cvv;

  String get expiryDate => _expiryDate;
}
