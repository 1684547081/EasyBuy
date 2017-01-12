package cn.zll.servlet;




import java.io.IOException;

import javax.imageio.ImageIO;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import cn.zll.util.AuthCode;


public class AuthCodeServlet extends HttpServlet {

	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doPost(request, response);
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String authCode = AuthCode.getAuthCode();  
        
        request.getSession().setAttribute("authCode", authCode); 
        //����֤�뱣�浽session�У������Ժ���֤  
        try {  
            //����ͼƬ  
            ImageIO.write(AuthCode.getAuthImg(authCode), "JPEG", response.getOutputStream());  
        } catch (IOException e){  
            e.printStackTrace();  
        } 
	}

}
