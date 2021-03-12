class Jobneed_DAO{

    int _id;
    String jobneedid;
    String jobdesc;
    String plandatetime;

    Jobneed_DAO(this.jobneedid, this.plandatetime, [this.jobdesc] );

    Jobneed_DAO.withId(this._id, this.jobneedid, this.plandatetime, [this.jobdesc]);

    int get id => _id;

    String get title => jobneedid;

    String get jobdesc1 => jobdesc;

    String get date => plandatetime;


    set title(String newTitle) {
        if (newTitle.length <= 255) {
            this.jobneedid = newTitle;
        }
    }
    set jobdesc1(String newjobdesc) {
        if (newjobdesc.length <= 255) {
            this.jobdesc = newjobdesc;
        }
    }

    set date(String newDate) {
        this.plandatetime = newDate;
    }

    // Convert a Note   object into a Map object
    Map<String,  dynamic> toMap() {

        var map = Map<String, dynamic>();
        if (id != null) {
            map['id'] = _id;
        }
        map['title'] = jobneedid;
        map['jobdesc'] = jobdesc;
        map['date'] = plandatetime
        ;

        return map;
    }

    // Extract a Note object from a Map object
    Jobneed_DAO.fromMapObject(Map<String, dynamic> map) {
        this._id = map['id'];
        this.jobneedid = map['title'];
        this.jobdesc = map['jobdesc'];
        this.plandatetime = map['date'];
    }
}