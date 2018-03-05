package com.tf.tadmin.controller.yewu;
import com.tf.tadmin.controller.BaseController;
import com.tf.tadmin.entity.Admin;
import com.tf.tadmin.entity.Log;
import com.tf.tadmin.entity.Message;
import com.tf.tadmin.entity.Pager;
import com.tf.tadmin.entity.yewu.TDict;
import com.tf.tadmin.service.DicService;
import com.tf.tadmin.utils.Constants;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * Created by wugq on 2017/12/31.
 * 字典信息维护
 */
@Controller
public class DicController extends BaseController {
    private static  final String pageDir="/yewu/dic";
    @Autowired
    private DicService dicService;

    @RequestMapping(value = "/yewu/dic" ,method = {RequestMethod.GET})
    public ModelAndView dic(){
        List<TDict> dics = dicService.queryTypeList();
        ModelAndView mav = new ModelAndView() ;
        mav.addObject("pdics",dics);
        mav.setViewName(pageDir+"/dic-index");
        return mav ;
    }
    @RequestMapping(value = "/yewu/dic/list")
    public @ResponseBody
    Pager<TDict> list(@RequestParam(required=true) Integer page,
                      @RequestParam(required = false , value = "key") String key,
                      @RequestParam(required = false , value = "type") String type){
        int start = (page - 1)* Constants.PAGE_SIZE ;
        Map<String,Object> param = new HashMap<String,Object>();
        if(!StringUtils.isEmpty(key)){
            param.put("key",key);
        }
        if(!StringUtils.isEmpty(type)){
            param.put("type",type);
        }
        Pager<TDict> pager = this.dicService.queryList(start,param) ;
        return pager;
    }

    @RequestMapping(value = "/yewu/dic/edit" ,method = {RequestMethod.GET})
    public ModelAndView edit(@RequestParam(required = false) Integer id){
        ModelAndView mav = new ModelAndView() ;
        List<TDict> dics = dicService.queryTypeList();
        mav.addObject("pdics",dics);
        if(id != null){
            TDict dic = dicService.queryById(id);
            mav.addObject("dic",dic);
        }
        mav.setViewName(pageDir+"/dic-edit");
        return mav ;
    }
    /**
     * 保存
     * @param dict
     * @return
     */
    @RequestMapping(value = "/yewu/dic/save" ,method = {RequestMethod.GET , RequestMethod.POST})
    public @ResponseBody
    Message save(TDict dict) {
        boolean isModify = false ;
        Integer id = dict.getId()  ;
        if(id != null ){
            isModify = true ;
        }
        int result = 0 ;
        try {
            if (isModify) {
                result = this.dicService.update(dict);
            } else {
                result = this.dicService.insert(dict);
            }
        }catch (Exception ex){
            ex.printStackTrace();
            result=0;
        }
        return new Message(result) ;
    }
    /**
     * 删除
     * @param id
     * @return
     */
    @RequestMapping(value = "/yewu/dic/del/{id}" ,method = {RequestMethod.POST})
    public @ResponseBody Message del(@PathVariable Integer id){
        int ret = this.dicService.delete(id) ;
        return new Message(ret) ;
    }

}
