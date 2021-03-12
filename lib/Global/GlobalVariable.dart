class GlobalVariable
{
    static GlobalVariable _instance;
    factory GlobalVariable() => _instance ??= new GlobalVariable._();
    GlobalVariable._();

    String getServerUrl(){
        //return 'http://192.168.1.150:8000/service/';
        //print("site==="+site);
        //return site;
        return 'https://intelliwiz.youtility.in/service/';
    }
}