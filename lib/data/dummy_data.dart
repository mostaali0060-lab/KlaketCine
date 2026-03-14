final List<Map<String, dynamic>> dummyData = [
  {
    'title': 'مسلسل الأمير',
    'poster':
        'https://image.tmdb.org/t/p/original/hqaW4C5AFeBLsuJ2NLzglwvvOyD.jpg',
    'genre': 'دراما',
    'year': '2014-2016',
    'rating': 7.5,
    'badge': 'حصري',
    'type': 'series',
  },
  {
    'title': 'مسلسل الهيبة',
    'poster':
        'https://image.tmdb.org/t/p/original/hqaW4C5AFeBLsuJ2NLzglwvvOyD.jpg',
    'genre': 'دراما',
    'year': '2017-2021',
    'rating': 7.9,
    'badge': 'جديد',
    'type': 'series',
  },
  {
    'title': 'مسلسل باب الحارة',
    'poster':
        'https://image.tmdb.org/t/p/original/hqaW4C5AFeBLsuJ2NLzglwvvOyD.jpg',
    'genre': 'دراما',
    'year': '2006-2022',
    'rating': 8.1,
    'badge': '',
    'type': 'series',
  },
  {
    'title': 'فيلم The Shawshank Redemption',
    'poster':
        'https://image.tmdb.org/t/p/w500/q6y0Go1tsGEsmtFryDOJo3dEmqEE.jpg',
    'genre': 'دراما',
    'year': '1994',
    'rating': 9.3,
    'badge': 'حصري',
    'type': 'movie', // Added type
    'video_servers': [
      {
        'name': 'سيرفر #1',
        'url': 'http://commondatastorage.googleapis.com/gtv-videos-bucket/sample/BigBuckBunny.mp4'
      },
      {
        'name': 'سيرفر #2',
        'url': 'http://commondatastorage.googleapis.com/gtv-videos-bucket/sample/BigBuckBunny.mp4'
      }
    ]
  },
  {
    'title': 'مسلسل Game of Thrones',
    'poster': 'https://image.tmdb.org/t/p/w500/u3bZgnGQ9T01sWNhyveQz0wH0Hl.jpg',
    'genre': 'فانتازيا',
    'year': '2011-2019',
    'rating': 9.2,
    'badge': 'جديد',
    'type': 'series',
  },
  {
    'title': 'فيلم The Godfather',
    'poster': 'https://image.tmdb.org/t/p/w500/3bhkrj58Vtu7enYsRolD1fZdja1.jpg',
    'genre': 'جريمة',
    'year': '1972',
    'rating': 9.2,
    'badge': '',
    'type': 'movie', // Added type
    'video_servers': [
      {
        'name': 'سيرفر #1',
        'url': 'http://commondatastorage.googleapis.com/gtv-videos-bucket/sample/BigBuckBunny.mp4'
      }
    ]
  },
  {
    'title': 'مسلسل Breaking Bad',
    'poster': 'https://image.tmdb.org/t/p/w500/ggFHVNu6YYI5L9pCfOacjizRGt.jpg',
    'genre': 'دراما',
    'year': '2008-2013',
    'rating': 9.5,
    'badge': 'ينتهي قريبا',
    'type': 'series',
  },
  {
    'title': 'فيلم The Dark Knight',
    'poster': 'https://image.tmdb.org/t/p/w500/qJ2tW6WMUDux911r6m7haRef0WH.jpg',
    'genre': 'أكشن',
    'year': '2008',
    'rating': 9.0,
    'badge': '',
    'type': 'movie', // Added type
    'video_servers': [
      {
        'name': 'سيرفر #1',
        'url': 'http://commondatastorage.googleapis.com/gtv-videos-bucket/sample/BigBuckBunny.mp4'
      }
    ]
  },
  {
    'title': 'مسلسل Friends',
    'poster': 'https://image.tmdb.org/t/p/w500/f496cm9enuEsZkSPzCwn9OIG6DF.jpg',
    'genre': 'كوميدي',
    'year': '1994-2004',
    'rating': 8.9,
    'badge': '',
    'type': 'series',
  },
];

const List<Map<String, dynamic>> recentlyAddedEpisodes = [
  {
    'series_title': 'مسلسل The Crown',
    'season_number': 5,
    'episode_number': 1,
    'thumbnail':
        'https://image.tmdb.org/t/p/w500/1O4T3aVEi0CVs3YJ1B5t2Q2IZ3x.jpg',
    'duration': '49:06',
    'date_added': '2026-03-05',
    'video_servers': [
      {
        'name': 'سيرفر #1',
        'url': 'http://commondatastorage.googleapis.com/gtv-videos-bucket/sample/BigBuckBunny.mp4'
      }
    ]
  },
  {
    'series_title': 'مسلسل Money Heist',
    'season_number': 5,
    'episode_number': 1,
    'thumbnail':
        'https://image.tmdb.org/t/p/w500/reEMJA1uzscCbkpeRJeTT2bjqUp.jpg',
    'duration': '36:44',
    'date_added': '2026-03-06',
    'video_servers': [
      {
        'name': 'سيرفر #1',
        'url': 'http://commondatastorage.googleapis.com/gtv-videos-bucket/sample/BigBuckBunny.mp4'
      }
    ]
  },
  {
    'series_title': 'مسلسل Stranger Things',
    'season_number': 4,
    'episode_number': 1,
    'thumbnail':
        'https://image.tmdb.org/t/p/w500/49WJfeN0moxb9IPfGn8AIqMGskD.jpg',
    'duration': '55:12',
    'date_added': '2026-03-07',
    'video_servers': [
      {
        'name': 'سيرفر #1',
        'url': 'http://commondatastorage.googleapis.com/gtv-videos-bucket/sample/BigBuckBunny.mp4'
      }
    ]
  },
  {
    'series_title': 'مسلسل The Witcher',
    'season_number': 3,
    'episode_number': 1,
    'thumbnail':
        'https://image.tmdb.org/t/p/w500/foGkPxpw9h8zUn82Y3p1CjDzA12.jpg',
    'duration': '42:18',
    'date_added': '2026-03-08',
    'video_servers': [
      {
        'name': 'سيرفر #1',
        'url': 'http://commondatastorage.googleapis.com/gtv-videos-bucket/sample/BigBuckBunny.mp4'
      }
    ]
  },
];

const seasonsData = [
  {
    "season_number": 1,
    "episodes_count": 20,
    "episodes": [
      {
        "episode_number": 1,
        "title": "بدايات جديدة",
        "description":
            "بعد حادث مأساوي، يضطر البطل إلى تغيير مسار حياته والبدء من جديد في مدينة غريبة.",
        "thumbnail":
            "https://image.tmdb.org/t/p/w500/gg2WdefC0G241aA8sS5M848gqf.jpg",
        'video_servers': [
          {
            'name': 'سيرفر #1',
            'url': 'http://commondatastorage.googleapis.com/gtv-videos-bucket/sample/BigBuckBunny.mp4'
          },
          {
            'name': 'سيرفر #2',
            'url': 'http://commondatastorage.googleapis.com/gtv-videos-bucket/sample/BigBuckBunny.mp4'
          }
        ]
      },
      {
        "episode_number": 2,
        "title": "أسرار الماضي",
        "description":
            "يظهر شخص من ماضي البطل، مهدداً بكشف أسرار قد تدمر كل ما بناه.",
        "thumbnail":
            "https://image.tmdb.org/t/p/w500/pHa5r5oApcpSCl2O0n1m3aROfLp.jpg",
        'video_servers': [
          {
            'name': 'سيرفر #1',
            'url': 'http://commondatastorage.googleapis.com/gtv-videos-bucket/sample/BigBuckBunny.mp4'
          }
        ]
      },
      {
        "episode_number": 3,
        "title": "الحلقة 3",
        "description": "وصف الحلقة.",
        "thumbnail":
            "https://image.tmdb.org/t/p/w500/pHa5r5oApcpSCl2O0n1m3aROfLp.jpg",
        'video_servers': [
          {
            'name': 'سيرفر #1',
            'url': 'http://commondatastorage.googleapis.com/gtv-videos-bucket/sample/BigBuckBunny.mp4'
          }
        ]
      },
      {
        "episode_number": 4,
        "title": "الحلقة 4",
        "description": "وصف الحلقة.",
        "thumbnail":
            "https://image.tmdb.org/t/p/w500/pHa5r5oApcpSCl2O0n1m3aROfLp.jpg",
        'video_servers': [
          {
            'name': 'سيرفر #1',
            'url': 'http://commondatastorage.googleapis.com/gtv-videos-bucket/sample/BigBuckBunny.mp4'
          }
        ]
      },
      {
        "episode_number": 5,
        "title": "الحلقة 5",
        "description": "وصف الحلقة.",
        "thumbnail":
            "https://image.tmdb.org/t/p/w500/pHa5r5oApcpSCl2O0n1m3aROfLp.jpg",
        'video_servers': [
          {
            'name': 'سيرفر #1',
            'url': 'http://commondatastorage.googleapis.com/gtv-videos-bucket/sample/BigBuckBunny.mp4'
          }
        ]
      },
      {
        "episode_number": 6,
        "title": "الحلقة 6",
        "description": "وصف الحلقة.",
        "thumbnail":
            "https://image.tmdb.org/t/p/w500/pHa5r5oApcpSCl2O0n1m3aROfLp.jpg",
        'video_servers': [
          {
            'name': 'سيرفر #1',
            'url': 'http://commondatastorage.googleapis.com/gtv-videos-bucket/sample/BigBuckBunny.mp4'
          }
        ]
      },
      {
        "episode_number": 7,
        "title": "الحلقة 7",
        "description": "وصف الحلقة.",
        "thumbnail":
            "https://image.tmdb.org/t/p/w500/pHa5r5oApcpSCl2O0n1m3aROfLp.jpg",
        'video_servers': [
          {
            'name': 'سيرفر #1',
            'url': 'http://commondatastorage.googleapis.com/gtv-videos-bucket/sample/BigBuckBunny.mp4'
          }
        ]
      },
      {
        "episode_number": 8,
        "title": "الحلقة 8",
        "description": "وصف الحلقة.",
        "thumbnail":
            "https://image.tmdb.org/t/p/w500/pHa5r5oApcpSCl2O0n1m3aROfLp.jpg",
        'video_servers': [
          {
            'name': 'سيرفر #1',
            'url': 'http://commondatastorage.googleapis.com/gtv-videos-bucket/sample/BigBuckBunny.mp4'
          }
        ]
      },
      {
        "episode_number": 9,
        "title": "الحلقة 9",
        "description": "وصف الحلقة.",
        "thumbnail":
            "https://image.tmdb.org/t/p/w500/pHa5r5oApcpSCl2O0n1m3aROfLp.jpg",
        'video_servers': [
          {
            'name': 'سيرفر #1',
            'url': 'http://commondatastorage.googleapis.com/gtv-videos-bucket/sample/BigBuckBunny.mp4'
          }
        ]
      },
      {
        "episode_number": 10,
        "title": "الحلقة 10",
        "description": "وصف الحلقة.",
        "thumbnail":
            "https://image.tmdb.org/t/p/w500/pHa5r5oApcpSCl2O0n1m3aROfLp.jpg",
        'video_servers': [
          {
            'name': 'سيرفر #1',
            'url': 'http://commondatastorage.googleapis.com/gtv-videos-bucket/sample/BigBuckBunny.mp4'
          }
        ]
      },
    ]
  },
  {
    "season_number": 2,
    "episodes_count": 30,
    "episodes": [
      {
        "episode_number": 1,
        "title": "عودة غير متوقعة",
        "description":
            "تبدأ أحداث الموسم الثاني بعودة شخصية رئيسية كان يُعتقد أنها اختفت إلى الأبد.",
        "thumbnail":
            "https://image.tmdb.org/t/p/w500/6LWy0jv3v3A3Jm2tL3P1h492gOJ.jpg",
        'video_servers': [
          {
            'name': 'سيرفر #1',
            'url': 'http://commondatastorage.googleapis.com/gtv-videos-bucket/sample/BigBuckBunny.mp4'
          }
        ]
      },
    ]
  },
];

const List<Map<String, String>> castData = [
  {
    'name': 'حمزة العيلي',
    'role': 'درويش',
    'image': 'https://image.tmdb.org/t/p/w500/A2L4r2B5gT7bVdC26G1Oa1gY5aT.jpg',
  },
  {
    'name': 'أسماء أبو اليزيد',
    'role': 'رسمية',
    'image': 'https://image.tmdb.org/t/p/w500/q9qJAmh2W3rGk3yv5QxVz7wO9Z6.jpg',
  },
  {
    'name': 'دنيا سامي',
    'role': 'عيشة',
    'image': 'https://image.tmdb.org/t/p/w500/g9fS42JFuA9m6IuK8KSTAb4tV29.jpg',
  },
  {
    'name': 'أحمد أمين',
    'role': 'عبدالعزيز النص',
    'image': 'https://image.tmdb.org/t/p/w500/2XTqJbwL54t9fM0c2iBfPAb2b6s.jpg',
  },
  {
    'name': 'صدقي صخر',
    'role': 'الصاع علوي',
    'image': 'https://image.tmdb.org/t/p/w500/7aFm7cSPERK2f9O22NAyV62x2pP.jpg',
  },
  {
    'name': 'عبدالرحمن محمد',
    'role': 'رزقوق',
    'image': 'https://image.tmdb.org/t/p/w500/iAhb2r2gR8rJigUvIe3h0AljLz7.jpg',
  },
  {
    'name': 'سامية الطرابلسي',
    'role': 'عزيزة',
    'image': 'https://image.tmdb.org/t/p/w500/4Zf8YgBDfG2y5u52fGvA6rELhAT.jpg',
  },
];

const List<Map<String, String>> crewData = [
  {
    'name': 'مخرج',
    'role': 'اسم المخرج',
    'image': 'https://via.placeholder.com/150/FFFFFF/000000?text=Director',
  },
  {
    'name': 'كاتب',
    'role': 'اسم الكاتب',
    'image': 'https://via.placeholder.com/150/FFFFFF/000000?text=Writer',
  },
  {
    'name': 'منتج',
    'role': 'اسم المنتج',
    'image': 'https://via.placeholder.com/150/FFFFFF/000000?text=Producer',
  },
];
