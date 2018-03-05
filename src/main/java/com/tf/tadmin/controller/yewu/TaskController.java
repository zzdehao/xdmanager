package com.tf.tadmin.controller.yewu;

import com.tf.tadmin.controller.BaseController;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * Created by wugq on 2017/12/23.
 * 任务管理
 */
@Controller
public class TaskController extends BaseController {
    private static  final String pageDir="/yewu";

    /**
     * 发布最近一次导入的任务
     * @param model
     * @return
     */
    @RequestMapping("/yewu/task-fabuzuijin")
    public String fabuzuijin(Model model){
        return pageDir+"/task-fabuzuijin";
    }
    /**
     * 导出未完成任务清单
     * @param model
     * @return
     */
    @RequestMapping("/yewu/dcnofinish")
    public String dcnofinish(Model model){
        return pageDir+"/task-dcnofinish";
    }
}

