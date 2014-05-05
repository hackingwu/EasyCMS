package cn.easycms.service;

import cn.easycms.dao.LinkDaoImpl;
import cn.easycms.model.Link;
import cn.easycms.model.Site;
import cn.easycms.util.StringUtil;
import org.hibernate.Criteria;
import org.hibernate.criterion.Order;
import org.hibernate.criterion.Restrictions;

import java.util.ArrayList;
import java.util.List;

/**
 * Created by hackingwu on 2014/4/12.
 */
public class LinkService {
    private LinkDaoImpl linkDaoImpl;

    public void setLinkDaoImpl(LinkDaoImpl linkDaoImpl) {
        this.linkDaoImpl = linkDaoImpl;
    }

    public void add(Link link) {
        linkDaoImpl
                .save(link);
    }

    public List<Link> find(Link link, String orderNum, int currPage, int pageSize) {
        Criteria criteria = linkDaoImpl.getCurrentSession().createCriteria(Link.class);
        proSearch(link, criteria);
        List<Link> list = criteria.addOrder(Order.asc(orderNum))
                .setFirstResult((currPage - 1) * pageSize)
                .setMaxResults(pageSize)
                .list();
        for (int i = 0; i < list.size(); i++) {
            list.get(i).setClassName(getClassNameByParId(list.get(i).getParId()));
        }
        return list;
    }

    public String getClassNameByParId(String parId) {
        List<Link> list = linkDaoImpl.getCurrentSession().createCriteria(Link.class).add(Restrictions.eq("id", parId)).list();
        if (list != null && list.size() > 0) {
            return list.get(0).getName();
        }
        return "";
    }

    public void proSearch(Link link, Criteria criteria) {
        if (link != null) {
            if (link.getSite() != null) {
                criteria.add(Restrictions.eq("site", link.getSite()));
            }
            if (StringUtil.isNotEmpty(link.getName())) {
                criteria.add(Restrictions.like("name", "%" + link.getName() + "%"));
            }
            if (link.getParId() != null) {
                criteria.add(Restrictions.eq("parId", link.getParId()));

            }
            if (StringUtil.isNotEmpty(link.getPageMark())) {
                criteria.add(Restrictions.eq("pageMark", link.getPageMark()));
            }
            if (StringUtil.isNotEmpty(link.getIsOk())) {
                criteria.add(Restrictions.eq("isOk", link.getIsOk()));
            }
            if (StringUtil.isNotEmpty(link.getType())) {
                criteria.add(Restrictions.eq("type", link.getType()));
            }
            if (StringUtil.isNotEmpty(link.getPageMarks())) {
                String[] pageMarks = link.getPageMarks().split(",");
                criteria.add(Restrictions.in("pageMark", pageMarks));
            }
            if (StringUtil.isNotEmpty(link.getClassPageMarks())) {
                criteria.add(Restrictions.in("parId", getIdByPageMarks(link.getClassPageMarks())));
            }
            if (link.getIsClass() != null && link.getIsClass().equals("1")) {
                criteria.add(Restrictions.or(Restrictions.eq("parId", ""), Restrictions.isNull("parId")));
            } else if (link.getIsClass() != null && link.getIsClass().equals("0")) {
                criteria.add(Restrictions.and(Restrictions.ne("parId", ""), Restrictions.isNotNull("parId")));
            }
            if (StringUtil.isNotEmpty(link.getClassName())) {
                criteria.add(Restrictions.in("parId", getIdByName(link.getClassName())));
            }
        }
    }

    private List getIdByName(String name) {
        List<Link> links = linkDaoImpl.getCurrentSession().createCriteria(Link.class).add(Restrictions.like("name", name)).list();
        List ids = new ArrayList();
        for (Link link : links) {
            ids.add(link.getId());
        }
        return ids;
    }

    private List getIdByPageMarks(String pageMark) {
        String[] pageMarks = pageMark.split(",");
        List<Link> links = linkDaoImpl.getCurrentSession().createCriteria(Link.class)
                .add(Restrictions.in("pageMark", pageMarks))
                .list();
        List ids = new ArrayList();
        for (Link link : links) {
            ids.add(link.getId());
        }
        return ids;
    }

    public int count(Link link) {
        if (link != null) {
            Criteria criteria = linkDaoImpl.getCurrentSession().createCriteria(Link.class);
            proSearch(link, criteria);
            return criteria.list().size();
        }
        return 0;
    }

    public List<Link> findBySite(Site site) {
        return linkDaoImpl.getCurrentSession().createCriteria(Link.class).add(Restrictions.eq("site", site)).list();
    }

    public void delBySite(Site site) {
        List<Link> links = findBySite(site);
        for (Link link : links)
            delete(link);

    }

    public void delete(Link link) {
        if (link != null)
            linkDaoImpl.delete(link);
    }

    public void delete(String linkId) {
        if (StringUtil.isNotEmpty(linkId))
            linkDaoImpl.delete(findById(linkId));
    }

    public Link findById(String id) {
        return (Link) linkDaoImpl.get(id);
    }

    public List<Link> findAll(Link classLink, String order) {
        Criteria criteria = linkDaoImpl.getCurrentSession().createCriteria(Link.class);
        proSearch(classLink, criteria);
        if (StringUtil.isNotEmpty(order)) {
            criteria.addOrder(Order.asc(order));
        }
        return criteria.list();
    }

    public boolean hasPageMark(Site site, String type, boolean isClass, String pageMark) {
        Criteria criteria = linkDaoImpl.getCurrentSession().createCriteria(Link.class);
        Link link = new Link();
        link.setSite(site);
        link.setType(type);
        if (isClass) {
            link.setIsClass("1");
        } else {
            link.setIsClass("0");
        }
        link.setPageMark(pageMark);
        proSearch(link, criteria);
        return criteria.list().size() > 0;
    }

    public void update(Link oldLink) {
        linkDaoImpl.update(oldLink);
    }
}
