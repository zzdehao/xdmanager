package com.tf.tadmin.controller.yewu;
import com.tf.tadmin.controller.BaseController;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
/**
 * Created by wugq on 2017/12/23.
 * 导出巡店数据数据
 */
@Controller
public class DcxdDataControler extends BaseController {
    private static  final String pageDir="/yewu/dcxd";

    /**
     * 巡店数据
     * @param model
     * @return
     */
    @RequestMapping("/yewu/dcxd/xddata")
    public String xddata(Model model){
        return pageDir+"/dc-xddata";
    }

    /**
     * 巡店轨迹
     * @param model
     * @return
     */
    @RequestMapping("/yewu/dcxd/xdtrackdata")
    public String xdtrackdata(Model model){
        return pageDir+"/dc-xdtrackdata";
    }
    /**
     * 巡店数据展示
     * @param model
     * @return
     */
    @RequestMapping("/yewu/dcxd/xdvdmshow")
    public String xdvdmshow(Model model){
        return pageDir+"/dc-xdvdmshow";
    }

    /**
     * 导数数展示
     * @param model
     * @return
     */
    @RequestMapping("/yewu/dcxd/drxdtovdm")
    public String xdtovdm(Model model){
        return pageDir+"/dc-drxdtovdm";
    }


}
