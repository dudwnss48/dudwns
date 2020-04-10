package bytestream;

import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.net.MalformedURLException;
import java.net.URL;

import org.apache.commons.io.IOUtils;

public class FileCopyDemo8 {
	
	public static void main(String[] args) throws IOException {
		
		URL url = new URL("https://www.topstarnews.net/news/photo/201908/653630_355016_3125.jpg");
		
		InputStream is = url.openStream();
		FileOutputStream fos = new FileOutputStream("c:/files/가이드");
		
		IOUtils.copy(is, fos);
				
	}

}
