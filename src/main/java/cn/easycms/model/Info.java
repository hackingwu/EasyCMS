package cn.easycms.model;

import cn.easycms.util.StringUtil;

import java.util.Date;
import java.util.List;

/**
 * Created by hackingwu on 2014/4/18.
 */
public class Info {
    private String id;
    private String site;
    private Channel channel;
    private String title;
    private String shortTitle;
    private String titleColor;
    private String titleBlod;
    private String source;
    private String author;
    private String description;
    private String content;
    private String tags;
    private String img;
    private String url;
    private String attchs;
    private Date   addTime;
    private String template;
    private String isHot;
    private String isTop;
    private Date   topEndTime;
    private Integer clickNum;
    private String addUser;
    private String state;
    private String isSign;
    private String video;
    private String isComment;
    private String indexNum;
    private String openType;
    private String openTimeType;
    private Date   openEndTime;
    private Integer htmlIndexNum;
    private String isImgs;
    private String checkOpenEndTime;


    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getSite() {
        return site;
    }

    public void setSite(String site) {
        this.site = site;
    }

    public Channel getChannel() {
        return channel;
    }

    public void setChannel(Channel channel) {
        this.channel = channel;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getShortTitle() {
        return shortTitle;
    }

    public void setShortTitle(String shortTitle) {
        this.shortTitle = shortTitle;
    }

    public String getTitleColor() {
        return titleColor;
    }

    public void setTitleColor(String titleColor) {
        this.titleColor = titleColor;
    }

    public String getTitleBlod() {
        return titleBlod;
    }

    public void setTitleBlod(String titleBlod) {
        this.titleBlod = titleBlod;
    }

    public String getSource() {
        return source;
    }

    public void setSource(String source) {
        this.source = source;
    }

    public String getAuthor() {
        return author;
    }

    public void setAuthor(String author) {
        this.author = author;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public String getTags() {
        return tags;
    }

    public void setTags(String tags) {
        this.tags = tags;
    }

    public String getImg() {
        return img;
    }

    public void setImg(String img) {
        this.img = img;
    }

    public String getUrl() {
        return url;
    }

    public void setUrl(String url) {
        this.url = url;
    }

    public String getAttchs() {
        return attchs;
    }

    public void setAttchs(String attchs) {
        this.attchs = attchs;
    }

    public Date getAddTime() {
        return addTime;
    }

    public void setAddTime(Date addTime) {
        this.addTime = addTime;
    }

    public String getTemplate() {
        return template;
    }

    public void setTemplate(String template) {
        this.template = template;
    }

    public String getIsHot() {
        return isHot;
    }

    public void setIsHot(String isHot) {
        this.isHot = isHot;
    }

    public String getIsTop() {
        return isTop;
    }

    public void setIsTop(String isTop) {
        this.isTop = isTop;
    }

    public Date getTopEndTime() {
        return topEndTime;
    }

    public void setTopEndTime(Date topEndTime) {
        this.topEndTime = topEndTime;
    }

    public Integer getClickNum() {
        return clickNum;
    }

    public void setClickNum(Integer clickNum) {
        this.clickNum = clickNum;
    }

    public String getAddUser() {
        return addUser;
    }

    public void setAddUser(String addUser) {
        this.addUser = addUser;
    }

    public String getState() {
        return state;
    }

    public void setState(String state) {
        this.state = state;
    }

    public String getIsSign() {
        return isSign;
    }

    public void setIsSign(String isSign) {
        this.isSign = isSign;
    }

    public String getVideo() {
        return video;
    }

    public void setVideo(String video) {
        this.video = video;
    }

    public String getIsComment() {
        return isComment;
    }

    public void setIsComment(String isComment) {
        this.isComment = isComment;
    }

    public String getIndexNum() {
        return indexNum;
    }

    public void setIndexNum(String indexNum) {
        this.indexNum = indexNum;
    }

    public String getOpenType() {
        return openType;
    }

    public void setOpenType(String openType) {
        this.openType = openType;
    }

    public String getOpenTimeType() {
        return openTimeType;
    }

    public void setOpenTimeType(String openTimeType) {
        this.openTimeType = openTimeType;
    }

    public Date getOpenEndTime() {
        return openEndTime;
    }

    public void setOpenEndTime(Date openEndTime) {
        this.openEndTime = openEndTime;
    }

    public Integer getHtmlIndexNum() {
        return htmlIndexNum;
    }

    public void setHtmlIndexNum(Integer htmlIndexNum) {
        this.htmlIndexNum = htmlIndexNum;
    }

    public String getIsImgs() {
        return isImgs;
    }

    public void setIsImgs(String isImgs) {
        this.isImgs = isImgs;
    }




    //非数据库内容----------------------------
    private String isCommentStr;
    public final static String ISCOMMENT_NO     = "0";
    public final static String ISCOMMENT_MEMBER = "1";
    public final static String ISCOMMENT_ALL    = "2";
    private List<Channel> channelPageMark;

    public List<Channel> getChannelPageMark() {
        return channelPageMark;
    }

    public void setChannelPageMark(List<Channel> channelPageMark) {
        this.channelPageMark = channelPageMark;
    }
    private List<Channel> channels;

    public List<Channel> getChannels() {
        return channels;
    }

    public void setChannels(List<Channel> channels) {
        this.channels = channels;
    }

    public void setCheckOpenEndTime(String checkOpenedTime) {
        this.checkOpenEndTime = checkOpenEndTime;
    }

    public String getCheckOpenEndTime() {
        return checkOpenEndTime;
    }
    public String searchKey;

    public String getSearchKey() {
        return searchKey;
    }

    public void setSearchKey(String searchKey) {
        this.searchKey = searchKey;
    }

    private int showTitleLen;

    public int getShowTitleLen() {
        return showTitleLen;
    }

    public void setShowTitleLen(int showTitleLen) {
        this.showTitleLen = showTitleLen;
    }
    private String dateFormat;

    public String getDateFormat() {
        return dateFormat;
    }

    public void setDateFormat(String dateFormat) {
        this.dateFormat = dateFormat;
    }

    private String isNew;

    public String getIsNew() {
        return isNew;
    }

    public void setIsNew(String isNew) {
        this.isNew = isNew;
    }
    private String sitePath;

    public String getSitePath() {
        return sitePath;
    }

    public void setSitePath(String sitePath) {
        this.sitePath = sitePath;
    }
    private String pageUrl = "";//本信息的链接地址

    public String getPageUrl() {
        return pageUrl;
    }

    public void setPageurl(String pageUrl) {
        this.pageUrl = pageUrl;
    }
    //title或者shortTitle都是纯文本，showTitle根据titleColor和titleBlod（粗体）来增加标题的样式，为html中的最终title。
    private String showTitle;
    public String getShowTitle() {
        if (!StringUtil.isNotEmpty(showTitle)) {
            //showTitle为空
            //默认为标题
            showTitle=this.title;
            //判断是否有短标题
            if (StringUtil.isNotEmpty(shortTitle)) {
                showTitle=shortTitle;
            }
            //判断标题长度
            if (showTitleLen>0 && showTitle.length()>showTitleLen) {
                showTitle=showTitle.substring(0, showTitleLen);
            }
            //添加标题颜色
            showTitle="<font color='"+titleColor+"'>"+showTitle+"</font>";
            //判断是否粗体
            if ("1".equals(titleBlod)) {
                showTitle="<b>"+showTitle+"</b>";
            }
        }
        return showTitle;
    }

    public void setShowTitle(String showTitle) {
        this.showTitle = showTitle;
    }
}
