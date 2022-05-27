

class Controller
{
  static bool isNumiric(String str)
  {
    if(str==null)
    {
      return false;
    }

    return double.parse(str,(e) => 0) !=null || int.parse(str,onError: (e) => 0) !=null;


  }



}