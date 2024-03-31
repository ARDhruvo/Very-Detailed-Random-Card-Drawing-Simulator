/* 
 * @author Kashikizu
 * Initial Completion Date: 31/03/2024
 */

import 'dart:math';

void main() {
  Deck d = Deck();
  d.ocd();
}

class Deck extends CardCalc {
  Deck() {
    int n = univRoll(13); //Determines the number of cards to be drawn
    if (n == 0) {
      print("No cards was drawn");
      banana();
    } else {
      print("$n cards will be drawn");
      ocd();

      draw(n); //Draws the cards

      print("Among the cards drawn:");
      ocd();
      cardCount(); //Shows the most drawn suit
      cardStats(n); //Gives stats about the drawn cards
    }
  }
}

class CardCalc extends Keyword {
  CardCalc() {}

  //Draws cards
  void draw(int n) {
    for (int i = 0; i < n; i++) {
      int draw = univRoll(52);
      int ser = i + 1;
      hand[i] = draw;
      for (int j = i - 1; j >= 0; j--) {
        if (hand[i] == hand[j]) {
          draw = univRoll(52);
          hand[i] = draw;
        }
      }
      print("Card #$ser: ${cards[draw]}");
      suitsCounter(draw); //Keeps track of suits
    }
    ocd();
  }

  void suitsCounter(int draw) {
    if (draw <= 12) {
      suits[0]++;
    } else if (draw <= 25) {
      suits[1]++;
    } else if (draw <= 38) {
      suits[2]++;
    } else {
      suits[3]++;
    }

    //For face cards
    if ((draw >= 0 && draw <= 3) ||
        (draw >= 13 && draw <= 16) ||
        (draw >= 26 && draw <= 29) ||
        (draw >= 39 && draw <= 42)) {
      suits[4]++;
    }
  }

  void cardCount() {
    var sort = [0, 0, 0, 0];
    for (int i = 0; i < 4; i++) {
      sort[i] = suits[i];
    }
    sort.sort();
    if (sort[3] == sort[0]) {
      print("All suits were drawn equally");
    } else {
      print("Most drawn suit(s):");
      for (int i = 0; i < 4; i++) {
        if (sort[3] == suits[i]) {
          print(suitsName[i]);
        }
      }
    }
    ocd();
  }

  //Statistics of the drawn cards
  void cardStats(int n) {
    for (int i = 0; i < 4; i++) {
      if (suits[i] != 0) {
        print("${suitsName[i]} was drawn ${suits[i]} times");
        double percHand = percCalc(suits[i], n);
        print("Which comprises $percHand% of cards drawn");
        double percSuits = percCalc(suits[i], 13);
        print("$percSuits% of cards the suit");
        double percDeck = percCalc(suits[i], 52);
        print("$percDeck% of cards in deck");
        ocd();
      }
    }
    if (suits[4] != 0) {
      print("Number of Face Cards: ${suits[4]}");
      double percHand = percCalc(suits[4], n);
      print("Which comprises $percHand% of cards drawn");
      double percFace = percCalc(suits[4], 12);
      print("$percFace% of Face Cards");
      double percDeck = percCalc(suits[4], 52);
      print("$percDeck% of cards in deck");
      ocd();
    }
  }
}

class Keyword extends UnivCalc {
  var cards = [
    'Ace of Spades',
    'King of Spades',
    'Queen of Spades',
    'Jack of Spades',
    '10 of Spades',
    '9 of Spades',
    '8 of Spades',
    '7 of Spades',
    '6 of Spades',
    '5 of Spades',
    '4 of Spades',
    '3 of Spades',
    '2 of Spades',
    'Ace of Hearts',
    'King of Hearts',
    'Queen of Hearts',
    'Jack of Hearts',
    '10 of Hearts',
    '9 of Hearts',
    '8 of Hearts',
    '7 of Hearts',
    '6 of Hearts',
    '5 of Hearts',
    '4 of Hearts',
    '3 of Hearts',
    '2 of Hearts',
    'Ace of Clubs',
    'King of Clubs',
    'Queen of Clubs',
    'Jack of Clubs',
    '10 of Clubs',
    '9 of Clubs',
    '8 of Clubs',
    '7 of Clubs',
    '6 of Clubs',
    '5 of Clubs',
    '4 of Clubs',
    '3 of Clubs',
    '2 of Clubs',
    'Ace of Diamond',
    'King of Diamond',
    'Queen of Diamond',
    'Jack of Diamond',
    '10 of Diamond',
    '9 of Diamond',
    '8 of Diamond',
    '7 of Diamond',
    '6 of Diamond',
    '5 of Diamond',
    '4 of Diamond',
    '3 of Diamond',
    '2 of Diamond'
  ];
}

class UnivCalc {
  int heads = 0, tails = 0;

  int mas = 0, fem = 0;
  List<int> genre = [0, 0, 0, 0, 0];
  int lifeCheck = 1;

  var hand = [60, 60, 60, 60, 60, 60, 60, 60, 60, 60, 60, 60, 60];
  var suits = [0, 0, 0, 0, 0],
      suitsName = ['Spades', 'Hearts', 'Clubs', 'Diamonds'];
  UnivCalc() {}

  void banana() {
    int banana = rand() + 1;
    ocd();
    print("Instead you got $banana bananas!");
  }

  void flip(int loc, n, void func(String a, int s),
      [String? a, b, int? s, List<int>? gun]) {
    switch (loc) {
      case 0: //coin
        {
          a = "Heads";
          b = "Tails";
          for (int i = 0; i < n; i++) {
            s = i + 1;
            int res = rand() % 2;
            if (res == 0) {
              func(a, s);
              heads++;
            } else {
              func(b, s);
              tails++;
            }
          }
        }
        break;
      case 1: //dice
        {
          //Not much to do I think
        }
        break;
      case 2: //color
        {}
        break;
      case 3: //roulette
        {}
        break;
      case 4: //name generator
        {}
        break;
      case 5: //deck of cards
        {}
        break;
      case 6: //Gacha
        {}
        break;
      default:
        {
          print("placeholder");
        }
    }
  }

  int univRoll(int n) {
    int cases = rand() % n;
    return cases;
  }

  //Calculates % stats
  double percCalc(int f, n) {
    double percFace = (f / n) * 100;
    double percRound = double.parse(percFace.toStringAsFixed(2));
    return percRound;
  }

  //Returns a random number
  int rand() {
    int value = Random().nextInt(6969);
    return value;
  }

  //Returns a random number between 10; Used for determining loop numbers
  int gen() {
    int value = Random().nextInt(10);
    return value;
  }

  void ocd() {
    print("");
  }
}
