package ShoeStoreAPI.ShoeStoreAPI.service;

import com.cloudinary.Cloudinary;
import com.cloudinary.utils.ObjectUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

@Service
public class CloudinaryService {

    @Autowired
    private Cloudinary cloudinaryConfig;

    public String uploadFile(MultipartFile file) {
        try {
            File uploadedFile = convertMultiPartToFile(file);
            
            // Tạo Map để chỉ định thư mục 'ShoeStore'
            Map<String, Object> uploadParams = new HashMap<>();
            uploadParams.put("folder", "Avatar");
            
            @SuppressWarnings("rawtypes")
            Map uploadResult = cloudinaryConfig.uploader().upload(uploadedFile, uploadParams);
            
            uploadedFile.delete();
            return uploadResult.get("url").toString();
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
    }


    private File convertMultiPartToFile(MultipartFile file) throws IOException {
        File convFile = new File(file.getOriginalFilename());
        FileOutputStream fos = new FileOutputStream(convFile);
        fos.write(file.getBytes());
        fos.close();
        return convFile;
    }

    public String uploadFileProduct(MultipartFile file) {
        try {
            File uploadedFile = convertMultiPartToFile(file);

            // Tạo Map để chỉ định thư mục 'ShoeStore'
            Map<String, Object> uploadParams = new HashMap<>();
            uploadParams.put("folder", "ShoeStore");

            @SuppressWarnings("rawtypes")
            Map uploadResult = cloudinaryConfig.uploader().upload(uploadedFile, uploadParams);

            uploadedFile.delete();
            return uploadResult.get("url").toString();
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
    }
}
