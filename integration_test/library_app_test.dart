import 'package:flutter/foundation.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:integration_test/integration_test.dart';
import 'package:the_library_app/data/vos/book_category_vo.dart';
import 'package:the_library_app/data/vos/book_vo.dart';
import 'package:the_library_app/data/vos/shelf_vo.dart';
import 'package:the_library_app/main.dart';
import 'package:the_library_app/pages/home_page.dart';
import 'package:the_library_app/persistence/hive_constants.dart';

import 'test_data/test_data.dart';

void main() async{
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  await Hive.initFlutter();

  Hive.registerAdapter(BookListVOAdapter());
  Hive.registerAdapter(BookVOAdapter());
  Hive.registerAdapter(ShelfVOAdapter());

  await Hive.openBox<BookCategoryVO>(BOX_NAME_BOOK_CATEGORY_VO);
  await Hive.openBox<BookVO>(BOX_NAME_BOOK_VO);
  await Hive.openBox<ShelfVO>(BOX_NAME_SHELF_VO);
  
  
  testWidgets("Test Book", (WidgetTester tester)async {
    await tester.pumpWidget(MyApp());
    await Future.delayed(Duration(seconds: 2));

    await tester.pumpAndSettle(Duration(seconds: 3));
    expect(find.byType(HomePage), findsOneWidget);
    //await tester.dragFrom(startLocation, offset)
    expect(find.byKey(Key(BOOK_LIST_VIEW_KEY)),findsAtLeastNWidgets(3));

    
  });

}