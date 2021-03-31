
String convert_Server_Datetime(String datetime){

        var today = DateTime.parse(datetime);
        var finalDate = today.add(const Duration(hours: 05, minutes: 30));
        return finalDate.toString().substring(0, 16);
}


String IsJobStarts(String Startdatetime, String Enddatetime){
    DateTime startDate = DateTime.parse(Startdatetime);
    DateTime endDate = DateTime.parse(Enddatetime);
    DateTime now = DateTime.now();
    if(startDate.isBefore(now) && endDate.isAfter(now)){
        return "0";
    }else if(!startDate.isBefore(now)){
        return "1";
    }else if(!endDate.isAfter(now)){
        return "2";
    }

}