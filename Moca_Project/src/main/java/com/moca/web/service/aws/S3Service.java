package com.moca.web.service.aws;

import com.amazonaws.services.s3.AmazonS3Client;
import com.amazonaws.services.s3.model.CannedAccessControlList;
import com.amazonaws.services.s3.model.PutObjectRequest;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.apache.commons.io.FilenameUtils;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Component;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.ServletContext;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.Optional;
import java.util.UUID;

@Slf4j
@RequiredArgsConstructor
@Component
public class S3Service{

    private final AmazonS3Client amazonS3Client;
    private final ServletContext servletContext;

    @Value("${moca.data.profile}")
    String profilePath;

    @Value("${cloud.aws.s3.bucket}")
    public String bucket;  // S3 버킷 이름

    public String upload(MultipartFile multipartFile) throws IOException {
        File uploadFile = convert(multipartFile)  // 파일 변환할 수 없으면 에러
                .orElseThrow(() -> new IllegalArgumentException("error: MultipartFile -> File convert fail"));

        return upload(uploadFile);
    }

    // S3로 파일 업로드하기
    private String upload(File uploadFile) {
//        String fileName = UUID.randomUUID() + uploadFile.getName();
        String fileName = uploadFile.getName();
        String uploadImageUrl = putS3(uploadFile, fileName);
        removeNewFile(uploadFile);
        return fileName;
    }

    // S3로 업로드
    private String putS3(File uploadFile, String fileName) {
        amazonS3Client.putObject(new PutObjectRequest(bucket, fileName, uploadFile).withCannedAcl(CannedAccessControlList.PublicRead));
        return amazonS3Client.getUrl(bucket, fileName).toString();
    }

    // 로컬에 저장된 이미지 지우기
    private void removeNewFile(File targetFile) {
        if (targetFile.delete()) {
            log.info("File delete success");
            return;
        }
        log.info("File delete fail");
    }

    // 로컬에 파일 업로드 하기
    private Optional<File> convert(MultipartFile file) throws IOException {
        StringBuilder files = new StringBuilder();
        files.append(System.currentTimeMillis());
        files.append(".");
        files.append(FilenameUtils.getExtension(file.getOriginalFilename()));
        String fileName = String.valueOf(files);

        String OS = System.getProperty("os.name").toLowerCase();
        String dirPath = null;

        if (OS.indexOf("win") >= 0) {
            dirPath = servletContext.getRealPath("/resources/img/profileImg/");
        }else if (OS.indexOf("mac") >= 0) {
            dirPath = servletContext.getRealPath("/resources/img/profileImg/");
        }else {
            dirPath = profilePath;
        }

        File convertFile = new File(dirPath + fileName);
        if (convertFile.createNewFile()) { // 바로 위에서 지정한 경로에 File이 생성됨 (경로가 잘못되었다면 생성 불가능)
            try (FileOutputStream fos = new FileOutputStream(convertFile)) { // FileOutputStream 데이터를 파일에 바이트 스트림으로 저장하기 위함
                fos.write(file.getBytes());
            }
            return Optional.of(convertFile);
        }

        return Optional.empty();
    }
}