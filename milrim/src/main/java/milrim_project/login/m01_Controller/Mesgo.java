package milrim_project.login.m01_Controller;

import java.util.HashMap;
import org.json.simple.JSONObject;
import net.nurigo.java_sdk.api.Message;
import net.nurigo.java_sdk.exceptions.CoolsmsException;

public class Mesgo {
    String api_key = "NCSCIW74KIRULFKD";
    String api_secret = "0VXCPQF8SNFHHJW38DRZMZ6ZZUZGXFJY";
    Message coolsms = new Message(api_key, api_secret);

    public void mesgo() {
    	
    // 4 params(to, from, type, text) are mandatory. must be filled
    HashMap<String, String> params = new HashMap<String, String>();
    params.put("to", "01033293090");
    params.put("from", "01033293090"); //무조건 자기번호 (인증)
    params.put("type", "SMS");
    params.put("text", "ㅎㅇ");
    params.put("app_version", "test app 1.2"); // application name and version

    try {
    	//send() 는 메시지를 보내는 함수  
      JSONObject obj = (JSONObject) coolsms.send(params);
      System.out.println(obj.toString());
    } catch (CoolsmsException e) {
      System.out.println(e.getMessage());
      System.out.println(e.getCode());
    }
  }
}
