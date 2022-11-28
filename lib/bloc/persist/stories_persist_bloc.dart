import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:instagram_story_clone/bloc/bloc.dart';
import 'package:instagram_story_clone/bloc/persist/stories_persist_event.dart';
import 'package:instagram_story_clone/bloc/persist/stories_persist_model.dart';

class CounterBloc extends HydratedBloc<CounterEvent, List<StoriesPersist>> {
  //
  CounterBloc() : super(const [StoriesPersist(id: '0', currentIndex: 0)]) {
    on<CounterIncrementPressed>((event, emit) {
      final index = state.indexWhere((element) => element.id == event.id);
      print('=========================');
      for (var user in state) {
        print(user.toJson());
      }
      var newList = state;
      if (index == -1) {
        // newList.addAll([StoriesPersist(id: event.id, currentIndex: 1)]);

        newList = [...newList, StoriesPersist(id: event.id, currentIndex: 1)];

        emit(newList);
      } else {
        final firstWhere =
            state.firstWhere((element) => element.id == event.id);
        final currentIndex = firstWhere.currentIndex;
        newList[index] =
            StoriesPersist(id: event.id, currentIndex: currentIndex + 1);
        emit([
          ...newList,
        ]);
      }
    });

    on<CounterDecrementPressed>((event, emit) {
      final index = state.indexWhere((element) => element.id == event.id);
      if (index == -1) {
        var newList = state;
        // newList.addAll([StoriesPersist(id: event.id, currentIndex: 1)]);
        newList = [...newList, StoriesPersist(id: event.id, currentIndex: 1)];
      } else {
        final firstWhere =
            state.firstWhere((element) => element.id == event.id);
        final currentIndex = firstWhere.currentIndex;
        final newList = state;
        newList[index] =
            StoriesPersist(id: event.id, currentIndex: currentIndex - 1);

        emit([
          ...newList,
        ]);
      }
    });
  }

  @override
  List<StoriesPersist> fromJson(Map<String, dynamic> json) {
    return (json['id'] as List<dynamic>)
        .map((item) => StoriesPersist.fromJson(item as Map<String, dynamic>))
        .toList();
  }

  @override
  Map<String, dynamic> toJson(List<StoriesPersist> state) {
    return <String, dynamic>{
      'id': state.map((item) => item.toJson()).toList(),
    };
  }
}
