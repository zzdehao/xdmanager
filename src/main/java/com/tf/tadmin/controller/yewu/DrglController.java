package com.tf.tadmin.controller.yewu;
import com.tf.tadmin.controller.BaseController;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;
/**
 * Created by wugq on 2017/12/23.
 * 导入管理
 * 1>导入配置和任务
 */
@Controller
public class DrglController extends BaseController {
    private static  final String pageDir="/yewu/drgl";

    /**
     * 导入配置和任务
     * @return
     */
    @RequestMapping(value = "/yewu/drgl/taskdrconfig" ,method = {RequestMethod.GET})
    public ModelAndView dic(){
        ModelAndView mav = new ModelAndView() ;
        mav.setViewName(pageDir+"/task-drconfig");
        return mav ;
    }

    /**
     * 导入消息信息
     * @return
     */
    @RequestMapping(value = "/yewu/drgl/drpushmsg" ,method = {RequestMethod.GET})
    public ModelAndView drpushmsg(){
        ModelAndView mav = new ModelAndView() ;
        mav.setViewName(pageDir+"/dr-pushmsg");
        return mav ;
    }
}
