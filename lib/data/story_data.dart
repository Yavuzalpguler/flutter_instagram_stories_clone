import '../models/story_model.dart';
import '../models/user_model.dart';

//THIS MODEL IS TAKEN DIRECTLY FROM A YOUTUUBE TUTORIAL
const User user = User(
  name: 'Mock User',
  profileImageUrl:
      'http://m.gettywallpapers.com/wp-content/uploads/2021/03/Cool-HD-Wallpaper.jpg',
);

const List<Story> stories = [
  Story(
    url:
        'http://m.gettywallpapers.com/wp-content/uploads/2022/11/New-Devin-Booker-Wallpaper.jpeg',
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
        name: 'Mock User 1',
        profileImageUrl:
            'http://m.gettywallpapers.com/wp-content/uploads/2022/09/Post-Malone-4k-Wallpaper.jpg',
      ),
      id: '1',
      story: stories),
  UserStoryList(
      user: const User(
        name: 'Mock User 2',
        profileImageUrl:
            'http://m.gettywallpapers.com/wp-content/uploads/2022/11/Gareth-Bale-Wallpaper.jpeg',
      ),
      id: '2',
      story: stories),
  UserStoryList(
      user: const User(
        name: 'Mock User 3',
        profileImageUrl:
            'http://m.gettywallpapers.com/wp-content/uploads/2022/11/Dj-Snake-Wallpaper.jpeg',
      ),
      id: '3',
      story: stories),
  UserStoryList(
      user: const User(
        name: 'Mock User 4',
        profileImageUrl:
            'http://m.gettywallpapers.com/wp-content/uploads/2022/11/Hitman-Absolution-Wallpaper-HD.jpeg',
      ),
      id: '4',
      story: stories),
  UserStoryList(
      user: const User(
        name: 'Mock User 5',
        profileImageUrl:
            'http://m.gettywallpapers.com/wp-content/uploads/2022/09/4k-Post-Malone-Wallpaper-For-Mobile.jpg',
      ),
      id: '5',
      story: stories),
  UserStoryList(
      user: const User(
        name: 'Mock User 6',
        profileImageUrl:
            'http://m.gettywallpapers.com/wp-content/uploads/2022/11/Devin-Booker-Wallpapers.jpg',
      ),
      id: '6',
      story: stories),
  UserStoryList(
      user: const User(
        name: 'Mock User 7',
        profileImageUrl:
            'http://m.gettywallpapers.com/wp-content/uploads/2022/11/New-Devin-Booker-Wallpaper.jpeg',
      ),
      id: '7',
      story: stories),
];

class UserStoryList {
  List<Story> story;
  User user;
  String id;

  UserStoryList({required this.story, required this.user, required this.id});
}
