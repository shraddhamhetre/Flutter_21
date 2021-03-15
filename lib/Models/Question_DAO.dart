class Question_DAO {
  int _id;
  int _questionid;
  String _questionname;
  int _type;
  String _options;
  int _unit;
  String _Min;
  String _Max;
  String _alertOn;
  int _cuser;
  String _cdtz;
  int _muser;
  String _mdtz;
  int _buid;

  Question_DAO(
      this._questionid,
      this._questionname,
      this._type,
      this._options,
      this._unit,
      this._Min,
      this._Max,
      this._alertOn,
      this._cuser,
      this._cdtz,
      this._muser,
      this._mdtz,
      this._buid);

  Question_DAO.withId(
      this._id,
      this._questionid,
      this._questionname,
      this._type,
      this._options,
      this._unit,
      this._Min,
      this._Max,
      this._alertOn,
      this._cuser,
      this._cdtz,
      this._muser,
      this._mdtz,
      this._buid);

  int get id => _id;
  int get questionid => _questionid;
  String get questionname => _questionname;
  int get type => _type;
  String get options => _options;
  int get unit => _unit;
  String get Min => _Min;
  String get Max => _Max;
  String get alertOn => _alertOn;
  int get cuser => _cuser;
  String get cdtz => _cdtz;
  int get muser => _muser;
  String get mdtz => _mdtz;
  int get buid => _buid;

  set questionid(int newquestionid) {
    this._questionid = newquestionid;
  }

  set questionname(String newquestionname) {
    this._questionname = newquestionname;
  }

  set type(int newtype) {
    this._type = newtype;
  }

  set options(String newoptions) {
    this._options = newoptions;
  }

  set unit(int newunit) {
    this._unit = newunit;
  }

  set Min(String newMin) {
    this._Min = newMin;
  }

  set Max(String newMax) {
    this._Max = newMax;
  }

  set alertOn(String newalertOn) {
    this._alertOn = newalertOn;
  }

  set cuser(int newcuser) {
    this._cuser = newcuser;
  }

  set cdtz(String newcdtz) {
    this._cdtz = newcdtz;
  }

  set muser(int newmuser) {
    this._muser = newmuser;
  }

  set mdtz(String newmdtz) {
    this._mdtz = newmdtz;
  }

  set buid(int newbuid) {
    this._buid = newbuid;
  }

  // Convert a Note   object into a Map object
  Map<String, dynamic> toMap() {
    var map = Map<String, dynamic>();
    if (id != null) {
      map['id'] = _id;
    }
    map['questionid'] = _questionid;
    map['questionname'] = _questionname;
    map['type'] = _type;
    map['options'] = _options;
    map['unit'] = _unit;
    map['Min'] = _Min;
    map['Max'] = _Max;
    map['alertOn'] = _alertOn;
    map['cuser'] = _cuser;
    map['cdtz'] = _cdtz;
    map['muser'] = _muser;
    map['mdtz'] = _mdtz;
    map['buid'] = _buid;
    return map;
  }

  // Extract a Note object from a Map object
  Question_DAO.fromMapObject(Map<String, dynamic> map) {
    this._id = map['id'];
    this._questionid = map['questionid'];
    this._questionname = map['questionname'];
    this._type = map['type'];
    this._options = map['options'];
    this._unit = map['unit'];
    this._Min = map['Min'];
    this._Max = map['Max'];
    this._alertOn = map['alertOn'];
    this._cuser = map['cuser'];
    this._cdtz = map['cdtz'];
    this._muser = map['muser'];
    this._mdtz = map['mdtz'];
    this._buid = map['buid'];
  }
}
