enum TaskStatus {
  //할 일, 급한 일, 진행 중, 완료한 일
  todo('할 일'),
  urgent('급한 일'),
  inProgress('진행 중'),
  done('완료한 일');

  final String kor;
  const TaskStatus(this.kor);
}