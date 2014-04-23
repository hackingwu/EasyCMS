package cn.easycms.action;

import cn.easycms.base.BaseAction;
import cn.easycms.model.Question;
import cn.easycms.service.QuestionService;
import cn.easycms.util.Pager;

import java.util.List;

/**
 * Created by hackingwu on 2014/4/23.
 */
public class QuestionAction extends BaseAction{

    private Question question;
    private String   order;
    private int      currPage;
    private int      pageSize;

    public String getPageStr() {
        return pageStr;
    }

    public void setPageStr(String pageStr) {
        this.pageStr = pageStr;
    }

    private String pageStr;

    public int getTotalCount() {
        return totalCount;
    }

    public void setTotalCount(int totalCount) {
        this.totalCount = totalCount;
    }

    private int totalCount;

    public String getOrder() {
        return order;
    }

    public void setOrder(String order) {
        this.order = order;
    }

    public int getCurrPage() {
        return currPage;
    }

    public void setCurrPage(int currPage) {
        this.currPage = currPage;
    }

    public int getPageSize() {
        return pageSize;
    }

    public void setPageSize(int pageSize) {
        this.pageSize = pageSize;
    }

    public List<Question> getQuestionList() {
        return questionList;
    }

    public void setQuestionList(List<Question> questionList) {
        this.questionList = questionList;
    }

    private List<Question> questionList;

    public Question getQuestion() {
        return question;
    }

    public void setQuestion(Question question) {
        this.question = question;
    }

    private QuestionService questionService;

    public void setQuestionService(QuestionService questionService) {
        this.questionService = questionService;
    }
    /**
     * 网上调查 列表
     * @return
     */
    public String list(){
        if (question==null ){
            question=new Question();
        }
        if (!isAdminLogin() && !isSiteAdmin()) {
            question.setAddUser(getLoginAdmin().getId());
        }
        question.setSite(getManageSite());
        questionList=questionService.find(question, order, currPage, pageSize);
        totalCount=questionService.count(question);
        Pager pager=new Pager(getHttpRequest());
        pager.appendParam("question.name");
        pager.appendParam("question.selecttype");
        pager.appendParam("question.isok");
        pager.appendParam("order");
        pager.appendParam("pageSize");
        pager.appendParam("pageFuncId");
        pager.setCurrPage(currPage);
        pager.setPageSize(pageSize);
        pager.setTotalCount(totalCount);
        pager.setOutStr("question_list.do");
        pageStr=pager.getOutStr();
        return "list";
    }
}
