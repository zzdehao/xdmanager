package com.tf.biz.check;

import com.tf.biz.check.entity.BizCheckDetail;
import com.tf.biz.check.entity.BizCheckDetailExample;
import com.tf.biz.check.entity.BizCheckPlan;
import com.tf.biz.check.entity.BizCheckPlanExample;
import com.tf.biz.check.param.BizCheckDetailRequest;
import com.tf.biz.check.param.BizCheckDetailResponse;
import com.tf.biz.store.StoreService;
import com.tf.biz.store.entity.BizStore;
import com.tf.biz.store.entity.BizStoreExample;
import com.tf.tadmin.controller.BaseController;
import com.tf.tadmin.entity.Admin;
import com.tf.tadmin.entity.Pager;
import com.tf.tadmin.service.AdminService;
import org.apache.commons.lang3.StringUtils;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.util.CollectionUtils;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.BufferedOutputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.function.Function;
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

    @Autowired
    private StoreService storeService;

    @Autowired
    private AdminService adminService;


    @Value("${upload.dir}")
    private String uploadDir;

    @RequestMapping(value = "/check/list/page", method = {RequestMethod.GET})
    public ModelAndView checkListPage(HttpServletResponse response, HttpServletRequest request) throws Exception {
        return new ModelAndView("biz/check/check_list");
    }

    @RequestMapping(value = "/check/list/query", method = {RequestMethod.GET})
    @ResponseBody
    public Pager<BizCheckDetailResponse> checkListPageQuery(@RequestParam Map<String, String> param, @RequestHeader Integer limit, @RequestHeader Integer offset) throws Exception {
        Pager<BizCheckDetailResponse> pager = this.checkService.findList(param, limit, offset);
        return pager;
    }

    @RequestMapping(value = "/check/export", method = {RequestMethod.GET})
    public void exportCheck(@RequestParam Map<String, String> param, HttpServletResponse response) throws Exception {
        response.reset();
        response.setHeader("Content-Disposition", "attachment;filename=" + new String(this.fileName.getBytes(), "iso-8859-1") + ".xlsx");
        response.setContentType("application/vnd.ms-excel;charset=UTF-8");
        response.setHeader("Pragma", "no-cache");
        response.setHeader("Cache-Control", "no-cache");
        response.setDateHeader("Expires", 0);

        XSSFWorkbook workBook = this.checkService.createExcel(param);
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
    public ModelAndView routeCheck(HttpServletResponse response, HttpServletRequest request) throws Exception {
        return new ModelAndView("biz/check/check_route");
    }

    @RequestMapping(value = "/check/route/query", method = {RequestMethod.POST})
    @ResponseBody
    public Object routeCheckQuery(@RequestBody BizCheckDetailRequest checkDetailRequest) throws Exception {
        List<List<Map<String, Object>>> reList = new ArrayList();

        BizCheckDetailExample checkDetailExample = new BizCheckDetailExample();
        BizCheckDetailExample.Criteria criteria = checkDetailExample.createCriteria();

        if (checkDetailRequest.getBatchId() != null) {
            BizCheckPlanExample checkPlanExample = new BizCheckPlanExample();
            checkPlanExample.createCriteria().andBatchIdEqualTo(checkDetailRequest.getBatchId());
            List<BizCheckPlan> checkPlanList = this.checkService.findCheckPlan(checkPlanExample);
            List<Long> planIdList = checkPlanList.stream().map(BizCheckPlan::getId).collect(Collectors.toList());
            if (CollectionUtils.isEmpty(planIdList)) {
                return reList;
            }
            criteria.andPlanIdIn(planIdList);
        }

        this.buildCheckDetailCriteria(criteria, checkDetailRequest);
        checkDetailExample.setOrderByClause("check_time");
        List<BizCheckDetail> list = this.checkService.findCheckDetail(checkDetailExample);
        if (CollectionUtils.isEmpty(list)) {
            return reList;
        }

        List<Long> storeIdList = list.stream().map(BizCheckDetail::getStoreId).collect(Collectors.toList());
        BizStoreExample exampleStore = new BizStoreExample();
        exampleStore.createCriteria().andIdIn(storeIdList);
        List<BizStore> storeList = this.storeService.findStore(exampleStore);
        if (CollectionUtils.isEmpty(storeList)) {
            return reList;
        }
        Map<Long, BizStore> storeMap = storeList.stream().collect(Collectors.toMap(BizStore::getId, Function.identity()));
        Map<Long, List<BizCheckDetail>> checkDetailMap = list.stream().collect(Collectors.groupingBy(BizCheckDetail::getCheckUserId, Collectors.toList()));

        checkDetailMap.forEach((k, v) -> {
            List<Map<String, Object>> listTemp = new ArrayList<>();
            v.forEach(l -> {
                listTemp.add(new HashMap() {{
                    put("detail", l);
                    put("store", storeMap.get(l.getStoreId()));
                }});
            });
            reList.add(listTemp);

        });
        return reList;
    }

    @RequestMapping(value = "/check/detail/page/{id}", method = {RequestMethod.GET})
    @ResponseBody
    public ModelAndView checkDetailPage(@PathVariable Long id) throws Exception {
        ModelAndView mav = new ModelAndView("biz/check/check_detail");
        mav.addObject("id", id);
        return mav;
    }

    @RequestMapping(value = "/check/detail/query/{id}", method = {RequestMethod.GET})
    @ResponseBody
    public Object checkDetailQuery(@PathVariable Long id) throws Exception {
        return this.checkService.findById(id);
    }

    private void buildCheckDetailCriteria(BizCheckDetailExample.Criteria criteria, BizCheckDetailRequest checkDetailRequest) {
        if (checkDetailRequest.getPlanId() != null) {
            criteria.andPlanIdEqualTo(checkDetailRequest.getPlanId());
        }
        if (checkDetailRequest.getStartTime() != null && checkDetailRequest.getEndTime() != null) {
            criteria.andCheckTimeBetween(checkDetailRequest.getStartTime(), checkDetailRequest.getEndTime());
        } else if (checkDetailRequest.getStartTime() != null) {
            criteria.andCheckTimeGreaterThanOrEqualTo(checkDetailRequest.getStartTime());
        } else if (checkDetailRequest.getEndTime() != null) {
            criteria.andCheckTimeLessThanOrEqualTo(checkDetailRequest.getEndTime());
        }
        if(StringUtils.isNotBlank(checkDetailRequest.getPhone())){
            Admin admin = this.adminService.get(checkDetailRequest.getPhone());
            if(admin != null){
                criteria.andCheckUserIdEqualTo(Long.valueOf(admin.getId()));
            }
        }

    }


}
