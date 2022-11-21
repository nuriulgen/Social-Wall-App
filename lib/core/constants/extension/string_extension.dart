class AppStringConstants {
  // Singleton
  static AppStringConstants? _instance;
  static AppStringConstants? get instance {
    _instance ??= AppStringConstants._init();
    return _instance;
  }

  AppStringConstants._init();

  //STRING
  final String homeTitle = 'Sosyal Duvar';
  final String postsText = 'Gönderi';
  final String commentText = 'Yorum';
  final String addImageButton = 'Fotoğraf / Video Ekle';
  final String shareButton = 'Paylaş';
}
