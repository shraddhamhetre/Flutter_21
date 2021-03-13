class Jobneed_DAO{

    int _id;
    int _jobneedid;
    String _jobdesc;
    String _plandatetime;

    Jobneed_DAO(this._jobneedid, this._plandatetime, [this._jobdesc] );

    Jobneed_DAO.withId(this._id, this._jobneedid, this._plandatetime, [this._jobdesc]);

    int get id => _id;

    int get jobneedid => _jobneedid;

    String get jobdesc => _jobdesc;

    String get plandatetime => _plandatetime;


    set jobneedid(int newjobneedid) {
            this._jobneedid = newjobneedid;
    }
    set jobdesc(String newjobdesc) {
        if (newjobdesc.length <= 255) {
            this._jobdesc = newjobdesc;
        }
    }

    set plandatetime(String newDate) {
        this._plandatetime = newDate;
    }

    // Convert a Note   object into a Map object
    Map<String,  dynamic> toMap() {

        var map = Map<String, dynamic>();
        if (id != null) {
            map['id'] = _id;
        }
        map['jobneedid'] = _jobneedid;
        map['jobdesc'] = _jobdesc;
        map['plandatetime'] = _plandatetime
        ;

        return map;
    }

    // Extract a Note object from a Map object
    Jobneed_DAO.fromMapObject(Map<String, dynamic> map) {
        this._id = map['id'];
        this._jobneedid = map['jobneedid'];
        this._jobdesc = map['jobdesc'];
        this._plandatetime = map['plandatetime'];
    }
}