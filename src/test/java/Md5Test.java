import com.oraclewdp.ddbookmarket.util.MD5Util;

public class Md5Test{
    public static void main(String[] args) throws  Exception{
        String str="admin";
        System.out.println(MD5Util.getEncryptedPwd(str));
    }
}
