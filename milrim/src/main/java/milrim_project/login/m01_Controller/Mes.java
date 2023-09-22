
package milrim_project.login.m01_Controller;
public class Mes {
  public static void main(String[] args) {
	  String checkNum = "";
	  for(int i=1;i<=6;i++) {
		  int rdNum = (int)(Math.random()*10);
		  checkNum += ""+rdNum;
	  }
  }
}