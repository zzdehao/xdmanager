package com.tf.biz.check;

import com.tf.biz.check.entity.BizCheckPlanExample;
import com.tf.biz.check.mapper.BizCheckPlanMapper;
import com.tf.biz.imp.ImportService;
import com.tf.biz.imp.constant.ImportEnum;
import com.tf.biz.imp.pojo.FilePath;
import com.tf.biz.store.entity.BizStore;
import com.tf.biz.store.mapper.BizStoreMapper;
import com.tf.tadmin.entity.SessionUser;
import com.tf.tadmin.shiro.ShiroUtils;
import com.tf.tadmin.utils.ExcelUtil;
import org.apache.poi.hssf.usermodel.HSSFClientAnchor;
import org.apache.poi.hssf.usermodel.HSSFPatriarch;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.openxml4j.exceptions.InvalidFormatException;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.ss.usermodel.Workbook;
import org.apache.poi.ss.usermodel.WorkbookFactory;
import org.apache.poi.xssf.usermodel.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

import javax.imageio.ImageIO;
import java.awt.image.BufferedImage;
import java.io.*;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

@Service
@Transactional
public class CheckService {

    @Autowired
    private BizCheckPlanMapper bizCheckPlanMapper;

    XSSFWorkbook createExcel(){

        return buildExcel();
    }

    private XSSFWorkbook buildExcel() {
        FileOutputStream fileOut = null;
        BufferedImage bufferImg = null;

        XSSFWorkbook workBook = new XSSFWorkbook();
        XSSFSheet sheet = workBook.createSheet("导出excel例子");
        XSSFRow headRow = sheet.createRow(0);
        XSSFCell cell = null;
        for (int i = 0; i < 10; i++) {
            cell = headRow.createCell(i);
            cell.setCellValue("头_" + i);
        }
        try {
            ByteArrayOutputStream byteArrayOut = new ByteArrayOutputStream();
            bufferImg = ImageIO.read(new File("D:/temp/wxd/test.jpg"));
            ImageIO.write(bufferImg, "jpg", byteArrayOut);
            XSSFDrawing patriarch = sheet.createDrawingPatriarch();
            XSSFClientAnchor anchor = new XSSFClientAnchor(0, 0, 1023, 250, (short) 1, 1, (short) 5, 8);
            patriarch.createPicture(anchor, workBook.addPicture(byteArrayOut.toByteArray(), XSSFWorkbook.PICTURE_TYPE_JPEG));
        } catch (IOException e) {
            e.printStackTrace();
        }

        return workBook;
    }

}
