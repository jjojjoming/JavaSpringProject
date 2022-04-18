package com.moca.web.service;

import com.moca.web.service.aws.S3Service;
import lombok.RequiredArgsConstructor;
import org.apache.commons.io.FilenameUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.io.ClassPathResource;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.ServletContext;
import java.io.File;

@RequiredArgsConstructor
@Service
@Transactional
public class ProfileService {

    private final S3Service s3Service;

    public String saveUploadFile(MultipartFile profileImg) {

        // 첨부파일 받기위한 코드(시간단위 ms 단위로 설정)
        // 한글 타입 때문에 DB에 저장된 파일 명과, 디렉토리에 저장된 파일명이 동일하더라고
        // 인코딩 문제로 화면에서 파일을 찾을 수 없어서 이미지 표시가 안됨
        // 원본 파일명을 쓰지말고 ms 단위로 파일을 저장
        String fileName = null;
        try {
            fileName = s3Service.upload(profileImg);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return fileName;
    }

}
