import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';

import '../../persistence/hive_constants.dart';

part 'book_vo.g.dart';
@JsonSerializable()
@HiveType(typeId: HIVE_TYPE_ID_BOOK_VO,adapterName: "BookVOAdapter")
class BookVO{
  @JsonKey(name: "age_group")
  @HiveField(0)
  String? ageGroup;

  @JsonKey(name: "amazon_product_url")
  @HiveField(1)
  String? amazonProductUrl;

  @JsonKey(name: "article_chapter_link")
  @HiveField(2)
  String? articleChapterLink;

  @JsonKey(name: "author")
  @HiveField(3)
  String? author;

  @JsonKey(name: "book_image")
  @HiveField(4)
  String? bookImage;

  @JsonKey(name: "book_image_width")
  @HiveField(5)
  int? bookImageWidth;

  @JsonKey(name: "book_image_height")
  @HiveField(6)
  int? bookImageHeight;

  @JsonKey(name: "title")
  @HiveField(7)
  String? title;

  @JsonKey(name: "description")
  @HiveField(8)
  String? description;

  @JsonKey(name: "opened_date")
  @HiveField(9)
  String? openedDate;

  @JsonKey(name: "list_name")
  @HiveField(10)
  String? listName;

  BookVO(
      this.ageGroup,
      this.amazonProductUrl,
      this.articleChapterLink,
      this.author,
      this.bookImage,
      this.bookImageWidth,
      this.bookImageHeight,
      this.title,
      this.description,
      this.listName);

  factory BookVO.fromJson(Map<String, dynamic> json) =>
      _$BookVOFromJson(json);

  Map<String, dynamic> toJson() => _$BookVOToJson(this);
}

// {
// "age_group": "",
// "amazon_product_url": "https://www.amazon.com/dp/1668001225?tag=NYTBSREV-20",
// "article_chapter_link": "",
// "author": "Colleen Hoover",
// "book_image": "https://storage.googleapis.com/du-prd/books/images/9781668001226.jpg",
// "book_image_width": 322,
// "book_image_height": 500,
// "book_review_link": "",
// "contributor": "by Colleen Hoover",
// "contributor_note": "",
// "created_date": "2022-11-23 23:03:26",
// "description": "In the sequel to “It Ends With Us,” Lily deals with her jealous ex-husband as she reconnects with her first boyfriend.",
// "first_chapter_link": "",
// "price": "0.00",
// "primary_isbn10": "1668001225",
// "primary_isbn13": "9781668001226",
// "book_uri": "nyt://book/3aa85e47-4df9-53ef-9957-a77753d3502c",
// "publisher": "Atria",
// "rank": 1,
// "rank_last_week": 1,
// "sunday_review_link": "",
// "title": "IT STARTS WITH US",
// "updated_date": "2022-11-23 23:07:54",
// "weeks_on_list": 5,
// "buy_links": [
// {
// "name": "Amazon",
// "url": "https://www.amazon.com/dp/1668001225?tag=NYTBSREV-20"
// },
// {
// "name": "Apple Books",
// "url": "https://goto.applebooks.apple/9781668001226?at=10lIEQ"
// },
// {
// "name": "Barnes and Noble",
// "url": "https://www.anrdoezrs.net/click-7990613-11819508?url=https%3A%2F%2Fwww.barnesandnoble.com%2Fw%2F%3Fean%3D9781668001226"
// },
// {
// "name": "Books-A-Million",
// "url": "https://du-gae-books-dot-nyt-du-prd.appspot.com/redirect?url1=https%3A%2F%2Fwww.anrdoezrs.net%2Fclick-7990613-35140%3Furl%3Dhttps%253A%252F%252Fwww.booksamillion.com%252Fp%252FIT%252BSTARTS%252BWITH%252BUS%252FColleen%252BHoover%252F9781668001226&url2=https%3A%2F%2Fwww.anrdoezrs.net%2Fclick-7990613-35140%3Furl%3Dhttps%253A%252F%252Fwww.booksamillion.com%252Fsearch%253Fquery%253DIT%252BSTARTS%252BWITH%252BUS%252BColleen%252BHoover"
// },
// {
// "name": "Bookshop",
// "url": "https://du-gae-books-dot-nyt-du-prd.appspot.com/redirect?url1=https%3A%2F%2Fbookshop.org%2Fa%2F3546%2F9781668001226&url2=https%3A%2F%2Fbookshop.org%2Fbooks%3Faffiliate%3D3546%26keywords%3DIT%2BSTARTS%2BWITH%2BUS"
// },
// {
// "name": "IndieBound",
// "url": "https://du-gae-books-dot-nyt-du-prd.appspot.com/redirect?url1=https%3A%2F%2Fwww.indiebound.org%2Fbook%2F9781668001226%3Faff%3DNYT&url2=https%3A%2F%2Fwww.indiebound.org%2Fsearch%2Fbook%3Fkeys%3DIT%2BSTARTS%2BWITH%2BUS%2BColleen%2BHoover%26aff%3DNYT"
// }
// ]
// },