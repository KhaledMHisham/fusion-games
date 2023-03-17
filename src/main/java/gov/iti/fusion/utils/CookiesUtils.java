package gov.iti.fusion.utils;

import jakarta.servlet.http.Cookie;

public class CookiesUtils {

    public static Cookie getCookie(Cookie[] cookies, String name){
        if(cookies == null){
            return null;
        }
        for(Cookie cookie : cookies){
            if(cookie.getName().equals(name)){
                return cookie;
            }
        }
        return null;
    }
}
