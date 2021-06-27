class Task {
  List<Task> tasks;
  String note;
  DateTime timeToComplete;
  bool completed;
  String repeats;
  DateTime deadline;
  List<DateTime> reminders;
  String title;
  String taskID;

  Task(this.title, this.completed, this.taskID);
}
