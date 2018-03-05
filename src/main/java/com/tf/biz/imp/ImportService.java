package com.tf.biz.imp;

import com.tf.biz.imp.entity.BizImportBatch;
import com.tf.biz.imp.mapper.BizImportBatchMapper;
import com.tf.biz.imp.pojo.FilePath;
import com.tf.tadmin.utils.DateUtils;
import com.tf.tadmin.utils.UUIDGenerator;
import org.apache.commons.io.FileUtils;
import org.apache.poi.openxml4j.exceptions.InvalidFormatException;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

import java.io.File;
import java.io.IOException;
import java.util.Date;

@Service
@Transactional
public class ImportService {

    private Logger logger = LoggerFactory.getLogger(this.getClass());

    @Autowired
    private BizImportBatchMapper bizImportBatchMapper;

    public long save(MultipartFile multipartFile, FilePath filePath) throws IOException, InvalidFormatException {
        logger.info("文件长度: " + multipartFile.getSize());
        logger.info("文件类型: " + multipartFile.getContentType());
        logger.info("文件名称: " + multipartFile.getName());
        logger.info("文件原名: " + multipartFile.getOriginalFilename());

        String fileName = UUIDGenerator.getUUID();
        if (multipartFile.getOriginalFilename().lastIndexOf(".") > 0) {
            fileName += multipartFile.getOriginalFilename().substring(multipartFile.getOriginalFilename().lastIndexOf("."));
        }

        String date = DateUtils.formatDateTime(new Date().getTime(), DateUtils.DATE_FORMAT);

        String realPath = filePath.getRealPath() + File.separator + date;
        FileUtils.copyInputStreamToFile(multipartFile.getInputStream(), new File(realPath, fileName));

        String webPath = filePath.getWebPath() + File.separator + date + File.separator + fileName;

        BizImportBatch bizImportBatch = new BizImportBatch();
        //TODO 设置保存

        this.bizImportBatchMapper.insertSelective(bizImportBatch);

        return bizImportBatch.getId();

    }


}
