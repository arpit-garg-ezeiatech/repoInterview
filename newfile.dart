void main() {
  const awards = [
  {
    'name': 'James Peebles',
    'category': 'Physics',
    'research': 'Theoretical discoveries in physical cosmology',
    'year': 2019,
  },
  {
    'name': 'Michel Mayor',
    'category': 'Physics',
    'research': 'Discovery of an exoplanet orbiting a solar-type star',
    'year': 2019,
  },
  {
    'name': 'Didier Queloz',
    'category': 'Physics',
    'research': 'Discovery of an exoplanet orbiting a solar-type star',
    'year': 2019,
  },
  {
    'name':'Akira Yoshino',
    'category': 'Chemistry',
    'research': 'Development of lithium-ion batteries',
    'year': 2019,
  },
  {
    'name': 'Arthur Ashkin',
    'category': 'Physics',
    'research': 'Optical tweezers and their application to biological systems',
    'year': 2018,
  },
  {
    'name': 'Gerard Mourou',
    'category': 'Physics',
    'research': 'Method of generating high-intensity, ultra-short optical pulses',
    'year': 2018,
  },
  {
    'name': 'Donna Strickland',
    'category': 'Physics',
'research': 'Method of generating high-intensity, ultra-short optical pulses',
    'year': 2018,
  },
  {
    'name': 'Frances H. Arnold',
    'category': 'Chemistry',
    'research': 'Directed evolution of enzymes',
    'year': 2018,
  },
  {
    'name': 'George P. Smith',
    'category': 'Chemistry',
    'research': 'Phage display of peptides and antibodies.',
    'year': 2018,
  },
  {
    'name': 'Sir Gregory P. Winter',
    'category': 'Chemistry',
    'research': 'Phage display of peptides and antibodies.',
    'year': 2018,
  },
];
  
  List<Winner> winners = [];
  for(int i = 0; i < awards.length;i++) {
    var award = awards[i];
    Winner winner = new Winner(award['name'].toString(),award['category'].toString(),award['research'].toString(),int.parse(award['year'].toString()));
    winners.add(winner);
  }
  winners.sort((winner1,winner2){
    return winner1.year.compareTo(winner2.year);
  });
  
  int arrayLength = winners.length;
  List<WinnerbyYC> winnersByYC = [];
  
  for(int i = 0; i < arrayLength;i++) {
    var winner = winners[i];
    var exists = winnersByYC.where((item) => item.year == winner.year && item.category == winner.category);
    if (exists.isEmpty) {
      winnersByYC.add(new WinnerbyYC(winner.year, winner.category, [winner]));
    } else {
      exists.first.winners.add(winner);
    }
  }
  
  for(int i = 0; i < winnersByYC.length;i++) {
    winnersByYC[i].winners.sort((a,b){
      return -a.research.compareTo(b.research);
    });
  }
  
  winnersByYC.sort((a,b){
    int yearComp = a.year.compareTo(b.year);
    if (yearComp == 0) {
      return a.category.compareTo(b.category); // '-' for descending
    }
    return yearComp;
  });
  for(int i = 0; i < winnersByYC.length;i++) {
    print(winnersByYC[i].year.toString() + "" + winnersByYC[i].category);
    for(int j = 0;j < winnersByYC[i].winners.length;j++) {
      print(winnersByYC[i].winners[j].research);
    }
  }
}

class Winner {
  String name;
  String category;
  String research;
  int year;
  
  Winner(this.name, this.category, this.research, this.year);
  
}

class WinnerbyYC {
  int year;
  String category;
  List<Winner> winners;
  WinnerbyYC(this.year, this.category, this.winners);
}
