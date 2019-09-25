import 'dart:math';
Random random = Random();
List names = [
  "Jeet Vithalani",
  "Amit Chaudhari",
  "Shreyas Hosmani",
  "Sukhada Wagh",
  "Rohan Beldar",
  "Aishwarya Mehta",
  "Saudagar Barde",
  "Raghib Nasri",
  "Jagannath H.",
  "Shivani Hosmani",
  "Saurabh Thakkar",
];

List designations = [
  "Data Scientist",
  "Android Developer",
  "Flutter Developer",
  "Backend Developer",
  "Student @ COEP",
  "Java Developer",
  "Founder, Entrepreneur",
  "Private Investor",
  "Business Analyst",
  "Chief Technology Officer",
  "CEO @ gathrr.in",
];

List messages = [
  "Hey, when are you cheking in?",
  "Hey guys,just have a look at the event schedule?",
  "@XYZ, can we meet to scan?",
  "See who just checked-in 😂😂",
  "Dude pls send me the files shared at yesterday's event",
  "@XYZ, can we meet to scan?",
  "Hey guys,just have a look at the event schedule?❤️❤️",
  "Will you be attending the meetup tomorrow?",
  "Hey, when are you cheking in?",
  "Let's make a UI series.",
  "Can i hear your voice?",
];

List notification = [
  "checked in for the event Social NETWork, Westin",
  "scanned you and added you in their contacts",
  "sent you a connection request",
  "requested to view your hidden details",
  "checked in for the event TedEx, KP",
  "scanned you and added you in their contacts",
  "sent you a connection request",
  "requested to view your hidden details",
  "checked in for the event Awffice, JW Mariott, SB.Road",
  "scanned you and added you in their contacts",
  "sent you a connection request",
];

List notifications = List.generate(13, (index)=>{
  "name": names[random.nextInt(10)],
  "dp": "assets/cm${random.nextInt(10)}.jpg",
  "time": "${random.nextInt(50)} min ago",
  //"notif": notifs[random.nextInt(10)]
});

List posts = List.generate(13, (index)=>{
    "name": names[random.nextInt(10)],
    "dp": "assets/cm${random.nextInt(10)}.jpg",
    "time": "${random.nextInt(50)} min ago",
    "img": "assets/cm${random.nextInt(10)}.jpg"
});

List chats = List.generate(13, (index)=>{
  "name": names[random.nextInt(10)],
  "dp": "assets/cm${random.nextInt(10)}.jpg",
  "msg": messages[random.nextInt(10)],
  "counter": random.nextInt(20),
  "time": "${random.nextInt(50)} min ago",
  "isOnline": random.nextBool(),
});

List groups = List.generate(13, (index)=>{
  "name": "Event ${random.nextInt(20)}",
  "dp": "assets/cm${random.nextInt(10)}.jpg",
  "msg": messages[random.nextInt(10)],
  "counter": random.nextInt(20),
  "time": "${random.nextInt(50)} min ago",
  "isOnline": random.nextBool(),
});

List types = ["text", "image"];
List conversation = List.generate(10, (index)=>{
  "username": "Group ${random.nextInt(20)}",
  "time": "${random.nextInt(50)} min ago",
  "type": types[random.nextInt(2)],
  "replyText": messages[random.nextInt(10)],
  "isMe": random.nextBool(),
  "isGroup": false,
  "isReply": random.nextBool(),
});

List friends = List.generate(13, (index)=>{
  "name": names[random.nextInt(10)],
  "dp": "assets/cm${random.nextInt(10)}.jpg",
  "status": "Anything could be here",
  "isAccept": random.nextBool(),
});