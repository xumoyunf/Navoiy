import 'package:flutter/material.dart';
import 'models/author_model.dart';
import 'screens/author_screen.dart';
import 'models/data_model.dart';
import 'screens/chapter_screen.dart';
import 'screens/home_screen.dart';
import 'screens/view_screen.dart';

class OnGenerateRouter {
  Route<dynamic>? router(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return navigateTo(const HomeScreen());
      case '/chapter':
        final title = (settings.arguments as List)[0];
        final books = (settings.arguments as List)[1] as List<Book>;
        return navigateTo(ChapterScreen(title: title, books: books));
      case '/view':
        final book = settings.arguments as Book;
        return navigateTo(ViewScreen(book: book));
      case '/authors':
        final authors = settings.arguments as List<Author>;
        return navigateTo(AuthorScreen(authors: authors));
      default:
        return navigateTo(Scaffold());
    }
  }

  navigateTo(Widget widget) {
    return MaterialPageRoute(builder: (ctx) => widget);
  }
}
