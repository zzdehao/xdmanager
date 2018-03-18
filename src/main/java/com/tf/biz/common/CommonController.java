package com.tf.biz.common;

import com.tf.biz.imp.ImportService;
import com.tf.biz.imp.entity.BizImportBatch;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

@Controller
public class CommonController {

    @Autowired
    private ImportService importService;

    @RequestMapping(value = "/common/batch", method = {RequestMethod.GET})
    @ResponseBody
    public Object batchQuery(@RequestParam List<Integer> typeList) throws Exception {
        List<BizImportBatch> list = this.importService.queryBatchByTypes(typeList);
        Map<Integer, List<BizImportBatch>> importBatchMap = list.stream().collect(Collectors.groupingBy(BizImportBatch::getImportType, Collectors.toList()));
        return importBatchMap;
    }

    @RequestMapping(value = "/common/batch/list", method = {RequestMethod.GET})
    @ResponseBody
    public Object batchListQuery(@RequestParam List<Integer> typeList) throws Exception {
        List<BizImportBatch> list = this.importService.queryBatchByTypes(typeList);
        return list;
    }
}
