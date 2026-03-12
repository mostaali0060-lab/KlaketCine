class DummyData {
  DummyData._();

  static const List<Map<String, dynamic>> featuredHero = [
    {
      "id": 1,
      "title": "باب الحارة",
      "poster": "assets/poster.jpg",
      "rating": 8.1,
      "genre": "اجتماعي",
      "year": "2006",
    },
    {
      "id": 2,
      "title": "الحشاشين",
      "poster": "assets/poster.jpg",
      "rating": 8.5,
      "genre": "تاريخي",
      "year": "2024",
    },
    {
       "id": 3,
      "title": "الاختيار",
      "poster": "assets/poster.jpg",
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
      "poster": "assets/poster.jpg",
      "rating": 6.5,
      "badge": "جديد",
    },
    {
      "id": 102,
      "title": "المداح",
      "poster": "assets/poster.jpg",
      "rating": 7.2,
      "badge": "HD",
    },
    {
      "id": 103,
      "title": "موسى",
      "poster": "assets/poster.jpg",
      "rating": 6.8,
      "badge": "",
    },
    {
      "id": 104,
      "title": "خيانة عهد",
      "poster": "assets/poster.jpg",
      "rating": 7.5,
      "badge": "حصري",
    },
    {
      "id": 105,
      "title": "ولاد رزق",
      "poster": "assets/poster.jpg",
      "rating": 8.0,
      "badge": "شائع",
    },
    {
      "id": 106,
      "title": "بيت الروبي",
      "poster": "assets/poster.jpg",
      "rating": 7.0,
      "badge": "",
    }
  ];

  static const Map<String, dynamic> seriesDetailsInfo = {
    "id": 1,
    "title": "باب الحارة",
    "en_title": "Bab Al Hara",
    "poster": "assets/poster.jpg",
    "cover": "assets/poster.jpg",
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
    {"id": 1, "number": 1, "title": "مولد أبو عصام", "duration": "45 دقيقة", "image": "assets/poster.jpg"},
    {"id": 2, "number": 2, "title": "الزعيم والعكيد", "duration": "42 دقيقة", "image": "assets/poster.jpg"},
    {"id": 3, "number": 3, "title": "خلاف مع الفرنساوي", "duration": "48 دقيقة", "image": "assets/poster.jpg"},
    {"id": 4, "number": 4, "title": "مشكلة الإدعشري", "duration": "43 دقيقة", "image": "assets/poster.jpg"},
    {"id": 5, "number": 5, "title": "عودة أبو شهاب", "duration": "46 دقيقة", "image": "assets/poster.jpg"},
    {"id": 6, "number": 6, "title": "زواج معتز", "duration": "41 دقيقة", "image": "assets/poster.jpg"},
    {"id": 7, "number": 7, "title": "مؤامرة جديدة", "duration": "44 دقيقة", "image": "assets/poster.jpg"},
    {"id": 8, "number": 8, "title": "كشف الحقيقة", "duration": "47 دقيقة", "image": "assets/poster.jpg"},
    {"id": 9, "number": 9, "title": "أبو عصام في خطر", "duration": "40 دقيقة", "image": "assets/poster.jpg"},
    {"id": 10, "number": 10, "title": "نهاية الإدعشري", "duration": "49 دقيقة", "image": "assets/poster.jpg"}
  ];
}
