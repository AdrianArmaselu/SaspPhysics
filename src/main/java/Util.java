import java.io.Closeable;
import java.io.IOException;

/**
 * Created by adisor on 4/23/2017.
 */
public class Util {

    public static void closeResource(Closeable resource){
        if(resource != null)
            try {
                resource.close();
            } catch (IOException e) {
                e.printStackTrace();
            }
    }
}
