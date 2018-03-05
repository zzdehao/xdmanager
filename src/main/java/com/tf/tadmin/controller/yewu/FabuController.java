package com.tf.tadmin.controller.yewu;
import com.tf.tadmin.controller.BaseController;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * Created by wugq on 2017/12/23.
 * 发布信息导入和推送
 */
@Controller
public class FabuController extends BaseController {
    private static  final String pageDir="/yewu";

    /**
     * 导入消息数据
     * @param model
     * @return
     */
    @RequestMapping("/yewu/fabu-pushmsg")
    public String drpushmsg(Model model){
        return pageDir+"/fabu-pushmsg";
    }

    /**
     * 推送最近导入的消息
     * @param model
     * @return
     */
    @RequestMapping("/yewu/fabu-sendpushmsg")
    public String drsendpushmsg(Model model){
        return pageDir+"/fabu-sendpushmsg";
    }

}
