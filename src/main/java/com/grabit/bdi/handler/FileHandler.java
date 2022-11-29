package com.grabit.bdi.handler;

import java.io.IOException;

import javax.annotation.Resource;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Component;
import org.springframework.web.multipart.MultipartFile;

import com.amazonaws.SdkClientException;
import com.amazonaws.services.s3.model.ObjectMetadata;
import com.grabit.bdi.config.CredentialsConfig;

@Component
public class FileHandler {

	@Value("${bucket.name}")
	private String BUCKET_NAME;
	@Value("${folder.in.bucket}")
	private String FOLDER_NAME;
	@Resource
	private CredentialsConfig cc;

	public String getNewFileName(MultipartFile file) {
		String ogFileName = file.getOriginalFilename();
		String newFileName = System.nanoTime() + ogFileName.substring(ogFileName.indexOf("."));
		return newFileName;
	}

	public void putObject(MultipartFile file, String fileName) {
		ObjectMetadata omd = new ObjectMetadata();
		omd.setContentType(file.getContentType());
		omd.setContentLength(file.getSize());
		try {
			cc.getS3Client().putObject(BUCKET_NAME, FOLDER_NAME + fileName, file.getInputStream(), omd);
		} catch (SdkClientException | IOException e) {
			e.printStackTrace();
		}
	}

	public void deleteObject(String fileName) {
		cc.getS3Client().deleteObject(BUCKET_NAME, FOLDER_NAME + fileName);
	}
}
