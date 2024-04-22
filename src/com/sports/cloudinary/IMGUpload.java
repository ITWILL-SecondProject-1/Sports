package com.sports.cloudinary;

import com.cloudinary.Cloudinary;
import com.cloudinary.utils.ObjectUtils;
import com.sports.utils.Config;

import javax.servlet.http.Part;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.util.HashMap;
import java.util.Map;

public class IMGUpload {
    private Cloudinary cloudinary;

    public IMGUpload() {
        this.cloudinary = new Cloudinary(Config.getENV());
    }

    public Map<String, String> uploadImage(Part filePart) throws IOException {
        File tempFile = File.createTempFile("upload-", ".tmp"); // 임시 파일 생성
        try (InputStream input = filePart.getInputStream();
             OutputStream output = new FileOutputStream(tempFile)) {
            byte[] buffer = new byte[1024];
            int bytesRead;
            while ((bytesRead = input.read(buffer)) != -1) {
                output.write(buffer, 0, bytesRead);
            }
        }

        Map uploadResult = cloudinary.uploader().upload(tempFile, ObjectUtils.emptyMap());
        tempFile.delete();
        Map<String, String> result = new HashMap<>();
        result.put("url", (String) uploadResult.get("url"));
        result.put("public_id", (String) uploadResult.get("public_id"));
        
        return result;
        
        
    }
}