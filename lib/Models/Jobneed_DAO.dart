class Jobneed_DAO {
  int _id;
  int _jobneedid;
  String _jobdesc;
  String _plandatetime;
  String _expirydatetime;
  int _gracetime;
  String _receivedonserver;
  String _starttime;
  String _endtime;
  String _gpslocation;
  String _remarks;
  int _aatop;
  int _assetid;
  int _frequency;
  int _jobid;
  int _jobstatus;
  int _jobtype;
  int _performedby;
  int _priority;
  int _questionsetid;
  int _ScanType;
  int _peopleid;
  int _groupid;
  int _identifier;
  int _parent;
  int _isDeleted;
  int _cuser;
  int _muser;
  String _cdtz;
  String _mdtz;
  int _ticketno;
  int _buid;
  int _seqno;
  int _ticketcategory;
  int _ctzoffset;
  String _multiplicationfactor;
  String _multiplicationfactor1;
  String _multiplicationfactor2;
  String _attachmentcount;
  String _syncStatus;

  Jobneed_DAO(
      this._jobneedid,
      this._plandatetime,
      this._jobdesc,
      this._expirydatetime,
      this._gracetime,
      this._receivedonserver,
      this._starttime,
      this._endtime,
      this._gpslocation,
      this._remarks,
      this._aatop,
      this._assetid,
      this._frequency,
      this._jobid,
      this._jobstatus,
      this._jobtype,
      this._performedby,
      this._priority,
      this._questionsetid,
      this._ScanType,
      this._peopleid,
      this._groupid,
      this._identifier,
      this._parent,
      this._isDeleted,
      this._cuser,
      this._muser,
      this._cdtz,
      this._mdtz,
      this._ticketno,
      this._buid,
      this._seqno,
      this._ticketcategory,
      this._ctzoffset,
      this._multiplicationfactor,
      this._multiplicationfactor1,
      this._multiplicationfactor2,
      this._attachmentcount,
      this._syncStatus);

  Jobneed_DAO.withId(
      this._id,
      this._jobneedid,
      this._plandatetime,
      this._jobdesc,
      this._expirydatetime,
      this._gracetime,
      this._receivedonserver,
      this._starttime,
      this._endtime,
      this._gpslocation,
      this._remarks,
      this._aatop,
      this._assetid,
      this._frequency,
      this._jobid,
      this._jobstatus,
      this._jobtype,
      this._performedby,
      this._priority,
      this._questionsetid,
      this._ScanType,
      this._peopleid,
      this._groupid,
      this._identifier,
      this._parent,
      this._isDeleted,
      this._cuser,
      this._muser,
      this._cdtz,
      this._mdtz,
      this._ticketno,
      this._buid,
      this._seqno,
      this._ticketcategory,
      this._ctzoffset,
      this._multiplicationfactor,
      this._multiplicationfactor1,
      this._multiplicationfactor2,
      this._attachmentcount,
      this._syncStatus);

  int get id => _id;
  int get jobneedid => _jobneedid;
  String get jobdesc => _jobdesc;
  String get plandatetime => _plandatetime;
  String get expirydatetime => _expirydatetime;
  int get gracetime => _gracetime;
  String get receivedonserver => _receivedonserver;
  String get starttime => _starttime;
  String get endtime => _endtime;
  String get gpslocation => _gpslocation;
  String get remarks => _remarks;
  int get aatop => _aatop;
  int get assetid => _assetid;
  int get frequency => _frequency;
  int get jobid => _jobid;
  int get jobstatus => _jobstatus;
  int get jobtype => _jobtype;
  int get performedby => _performedby;
  int get priority => _priority;
  int get questionsetid => _questionsetid;
  int get ScanType => _ScanType;
  int get peopleid => _peopleid;
  int get groupid => _groupid;
  int get identifier => _identifier;
  int get parent => _parent;
  int get isDeleted => _isDeleted;
  int get cuser => _cuser;
  int get muser => _muser;
  String get cdtz => _cdtz;
  String get mdtz => _mdtz;
  int get ticketno => _ticketno;
  int get buid => _buid;
  int get seqno => _seqno;
  int get ticketcategory => _ticketcategory;
  int get ctzoffset => _ctzoffset;
  String get multiplicationfactor => _multiplicationfactor;
  String get multiplicationfactor1 => _multiplicationfactor1;
  String get multiplicationfactor2 => _multiplicationfactor2;
  String get attachmentcount => _attachmentcount;
  String get syncStatus => _syncStatus;

  set jobneedid(int newjobneedid) {
    this._jobneedid = newjobneedid;
  }

  set jobdesc(String newjobdesc) {
    if (newjobdesc.length <= 255) {
      this._jobdesc = newjobdesc;
    }
  }

  set plandatetime(String newplandatetime) {
    this._plandatetime = newplandatetime;
  }

  set expirydatetime(String newexpirydatetime) {
    this._expirydatetime = newexpirydatetime;
  }

  set gracetime(int newgracetime) {
    this._gracetime = newgracetime;
  }

  set receivedonserver(String newreceivedonserver) {
    this._receivedonserver = newreceivedonserver;
  }

  set starttime(String newstarttime) {
    this._starttime = newstarttime;
  }

  set endtime(String newendtime) {
    this._endtime = newendtime;
  }

  set gpslocation(String newgpslocation) {
    this._gpslocation = newgpslocation;
  }

  set remarks(String newremarks) {
    this._remarks = newremarks;
  }

  set aatop(int newaatop) {
    this._aatop = newaatop;
  }

  set assetid(int newassetid) {
    this._assetid = newassetid;
  }

  set frequency(int newfrequency) {
    this._frequency = newfrequency;
  }

  set jobid(int newjobid) {
    this._jobid = newjobid;
  }

  set jobstatus(int newjobstatus) {
    this._jobstatus = newjobstatus;
  }

  set jobtype(int newjobtype) {
    this._jobtype = newjobtype;
  }

  set performedby(int newperformedby) {
    this._performedby = newperformedby;
  }

  set priority(int newpriority) {
    this._priority = priority;
  }

  set questionsetid(int newquestionsetid) {
    this._questionsetid = newquestionsetid;
  }

  set ScanType(int newScanType) {
    this._ScanType = newScanType;
  }

  set peopleid(int newpeopleid) {
    this._peopleid = peopleid;
  }

  set groupid(int newgroupid) {
    this._groupid = newgroupid;
  }

  set identifier(int newidentifier) {
    this._identifier = newidentifier;
  }

  set parent(int newparent) {
    this._parent = newparent;
  }

  set isDeleted(int newisDeleted) {
    this._isDeleted = newisDeleted;
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

  set ticketno(int newticketno) {
    this._ticketno = newticketno;
  }

  set buid(int newbuid) {
    this._buid = newbuid;
  }

  set seqno(int newseqno) {
    this._seqno = newseqno;
  }

  set ticketcategory(int newticketcategory) {
    this._ticketcategory = newticketcategory;
  }

  set ctzoffset(int newctzoffset) {
    this._ctzoffset = newctzoffset;
  }

  set multiplicationfactor(String newmultiplicationfactor) {
    this._multiplicationfactor = newmultiplicationfactor;
  }

  set multiplicationfactor1(String newmultiplicationfactor1) {
    this._multiplicationfactor1 = newmultiplicationfactor1;
  }

  set multiplicationfactor2(String newmultiplicationfactor2) {
    this._multiplicationfactor2 = newmultiplicationfactor2;
  }

  set attachmentcount(String newattachmentcount) {
    this._attachmentcount = newattachmentcount;
  }

  set syncStatus(String newsyncStatus) {
    this._syncStatus = newsyncStatus;
  }

  // Convert a Note   object into a Map object
  Map<String, dynamic> toMap() {
    var map = Map<String, dynamic>();
    if (id != null) {
      map['id'] = _id;
    }
    map['jobneedid'] = _jobneedid;
    map['jobdesc'] = _jobdesc;
    map['plandatetime'] = _plandatetime;
    map['expirydatetime'] = _expirydatetime;
    map['gracetime'] = _gracetime;
    map['receivedonserver'] = _receivedonserver;
    map['starttime'] = _starttime;
    map['endtime'] = _endtime;
    map['gpslocation'] = _gpslocation;
    map['remarks'] = _remarks;
    map['aatop'] = _aatop;
    map['assetid'] = _assetid;
    map['frequency'] = _frequency;
    map['jobid'] = _jobid;
    map['jobstatus'] = _jobstatus;
    map['jobtype'] = _jobtype;
    map['performedby'] = _performedby;
    map['priority'] = _priority;
    map['questionsetid'] = _questionsetid;
    map['ScanType'] = _ScanType;
    map['peopleid'] = _peopleid;
    map['groupid'] = _groupid;
    map['identifier'] = _identifier;
    map['parent'] = _parent;
    map['isDeleted'] = _isDeleted;
    map['cuser'] = _cuser;
    map['muser'] = _muser;
    map['cdtz'] = _cdtz;
    map['mdtz'] = _mdtz;
    map['ticketno'] = _ticketno;
    map['buid'] = _buid;
    map['seqno'] = _seqno;
    map['ticketcategory'] = _ticketcategory;
    map['ctzoffset'] = _ctzoffset;
    map['multiplicationfactor'] = _multiplicationfactor;
    map['multiplicationfactor1'] = _multiplicationfactor1;
    map['multiplicationfactor2'] = _multiplicationfactor2;
    map['attachmentcount'] = _attachmentcount;
    map['syncStatus'] = _syncStatus;
    return map;
  }

  // Extract a Note object from a Map object
  Jobneed_DAO.fromMapObject(Map<String, dynamic> map) {
    this._id = map['id'];
    this._jobneedid = map['jobneedid'];
    this._jobdesc = map['jobdesc'];
    this._plandatetime = map['plandatetime'];
    this._jobdesc = map['jobdesc'];
    this._expirydatetime = map['expirydatetime'];
    this._gracetime = map['gracetime'];
    this._receivedonserver = map['receivedonserver'];
    this._starttime = map['starttime'];
    this._endtime = map['endtime'];
    this._gpslocation = map['gpslocation'];
    this._remarks = map['remarks'];
    this._aatop = map['aatop'];
    this._assetid = map['assetid'];
    this._frequency = map['frequency'];
    this._jobid = map['jobid'];
    this._jobstatus = map['jobstatus'];
    this._jobtype = map['jobtype'];
    this._performedby = map['performedby'];
    this._priority = map['priority'];
    this._questionsetid = map['questionsetid'];
    this._ScanType = map['ScanType'];
    this._peopleid = map['peopleid'];
    this._groupid = map['groupid'];
    this._identifier = map['identifier'];
    this._parent = map['parent'];
    this._isDeleted = map['isDeleted'];
    this._cuser = map['cuser'];
    this._muser = map['muser'];
    this._cdtz = map['cdtz'];
    this._mdtz = map['mdtz'];
    this._ticketno = map['ticketno'];
    this._buid = map['buid'];
    this._seqno = map['seqno'];
    this._ticketcategory = map['ticketcategory'];
    this._ctzoffset = map['ctzoffset'];
    this._multiplicationfactor = map['multiplicationfactor'];
    this._multiplicationfactor1 = map['multiplicationfactor1'];
    this._multiplicationfactor2 = map['multiplicationfactor2'];
    this._attachmentcount = map['attachmentcount'];
    this._syncStatus = map['syncStatus'];
  }
}
