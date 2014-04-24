package cn.easycms.service;

import cn.easycms.dao.ReportDaoImpl;
import cn.easycms.model.Report;
import cn.easycms.util.StringUtil;
import org.hibernate.Criteria;
import org.hibernate.criterion.Order;
import org.hibernate.criterion.Restrictions;

import java.util.List;

/**
 * Created by hackingwu on 2014/4/24.
 */
public class ReportService {
    private ReportDaoImpl reportDaoImpl;

    public ReportDaoImpl getReportDaoImpl() {
        return reportDaoImpl;
    }

    public void setReportDaoImpl(ReportDaoImpl reportDaoImpl) {
        this.reportDaoImpl = reportDaoImpl;
    }


    public List<Report> find(Report report, String order, int currPage, int pageSize, boolean cache) {
        Criteria criteria = reportDaoImpl.getCurrentSession().createCriteria(Report.class);
        proSearchParam(report,criteria);
        if (StringUtil.isNotEmpty(order))
            criteria.addOrder(Order.asc(order));
        if (currPage>=1&&pageSize>=1){
            criteria.setMaxResults(pageSize);
            criteria.setFirstResult((currPage-1)*pageSize);
        }
        if (cache)
            criteria.setCacheable(cache);
        return criteria.list();
    }
    /**
     * 处理查询条件
     * @param report
     * @param criteria
     */
    public void proSearchParam(Report report,Criteria criteria){
        if (report!=null ) {
            if (StringUtil.isNotEmpty(report.getQueryCode())) {
                criteria.add(Restrictions.like("queryCode", "%" + report.getQueryCode().trim() + "%"));
            }
            if (StringUtil.isNotEmpty(report.getName())) {
                criteria.add(Restrictions.like("name", "%" + report.getName().trim() + "%"));
            }
            if (StringUtil.isNotEmpty(report.getLinkMan())) {
                criteria.add(Restrictions.like("linkMan", "%" + report.getLinkMan().trim() + "%"));
            }
            if (StringUtil.isNotEmpty(report.getIssuer()) {
                criteria.add(Restrictions.like("issuer", "%" + report.getIssuer().trim() + "%"));
            }
            if (StringUtil.isNotEmpty(report.getUserId())) {
                criteria.add(Restrictions.like("userId", report.getUserId().trim());
            }
            if (StringUtil.isNotEmpty(report.getState())) {
                if ("1".equals(report.getState())) {
                    criteria.add(Restrictions.eq("state", "1"));
                }else if ("0".equals(report.getState())) {
                    criteria.add(Restrictions.eq("state","0"));
                }
            }

        }
    }

    public int count(Report report, boolean cache) {
        return find(report,null,0,0,cache).size();
    }

    public Report findById(String id) {
        return (Report)reportDaoImpl.get(id);
    }

    public void update(Report updateReport) {

        reportDaoImpl.update(updateReport);
    }

    public void del(Report report) {
        reportDaoImpl.delete(report);

    }
}
