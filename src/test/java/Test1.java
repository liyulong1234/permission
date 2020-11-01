import org.apache.commons.codec.digest.DigestUtils;
import org.junit.Test;

public class Test1 {

    @Test
    public void test1(){
        String str = null;
        String s = DigestUtils.md5Hex(str);
        System.out.println(s);
    }
}
