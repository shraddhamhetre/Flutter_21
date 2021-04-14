class Asset_DAO {
  int _id;
  int _assetid;
  String _assetcode;
  String _assetname;
  String _enable;
  String _iscritical;
  String _gpslocation;
  int _parent;
  int _identifier;
  int _runningstatus;
  int _cuser;
  int _muser;
  String _cdtz;
  String _isdeleted;
  String _mdtz;
  String _syncStatus;
  int _buid;
  String _loccode;
  String _locname;
  int _type;
  int _category;
  int _subcategory;
  int _brand;
  int _model;
  String _supplier;
  String _capacity;
  int _unit;
  String _yom;
  String _msn;
  String _bdate;
  String _pdate;
  String _isdate;
  String _billval;
  int _service;
  String _Sservprov;
  String _servprovname;
  String _sfdate;
  String _stdate;
  int _meter;
  String _qsetids;
  String _qsetname;
  String _tempcode;
  String _multiplicationfactor;

  Asset_DAO(
      this._assetid,
      this._assetcode,
      this._assetname,
      this._enable,
      this._iscritical,
      this._gpslocation,
      this._parent,
      this._identifier,
      this._runningstatus,
      this._cuser,
      this._muser,
      this._cdtz,
      this._isdeleted,
      this._mdtz,
      this._syncStatus,
      this._buid,
      this._loccode,
      this._locname,
      this._type,
      this._category,
      this._subcategory,
      this._brand,
      this._model,
      this._supplier,
      this._capacity,
      this._unit,
      this._yom,
      this._msn,
      this._bdate,
      this._pdate,
      this._isdate,
      this._billval,
      this._service,
      this._Sservprov,
      this._servprovname,
      this._sfdate,
      this._stdate,
      this._meter,
      this._qsetids,
      this._qsetname,
      this._tempcode,
      this._multiplicationfactor);

  Asset_DAO.withId(
      this._id,
      this._assetid,
      this._assetcode,
      this._assetname,
      this._enable,
      this._iscritical,
      this._gpslocation,
      this._parent,
      this._identifier,
      this._runningstatus,
      this._cuser,
      this._muser,
      this._cdtz,
      this._isdeleted,
      this._mdtz,
      this._syncStatus,
      this._buid,
      this._loccode,
      this._locname,
      this._type,
      this._category,
      this._subcategory,
      this._brand,
      this._model,
      this._supplier,
      this._capacity,
      this._unit,
      this._yom,
      this._msn,
      this._bdate,
      this._pdate,
      this._isdate,
      this._billval,
      this._service,
      this._Sservprov,
      this._servprovname,
      this._sfdate,
      this._stdate,
      this._meter,
      this._qsetids,
      this._qsetname,
      this._tempcode,
      this._multiplicationfactor);

  int get id => _id;
  int get assetid => _assetid;
  String get assetcode => _assetcode;
  String get assetname => _assetname;
  String get enable => _enable;
  String get iscritical => _iscritical;
  String get gpslocation => _gpslocation;
  int get parent => _parent;
  int get identifier => _identifier;
  int get runningstatus => _runningstatus;
  int get cuser => _cuser;
  int get muser => _muser;
  String get cdtz => _cdtz;
  String get isdeleted => _isdeleted;
  String get mdtz => _mdtz;
  String get syncStatus => _syncStatus;
  int get buid => _buid;
  String get loccode => _loccode;
  String get locname => _locname;
  int get type => _type;
  int get category => _category;
  int get subcategory => _subcategory;
  int get brand => _brand;
  int get model => _model;
  String get supplier => _supplier;
  String get capacity => _capacity;
  int get unit => _unit;
  String get yom => _yom;
  String get msn => _msn;
  String get bdate => _bdate;
  String get pdate => _pdate;
  String get isdate => _isdate;
  String get billval => _billval;
  int get service => _service;
  String get Sservprov => _Sservprov;
  String get servprovname => _servprovname;
  String get sfdate => _sfdate;
  String get stdate => _stdate;
  int get meter => _meter;
  String get qsetids => _qsetids;
  String get qsetname => _qsetname;
  String get tempcode => _tempcode;
  String get multiplicationfactor => _multiplicationfactor;

  set assetid(int newassetid) {
    this._assetid = newassetid;
  }

  set assetcode(String newassetcode) {
    this._assetcode = newassetcode;
  }

  set assetname(String newassetname) {
    this._assetname = newassetname;
  }

  set enable(String newenable) {
    this._enable = newenable;
  }

  set iscritical(String newiscritical) {
    this._iscritical = newiscritical;
  }

  set gpslocation(String newgpslocation) {
    this._gpslocation = newgpslocation;
  }

  set parent(int newparent) {
    this._parent = newparent;
  }

  set identifier(int newidentifier) {
    this._identifier = newidentifier;
  }

  set runningstatus(int newrunningstatus) {
    this._runningstatus = newrunningstatus;
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

  set isdeleted(String newisdeleted) {
    this._isdeleted = newisdeleted;
  }

  set mdtz(String newmdtz) {
    this._mdtz = newmdtz;
  }

  set syncStatus(String newsyncStatus) {
    this._syncStatus = newsyncStatus;
  }

  set buid(int newbuid) {
    this._buid = newbuid;
  }

  set loccode(String newloccode) {
    this._loccode = newloccode;
  }

  set locname(String newlocname) {
    this._locname = newlocname;
  }

  set type(int newtype) {
    this._type = newtype;
  }

  set category(int newcategory) {
    this._category = newcategory;
  }

  set subcategory(int newsubcategory) {
    this._subcategory = newsubcategory;
  }

  set brand(int newbrand) {
    this._brand = newbrand;
  }

  set model(int newmodel) {
    this._model = newmodel;
  }

  set supplier(String newsupplier) {
    this._supplier = newsupplier;
  }

  set capacity(String newcapacity) {
    this._capacity = newcapacity;
  }

  set unit(int newunit) {
    this._unit = newunit;
  }

  set yom(String newyom) {
    this._yom = newyom;
  }

  set msn(String newmsn) {
    this._msn = newmsn;
  }

  set bdate(String newbdate) {
    this._bdate = newbdate;
  }

  set pdate(String newpdate) {
    this._pdate = newpdate;
  }

  set isdate(String newisdate) {
    this._isdate = newisdate;
  }

  set billval(String newbillval) {
    this._billval = newbillval;
  }

  set service(int newservice) {
    this._service = newservice;
  }

  set Sservprov(String newSservprov) {
    this._Sservprov = newSservprov;
  }

  set servprovname(String newservprovname) {
    this._servprovname = newservprovname;
  }

  set sfdate(String newsfdate) {
    this._sfdate = newsfdate;
  }

  set stdate(String newstdate) {
    this._stdate = newstdate;
  }

  set meter(int newmeter) {
    this._meter = newmeter;
  }

  set qsetids(String newqsetids) {
    this._qsetids = newqsetids;
  }

  set qsetname(String newqsetname) {
    this._qsetname = newqsetname;
  }

  set tempcode(String newtempcode) {
    this._tempcode = newtempcode;
  }

  set multiplicationfactor(String newmultiplicationfactor) {
    this._multiplicationfactor = newmultiplicationfactor;
  }

  // Convert a Note   object into a Map object
  Map<String, dynamic> toMap() {
    var map = Map<String, dynamic>();
    if (id != null) {
      map['id'] = _id;
    }
    map['assetid'] = _assetid;
    map['assetcode'] = _assetcode;
    map['assetname'] = _assetname;
    map['enable'] = _enable;
    map['iscritical'] = _iscritical;
    map['gpslocation'] = _gpslocation;
    map['parent'] = _parent;
    map['identifier'] = _identifier;
    map['runningstatus'] = _runningstatus;
    map['cuser'] = _cuser;
    map['muser'] = _muser;
    map['cdtz'] = _cdtz;
    map['isdeleted'] = _isdeleted;
    map['mdtz'] = _mdtz;
    map['syncStatus'] = _syncStatus;
    map['buid'] = _buid;
    map['loccode'] = _loccode;
    map['locname'] = _locname;
    map['type'] = _type;
    map['category'] = _category;
    map['subcategory'] = _subcategory;
    map['brand'] = _brand;
    map['model'] = _model;
    map['supplier'] = _supplier;
    map['capacity'] = _capacity;
    map['unit'] = _unit;
    map['yom'] = _yom;
    map['msn'] = _msn;
    map['bdate'] = _bdate;
    map['pdate'] = _pdate;
    map['isdate'] = _isdate;
    map['billval'] = _billval;
    map['service'] = _service;
    map['Sservprov'] = _Sservprov;
    map['servprovname'] = _servprovname;
    map['sfdate'] = _sfdate;
    map['stdate'] = _stdate;
    map['meter'] = _meter;
    map['qsetids'] = _qsetids;
    map['qsetname'] = _qsetname;
    map['tempcode'] = _tempcode;
    map['multiplicationfactor'] = _multiplicationfactor;
    return map;
  }

  // Extract a Note object from a Map object
  Asset_DAO.fromMapObject(Map<String, dynamic> map) {
    this._id = map['id'];
    this._assetid = map['assetid'];
    this._assetcode = map['assetcode'];
    this._assetname = map['assetname'];
    this._enable = map['enable'];
    this._iscritical = map['iscritical'];
    this._gpslocation = map['gpslocation'];
    this._parent = map['parent'];
    this._identifier = map['identifier'];
    this._runningstatus = map['runningstatus'];
    this._cuser = map['cuser'];
    this._muser = map['muser'];
    this._cdtz = map['cdtz'];
    this._isdeleted = map['isdeleted'];
    this._mdtz = map['mdtz'];
    this._syncStatus = map['syncStatus'];
    this._buid = map['buid'];
    this._loccode = map['loccode'];
    this._locname = map['locname'];
    this._type = map['type'];
    this._category = map['category'];
    this._subcategory = map['subcategory'];
    this._brand = map['brand'];
    this._model = map['model'];
    this._supplier = map['supplier'];
    this._capacity = map['capacity'];
    this._unit = map['unit'];
    this._yom = map['yom'];
    this._msn = map['msn'];
    this._bdate = map['bdate'];
    this._pdate = map['pdate'];
    this._isdate = map['isdate'];
    this._billval = map['billval'];
    this._service = map['service'];
    this._Sservprov = map['Sservprov'];
    this._servprovname = map['servprovname'];
    this._sfdate = map['sfdate'];
    this._stdate = map['stdate'];
    this._meter = map['meter'];
    this._qsetids = map['qsetids'];
    this._qsetname = map['qsetname'];
    this._tempcode = map['tempcode'];
    this._multiplicationfactor = map['multiplicationfactor'];
  }
}
