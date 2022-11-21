import '../models/story_model.dart';
import '../models/user_model.dart';

const User user = User(
  name: 'presence.fit',
  profileImageUrl:
      'http://m.gettywallpapers.com/wp-content/uploads/2021/03/Cool-HD-Wallpaper.jpg',
);

const List<Story> stories = [
  Story(
    url:
        'https://cdn.pixabay.com/photo/2018/01/14/23/12/nature-3082832_1280.jpg',
    media: MediaType.image,
    user: user,
    duration: Duration(seconds: 5),
    timeAgo: '1 hour ago',
  ),
  Story(
    url:
        'https://storage.googleapis.com/gtv-videos-bucket/sample/ForBiggerMeltdowns.mp4',
    media: MediaType.video,
    duration: Duration(seconds: 0),
    user: user,
    timeAgo: '1 hour ago',
  ),
  Story(
    url:
        'https://storage.googleapis.com/gtv-videos-bucket/sample/ForBiggerMeltdowns.mp4',
    media: MediaType.video,
    duration: Duration(seconds: 0),
    user: user,
    timeAgo: '1 hour ago',
  ),
  Story(
    url:
        'https://images.unsplash.com/photo-1531694611353-d4758f86fa6d?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=564&q=80',
    media: MediaType.image,
    duration: Duration(seconds: 5),
    user: user,
    timeAgo: '1 hour ago',
  ),
  Story(
    url:
        'https://storage.googleapis.com/gtv-videos-bucket/sample/ForBiggerMeltdowns.mp4',
    media: MediaType.video,
    duration: Duration(seconds: 0),
    user: user,
    timeAgo: '1 hour ago',
  ),
];
List<UserStoryList> storyListUser = [
  UserStoryList(
      user: const User(
        name: 'Mock User',
        profileImageUrl:
            'http://m.gettywallpapers.com/wp-content/uploads/2021/03/Cool-HD-Wallpaper.jpg',
      ),
      story: stories),
  UserStoryList(
      user: const User(
        name: 'Mock User 1',
        profileImageUrl:
            'http://m.gettywallpapers.com/wp-content/uploads/2021/03/Cool-HD-Wallpaper.jpg',
      ),
      story: stories),
  UserStoryList(
      user: const User(
        name: 'Mock User 2',
        profileImageUrl:
            'http://m.gettywallpapers.com/wp-content/uploads/2021/03/Cool-HD-Wallpaper.jpg',
      ),
      story: stories),
  UserStoryList(
      user: const User(
        name: 'Mock User 3',
        profileImageUrl:
            'http://m.gettywallpapers.com/wp-content/uploads/2021/03/Cool-HD-Wallpaper.jpg',
      ),
      story: stories),
  UserStoryList(
      user: const User(
        name: 'Mock User 4',
        profileImageUrl:
            'http://m.gettywallpapers.com/wp-content/uploads/2021/03/Cool-HD-Wallpaper.jpg',
      ),
      story: stories),
  UserStoryList(
      user: const User(
        name: 'Mock User 5',
        profileImageUrl:
            'http://m.gettywallpapers.com/wp-content/uploads/2021/03/Cool-HD-Wallpaper.jpg',
      ),
      story: stories),
  UserStoryList(
      user: const User(
        name: 'Mock User 6',
        profileImageUrl:
            'http://m.gettywallpapers.com/wp-content/uploads/2021/03/Cool-HD-Wallpaper.jpg',
      ),
      story: stories),
];

class UserStoryList {
  List<Story> story;
  User user;

  UserStoryList({required this.story, required this.user});
}
