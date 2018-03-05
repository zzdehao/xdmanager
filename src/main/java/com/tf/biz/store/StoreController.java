package com.tf.biz.store;

import com.tf.biz.imp.pojo.FilePath;
import com.tf.tadmin.controller.BaseController;
import com.tf.tadmin.entity.Upload;
import com.tf.tadmin.service.UploadService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

/**
 * @author mo.xf
 * @date 2015年12月25日
 */
@Controller
public class StoreController extends BaseController {

    private Logger logger = LoggerFactory.getLogger(this.getClass());

    @Resource
    private UploadService uploadService;

    @Autowired
    private StoreService storeService;

    @Value("${upload.dir}")
    private String uploadDir;

    @RequestMapping(value = "/store/import", method = {RequestMethod.POST})
    public @ResponseBody Upload importStore(@RequestParam MultipartFile multipartFile, HttpServletRequest req, Upload upload) throws Exception {
        String realPath = req.getSession().getServletContext().getRealPath(this.uploadDir);
        String webPath = req.getContextPath() + this.uploadDir;
        this.storeService.saveMultipartFile(multipartFile, new FilePath(realPath, webPath));
        return upload;
    }


    @RequestMapping(value = "/get/{id}", method = {RequestMethod.GET, RequestMethod.POST})
    public @ResponseBody
    String get(Integer id) {
        Upload upload = this.uploadService.queryById(id);
        return upload.getPath();
    }

}
