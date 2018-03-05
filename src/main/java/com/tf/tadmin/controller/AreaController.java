package com.tf.tadmin.controller;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.tf.tadmin.entity.Area;
import com.tf.tadmin.entity.Message;
import com.tf.tadmin.service.AreaService;

/**
 * 
 * 区域管理
 *
 * @date 2015年10月29日
 *
 * @author mo.xf
 *
 */
@Controller
@RequestMapping(value = "/area")
public class AreaController extends BaseController {
	
	@Resource
	private AreaService areaService ;
	
	@RequestMapping(value = "/index")
	public ModelAndView index(){
		ModelAndView mav = new ModelAndView() ;
		mav.setViewName("admin/area-index");
		return mav ;
	}
	
	/**
	 * 
	 * @param parentId
	 * @param status
	 * @param level
	 * @return
	 */
	@RequestMapping(value = "/list")
	public @ResponseBody List<Area> list(@RequestParam(required = true , value = "p") Integer parentId ,
			@RequestParam(required = false , value = "s") Integer status ,
			@RequestParam(required = false , value = "l") Integer level){
		List<Area> list = this.areaService.queryList(parentId, status, level) ;
		
		return list ;
	}
	
	/**
	 * 
	 * @param id
	 * @param s
	 * @return
	 */
	@RequestMapping(value = "/status/{id}/{s}")
	public Message updateStatus(@PathVariable Integer id  ,@PathVariable Integer s){
		int r = this.areaService.updateStatus(id, s) ;
		return new Message(r) ;
	}
	
	
}
