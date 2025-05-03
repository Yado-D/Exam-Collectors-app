
import 'dart:math';

class QuotesService {
  static final List _quotes = quotesWithAuthors; // Your quotes list

  static String getRandom() {
    return _quotes[Random().nextInt(_quotes.length)];
  }

  static String getDaily({int? seed}) {
    // Use seed based on date to get same quote all day
    final now = DateTime.now();
    final dailySeed = seed ?? now.year + now.month + now.day;
    return _quotes[Random(dailySeed).nextInt(_quotes.length)]["quote"];
  }
}



final List<Map<String, String>> quotesWithAuthors = [
  {
    "quote": "Stay hard!",
    "author": "David Goggins"
  },
  {
    "quote": "You don't know me, son!",
    "author": "David Goggins"
  },
  {
    "quote": "The only limits that exist are the ones you place on yourself.",
    "author": "David Goggins"
  },
  {
    "quote": "Success isn't owned, it's leased—and rent is due every day.",
    "author": "Jocko Willink"
  },
  {
    "quote": "Discipline equals freedom.",
    "author": "Jocko Willink"
  },
  {
    "quote": "The only easy day was yesterday.",
    "author": "Navy SEALs"
  },
  {
    "quote": "Embrace the suck.",
    "author": "Military Proverb"
  },
  {
    "quote": "Hard work beats talent when talent fails to work hard.",
    "author": "Kevin Durant"
  },
  {
    "quote": "Pressure makes diamonds.",
    "author": "George Patton"
  },
  {
    "quote": "Suffer the pain of discipline or suffer the pain of regret.",
    "author": "Anonymous"
  },
  {
    "quote": "No excuses. Just results.",
    "author": "Kobe Bryant"
  },
  {
    "quote": "If it doesn't challenge you, it won't change you.",
    "author": "Fred DeVito"
  },
  {
    "quote": "Get comfortable being uncomfortable.",
    "author": "Jillian Michaels"
  },
  {
    "quote": "The body achieves what the mind believes.",
    "author": "Anonymous"
  },
  {
    "quote": "Don't stop when you're tired. Stop when you're done.",
    "author": "David Goggins"
  },
  {
    "quote": "Motivation is crap. Motivation comes and goes.",
    "author": "David Goggins"
  },
  {
    "quote": "Be uncommon amongst uncommon people.",
    "author": "David Goggins"
  },
  {
    "quote": "You must build calluses on your brain.",
    "author": "David Goggins"
  },
  {
    "quote": "When you think you're done, you're only 40% there.",
    "author": "David Goggins"
  },
  {
    "quote": "Take souls.",
    "author": "David Goggins"
  }
];