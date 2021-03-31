class PeopleEventLog_DAO {
    int _id;
    int _pelogid;
    String _accuracy;
    int _deviceid;
    String _datetime;
    String _gpslocation;
    int _photorecognitionthreshold;
    String _photorecognitionscore;
    String _photorecognitiontimestamp;
    String _photorecognitionserviceresponse;
    String _facerecognition;
    int _gfid;
    int _ctzoffset;

    // String _isdeleted;
    int _peopleid;
    String _peventtype;
    String _punchstatus;
    int _verifiedby;
    int _cuser;
    int _muser;
    String _cdtz;
    String _mdtz;
    int _buid;
    String _syncStatus;
    String _scanPeopleCode;
    int _transportmode;
    String _expamt;
    int _duration;
    int _distance;
    String _reference;
    String _remarks;
    String _otherlocation;

    PeopleEventLog_DAO(
        this._pelogid,
        this._accuracy,
        this._deviceid,
        this._datetime,
        this._gpslocation,
        this._photorecognitionthreshold,
        this._photorecognitionscore,
        this._photorecognitiontimestamp,
        this._photorecognitionserviceresponse,
        this._facerecognition,
        this._gfid,
        this._ctzoffset,
        // this._isdeleted,
        this._peopleid,
        this._peventtype,
        this._punchstatus,
        this._verifiedby,
        this._cuser,
        this._muser,
        this._cdtz,
        this._mdtz,
        this._buid,
        this._syncStatus,
        this._scanPeopleCode,
        this._transportmode,
        this._expamt,
        this._duration,
        this._distance,
        this._reference,
        this._remarks,
        this._otherlocation,
        );

    PeopleEventLog_DAO.withID(
        this._id,
        this._pelogid,
        this._accuracy,
        this._deviceid,
        this._datetime,
        this._gpslocation,
        this._photorecognitionthreshold,
        this._photorecognitionscore,
        this._photorecognitiontimestamp,
        this._photorecognitionserviceresponse,
        this._facerecognition,
        this._gfid,
        this._ctzoffset,
        // this._isdeleted,
        this._peopleid,
        this._peventtype,
        this._punchstatus,
        this._verifiedby,
        this._cuser,
        this._muser,
        this._cdtz,
        this._mdtz,
        this._buid,
        this._syncStatus,
        this._scanPeopleCode,
        this._transportmode,
        this._expamt,
        this._duration,
        this._distance,
        this._reference,
        this._remarks,
        this._otherlocation,
        );

    int get id => _id;
    int get pelogid => _pelogid;
    String get accuracy => _accuracy;
    int get deviceid => _deviceid;
    String get datetime => _datetime;
    String get gpslocation => _gpslocation;
    int get photorecognitionthreshold => _photorecognitionthreshold;
    String get photorecognitionscore => _photorecognitionscore;
    String get photorecognitiontimestamp => _photorecognitiontimestamp;
    String get photorecognitionserviceresponse =>
        _photorecognitionserviceresponse;
    String get facerecognition => _facerecognition;
    int get gfid => _gfid;
    int get ctzoffset => _ctzoffset;
    // String get =>_isdeleted;
    int get peopleid => _peopleid;
    String get peventtype => _peventtype;
    String get punchstatus => _punchstatus;
    int get verifiedby => _verifiedby;
    int get cuser => _cuser;
    int get muser => _muser;
    String get cdtz => _cdtz;
    String get mdtz => _mdtz;
    int get buid => _buid;
    String get syncStatus => _syncStatus;
    String get scanPeopleCode => _scanPeopleCode;
    int get transportmode => _transportmode;
    String get expamt => _expamt;
    int get duration => _duration;
    int get distance => _distance;
    String get reference => _reference;
    String get remarks => _remarks;
    String get otherlocation => _otherlocation;

    set pelogid(int newpelogid) {
        this._pelogid = newpelogid;
    }

    set accuracy(String newaccuracy) {
        this._accuracy = newaccuracy;
    }

    set deviceid(int newdeviceid) {
        this._deviceid = newdeviceid;
    }

    set datetime(String newdatetime) {
        this._datetime = newdatetime;
    }

    set gpslocation(String newgpslocation) {
        this._gpslocation = newgpslocation;
    }
    set ctzoffset(int newctzoffset) {
        this._ctzoffset = newctzoffset;
    }

    set photorecognitionthreshold(int newphotorecognitionthreshold) {
        this._photorecognitionthreshold = newphotorecognitionthreshold;
    }

    set photorecognitionscore(String newphotorecognitionscore) {
        this._photorecognitionscore = newphotorecognitionscore;
    }

    set photorecognitiontimestamp(String newphotorecognitiontimestamp) {
        this._photorecognitiontimestamp = newphotorecognitiontimestamp;
    }

    set photorecognitionserviceresponse(
        String newphotorecognitionserviceresponse) {
        this._photorecognitionserviceresponse = newphotorecognitionserviceresponse;
    }

    set facerecognition(String newfacerecognition) {
        this._facerecognition = newfacerecognition;
    }

    set gfid(int newgfid) {
        this._gfid = newgfid;
    }

    set peopleid(int newpeopleid) {
        this._peopleid = newpeopleid;
    }

    set peventtype(String newpeventtype) {
        this._peventtype = newpeventtype;
    }

    set punchstatus(String newpunchstatus) {
        this._punchstatus = newpunchstatus;
    }

    set verifiedby(int newverifiedby) {
        this._verifiedby = newverifiedby;
    }

    set cuser(int newcuser) {
        this._cuser = newcuser;
    }

    set muser(int newmuser) {
        this._muser = newmuser;
    }

    set cdtz(String newcdtz) {
        this._cdtz = newcdtz;
    }

    set mdtz(String newmdtz) {
        this._mdtz = newmdtz;
    }

    set buid(int newbuid) {
        this._buid = newbuid;
    }

    set syncStatus(String newsyncStatus) {
        this._syncStatus = newsyncStatus;
    }

    set scanPeopleCode(String newscanPeopleCode) {
        this._scanPeopleCode = newscanPeopleCode;
    }

    set transportmode(int newtransportmode) {
        this._transportmode = newtransportmode;
    }

    set expamt(String newexpamt) {
        this._expamt = newexpamt;
    }

    set duration(int newduration) {
        this._duration = newduration;
    }

    set distance(int newdistance) {
        this._distance = newdistance;
    }

    set reference(String newreference) {
        this._reference = newreference;
    }

    set remarks(String newremarks) {
        this._remarks = newremarks;
    }

    set otherlocation(String newotherlocation) {
        this._otherlocation = newotherlocation;
    }

    Map<String, dynamic> toMap() {
        var map = Map<String, dynamic>();
        if (id != null) {
            map['id'] = _id;
        }
        map['pelogid'] = _pelogid;
        map['accuracy'] = _accuracy;
        map['deviceid'] = _deviceid;
        map['datetime'] = _datetime;
        map['gpslocation'] = _gpslocation;
        map['photorecognitionthreshold'] = _photorecognitionthreshold;
        map['photorecognitionscore'] = _photorecognitionscore;
        map['photorecognitiontimestamp'] = _photorecognitiontimestamp;
        map['photorecognitionserviceresponse'] = _photorecognitionserviceresponse;
        map['facerecognition'] = _facerecognition;
        map['gfid'] = _gfid;
        map['peopleid'] = _peopleid;
        map['peventtype'] = _peventtype;
        map['punchstatus'] = _punchstatus;
        map['verifiedby'] = _verifiedby;
        map['cuser'] = _cuser;
        map['muser'] = _muser;
        map['cdtz'] = _cdtz;
        map['mdtz'] = _mdtz;
        map['buid'] = _buid;
        map['syncStatus'] = _syncStatus;
        map['scanPeopleCode'] = _scanPeopleCode;
        map['transportmode'] = _transportmode;
        map['expamt'] = _expamt;
        map['duration'] = _duration;
        map['distance'] = _distance;
        map['reference'] = _reference;
        map['remarks'] = _remarks;
        map['otherlocation'] = _otherlocation;
        return map;
    }

    PeopleEventLog_DAO.fromMapObject(Map<String, dynamic> map) {
        this._id = map['id'];
        this._pelogid = map['pelogid'];
        this._accuracy = map['accuracy'];
        this._deviceid = map['deviceid'];
        this._datetime = map['datetime'];
        this._gpslocation = map['gpslocation'];
        this._photorecognitionthreshold = map['photorecognitionthreshold'];
        this._photorecognitionscore = map['photorecognitionscore'];
        this._photorecognitiontimestamp = map['photorecognitiontimestamp'];
        this._photorecognitionserviceresponse =
        map['photorecognitionserviceresponse'];
        this._facerecognition = map['facerecognition'];
        this._gfid = map['gfid'];
        this._peopleid = map['peopleid'];
        this._peventtype = map['peventtype'];
        this._punchstatus = map['punchstatus'];
        this._verifiedby = map['verifiedby'];
        this._cuser = map['cuser'];
        this._muser = map['muser'];
        this._cdtz = map['cdtz'];
        this._mdtz = map['mdtz'];
        this._buid = map['buid'];
        this._syncStatus = map['syncStatus'];
        this._scanPeopleCode = map['scanPeopleCode'];
        this._transportmode = map['transportmode'];
        this._expamt = map['expamt'];
        this._duration = map['duration'];
        this._distance = map['distance'];
        this._reference = map['reference'];
        this._remarks = map['remarks'];
        this._otherlocation = map['otherlocation'];
    }
}