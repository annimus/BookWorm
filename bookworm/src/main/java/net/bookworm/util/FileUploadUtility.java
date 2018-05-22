package net.bookworm.util;

import java.io.File;
import java.io.IOException;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.multipart.MultipartFile;

public class FileUploadUtility {

	// Windows ABS_PATH
	private static final String ABS_PATH = "C:\\Users\\Guilherme\\git\\BookWorm\\bookworm\\src\\main\\webapp\\assets\\images\\";
	
	// Ubuntu ABS_PATH
	//private static final String ABS_PATH = "/home/guilherme/git/BookWorm/bookworm/src/main/webapp/assets/images/";
	
	private static String REAL_PATH = "";
	private static final Logger logger = LoggerFactory.getLogger(FileUploadUtility.class);
	
	
	public static void uploadFile(HttpServletRequest request, MultipartFile file, String code) {
		// Getting the real path
		REAL_PATH = request.getSession().getServletContext().getRealPath("/assets/images/");
		logger.info(REAL_PATH);
		
		// Creates the directories if they do not exist
		if (!(new File(ABS_PATH).exists())) {
			new File(ABS_PATH).mkdirs();
		}
		
		if (!(new File(REAL_PATH).exists())) {
			new File(REAL_PATH).mkdirs();
		}
		
		try {
			// Server Upload
			file.transferTo(new File(REAL_PATH + code + ".jpg"));
			
			// Project Directory Upload
			file.transferTo(new File(ABS_PATH + code + ".jpg"));
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
}
