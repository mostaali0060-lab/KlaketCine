class DummyData {
  DummyData._();

  static const List<Map<String, dynamic>> featuredHero = [
    {
      "id": 1,
      "title": "باب الحارة",
      "poster": "https://images.weserv.nl/?url=image.tmdb.org/t/p/w600_and_h900_bestv2/vE2f6e9G01X1T6Zg3R2X3D9c2V0.jpg",
      "rating": 8.1,
      "genre": "اجتماعي",
      "year": "2006",
    },
    {
      "id": 2,
      "title": "الحشاشين",
      "poster": "https://media0098.elcinema.com/uploads/_640x_5e63538378f7b0d968ce42c094d076a861230aba2fc885507139e21e6052c1fa.jpg",
      "rating": 8.5,
      "genre": "تاريخي",
      "year": "2024",
    },
    {
       "id": 3,
      "title": "الاختيار",
      "poster": "https://images.weserv.nl/?url=image.tmdb.org/t/p/w600_and_h900_bestv2/c9VzXoI2r8h2q1lO16Y0XQ2Zq62.jpg",
      "rating": 9.0,
      "genre": "أكشن",
      "year": "2020",
    }
  ];

  static const List<String> categories = [
    "الكل", "دراما", "أكشن", "كوميدي", "إثارة", "رعب", "تاريخي"
  ];

  static const List<Map<String, dynamic>> moviesList = [
    {
      "id": 101,
      "title": "أبو البنات",
      "poster": "https://images.weserv.nl/?url=image.tmdb.org/t/p/w200/2L2D48GowI3o8rJg84sP521tGZg.jpg",
      "rating": 6.5,
      "badge": "جديد",
    },
    {
      "id": 102,
      "title": "المداح",
      "poster": "https://images.weserv.nl/?url=image.tmdb.org/t/p/w200/9b9X36c1p2q31Vw1H0l12F6e3o2.jpg",
      "rating": 7.2,
      "badge": "HD",
    },
    {
      "id": 103,
      "title": "موسى",
      "poster": "https://images.weserv.nl/?url=image.tmdb.org/t/p/w200/xV7E4Z7w6x1E0e2K3f1k2V2y6c7.jpg",
      "rating": 6.8,
      "badge": "",
    },
    {
      "id": 104,
      "title": "خيانة عهد",
      "poster": "https://images.weserv.nl/?url=image.tmdb.org/t/p/w200/v4B0U0A9I0n1d5J8q6G5o8S1x2v.jpg",
      "rating": 7.5,
      "badge": "حصري",
    },
    {
      "id": 105,
      "title": "ولاد رزق",
      "poster": "https://images.weserv.nl/?url=image.tmdb.org/t/p/w200/7r2zBtvZJqWwT0X8n45B0uS5L0l.jpg",
      "rating": 8.0,
      "badge": "شائع",
    },
    {
      "id": 106,
      "title": "بيت الروبي",
      "poster": "https://images.weserv.nl/?url=image.tmdb.org/t/p/w200/wB1B4N1dCZZC5R60Jc4H11nCq62.jpg",
      "rating": 7.0,
      "badge": "",
    }
  ];

  static const Map<String, dynamic> seriesDetailsInfo = {
    "id": 1,
    "title": "باب الحارة",
    "en_title": "Bab Al Hara",
    "poster": "https://image.tmdb.org/t/p/w600_and_h900_bestv2/qJ2tW6WMUDux911r6m7haRef0WH.jpg", // Using a placeholder that fills
    "cover": "https://images.unsplash.com/photo-1542204165-65bf26472b9b?auto=format&fit=crop&q=80&w=400&h=600", // Similar to the laptop table in screenshot
    "year": "2026",
    "country": "سوريا",
    "status": "جاري العرض",
    "rating": 8.1,
    "views": "43.8K",
    "comments": "22",
    "episodes_count": 30,
    "story": "حياة سكان حارة شعبية دمشقية في زمن الانتداب الفرنسي",
  };

  static const List<Map<String, dynamic>> seasonsInfo = [
    {
      "id": 1,
      "title": "الموسم 1",
      "episodes_count": 20,
    },
    {
      "id": 2,
      "title": "الموسم 2",
      "episodes_count": 30,
    },
    {
      "id": 3,
      "title": "الموسم 3",
      "episodes_count": 25,
    },
  ];

  static const List<Map<String, dynamic>> episodes = [
    {"id": 1, "number": 1},
    {"id": 2, "number": 2},
    {"id": 3, "number": 3},
    {"id": 4, "number": 4},
    {"id": 5, "number": 5},
    {"id": 6, "number": 6},
    {"id": 7, "number": 7},
    {"id": 8, "number": 8},
    {"id": 9, "number": 9},
    {"id": 10, "number": 10},
  ];
}
