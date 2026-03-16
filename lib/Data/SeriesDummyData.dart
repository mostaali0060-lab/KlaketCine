final List<Map<String, dynamic>> SeriesDummyData = [
  // 1. باب الحارة (الموجود مسبقاً)
  {
    "ID": 1,
    "Title": "باب الحارة",
    "Poster": "assets/images/bab_alhara.jpg",
    "Story": "دراما شامية تدور أحداثها في عشرينيات القرن الماضي.",
    "Label": "كلاسيك",
    "Rating": 8.5,
    "Views": 1200000,
    "CommentsCount": 340,
    "Cast": [
      {"ID": 101, "Name": "عباس النوري", "Role": "أبو عصام", "imageUrl": "assets/images/abbas.jpg"},
      {"ID": 102, "Name": "بسام كوسا", "Role": "الإدعشري", "imageUrl": "assets/images/bassam.jpg"}
    ],
    "Crew": [
      {"ID": 201, "Name": "بسام الملا", "Role": "مخرج", "imageUrl": "assets/images/director.jpg"}
    ],
    "Seasons": [
      {
        "SeasonNumber": 1,
        "EpisodesCount": 30,
        "Episodes": [
          {
            "EpisodeNumber": 1,
            "Title": "الحلقة 1",
            "Duration": 45,
            "WatchServers": [{"Name": "Server 1", "Url": "https://example.com/w1"}],
            "DownloadServers": [{"Name": "Down 1", "Url": "https://example.com/d1"}]
          }
        ]
      }
    ]
  },

  // 2. الهيبة (أكشن/دراما)
  {
    "ID": 2,
    "Title": "الهيبة",
    "Poster": "assets/images/al_hayba.jpg",
    "Story": "تدور الأحداث في إطار من التشويق حول عائلة تسيطر على قرية حدودية.",
    "Label": "تريند",
    "Rating": 9.2,
    "Views": 2500000,
    "CommentsCount": 850,
    "Cast": [
      {"ID": 301, "Name": "تيم حسن", "Role": "جبل شيخ الجبل", "imageUrl": "assets/images/taim.jpg"},
      {"ID": 302, "Name": "منى واصف", "Role": "أم جبل", "imageUrl": "assets/images/mouna.jpg"}
    ],
    "Crew": [
      {"ID": 401, "Name": "سامر البرقاوي", "Role": "مخرج", "imageUrl": "assets/images/samer.jpg"}
    ],
    "Seasons": [
      {
        "SeasonNumber": 1,
        "EpisodesCount": 30,
        "Episodes": [
          {
            "EpisodeNumber": 1,
            "Title": "العودة",
            "Duration": 40,
            "WatchServers": [{"Name": "Fast Server", "Url": "https://example.com/h1"}],
            "DownloadServers": [{"Name": "HD Download", "Url": "https://example.com/hd1"}]
          }
        ]
      }
    ]
  },

  // 3. أرطغرل (تاريخي)
  {
    "ID": 3,
    "Title": "قيامة أرطغرل",
    "Poster": "assets/images/ertugrul.jpg",
    "Story": "ملحمة تاريخية عن تأسيس الدولة العثمانية وصراعات القبائل.",
    "Label": "الأكثر مشاهدة",
    "Rating": 9.5,
    "Views": 5000000,
    "CommentsCount": 1200,
    "Cast": [
      {"ID": 501, "Name": "إنجين ألتان", "Role": "أرطغرل", "imageUrl": "assets/images/engin.jpg"},
      {"ID": 502, "Name": "إسراء بيلجيتش", "Role": "حليمة", "imageUrl": "assets/images/esra.jpg"}
    ],
    "Crew": [
      {"ID": 601, "Name": "محمد بوزداغ", "Role": "منتج ومؤلف", "imageUrl": "assets/images/bozdag.jpg"}
    ],
    "Seasons": [
      {
        "SeasonNumber": 1,
        "EpisodesCount": 150,
        "Episodes": [
          {
            "EpisodeNumber": 1,
            "Title": "بداية الرحلة",
            "Duration": 120,
            "WatchServers": [{"Name": "Main Server", "Url": "https://example.com/e1"}],
            "DownloadServers": [{"Name": "4K", "Url": "https://example.com/e1_4k"}]
          }
        ]
      }
    ]
  },

  // 4. الاختيار (وطني/دراما)
  {
    "ID": 4,
    "Title": "الاختيار",
    "Poster": "assets/images/al_ikhtiyar.jpg",
    "Story": "يتناول العمل بطولات القوات المسلحة المصرية وتضحياتهم.",
    "Label": "جديد",
    "Rating": 8.9,
    "Views": 1800000,
    "CommentsCount": 600,
    "Cast": [
      {"ID": 701, "Name": "أحمد كمال", "Role": "أحمد منسي", "imageUrl": "assets/images/ahmed.jpg"},
      {"ID": 702, "Name": "أمير كرارة", "Role": "سليم الأنصاري", "imageUrl": "assets/images/amir.jpg"}
    ],
    "Crew": [
      {"ID": 801, "Name": "بيتر ميمي", "Role": "مخرج", "imageUrl": "assets/images/peter.jpg"}
    ],
    "Seasons": [
      {
        "SeasonNumber": 1,
        "EpisodesCount": 30,
        "Episodes": [
          {
            "EpisodeNumber": 1,
            "Title": "الحلقة الأولى",
            "Duration": 42,
            "WatchServers": [{"Name": "Server 1", "Url": "https://example.com/v1"}],
            "DownloadServers": [{"Name": "1080p", "Url": "https://example.com/v1_high"}]
          }
        ]
      }
    ]
  },

  // 5. موضوع عائلي (كوميدي/اجتماعي)
  {
    "ID": 5,
    "Title": "موضوع عائلي",
    "Poster": "assets/images/family_matter.jpg",
    "Story": "شيف يكتشف فجأة أن لديه ابنة شابة، ويحاول رعايتها في إطار كوميدي.",
    "Label": "كوميدي",
    "Rating": 9.0,
    "Views": 900000,
    "CommentsCount": 450,
    "Cast": [
      {"ID": 901, "Name": "ماجد الكدواني", "Role": "إبراهيم", "imageUrl": "assets/images/majed.jpg"},
      {"ID": 902, "Name": "طه دسوقي", "Role": "حسن", "imageUrl": "assets/images/taha.jpg"}
    ],
    "Crew": [
      {"ID": 1001, "Name": "أحمد الجندي", "Role": "مخرج", "imageUrl": "assets/images/ahmed_g.jpg"}
    ],
    "Seasons": [
      {
        "SeasonNumber": 1,
        "EpisodesCount": 10,
        "Episodes": [
          {
            "EpisodeNumber": 1,
            "Title": "المفاجأة",
            "Duration": 35,
            "WatchServers": [{"Name": "Stream", "Url": "https://example.com/f1"}],
            "DownloadServers": [{"Name": "Save", "Url": "https://example.com/f1_save"}]
          }
        ]
      }
    ]
  }
];