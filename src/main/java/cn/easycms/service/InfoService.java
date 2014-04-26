package cn.easycms.service;

import cn.easycms.dao.InfoDaoImpl;
import cn.easycms.model.Info;
import cn.easycms.util.SqlUtil;
import cn.easycms.util.StringUtil;
import org.hibernate.Criteria;
import org.hibernate.criterion.*;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

/**
 * Created by hackingwu on 2014/4/18.
 */
public class InfoService {
    private InfoDaoImpl infoDaoImpl;

    public void setInfoDaoImpl(InfoDaoImpl infoDaoImpl) {
        this.infoDaoImpl = infoDaoImpl;
    }

    public List<Info> find(Info info, List orderAsc, List orderDesc, int currPage, int pageSize) {
        Criteria criteria = infoDaoImpl.getCurrentSession().createCriteria(Info.class);
        proSearchParam(info, criteria);
        if (orderAsc != null && orderAsc.size() > 0) {
            for (Object asc : orderAsc) {
                criteria.addOrder(Order.asc(asc.toString()));
            }
        }
        if (orderDesc != null && orderDesc.size() > 0)
            for (Object desc : orderDesc)
                criteria.addOrder(Order.desc(desc.toString()));

        criteria.setFirstResult((currPage - 1) * pageSize);
        criteria.setMaxResults(pageSize);
        return criteria.list();

    }

    public void proSearchParam(Info info, Criteria criteria) {
        if (info != null) {
            if (StringUtil.isNotEmpty(info.getSearchKey())) {
                String newKey = SqlUtil.replace(info.getSearchKey());
                info.setSearchKey(newKey);
                if (StringUtil.isNotEmpty(newKey)) {
                    String keyWord = "%" + newKey + "%";
                    //关键字查询，查询title,shortTitle,tags
                    criteria.add(Restrictions.like("title", keyWord))
                            .add(Restrictions.or(Restrictions.like("shortTitle", keyWord), Restrictions.like("description", keyWord), Restrictions.like("tags", keyWord)));

                }
            }
            if (StringUtil.isNotEmpty(info.getTags())) {
                String newTags = SqlUtil.replace(info.getTags());
                info.setTags(newTags);
                if (StringUtil.isNotEmpty(newTags)) {
                    String[] tags = newTags.split(",");
                    if (tags != null && tags.length > 0) {
                        for (int i = 0; i < tags.length; i++) {
                            criteria.add(Restrictions.or(Restrictions.like("shortTitle", tags[i]), Restrictions.like("description", tags[i]), Restrictions.like("tags", tags[i])));
                        }
                    }
                }
            }

            if (StringUtil.isNotEmpty(info.getId())) {
                criteria.add(Restrictions.eq("id", info.getId()));
            }
            if (StringUtil.isNotEmpty(info.getSite())) {
                criteria.add(Restrictions.eq("site", info.getSite()));
            }
            if ("1".equals(info.getCheckOpenEndTime())) {
                SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
                criteria.add(Restrictions.or(Restrictions.eqOrIsNull("openEndTime", ""), Restrictions.eq("openTimeType", '1'), Restrictions.gt("openEndTime", sdf.format(new Date()))));
            }
            if (info.getChannel() != null) {
                criteria.add(Restrictions.eq("channel", info.getChannel()));
            }
            if (info.getChannels() != null && info.getChannels().size() > 0) {
                criteria.add(Restrictions.in("channel", info.getChannels()));
            }
            if (info.getChannelPageMark() != null && info.getChannelPageMark().size() > 0) {
                criteria.add(Restrictions.in("channel", info.getChannelPageMark()));
            }
            if (StringUtil.isNotEmpty(info.getImg())) {
                criteria.add(Restrictions.and(Restrictions.ne("img", ""), Restrictions.isNotNull("img")));
            }
            if (StringUtil.isNotEmpty(info.getAddUser()))
                criteria.add(Restrictions.and(Restrictions.eq("addUser", info.getAddUser().trim())));
        }
    }

    public Info findById(String id) {
        return (Info) infoDaoImpl.get(id);
    }


    public int workloadSum(Info info) {
        //info的个数
        return workload(info).size();
    }

    public List<Info> workload(Info info) {
        Criteria criteria = infoDaoImpl.getCurrentSession().createCriteria(Info.class);
        proSearchParam(info,criteria);
        return criteria.list();
    }
    public List<Info> workload(Info info,int currPage,int pageSize){

        Criteria criteria = infoDaoImpl.getCurrentSession().createCriteria(Info.class);
        proSearchParam(info,criteria);
        criteria.setMaxResults(pageSize);
        criteria.setFirstResult((currPage-1)*pageSize);
        return criteria.list();
    }

    public int workloadCount(Info info) {
        //addUser的个数

        Criteria criteria = infoDaoImpl.getCurrentSession().createCriteria(Info.class);
        proSearchParam(info, criteria);
        ProjectionList projectionList = Projections.projectionList();
        projectionList.add(Projections.property("addUser"));
        criteria.setProjection(Projections.distinct(projectionList));
        return criteria.list().size();
    }

    public int count(Info info) {
        if (info!=null)
        {
            Criteria criteria = infoDaoImpl.getCurrentSession().createCriteria(Info.class);
            proSearchParam(info,criteria);
            return criteria.list().size();
        }
        return 0;
    }
}
