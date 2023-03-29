package com.danim.service;

import com.danim.dto.AddPostReq;
import com.danim.dto.GetPostRes;
import com.danim.entity.Photo;
import com.danim.entity.Post;
import org.springframework.web.multipart.MultipartFile;

import java.util.List;

public interface PostService {
    // 포스트 등록
    Post createPost() throws Exception;
    Post insertPost(Post savedPost, List<Photo> photoList, MultipartFile flagFile, MultipartFile voiceFile, AddPostReq addPostReq) throws Exception;

    // 포스트 삭제
    void deletePostById(Long postId) throws Exception;

    // 지역명 검색어에 따른 post 조회
    List<GetPostRes> findByLocation(String location) throws Exception;
}
