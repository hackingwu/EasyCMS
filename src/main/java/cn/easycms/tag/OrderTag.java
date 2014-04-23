package cn.easycms.tag;

import cn.easycms.base.BaseTag;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.jsp.JspException;

/**
 * Created by hackingwu on 2014/4/22.
 */
public class OrderTag extends BaseTag{
    private String aAttr="  ";//a属性
    private String colName;//列名
    private String col;//排序
    public int doStartTag() throws JspException {
        try {
            HttpServletRequest request=getRequest();
            String order="";
            if (request.getAttribute("order")!=null && request.getAttribute("order").toString().trim().length()>0) {
                order=request.getAttribute("order").toString();
            }
            StringBuilder sb=new StringBuilder();
            sb.append("<a ");
            sb.append(aAttr);
            sb.append(" href=\"javascript:pageForm.order.value='");
            if (order.equals(col)) {
                sb.append(col+" desc");
            }else {
                sb.append(col);
            }
            sb.append("';pageForm.submit();\" title=\"点击");
            if (order.equals(col)) {
                sb.append("倒序");
            }else {
                sb.append("正序");
            }
            sb.append("排列\">");
            sb.append(colName);
            sb.append("</a>");
            pageContext.getOut().println(sb.toString());
        } catch (Exception e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
        return this.SKIP_BODY;
    }
    public String getAAttr() {
        return aAttr;
    }
    public void setAAttr(String attr) {
        aAttr = attr;
    }
    public String getColName() {
        return colName;
    }
    public void setColName(String colName) {
        this.colName = colName;
    }
    public String getCol() {
        return col;
    }
    public void setCol(String col) {
        this.col = col;
    }

}
