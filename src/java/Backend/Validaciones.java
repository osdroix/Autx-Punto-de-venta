/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Backend;

import java.util.regex.Matcher;
import java.util.regex.Pattern;

public class Validaciones {
    
     public static int validarUsername(String username){
        
        Pattern p= Pattern.compile("[A-Za-zñÑüÜ0-9'.'':']{1,50}");
        Matcher m=p.matcher(username);
        
        if(m.matches()){
            return 0;
        }else if(username.replaceAll(" ", "")==""){
            return 1;
        }else{
            return 2;
        }
    }
     
    public static int validarCorreo(String correo){
        
         Pattern p= Pattern.compile("^[_A-Za-z0-9-\\+]+(\\.[_A-Za-z0-9-]+)*@"
						+ "[A-Za-z0-9-]+(\\.[A-Za-z0-9]+)*(\\.[A-Za-z]{2,})$");
         
        Matcher m=p.matcher(correo);
        
        if(m.matches()){
            return 0;
        }else if(correo.replaceAll(" ","")==""){
            return 1;
        }else{
            return 2;
        }
        
    }
    
    public static int validarPassword(String pass,String passr){
        
         Pattern p= Pattern.compile("[A-Za-zñÑüÜ0-9'.'':']{6,15}");
         
        Matcher m=p.matcher(pass);
        
        if(m.matches()){
            return 0;
        }else if(pass.replaceAll(" ","")==""){
            return 1;
        }else if(pass!=passr){
            return 2;
        }else{
            return 3;
        }
        
    }
    
    public static boolean validarNumero(String num){
         Pattern p= Pattern.compile("[0-9]{16}");
         
        Matcher m=p.matcher(num);
        
        if(m.matches()){
            
            return true;
        }else{
            return false;
        }
        
    }
    
    public static boolean validarFecha(String num){
         Pattern p= Pattern.compile("[0-9]{2}");
         
        Matcher m=p.matcher(num);
        
        if(m.matches()){
            
            return true;
        }else{
            return false;
        }
    }
    
    public static boolean validarCvv(String num){
         Pattern p= Pattern.compile("[0-9]{3}");
         
        Matcher m=p.matcher(num);
        
        if(m.matches()){
            
            return true;
        }else{
            return false;
        }
    }
    
    public static boolean obtenerLetras(String a){
        Pattern p= Pattern.compile("[0-9]{1}");
         
        Matcher m=p.matcher(a);
        if(m.matches()){
            
            return true;
        }else{
            return false;
        }
        
    }
    
    
    public static int getComillas(String a){
        int q=0;
        for (int i = 0; i < a.length(); i++) {
            if(a.charAt(i)=='"' || a.charAt(i)=='\'' || obtenerLetras(""+a.charAt(i))==false){
                q++;
            }
        }
        
        
        return q;
    }
    
}
