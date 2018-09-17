package com.spring.hungry.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.hungry.dao.ImageDAO;
import com.spring.hungry.model.Image;

@Service
public class ImageService {

    @Autowired ImageDAO imageDAO;
    public void insertImageList(List<Image> imageList) {
        for(Image image : imageList) {
            imageDAO.insert(image);
        }
    }
}