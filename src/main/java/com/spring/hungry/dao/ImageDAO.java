package com.spring.hungry.dao;

import com.spring.hungry.common.CommonDAO;
import com.spring.hungry.model.Image;
import org.springframework.stereotype.Component;

@Component
public class ImageDAO extends CommonDAO {
    private static final String nameSpace = "image.";

    public void insert(Image image) {
        super.insert(nameSpace + "save", image);
    }
}
