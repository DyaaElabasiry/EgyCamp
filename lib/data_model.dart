class Camp {
  final int id;
  final String campImgUrl;
  final String title;
  final String description;
  final String city;
  final bool isTrending;
  final bool isOffer;
  final String dollarPrice;
  final String egyPrice;
  final List<String> properties;
  final List<Day> days;
  final String creationDate;
  final DateTime startDate;
  final DateTime endDate;

  Camp({
    required this.id,
    required this.campImgUrl,
    required this.title,
    required this.description,
    required this.city,
    required this.isTrending,
    required this.isOffer,
    required this.dollarPrice,
    required this.egyPrice,
    required this.properties,
    required this.days,
    required this.creationDate,
    required this.startDate,
    required this.endDate,
  });
  Map<String, dynamic> toJson() {
    return {
      'Id': id,
      'campImgUrl': campImgUrl,
      'Title': title,
      'Description': description,
      'City': city,
      'isTrending': isTrending,
      'isOffer': isOffer,
      'dollarPrice': dollarPrice,
      'egyPrice': egyPrice,
      'properties': properties,
      'Days': days.map((day) => day.toJson()).toList(),
      'creationDate': creationDate,
      'startDate': startDate.toString(),
      'endDate': endDate.toString(),
    };
  }

  // Create a Camp object from a JSON map.
  static Camp fromJson(Map<String, dynamic> json) {
    return Camp(
      id: json['id'],
      campImgUrl: json['campImgUrl'],
      title: json['Title'],
      description: json['Description'],
      city: json['City'],
      isTrending: json['isTrending'],
      isOffer: json['isOffer'],
      dollarPrice: json['dollarPrice'],
      egyPrice: json['egyPrice'],
      properties: List<String>.from(json['properties']),
      days: (json['Days'] as List).map((i) => Day.fromJson(i)).toList(),
      creationDate: json['creationDate'],
      startDate: DateTime.parse(json['startDate']),
      endDate: DateTime.parse(json['endDate']),
    );
  }

}

class Day {
  final int id;
  final String title;
  final String imageUrl;
  final List<String> description;

  Day({
    required this.id,
    required this.title,
    required this.imageUrl,
    required this.description,
  });

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'Title': title,
      'ImageUrl': imageUrl,
      'Description': description,
    };
  }

  // Create a Day object from a JSON map.
  static Day fromJson(Map<String, dynamic> json) {
    return Day(
      id: json['id'],
      title: json['Title'],
      imageUrl: json['ImageUrl'],
      description: List<String>.from(json['Description']),
    );
  }


}

List<int> findAnomaly(List<Map<String,dynamic>> data) {
  List<int> result = [];
  for (int i = 0; i < data.length; i++) {

    if(data[i]["City"] == null || data[i]["Description"] == null || data[i]["Title"] == null || data[i]["campImgUrl"] == null || data[i]["id"] == null || data[i]["isTrending"] == null || data[i]["isOffer"] == null || data[i]["dollarPrice"] == null || data[i]["egyPrice"] == null || data[i]["properties"] == null || data[i]["Days"] == null || data[i]["creationDate"] == null || data[i]["startDate"] == null || data[i]["endDate"] == null){
      result.add(i);
    }
  }
  return result;
}


List<Map<String,dynamic>> data = [
  {
    "id": 1,
    "campImgUrl":
        "https://i.postimg.cc/sXmqwSz3/2023-11-27-20-32-13-ba885693.jpg",
    "Title": "Dolphin Camp",
    "Description":
        "It is located in the 'Dolphin Camp' location in the city of Dahab, located in South Sinai, less than 1 km from Dahab Beach. It is a place that provides free Wi-Fi, access to a private area, and free private parking.",
    "City": "Sinai",
    "isTrending": true,
    "isOffer": false,
    "dollarPrice": "100",
    "egyPrice": "1000",
    "properties": [
      "Free parking",
      "Free wifi",
      "Non-smoking rooms",
      "Facing the beach",
      "Private beach area"
    ],
    "Days": [
      {
        "id": 1,
        "Title": "Day1",
        "ImageUrl":
            "https://i.postimg.cc/VvpRR97r/2023-11-27-20-32-13-7028e060.jpg",
        "Description": [
          "Accommodation in rooms",
          "BBQ parties",
          "Summer parties"
        ]
      },
      {
        "id": 2,
        "Title": "Day2",
        "ImageUrl":
            "https://i.postimg.cc/K8v4jw70/2023-11-27-20-32-13-831a4499.jpg",
        "Description": [
          "Bathing in salt lakes",
          "Camping on mountain peaks",
          "Enjoying watching the sunset"
        ]
      },
      {
        "id": 3,
        "Title": "Day3",
        "ImageUrl":
            "https://i.postimg.cc/2ybFs3yB/2023-11-27-20-32-14-7fac7ff9.jpg",
        "Description": ["Free tours"]
      }
    ],
    "creationDate": "2023-12-04T15:30:00Z",
    "startDate": "2024-01-04T09:00:00Z",
    "endDate": "2024-01-07T09:00:00Z"
  },
  {
    "id": 2,
    "campImgUrl": "https://i.postimg.cc/BvRhVwDS/1.jpg",
    "Title": "Elrayga Camp Dahab",
    "Description":
        "Located in Dahab, 400 meters from Dahab Beach and 90 meters from Senai Divers and Backpackers, Elrayga Camp Dahab provides accommodation with free WiFi, air conditioning, a shared lounge and a garden. The camping offers barbecue facilities.",
    "City": "Sinai",
    "isTrending": false,
    "isOffer": true,
    "dollarPrice": "90",
    "egyPrice": "2500",
    "properties": [
      "Free parking",
      "Free wifi",
      "Non-smoking rooms",
      "Facing the beach",
      "Private beach area",
      "Airport shuttle service"
    ],
    "Days": [
      {
        "id": 1,
        "Title": "Day1",
        "ImageUrl": "https://i.postimg.cc/QtpqnNhm/2.jpg",
        "Description": [
          "Accommodation in rooms",
          "BBQ parties",
          "Summer parties"
        ]
      },
      {
        "id": 2,
        "Title": "Day2",
        "ImageUrl": "https://i.postimg.cc/43cvm47G/3.jpg",
        "Description": [
          "Bathing in salt lakes",
          "Camping on mountain peaks",
          "Enjoying watching the sunset"
        ]
      },
      {
        "id": 3,
        "Title": "Day3",
        "ImageUrl": "https://i.postimg.cc/8cZMqj3R/4.jpg",
        "Description": ["Free tours"]
      }
    ],
    "creationDate": "2023-12-04T15:30:00Z",
    "startDate": "2024-01-10T09:00:00Z",
    "endDate": "2024-01-13T09:00:00Z"
  },
  {
    "id": 3,
    "campImgUrl": "https://i.postimg.cc/pd09Wgkv/penguin1.jpg",
    "Title": "Penguin Village Dahab",
    "Description":
        "Penguin Village Dahab is located in the heart of Dahab, overlooking the Gulf of Aqaba. The hotel offers air-conditioned rooms with a balcony and free Wi-Fi. Water sports are also available for an additional fee.",
    "City": "Sinai",
    "isTrending": true,
    "isOffer": false,
    "dollarPrice": "95",
    "egyPrice": "2400",
    "properties": [
      "Free parking",
      "Free wifi",
      "Non-smoking rooms",
      "Facing the beach",
      "Private beach area",
      "Restaurant"
    ],
    "Days": [
      {
        "id": 1,
        "Title": "Day1",
        "ImageUrl": "https://i.postimg.cc/HLPxDbss/penguin2.jpg",
        "Description": [
          "Accommodation in rooms",
          "BBQ parties",
          "Summer parties"
        ]
      },
      {
        "id": 2,
        "Title": "Day2",
        "ImageUrl": "https://i.postimg.cc/Xqg630cc/penguin3.jpg",
        "Description": [
          "Bathing in salt lakes",
          "Camping on mountain peaks",
          "Enjoying watching the sunset"
        ]
      },
      {
        "id": 3,
        "Title": "Day3",
        "ImageUrl": "https://i.postimg.cc/J0pYP75g/penguin4.jpg",
        "Description": ["Free tours"]
      }
    ],
    "creationDate": "2023-12-04T15:30:00Z",
    "startDate": "2024-01-07T09:00:00Z",
    "endDate": "2024-01-10T09:00:00Z"
  },
  {
    "id": 4,
    "campImgUrl": "https://i.postimg.cc/zfphLLz9/station1.jpg",
    "Title": "Station House",
    "Description":
        "Located in Dahab, within 1.5 km of Dahab Beach, Station House Apartment provides accommodation with free WiFi and a flat-screen TV.",
    "City": "Sinai",
    "isTrending": false,
    "isOffer": true,
    "dollarPrice": "50",
    "egyPrice": "1500",
    "properties": [
      "Free parking",
      "Free wifi",
      "Non-smoking rooms",
      "Restaurant"
    ],
    "Days": [
      {
        "id": 1,
        "Title": "Day1",
        "ImageUrl": "https://i.postimg.cc/664hP05q/station2.jpg",
        "Description": [
          "Accommodation in rooms",
          "BBQ parties",
          "Summer parties"
        ]
      },
      {
        "id": 2,
        "Title": "Day2",
        "ImageUrl": "https://i.postimg.cc/50Y8Z4JT/station3.jpg",
        "Description": [
          "Bathing in salt lakes",
          "Camping on mountain peaks",
          "Enjoying watching the sunset"
        ]
      },
      {
        "id": 3,
        "Title": "Day3",
        "ImageUrl": "https://i.postimg.cc/RCtcdZXn/station4.jpg",
        "Description": ["Free tours"]
      }
    ],
    "creationDate": "2023-12-04T15:30:00Z",
    "startDate": "2024-01-10T09:00:00Z",
    "endDate": "2024-01-13T09:00:00Z"
  },
  {
    "id": 5,
    "campImgUrl": "https://i.postimg.cc/85YjW9FS/oasis-f-k-1.jpg",
    "Title": "Oasis Fighting Kangaroo",
    "Description":
        "Located in the heart of Dahab, less than a minute's walk from the beach, it offers accommodation featuring simple but clean budget rooms with ceiling fans and shared bathroom facilities. Some rooms have air conditioning and en suite showers.",
    "City": "Sinai",
    "isTrending": true,
    "isOffer": false,
    "dollarPrice": "120",
    "egyPrice": "5000",
    "properties": [
      "Free parking",
      "Free wifi",
      "Non-smoking rooms",
      "Facing the beach",
      "Private beach area",
      "Restaurant",
      "Family rooms"
    ],
    "Days": [
      {
        "id": 1,
        "Title": "Day1",
        "ImageUrl": "https://i.postimg.cc/QxmVJFKm/oasis-f-k-2.jpg",
        "Description": [
          "Accommodation in rooms",
          "BBQ parties",
          "Summer parties"
        ]
      },
      {
        "id": 2,
        "Title": "Day2",
        "ImageUrl": "https://i.postimg.cc/90JVZqgq/oasis-f-k-3.jpg",
        "Description": [
          "Bathing in salt lakes",
          "Camping on mountain peaks",
          "Enjoying watching the sunset"
        ]
      },
      {
        "id": 3,
        "Title": "Day3",
        "ImageUrl": "https://i.postimg.cc/1tsLB3q0/oasis-f-k-5.jpg",
        "Description": ["Free tours"]
      }
    ],
    "creationDate": "2023-12-04T15:30:00Z",
    "startDate": "2024-01-25T09:00:00Z",
    "endDate": "2024-01-28T09:00:00Z"
  },
  {
    "id": 6,
    "campImgUrl": "https://i.postimg.cc/Y0PZtqLF/oasis-4.jpg",
    "Title": "Oasis Panorama Hotel",
    "Description":
        "Located in Bawiti, Oasis Panorama Hotel offers 2-star accommodation with a garden, a restaurant, and a bar. There is free private parking and the property provides paid airport shuttle service.",
    "City": "Bahariya Oasis",
    "isTrending": false,
    "isOffer": true,
    "dollarPrice": "75",
    "egyPrice": "2500",
    "properties": [
      "Free parking",
      "Free wifi",
      "Non-smoking rooms",
      "Family rooms",
      "Room service",
      "Restaurant"
    ],
    "Days": [
      {
        "id": 1,
        "Title": "Day1",
        "ImageUrl": "https://i.postimg.cc/C5BTB689/oasis-p-h-2.jpg",
        "Description": [
          "Accommodation in rooms",
          "BBQ parties",
          "Summer parties"
        ]
      },
      {
        "id": 2,
        "Title": "Day2",
        "ImageUrl": "https://i.postimg.cc/Qd7Gx5bd/oasis-3.jpg",
        "Description": [
          "Bathing in salt lakes",
          "Camping on mountain peaks",
          "Enjoying watching the sunset"
        ]
      },
      {
        "id": 3,
        "Title": "Day3",
        "ImageUrl": "https://i.postimg.cc/1z9kcz6G/oasis-p-h-4.jpg",
        "Description": ["Free tours"]
      }
    ],
    "creationDate": "2023-12-04T15:30:00Z",
    "startDate": "2024-01-07T09:00:00Z",
    "endDate": "2024-01-10T09:00:00Z"
  },
  {
    "id": 7,
    "campImgUrl": "https://i.postimg.cc/N0Pz6jbz/stars-1.jpg",
    "Title": "Stars Camp Oasis",
    "Description":
        "Stars camp oasis is a sustainable campground in Bawiti, where guests can make the most of its garden and terrace. Featuring mountain and inner courtyard views, this campground also includes free WiFi.",
    "City": "Bahariya Oasis",
    "isTrending": true,
    "isOffer": false,
    "dollarPrice": "75",
    "egyPrice": "2500",
    "properties": [
      "Free wifi",
      "Non-smoking rooms",
      "Family rooms",
      "Room service",
      "Breakfast",
      "Swimming pool"
    ],
    "Days": [
      {
        "id": 1,
        "Title": "Day1",
        "ImageUrl": "https://i.postimg.cc/DZn8c7Z1/stars-2.jpg",
        "Description": [
          "Accommodation in rooms",
          "BBQ parties",
          "Summer parties"
        ]
      },
      {
        "id": 2,
        "Title": "Day2",
        "ImageUrl": "https://i.postimg.cc/C1RL7d0B/stars-3.jpg",
        "Description": [
          "Bathing in salt lakes",
          "Camping on mountain peaks",
          "Enjoying watching the sunset"
        ]
      },
      {
        "id": 3,
        "Title": "Day3",
        "ImageUrl": "https://i.postimg.cc/3NCMFHk0/stars-4.jpg",
        "Description": ["Free tours"]
      }
    ],
    "creationDate": "2023-12-04T15:30:00Z",
    "startDate": "2024-01-25T09:00:00Z",
    "endDate": "2024-01-28T09:00:00Z"
  },
  {
    "id": 8,
    "campImgUrl": "https://i.postimg.cc/tJbwTmBq/western-1.jpg",
    "Title": "Western Desert Safari",
    "Description":
        "Situated in Bawiti in the Giza Governorate region, Western desert safari features accommodation with free private parking.",
    "City": "Bahariya Oasis",
    "isTrending": true,
    "isOffer": false,
    "dollarPrice": "80",
    "egyPrice": "3000",
    "properties": ["Free parking", "Family rooms", "Breakfast"],
    "Days": [
      {
        "id": 1,
        "Title": "Day1",
        "ImageUrl": "https://i.postimg.cc/PrxK4jvG/western-2.jpg",
        "Description": [
          "Accommodation in rooms",
          "BBQ parties",
          "Summer parties"
        ]
      },
      {
        "id": 2,
        "Title": "Day2",
        "ImageUrl": "https://i.postimg.cc/YSw1JK0C/western-3.jpg",
        "Description": [
          "Bathing in salt lakes",
          "Camping on mountain peaks",
          "Enjoying watching the sunset"
        ]
      },
      {
        "id": 3,
        "Title": "Day3",
        "ImageUrl": "https://i.postimg.cc/0NxwVYX6/western3.jpg",
        "Description": ["Free tours"]
      }
    ],
    "creationDate": "2023-12-04T15:30:00Z",
    "startDate": "2024-01-16T09:00:00Z",
    "endDate": "2024-01-19T09:00:00Z"
  },
  {
    "id": 9,
    "campImgUrl": "https://i.postimg.cc/hGdKQ61T/EL-CAMEL-1.jpg",
    "Title": "El CAMEL HOTEL",
    "Description":
        "El CAMEL HOTEL is situated in Bawiti. This apartment has a private pool, a garden and free private parking. This apartment will provide guests with 1 bedroom, a flat-screen TV, and air conditioning. The property offers garden views.",
    "City": "Bahariya Oasis",
    "isTrending": true,
    "isOffer": false,
    "dollarPrice": "100",
    "egyPrice": "4000",
    "properties": ["Family rooms", "swimming pool", "breakfast", "Restaurants"],
    "Days": [
      {
        "id": 1,
        "Title": "Day1",
        "ImageUrl": "https://i.postimg.cc/TYNx7fkn/EL-CAMEL-2.jpg",
        "Description": [
          "Accommodation in rooms",
          "BBQ parties",
          "Summer parties"
        ]
      },
      {
        "id": 2,
        "Title": "Day2",
        "ImageUrl": "https://i.postimg.cc/RhPkDLTv/EL-CAMEL-3.jpg",
        "Description": [
          "Bathing in salt lakes",
          "camping on mountain peaks",
          "enjoying watching the sunset"
        ]
      },
      {
        "id": 3,
        "Title": "Day3",
        "ImageUrl": "https://i.postimg.cc/KvwV3zqp/EL-CAMEL-4.jpg",
        "Description": ["Free tours"]
      }
    ],
    "creationDate": "2023-12-04T15:30:00Z",
    "startDate": "2024-01-19T09:00:00Z",
    "endDate": "2024-01-22T09:00:00Z"
  },
  {
    "id": 10,
    "campImgUrl": "https://i.postimg.cc/VNLH3Cd6/ESCAPE1.jpg",
    "Title": "Escape Camp",
    "Description":
        "Escape Camp is set in Bawiti and offers a bar. This property offers access to a terrace and free private parking. Outdoor dining is also possible at the luxury tent. Guests at Escape Camp will be able to enjoy activities in and around Bawiti, like walking tours.",
    "City": "Bahariya Oasis",
    "isTrending": true,
    "isOffer": false,
    "dollarPrice": "90",
    "egyPrice": "3000",
    "properties": ["breakfast", "bar", "free parking"],
    "Days": [
      {
        "id": 1,
        "Title": "Day1",
        "ImageUrl": "https://i.postimg.cc/fRMH997K/ESCAPE2.jpg",
        "Description": [
          "Accommodation in rooms",
          "BBQ parties",
          "Summer parties"
        ]
      },
      {
        "id": 2,
        "Title": "Day2",
        "ImageUrl": "https://i.postimg.cc/Vk7F0Hkf/ESCAPE-3.jpg",
        "Description": [
          "Bathing in salt lakes",
          "camping on mountain peaks",
          "enjoying watching the sunset"
        ]
      },
      {
        "id": 3,
        "Title": "Day3",
        "ImageUrl": "https://i.postimg.cc/qqdcHPjL/ESCAPE-4.jpg",
        "Description": ["Free tours"]
      }
    ],
    "creationDate": "2023-12-04T15:30:00Z",
    "startDate": "2024-01-13T09:00:00Z",
    "endDate": "2024-01-16T09:00:00Z"
  },
  {
    "id": 11,
    "campImgUrl": "https://i.postimg.cc/8cHvQjFp/tzila1.jpg",
    "Title": "Tzila Lodge",
    "Description":
        "Tunis village Villa is located in the center of Fayoum. The property is 150 km from Cairo.",
    "City": "Fayoum",
    "isTrending": false,
    "isOffer": true,
    "dollarPrice": "50",
    "egyPrice": "1500",
    "properties": [
      "swimming pool",
      "restaurant",
      "free parking",
      "Family rooms",
      "breakfast"
    ],
    "Days": [
      {
        "id": 1,
        "Title": "Day1",
        "ImageUrl": "https://i.postimg.cc/qvg3SBpr/tzila-2.jpg",
        "Description": [
          "Accommodation in rooms",
          "BBQ parties",
          "Summer parties"
        ]
      },
      {
        "id": 2,
        "Title": "Day2",
        "ImageUrl": "https://i.postimg.cc/y8JDnfTY/tzila-3.jpg",
        "Description": [
          "Bathing in salt lakes",
          "camping on mountain peaks",
          "enjoying watching the sunset"
        ]
      },
      {
        "id": 3,
        "Title": "Day3",
        "ImageUrl": "https://i.postimg.cc/KjvzTQzb/tzila-4.jpg",
        "Description": ["Free tours"]
      }
    ],
    "creationDate": "2023-12-04T15:30:00Z",
    "startDate": "2024-01-13T09:00:00Z",
    "endDate": "2024-01-16T09:00:00Z"
  },
  {
    "id": 12,
    "campImgUrl": "https://i.postimg.cc/zvtfFWbg/tunis-1.jpg",
    "Title": "Tunis Camp Fayoum",
    "Description":
        "Located in Fayoum Centre, Tunis Tony provides free WiFi, and guests can enjoy a restaurant, a bar, and a garden. If you would like to discover the area, cycling is possible in the surroundings, and the property can arrange a bicycle rental service.",
    "City": "Fayoum",
    "isTrending": true,
    "isOffer": false,
    "dollarPrice": "100",
    "egyPrice": "3000",
    "properties": [
      "swimming pool",
      "restaurant",
      "free parking",
      "Family rooms",
      "breakfast",
      "Airport transfer service (free)",
      "Room service",
      "Free wifi",
      "Non-smoking rooms"
    ],
    "Days": [
      {
        "id": 1,
        "Title": "Day1",
        "ImageUrl": "https://i.postimg.cc/wTMMTWZc/tunis-2.jpg",
        "Description": [
          "Accommodation in rooms",
          "BBQ parties",
          "Summer parties"
        ]
      },
      {
        "id": 2,
        "Title": "Day2",
        "ImageUrl": "https://i.postimg.cc/436NFjHZ/tunis-3.jpg",
        "Description": [
          "Bathing in salt lakes",
          "camping on mountain peaks",
          "enjoying watching the sunset"
        ]
      },
      {
        "id": 3,
        "Title": "Day3",
        "ImageUrl": "https://i.postimg.cc/Dws28Rgs/tunis-4.jpg",
        "Description": ["Free tours"]
      }
    ],
    "creationDate": "2023-12-04T15:30:00Z",
    "startDate": "2024-01-22T09:00:00Z",
    "endDate": "2024-01-25T09:00:00Z"
  },
  {
    "id": 13,
    "campImgUrl": "https://i.postimg.cc/htFnWpBG/new-1.jpg",
    "Title": "New Panorama Resort",
    "Description":
        "Located in the center of Fayoum, New Panorama Resort is a bed and breakfast with lake views, a restaurant, a 24-hour front desk, a bar, a garden, a year-round outdoor pool, and a sun terrace. This bed and breakfast offer free private parking and free WiFi.",
    "City": "Fayoum",
    "isTrending": true,
    "isOffer": false,
    "dollarPrice": "110",
    "egyPrice": "3250",
    "properties": [
      "swimming pool",
      "restaurant",
      "free parking",
      "Family rooms",
      "breakfast",
      "Airport transfer service (free)",
      "Room service",
      "Free wifi",
      "Non-smoking rooms",
      "Private beach area"
    ],
    "Days": [
      {
        "id": 1,
        "Title": "Day1",
        "ImageUrl": "https://i.postimg.cc/XqSMSYRz/new-2.jpg",
        "Description": [
          "Accommodation in rooms",
          "BBQ parties",
          "Summer parties"
        ]
      },
      {
        "id": 2,
        "Title": "Day2",
        "ImageUrl": "https://i.postimg.cc/9MH1cwfZ/new-3.jpg",
        "Description": [
          "Bathing in salt lakes",
          "camping on mountain peaks",
          "enjoying watching the sunset"
        ]
      },
      {
        "id": 3,
        "Title": "Day3",
        "ImageUrl": "https://i.postimg.cc/vB9Y6kMC/new-4.jpg",
        "Description": ["Free tours"]
      }
    ],
    "creationDate": "2023-12-04T15:30:00Z",
    "startDate": "2024-01-22T09:00:00Z",
    "endDate": "2024-01-25T09:00:00Z"
  },
  {
    "id": 14,
    "campImgUrl": "https://i.postimg.cc/nrpskBFF/palace-1.jpg",
    "Title": "Tunis Palace - Fayoum",
    "Description":
        "Located in the center of Fayoum, Tunis Palace - Fayoum Villa is an air-conditioned accommodation with free WiFi, a restaurant, and access to a garden with a year-round outdoor pool. Featuring free private parking, this villa is in an area where guests can participate in activities such as hiking and cycling.",
    "City": "Fayoum",
    "isTrending": false,
    "isOffer": true,
    "dollarPrice": "100",
    "egyPrice": "3000",
    "properties": [
      "swimming pool",
      "kitchen",
      "free parking",
      "A house entirely yours",
      "Mountain view",
      "BBQ facilities",
      "Free wifi",
      "garden"
    ],
    "Days": [
      {
        "id": 1,
        "Title": "Day1",
        "ImageUrl": "https://i.postimg.cc/T3t38BRX/palace-2.jpg",
        "Description": [
          "Accommodation in rooms",
          "BBQ parties",
          "Summer parties"
        ]
      },
      {
        "id": 2,
        "Title": "Day2",
        "ImageUrl": "https://i.postimg.cc/NG8yJJrQ/palace-3.jpg",
        "Description": [
          "Bathing in salt lakes",
          "camping on mountain peaks",
          "enjoying watching the sunset"
        ]
      },
      {
        "id": 3,
        "Title": "Day3",
        "ImageUrl": "https://i.postimg.cc/Kv68mtT0/palace-4.jpg",
        "Description": ["Free tours"]
      }
    ],
    "creationDate": "2023-12-04T15:30:00Z",
    "startDate": "2024-01-22T09:00:00Z",
    "endDate": "2024-01-25T09:00:00Z"
  },
  {
    "id": 15,
    "campImgUrl": "https://i.postimg.cc/pdZWQ76S/sun-1.jpg",
    "Title": "Sun Lake Hotel",
    "Description":
        "Tunis Lake View Studio is located in Fayoum Center and offers a restaurant, a garden, and a terrace. Built in 2017, the property offers air-conditioned accommodation with a balcony. Guests at the apartment can enjoy an à la carte or halal breakfast.",
    "City": "Fayoum",
    "isTrending": true,
    "isOffer": false,
    "dollarPrice": "120",
    "egyPrice": "4000",
    "properties": [
      "Lake view",
      "conditioning",
      "free parking",
      "Free wifi",
      "garden"
    ],
    "Days": [
      {
        "id": 1,
        "Title": "Day1",
        "ImageUrl": "https://i.postimg.cc/sfBByj8D/sun-2.jpg",
        "Description": [
          "Accommodation in rooms",
          "BBQ parties",
          "Summer parties"
        ]
      },
      {
        "id": 2,
        "Title": "Day2",
        "ImageUrl": "https://i.postimg.cc/y6SNtfgD/sun-3.jpg",
        "Description": [
          "Bathing in salt lakes",
          "camping on mountain peaks",
          "enjoying watching the sunset"
        ]
      },
      {
        "id": 3,
        "Title": "Day3",
        "ImageUrl": "https://i.postimg.cc/ZnkJJSBC/sun-4.jpg",
        "Description": ["Free tours"]
      }
    ],
    "creationDate": "2023-12-04T15:30:00Z",
    "startDate": "2024-01-19T09:00:00Z",
    "endDate": "2024-01-22T09:00:00Z"
  },
  {
    "id": 16,
    "campImgUrl": "https://i.postimg.cc/bJsvbnrY/apadi-1.jpg",
    "Title": "Apadi camp",
    "Description":
        "Apadi camp is set in Coraya Bay and offers a garden and a terrace. Guests can enjoy a meal on an outdoor dining area while overlooking the mountain views.",
    "City": "Red Sea",
    "isTrending": false,
    "isOffer": true,
    "dollarPrice": "80",
    "egyPrice": "3000",
    "properties": [
      "Family rooms",
      "breakfast",
      "Non-smoking rooms",
      "free parking",
      "Free wifi"
    ],
    "Days": [
      {
        "id": 1,
        "Title": "Day1",
        "ImageUrl": "https://i.postimg.cc/tJ9qzR3J/apadi-2.jpg",
        "Description": [
          "Accommodation in rooms",
          "BBQ parties",
          "Summer parties"
        ]
      },
      {
        "id": 2,
        "Title": "Day2",
        "ImageUrl": "https://i.postimg.cc/Nf5qvrjY/apadi-3.jpg",
        "Description": [
          "Bathing in salt lakes",
          "camping on mountain peaks",
          "enjoying watching the sunset"
        ]
      },
      {
        "id": 3,
        "Title": "Day3",
        "ImageUrl": "https://i.postimg.cc/WpKFvgww/apadi-4.jpg",
        "Description": ["Free tours"]
      }
    ],
    "creationDate": "2023-12-04T15:30:00Z",
    "startDate": "2024-01-19T09:00:00Z",
    "endDate": "2024-01-22T09:00:00Z"
  },
  {
    "id": 17,
    "campImgUrl": "https://i.postimg.cc/c4yCFF53/marsa-1.jpg",
    "Title": "Marsa Shagra Village",
    "Description":
        "Marsa Shaqra Village offers accommodation near Abu Dabbab Bay and features a private beach area. All units have an outdoor seating area with unobstructed sea views. Guests at the lodge can enjoy three varied buffet meals per day. Snorkeling and scuba diving can be enjoyed at the extensive coral reefs accessible directly from the beach.",
    "City": "Red Sea",
    "isTrending": true,
    "isOffer": false,
    "dollarPrice": "120",
    "egyPrice": "4500",
    "properties": [
      "Airport transfer service (free)",
      "Private beach area",
      "Facilities for people with special needs",
      "restaurant",
      "breakfast",
      "Non-smoking rooms",
      "free parking",
      "Free wifi"
    ],
    "Days": [
      {
        "id": 1,
        "Title": "Day1",
        "ImageUrl": "https://i.postimg.cc/rFky1KKC/marsa-2.jpg",
        "Description": [
          "Accommodation in rooms",
          "BBQ parties",
          "Summer parties"
        ]
      },
      {
        "id": 2,
        "Title": "Day2",
        "ImageUrl": "https://i.postimg.cc/tCB0sTPg/marsa-3.jpg",
        "Description": [
          "Bathing in salt lakes",
          "camping on mountain peaks",
          "enjoying watching the sunset"
        ]
      },
      {
        "id": 3,
        "Title": "Day3",
        "ImageUrl": "https://i.postimg.cc/Jn56S65h/marsa-4.jpg",
        "Description": ["Free tours"]
      }
    ],
    "creationDate": "2023-12-04T15:30:00Z",
    "startDate": "2024-01-16T09:00:00Z",
    "endDate": "2024-01-19T09:00:00Z"
  },
  {
    "id": 18,
    "campImgUrl": "https://i.postimg.cc/8CSPHcKV/lagoonie-1.jpg",
    "Title": "Lagoonie Lodge & Beach",
    "Description":
        "Set in Hurghada, Lagoonie Lodge & Beach Cottage features accommodation with garden views, a restaurant, a fitness centre, a bar, a shared lounge area and a garden. This cottage offers both free WiFi and free private parking. All units come with a seating area, a flat-screen TV with satellite channels and a private bathroom with a hairdryer and shower. Some units also include a balcony and/or terrace with sea or city views. Guests at Lagoonie Lodge & Beach cottage can enjoy a continental breakfast.",
    "City": "Red Sea",
    "isTrending": false,
    "isOffer": true,
    "dollarPrice": "100",
    "egyPrice": "3000",
    "properties": [
      "Airport transfer service",
      "Fitness center",
      "Private beach area",
      "Facilities for people with special needs",
      "restaurant",
      "breakfast",
      "Non-smoking rooms",
      "free parking",
      "Free wifi"
    ],
    "Days": [
      {
        "id": 1,
        "Title": "Day1",
        "ImageUrl": "https://i.postimg.cc/MTd6z87M/lagoonie-2.jpg",
        "Description": [
          "Accommodation in rooms",
          "BBQ parties",
          "Summer parties"
        ]
      },
      {
        "id": 2,
        "Title": "Day2",
        "ImageUrl": "https://i.postimg.cc/XvxSCkpt/lagoonie-3.jpg",
        "Description": [
          "Bathing in salt lakes",
          "camping on mountain peaks",
          "enjoying watching the sunset"
        ]
      },
      {
        "id": 3,
        "Title": "Day3",
        "ImageUrl": "https://i.postimg.cc/T25dZByw/lagoonie-4.jpg",
        "Description": ["Free tours"]
      }
    ],
    "creationDate": "2023-12-04T15:30:00Z",
    "startDate": "2024-01-04T09:00:00Z",
    "endDate": "2024-01-07T09:00:00Z"
  }
];

