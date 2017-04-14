package com.jctl.cloud.manager.navlist;

import com.google.common.collect.Lists;
import com.google.common.collect.Maps;
import com.jctl.cloud.common.config.Global;
import com.jctl.cloud.common.utils.StringUtils;
import com.jctl.cloud.common.web.BaseController;
import com.jctl.cloud.manager.navcontent.NavContent;
import com.jctl.cloud.manager.navcontent.NavContentService;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.List;
import java.util.Map;

/**
 * 导航Controller
 *
 * @author kay
 * @version 2016-12-13
 */
@Controller
@RequestMapping(value = "${adminPath}/website/navlist/navListv1")
public class NavListControllerV1 extends BaseController {

    @Autowired
    private NavListService navListService;
    @Autowired
    private NavContentService navContentService;

    @ModelAttribute
    public NavList get(@RequestParam(required = false) String id) {

        NavList entity = null;
        if (StringUtils.isNotBlank(id)) {
            entity = navListService.get(id);
        }
        if (entity == null) {
            entity = new NavList();
        }
        return entity;
    }

    /**
     * 跳转导航详情页面
     *
     * @return
     */
    @RequestMapping("navContentList")
    public String navContentList(NavList navList, Model model) {
        List<NavList> list;
        NavContent navContent = new NavContent();
        try {
            list = navListService.getByParentId(navList.getParentId());
            navContent = navContentService.getByNavId(navList.getId());
            if (navContent != null) {
                model.addAttribute("content", navContent);
            }
            model.addAttribute("navId", navList.getId());
            model.addAttribute("list", list);

        } catch (Exception e) {
            e.printStackTrace();
        }
        return "manager/navlist/navContentList";
    }

    /**
     * 异步获取导航新闻内容
     *
     * @param id
     * @return
     */
    @RequestMapping("content")
    @ResponseBody
    public NavContent content(String id) {
        try {

            NavContent content = navContentService.getByNavId(id);
            if (content == null) {
                return new NavContent(id, null);
            }
            content.setNavId(Long.parseLong(id));
            return content;

        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }

    @RequestMapping("treeContData")
    @ResponseBody
    public List<Object> treeContData() {
        List list =getTreeData();
        return list;
    }

    private List<NavList> getTreeData() {
        List<NavList> result = navListService.getNavList();
        result = getAllChild(result);
        return result;
    }

    private List<NavList> getAllChild(List<NavList> result) {
        for (NavList nav : result) {
            List<NavList> child = navListService.getByParentId(nav.getId());
            if (child != null) {
                nav.setNodes(child);
                getAllChild(child);
            }
        }
        return result;
    }


    @RequiresPermissions("website:navlist:navList:view")
    @RequestMapping(value = {"list", ""})
    public String list(NavList navList, HttpServletRequest request, HttpServletResponse response, Model model) {
        List<NavList> list = navListService.findList(navList);
        model.addAttribute("list", list);
        return "manager/navlist/navListList";
    }

    @RequiresPermissions("website:navlist:navList:view")
    @RequestMapping(value = "form")
    public String form(NavList navList, Model model) {
        if (navList.getParent() != null && StringUtils.isNotBlank(navList.getParent().getId())) {
            navList.setParent(navListService.get(navList.getParent().getId()));
            // 获取排序号，最末节点排序号+30
            if (StringUtils.isBlank(navList.getId())) {
                NavList navListChild = new NavList();
                navListChild.setParent(new NavList(navList.getParent().getId()));
                List<NavList> list = navListService.findList(navList);
                if (list.size() > 0) {
                    navList.setSort(list.get(list.size() - 1).getSort());
                    if (navList.getSort() != null) {
                        navList.setSort(navList.getSort() + 30);
                    }
                }
            }
        }
        if (navList.getSort() == null) {
            navList.setSort(30);
        }
        model.addAttribute("navList", navList);
        return "manager/navlist/navListForm";
    }

    @RequiresPermissions("website:navlist:navList:edit")
    @RequestMapping(value = "save")
    public String save(NavList navList, Model model, RedirectAttributes redirectAttributes) {
        if (!beanValidator(model, navList)) {
            return form(navList, model);
        }
        navListService.save(navList);
        addMessage(redirectAttributes, "保存导航成功");
        return "redirect:" + Global.getAdminPath() + "/website/navlist/navList/?repage";
    }

    @RequiresPermissions("website:navlist:navList:edit")
    @RequestMapping(value = "delete")
    public String delete(NavList navList, RedirectAttributes redirectAttributes) {
        navListService.delete(navList);
        addMessage(redirectAttributes, "删除导航成功");
        return "redirect:" + Global.getAdminPath() + "/website/navlist/navList/?repage";
    }

    @RequiresPermissions("user")
    @ResponseBody
    @RequestMapping(value = "treeData")
    public List<Map<String, Object>> treeData(@RequestParam(required = false) String extId, HttpServletResponse response) {
        List<Map<String, Object>> mapList = Lists.newArrayList();
        List<NavList> list = navListService.findList(new NavList());
        for (int i = 0; i < list.size(); i++) {
            NavList e = list.get(i);
            if (StringUtils.isBlank(extId) || (extId != null && !extId.equals(e.getId()) && e.getParentIds().indexOf("," + extId + ",") == -1)) {
                Map<String, Object> map = Maps.newHashMap();
                map.put("id", e.getId());
                map.put("pId", e.getParentId());
                map.put("name", e.getName());
                mapList.add(map);
            }
        }
        return mapList;
    }

    /**
     * 一键修改导航状态
     *
     * @param navList
     * @return
     */
    @RequestMapping("changeStatus")
    public String changeStatus(NavList navList) {
        navList = navListService.get(navList);
        if (navList.getStatus().equals("0")) {
            navList.setStatus("1");
        } else {
            navList.setStatus("0");
        }
        navListService.save(navList);
        return "redirect:" + Global.getAdminPath() + "/website/navlist/navList/?repage";
    }

}