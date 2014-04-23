package cn.easycms.util;

import javax.servlet.http.HttpServletRequest;
import java.util.ArrayList;
import java.util.List;

/**
 * 分页工具类
 * Created by hackingwu on 2014/4/22.
 */
public class Pager {
    private int pageSize=10;
    private int currPage=1;
    private int totalCount=0;
    private int totalPage=0;
    private String url="";
    private String pageStr ;
    private HttpServletRequest request ;
    private String path;
    private String outStr;
    private String outStrNoTable;
    private Integer startIndex;
    private Integer endIndex;
    private List<String> params ;

    public Pager(HttpServletRequest request){
        this.request=request;
        if(request!=null){
            path = request.getContextPath();
        }else{
            path="";
        }
    }
    public void appendParam(String param){
        if(params==null){
            params = new ArrayList<String>();
        }
        if(param!=null&&!param.trim().equals("")&&params.contains(param)==false){
            params.add(param);
        }
    }
    public void appendParam(String param,String value){
        if(params==null){
            params = new ArrayList<String>();
        }
        if(param!=null&&!param.trim().equals("")&&params.contains(param)==false){
            params.add(param);
        }
    }



    public void setOutStr(String action) {
        try {
            if(totalCount%pageSize==0){
                totalPage = totalCount/pageSize;
            }else{
                totalPage = totalCount/pageSize+1;
            }
            currPage = currPage<1?1:currPage;
            currPage = totalPage>0&&currPage>totalPage?totalPage:currPage;

            StringBuffer sb=new StringBuffer();
            //javascript key code = 13
            sb.append("<form name='pageForm' method='get' action=\""+action+"\" onkeydown=\"if(event.keyCode==13){return false;}\">");

            sb.append("<input type='hidden' name='currPage' value=''>");
            if(params!=null){
                for(String param:params){
                    //if(request.getParameter(param)!=null)
                    sb.append("<input type='hidden' name='"+param+"' value='"+(request.getParameter(param)!=null?request.getParameter(param):"")+"'>");
                }
            }
            sb.append("<table width=\"97%\" border=\"0\" cellpadding=\"0\" cellspacing=\"0\">");
            sb.append("	<tr>");
            sb.append("	  <td height=\"46\" align=\"center\" valign=\"middle\" background=\"../images/main_bbj.gif\"><table width=\"98%\" border=\"0\" cellspacing=\"0\" cellpadding=\"0\">");
            sb.append("		<tr>");
            sb.append("       <td height=\"40\" align=\"center\" valign=\"middle\"><table border=\"0\" cellspacing=\"0\" cellpadding=\"0\">");
            sb.append("       <tr>");
            sb.append("       <td width=\"100\" height=\"40\" align=\"center\" valign=\"middle\">共&nbsp;<b>"+totalCount+"</b>&nbsp;条</td>");
            if(currPage-1>=1){
                sb.append("       <td width=\"50\" height=\"40\" align=\"center\" valign=\"middle\"><a href=\"javascript:pageForm.currPage.value=1;pageForm.submit();\">首页</a></td>");
                sb.append("       <td width=\"50\" height=\"40\" align=\"center\" valign=\"middle\"><a href=\"javascript:pageForm.currPage.value="+(currPage-1)+";pageForm.submit();\">上一页</a></td>");
            }else{
                sb.append("       <td width=\"50\" height=\"40\" align=\"center\" valign=\"middle\">首页</td>");
                sb.append("       <td width=\"50\" height=\"40\" align=\"center\" valign=\"middle\">上一页</td>");
            }
            if(currPage+1<=totalPage){
                sb.append("       <td width=\"50\" height=\"40\" align=\"center\" valign=\"middle\"><a href=\"javascript:pageForm.currPage.value="+(currPage+1)+";pageForm.submit();\">下一页</a></td>");
                sb.append("       <td width=\"50\" height=\"40\" align=\"center\" valign=\"middle\"><a href=\"javascript:pageForm.currPage.value="+(totalPage)+";pageForm.submit();\">尾页</a></td>");
            }else{
                sb.append("       <td width=\"50\" height=\"40\" align=\"center\" valign=\"middle\">下一页</td>");
                sb.append("       <td width=\"50\" height=\"40\" align=\"center\" valign=\"middle\">尾页</td>");
            }
            sb.append("		  <td width=\"220\" align=\"center\" valign=\"middle\" >每页&nbsp;<b>");
            sb.append(pageSize+"</b>&nbsp;");
            sb.append("条&nbsp;当前第&nbsp;<b>"+currPage+"</b>&nbsp;页/共&nbsp;<b>"+totalPage+"</b>&nbsp;页</td>");
            sb.append("		</tr>");
            sb.append("	  </table></td>");

            sb.append("	  <td width=\"35%\" height=\"40\" align=\"center\" valign=\"middle\"><table border=\"0\" cellspacing=\"0\" cellpadding=\"0\">");
            sb.append("		<tr>");
            sb.append("       <td width=\"120\" height=\"40\" align=\"center\" valign=\"middle\">跳转到第&nbsp;<input name=\"pageNum\" type=\"text\" value=\""+currPage+"\" class=\"ts_box4\" size=\"1\" style=\"text-align:center\">&nbsp;页</td>");
            sb.append("       <td width=\"30\" height=\"40\" align=\"center\" valign=\"middle\"><a href=\"javascript:"+(totalPage>1?"if(isNaN(pageForm.pageNum.value)==false&&pageForm.pageNum.value!="+currPage+"&&pageForm.pageNum.value>=1&&pageForm.pageNum.value<="+totalPage+"){pageForm.currPage.value=pageForm.pageNum.value;pageForm.submit();}":"void(0)")+"\"><img src=\"img/go.gif\" width=\"26\" height=\"22\" border=\"0\"></a></td>");
            sb.append("		</tr>");
            sb.append("	  </table></td>");
            sb.append("	</tr>");
            sb.append("</table>");
            sb.append("</td></tr></table>");
            sb.append("</form>");
            outStr=sb.toString();
        } catch (Exception e) {
            e.printStackTrace();
        }

    }
    public void setOutStrNoTable(String action) {
        try {
            if(totalCount%pageSize==0){
                totalPage = totalCount/pageSize;
            }else{
                totalPage = totalCount/pageSize+1;
            }
            currPage = currPage<1?1:currPage;
            currPage = totalPage>0&&currPage>totalPage?totalPage:currPage;

            StringBuffer sb=new StringBuffer();
            sb.append("<form name='pageForm' method='get' action=\""+action+"\" onkeydown=\"if(event.keyCode==13){return false;}\">");

            sb.append("<input type='hidden' name='currPage' value=''>");
            if(params!=null){
                for(String param:params){
                    //if(request.getParameter(param)!=null)
                    sb.append("<input type='hidden' name='"+param+"' value='"+(request.getParameter(param)!=null?request.getParameter(param):"")+"'>");
                }
            }
            sb.append(" 共&nbsp;<b>"+totalCount+"</b>&nbsp;条 ");
            if(currPage-1>=1){
                sb.append(" <a href=\"javascript:pageForm.currPage.value=1;pageForm.submit();\">首页</a> ");
                sb.append(" <a href=\"javascript:pageForm.currPage.value="+(currPage-1)+";pageForm.submit();\">上一页</a> ");
            }else{
                sb.append(" 首页 ");
                sb.append(" 上一页 ");
            }
            if(currPage+1<=totalPage){
                sb.append(" <a href=\"javascript:pageForm.currPage.value="+(currPage+1)+";pageForm.submit();\">下一页</a> ");
                sb.append(" <a href=\"javascript:pageForm.currPage.value="+(totalPage)+";pageForm.submit();\">尾页</a> ");
            }else{
                sb.append(" 下一页 ");
                sb.append(" 尾页 ");
            }
            sb.append(" 每页&nbsp;<b>");
            sb.append(pageSize+"</b>&nbsp;");
            sb.append("条&nbsp;当前第&nbsp;<b>"+currPage+"</b>&nbsp;页/共&nbsp;<b>"+totalPage+"</b>&nbsp;页");

            sb.append(" 跳转到第&nbsp;<input name=\"pageNum\" type=\"text\" value=\""+currPage+"\" class=\"ts_box4\" size=\"1\" style=\"text-align:center\">&nbsp;页");
            sb.append("<a href=\"javascript:"+(totalPage>1?"if(isNaN(pageForm.pageNum.value)==false&&pageForm.pageNum.value!="+currPage+"&&pageForm.pageNum.value>=1&&pageForm.pageNum.value<="+totalPage+"){pageForm.currPage.value=pageForm.pageNum.value;pageForm.submit();}":"void(0)")+"\"><img src=\"img/go.gif\" width=\"26\" height=\"22\" border=\"0\"></a>");
            sb.append("</form>");
            outStrNoTable=sb.toString();
        } catch (Exception e) {
            e.printStackTrace();
        }

    }


    public int getCurrPage() {
        return currPage;
    }
    public void setCurrPage(int currPage) {
        this.currPage = currPage;
    }
    public int getTotalCount() {
        return totalCount;
    }
    public void setTotalCount(int totalCount) {
        this.totalCount = totalCount;
    }
    public int getTotalPage() {
        return totalPage;
    }
    public void setTotalPage(int totalPage) {
        this.totalPage = totalPage;
    }
    public String getUrl() {
        return url;
    }
    public void setUrl(String url) {
        this.url = url;
    }

    public String getPageStr() {
        return pageStr;
    }

    public void setPageStr(String pageStr) {
        this.pageStr = pageStr;
    }

    public static void main(String arg[]){

    }
    public int getPageSize() {
        return pageSize;
    }
    public void setPageSize(int pageSize) {
        this.pageSize = pageSize;
    }
    public HttpServletRequest getRequest() {
        return request;
    }
    public void setRequest(HttpServletRequest request) {
        this.request = request;
    }
    public String getPath() {
        return path;
    }
    public void setPath(String path) {
        this.path = path;
    }
    public String getOutStr() {
        return outStr;
    }
    public Integer getStartIndex() {
        return startIndex;
    }
    public void setStartIndex(Integer startIndex) {
        this.startIndex = startIndex;
    }
    public Integer getEndIndex() {
        return endIndex;
    }
    public void setEndIndex(Integer endIndex) {
        this.endIndex = endIndex;
    }
    public String getOutStrNoTable() {
        return outStrNoTable;
    }

}
