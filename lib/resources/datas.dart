import 'package:flutter/material.dart';

// List<String> bookList = [
//   "assets/images/ebooks.jpg",
//   "mon boss est nul mais je le soigne",
//   "Gael Chatelain"
// ];

List<Map<String, dynamic>> completedBookFunctionList = [
  {"name": "Download", "icon": "assets/images/download.png"},
  {"name": "Delete from your library", "icon": "assets/images/delete.png"},
  {"name": "Add to shelves...", "icon": "assets/images/add.png"},
  {"name": "Mark as read", "icon": "assets/images/mark.png"},
];

List<Map<String, dynamic>> normalBookFunctionList = [
  {"name": "Free Sample", "icon": "assets/images/free.png"},
  {"name": "Add to wishlist", "icon": "assets/images/wishlist.png"},
  {"name": "About this book", "icon": "assets/images/aboutBook.png"},
];

List<Map<String, dynamic>> addBookFunctionList = [
  {"name": "Remove download", "icon": "assets/images/free.png"},
  {"name": "Delete from your library", "icon": "assets/images/delete.png"},
  {"name": "Add to wishlist", "icon": "assets/images/wishlist.png"},
  {"name": "Add to shelves", "icon": "assets/images/add.png"},
  {"name": "About this book", "icon": "assets/images/aboutBook.png"},
];

List<Map<String, dynamic>> shelvesDetailsFunctionList = [
  {"name": "Rename shelf", "icon": "assets/images/edit.png"},
  {"name": "Delete shelf", "icon": "assets/images/delete.png"},
];

String bookDetails='In one of the most dazzling books of his celebrated career, Dean Koontz delivers a masterwork of page-turning suspense that surpasses even his own inimitable reputation as a chronicler of our worst fears—and best dreams. In The Taking he tells the story of a community cut off from a world under siege, and the terrifying battle for survival waged by a young couple and their neighbors as familiar streets become fog-shrouded death traps. Gripping, heartbreaking, and triumphant in the face of mankind’s darkest hour, here is a small-town slice-of-doomsday thriller that strikes to the core of each of us to ask: What would you do in the midst of The Taking. \nOn the morning that will mark the end of the world they have known, Molly and Niel Sloan awaken to the drumbeat of rain on their roof. It has haunted their sleep, invaded their dreams, and now they rise to find a luminous silvery downpour drenching their small California mountain town. A strange scent hangs faintly in the air, and the young couple cannot shake the sense of something wrong. \tAs hours pass and the rain continues to fall, Molly and Niel listen to disturbing news of extreme weather phenomena across the globe. Before evening, their little town loses television and radio reception. Then telephone and the Internet are gone. With the ceaseless rain now comes an obscuring fog that transforms the once-friendly village into a ghostly labyrinth. By nightfall the Sloans have gathered with some of their neighbors to deal with community damage...but also because they feel the need to band together against some unknown threat, some enemy they cannot identify or even imagine. \nIn the night, strange noises arise, and at a distance, in the rain and the mist, mysterious lights are seen drifting among the trees. The rain diminishes with the dawn, but a moody gray-purple twilight prevails. Soon Molly, Niel, and their small band of friends will be forced to draw on reserves of strength, courage, and humanity they never knew they had. For within the misty gloom they will encounter something that reveals in a terrifying instant what is happening to their world—something that is hunting them with ruthless efficiency. Epic in scope, searingly intimate and immediate in perspective, The Taking is an adventure story like no other, a relentless roller-coaster read that brings apocalypse to Main Street and showcases the talents of one of our most original and mesmerizing novelists at the pinnacle of his powers.';

List<int> ratingList=[1,2,3,4,5];
List<String> tabList1=["Ebooks","Audiobooks","Comics"];
List<String> tabList2=["Purchases","Samples","Uploads"];
List<String> tabList3=["Not started","In progress"];
List<String> radioGridTextList=["List","Large grid","Small grid"];
List<String> radioSortTextList=["Recently opened","Title","Author"];

enum ViewASFormation{
  LIST,
  LARGE_GRID,
  SMALL_GRID
}

List<int> ratingNumber=[5,4,3,2,1];
List<int> ratingPercent=[35,40,20,5,5];
