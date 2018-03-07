package com.tf.biz.check;

import com.tf.biz.check.entity.BizCheckDetail;
import com.tf.biz.check.entity.BizCheckDetailExample;
import com.tf.biz.imp.pojo.FilePath;
import com.tf.biz.store.StoreService;
import com.tf.tadmin.controller.BaseController;
import com.tf.tadmin.entity.Upload;
import com.tf.tadmin.service.UploadService;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.BufferedOutputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.lang.reflect.InvocationTargetException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

/**
 * @author zx
 * @date 2018-3-6
 */
@Controller
public class CheckController extends BaseController {

    private Logger logger = LoggerFactory.getLogger(this.getClass());

    private final String fileName = "导出";

    @Resource
    private CheckService checkService;


    @Value("${upload.dir}")
    private String uploadDir;

    @RequestMapping(value = "/check/export", method = {RequestMethod.GET})
    public void exportCheck(HttpServletResponse response, HttpServletRequest request, Upload upload) throws Exception {
        response.reset();
        response.setHeader("Content-Disposition", "attachment;filename=" + new String(this.fileName.getBytes(), "iso-8859-1") + ".xlsx");
        response.setContentType("application/vnd.ms-excel;charset=UTF-8");
        response.setHeader("Pragma", "no-cache");
        response.setHeader("Cache-Control", "no-cache");
        response.setDateHeader("Expires", 0);

        XSSFWorkbook workBook = this.checkService.createExcel();
        OutputStream output;
        try {
            output = response.getOutputStream();
            BufferedOutputStream bufferedOutPut = new BufferedOutputStream(output);
            bufferedOutPut.flush();
            workBook.write(bufferedOutPut);
            bufferedOutPut.close();
        } catch (IOException e) {
            this.logger.error(this.fileName + "-失败" + e);
        }

    }

    @RequestMapping(value = "/check/route", method = {RequestMethod.GET})
    public ModelAndView routeCheck(HttpServletResponse response, HttpServletRequest request, Upload upload) throws Exception {
        return new ModelAndView("biz/check/check_route");
    }

    @RequestMapping(value = "/check/route/query", method = {RequestMethod.POST})
    @ResponseBody
    public Object routeCheckQuery(@RequestBody BizCheckDetail checkDetail) throws Exception {
        BizCheckDetailExample example = new BizCheckDetailExample();
        example.setOrderByClause("check_time");
        List<BizCheckDetail> list = this.checkService.findCheckDetail(example);
        Map<Long, List<BizCheckDetail>> checkDetailMap = list.stream().collect(Collectors.groupingBy(BizCheckDetail::getPlanId, Collectors.toList()));
        List<List<BizCheckDetail>> relist = new ArrayList();
        checkDetailMap.forEach((k, v) -> relist.add(v));
        return relist;
    }


}
