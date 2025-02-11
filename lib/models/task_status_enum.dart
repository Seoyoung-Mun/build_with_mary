enum TaskStatus {
  //할 일, 급한 일, 진행 중, 완료한 일
  todo('할 일'),
  urgent('급한 일'),
  inProgress('진행 중'),
  done('완료한 일');

  final String kor;
  const TaskStatus(this.kor);

  static TaskStatus fromIndex(int index){
    if (index < 0 || index >= TaskStatus.values.length) {
      return TaskStatus.todo; // 기본값 설정
    }
    return TaskStatus.values[index];
  }
}