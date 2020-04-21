class CourseModel {
  String name;
  String description;
  String university;
  String noOfCource;
  String tag1;
  String tag2;

  CourseModel({this.name,
      this.description,
      this.noOfCource,
      this.university,
      this.tag1,
      this.tag2});
}

class CourseList {
  static List<CourseModel> list = [
    CourseModel(
        name: "+254774148735",
        description:
            "Launch your career in data science. A sweet-cource introduction to data science, develop and taught by leading professors...",
        university: "Jons Hopkins ",
        noOfCource: "6:00am",
        tag1: "Failed",
        tag2: "Recieved"),
    CourseModel(
        name: "+254756343214",
        description:
            "This specialization from leading researchers at university of washington introduce to you to the exciting high-demand field of machine learning... ",
        university: "washington",
        noOfCource: "12:10pm",
        tag1: "Failed",
        tag2: "Recieved"),
    CourseModel(
        name: "+254702471432",
        description:
            "Drive better bussiness decision with an overview OF how big data is organised and intepreted. Apply insight to real-world problems and question...",
        university: "Diego",
        noOfCource: "12:10pm",
        tag1: "Failed",
        tag2: "Recieved"),
  ];
}class SmsStatuses {
  static List<CourseModel> list = [
    CourseModel(
        name: "Sent",
        description:
            "Launch your career in data science. A sweet-cource introduction to data science, develop and taught by leading professors...",
        university: "Jons Hopkins ",
        noOfCource: "1:30pm",
        tag1: "Failed",
        tag2: "Recieved"),
    CourseModel(
        name: "Pending",
        description:
            "This specialization from leading researchers at university of washington introduce to you to the exciting high-demand field of machine learning...",
        university: "John Blend",
        noOfCource: "8:45pm",
        tag1: "Failed",
        tag2: "Recieved"),
    CourseModel(
        name: "Delivered",
       ),
  ];
}
