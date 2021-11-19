package com.utils;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.io.UnsupportedEncodingException;

import javax.servlet.http.HttpServletResponse;

import org.springframework.web.multipart.MultipartFile;

public class FileUtil {

	    public static void down(HttpServletResponse res, String pathAddress) throws UnsupportedEncodingException {
	        File file=new File(pathAddress);
	        String fileName = file.getName();

	        res.setHeader("content-type", "application/octet-stream");
	        res.setContentType("application/octet-stream");
	        res.setHeader("Content-Disposition", "attachment;filename=" + new String(fileName.getBytes("utf-8"),"iso-8859-1"));
	        byte[] buff = new byte[1024];
	        FileInputStream bis = null;
	        OutputStream os = null;
	        try {
	            os = res.getOutputStream();
	            bis = new FileInputStream(file);
	            int readTmp = 0;
	            while ((readTmp = bis.read(buff)) != -1) {
	                os.write(buff, 0, readTmp);
	            }
	        } catch (IOException e) {
	            e.printStackTrace();
	        } finally {
	            if (bis != null) try {
	                bis.close();
	            } catch (IOException e) {
	                e.printStackTrace();
	            }
	        }
	        System.out.println("文件下载成功！");
	    }

	    
	    
	    /**
	     * MultipartFile 转 File
	     *
	     * @param file
	     * @throws Exception
	     */
	    public static File multipartFileToFile(MultipartFile file, String urlString) throws Exception {
	 
	        File toFile = null;
	        if (file.equals("") || file.getSize() <= 0) {
	            file = null;
	        } else {
	            InputStream ins = null;
	            ins = file.getInputStream();
	            toFile = new File(urlString + "\\" + file.getOriginalFilename());
	            if (!toFile.getParentFile().exists()&&!toFile.isDirectory()){
	            	toFile.getParentFile().mkdirs();
	            	toFile.createNewFile();
	            } else {
	            	toFile.createNewFile();
	            }
	            inputStreamToFile(ins, toFile);
	            ins.close();
	        }
	        return toFile;
	    }
	    //获取流文件
	    private static void inputStreamToFile(InputStream ins, File file) {
	        try {
	            OutputStream os = new FileOutputStream(file);
	            int bytesRead = 0;
	            byte[] buffer = new byte[8192];
	            while ((bytesRead = ins.read(buffer, 0, 8192)) != -1) {
	                os.write(buffer, 0, bytesRead);
	            }
	            os.close();
	            ins.close();
	        } catch (Exception e) {
	            e.printStackTrace();
	        }
	    }
	    
	    /**
	     * 删除本地临时文件
	     * @param file
	     */
	    public static void delteTempFile(File file) {
		    if (file != null) {
		        File del = new File(file.toURI());
		        del.delete();
		
		    }
	    }
}
