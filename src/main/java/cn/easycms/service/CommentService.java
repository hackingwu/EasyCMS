package cn.easycms.service;

import cn.easycms.dao.CommentDaoImpl;
import cn.easycms.model.Comment;

/**
 * Created by hackingwu on 2014/4/25.
 */
public class CommentService {
    private CommentDaoImpl commentDaoImpl;

    public CommentDaoImpl getCommentDaoImpl() {
        return commentDaoImpl;
    }

    public void setCommentDaoImpl(CommentDaoImpl commentDaoImpl) {
        this.commentDaoImpl = commentDaoImpl;
    }
}
