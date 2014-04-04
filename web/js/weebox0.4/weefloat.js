/**
 * weefloat.js
 * @category   javascript
 * @package    jquery
 * @author     ePim <WanJiDong@gmail.com>
 * @version
 */
(function ($) {
    var weefloat = function (content, options) {
        var self = this;
        this.dh = null;
        this.closeable = true;
        this.delay = 3;
        this.direction = 'full';
        this.options = null;
        this._content = content || '';
        this._options = options || {};
        this._defaults = {
            boxid: null,
            width: 0,
            height: 0,
            timeout: 0,
            focus: null,
            blur: null,
            contentType: 'text',
            zIndex: 998,
            onclose: null
        };
        //��ʼ��ѡ��
        this.initOptions = function () {
            self._options = self._options || {};
            self._options.contentType = self._options.contentType || "";
            if (self._options.contentType == "") {
                self._options.contentType = (self._content.substr(0, 1) == '#') ? 'selector' : 'text';
            }
            self.options = $.extend({}, self._defaults, self._options);
            self._options = null;
            self._defaults = null;
        };
        //��ʼ������Box
        this.initBox = function () {
            html = '<div class="weefloat">' +
                '	<div class="dialog-content"></div>' +
                '	<div class="dialog-close"></div>' +
                '</div>';
            self.dh = $(html).appendTo('body').hide().css({
                position: 'absolute',
                overflow: 'hidden',
                zIndex: self.options.zIndex
            });
            if (self.options.boxid) {
                self.dh.attr('id', self.options.boxid);
            }
            if (self.options.height > 0) {
                self.dh.css('height', self.options.height);
            }
            if (self.options.width > 0) {
                self.dh.css('width', self.options.width);
            }
            self.dh.bgiframe();
        }
        //��ʼ����������
        this.initContent = function (content) {
            if (self.options.contentType == "selector") {
                self.selector = self._content;
                self._content = $(self.selector).html();
                self.setContent(self._content);
                $(self.selector).empty();
                self.show();
                self.focus();
            } else if (self.options.contentType == "ajax") {
                self.ajaxurl = self._content;
                self.setLoading();
                self.show();
                if (self.options.cache == false) {
                    if (self.ajaxurl.indexOf('?') == -1) {
                        self.ajaxurl += "?_t=" + Math.random();
                    } else {
                        self.ajaxurl += "&_t=" + Math.random();
                    }
                }
                $.get(self.ajaxurl, function (data) {
                    self._content = data;
                    self.setContent(self._content);
                    self.show();
                    self.focus();
                });
            } else if (self.options.contentType == "iframe") { /*����iframeʹ�������ֱ����������ҳ�� by ePim*/
                self.setContent('<iframe src="' + self._content + '" width="100%" height="100%" frameborder="no"></iframe>');
                self.show();
                self.focus();
            } else {
                self.setContent(self._content);
                self.show();
                self.focus();
            }
        }
        //��ʼ�������¼�
        this.initEvent = function () {
            self.dh.find(".dialog-close").unbind('click').click(function () {
                self.close()
            });
            if (self.options.timeout > 0) {
                window.setTimeout(self.close, (self.options.timeout * 1000));
            }
        }
        //����onOnclose�¼�
        this.setOnclose = function (fn) {
            self.options.onclose = fn;
        }

        //��ʾ����
        this.show = function () {
            if (self.options.showButton) {
                self.dh.find('.dialog-button').show();
            }
            if (self.options.position == 'center') {
                self.setCenterPosition();
            } else {
                self.setElementPosition();
            }
            if (typeof self.options.showAnimate == "string") {
                self.dh.show(self.options.animate);
            } else {
                self.dh.animate(self.options.showAnimate.animate, self.options.showAnimate.speed);
            }
            if (self.mh) {
                self.mh.show();
            }
        }
        this.hide = function (fn) {
            if (typeof self.options.hideAnimate == "string") {
                self.dh.hide(self.options.animate, fn);
            } else {
                self.dh.animate(self.options.hideAnimate.animate, self.options.hideAnimate.speed, "", fn);
            }
        }
        //�ڵ����ڲ���Ԫ��
        this.find = function (selector) {
            return self.dh.find(selector);
        }
        //���ü��ؼ�״̬
        this.setLoading = function () {
            self.setContent('<div class="dialog-loading"></div>');
            self.dh.find(".dialog-button").hide();
            if (self.dc.height() < 90) {
                self.dc.height(Math.max(90, self.options.height));
            }
            if (self.dh.width() < 200) {
                self.dh.width(Math.max(200, self.options.width));
            }
        }
        this.setWidth = function (width) {
            self.dh.width(width);
        }
        //��������
        this.setContent = function (content) {
            self.dc.html(content);
            if (self.options.height > 0) {
                self.dc.css('height', self.options.height);
            } else {
                self.dc.css('height', '');
            }
            if (self.options.width > 0) {
                self.dh.css('width', self.options.width);
            } else {
                self.dh.css('width', '');
            }
            if (self.options.showButton) {
                self.dh.find(".dialog-button").show();
            }
        }
        //ȡ������
        this.getContent = function () {
            return self.dh.html();
        }
        //�رյ���
        this.close = function (n) {
            if (typeof(self.options.onclose) == "function") {
                self.options.onclose(self);
            }
            if (self.options.contentType == 'selector') {
                if (self.options.contentChange) {
                    //if have checkbox do
                    var cs = self.find(':checkbox');
                    $(self.selector).html(self.getContent());
                    if (cs.length > 0) {
                        $(self.selector).find(':checkbox').each(function (i) {
                            this.checked = cs[i].checked;
                        });
                    }
                } else {
                    $(self.selector).html(self._content);
                }
            }
            //���ùرպ�Ľ���
            if (self.options.blur) {
                $(self.options.blur).focus();
            }
            //��������ɾ��
            for (i = 0; i < arrweebox.length; i++) {
                if (arrweebox[i].dh.get(0) == self.dh.get(0)) {
                    arrweebox.splice(i, 1);
                    break;
                }
            }
            self.hide();
            self.dh.remove();
            if (self.mh) {
                self.mh.remove();
            }
        }
        //��������ʾ���м�λ��
        this.setCenterPosition = function () {
            var wnd = $(window), doc = $(document),
                pTop = doc.scrollTop(), pLeft = doc.scrollLeft();
            pTop += (wnd.height() - self.dh.height()) / 2;
            pLeft += (wnd.width() - self.dh.width()) / 2;
            self.dh.css({top: pTop, left: pLeft});
        }
        //���Ԫ�����õ�����ʾλ��
        this.setElementPosition = function () {
            var trigger = $(self.options.position.refele);
            var reftop = self.options.position.reftop || 0;
            var refleft = self.options.position.refleft || 0;
            var adjust = (typeof self.options.position.adjust == "undefined") ? true : self.options.position.adjust;
            var top = trigger.offset().top + trigger.height();
            var left = trigger.offset().left;
            var docWidth = document.documentElement.clientWidth || document.body.clientWidth;
            var docHeight = document.documentElement.clientHeight || document.body.clientHeight;
            var docTop = document.documentElement.scrollTop || document.body.scrollTop;
            var docLeft = document.documentElement.scrollLeft || document.body.scrollLeft;
            var docBottom = docTop + docHeight;
            var docRight = docLeft + docWidth;
            if (adjust && left + self.dh.width() > docRight) {
                left = docRight - self.dh.width() - 1;
            }
            if (adjust && top + self.dh.height() > docBottom) {
                top = docBottom - self.dh.height() - 1;
            }
            left = Math.max(left + refleft, 0);
            top = Math.max(top + reftop, 0);
            self.dh.css({top: top, left: left});
        }
        this.initOptions();
        this.initMask();
        this.initBox();
        this.initContent();
        this.initEvent();
    }

    var weefloats = function () {
        var self = this;
        this._onbox = false;
        this._opening = false;
        this.zIndex = 999;
        this.length = function () {
            return arrweebox.length;
        }
        this.open = function (content, options) {
            self._opening = true;
            if (typeof(options) == "undefined") {
                options = {};
            }
            if (options.boxid) {
                for (var i = 0; i < arrweebox.length; i++) {
                    if (arrweebox[i].dh.attr('id') == options.boxid) {
                        arrweebox[i].close();
                        break;
                    }
                }
            }
            options.zIndex = self.zIndex;
            self.zIndex += 10;
            var box = new weebox(content, options);
            box.dh.click(function () {
                self._onbox = true;
            });
            arrweebox.push(box);
            /*-----�����ie��ҳ����ʱ���ֲ�����Ӱû�и��ǵ�����-----by ePim*/
            if (box.options.position != "center") {
                box.setElementPosition();
            }
            if (box.mh) {
                box.mh.css({
                    width: box.bwidth(),
                    height: box.bheight()
                });
            }
            /*-----�����ie��ҳ����ʱ���ֲ���û�����ֵ�����-----by ePim(WanJiDong@gmail.com)*/
            return box;
        }
        //�ر����ϲ㴰��,������÷�����jQuery.weeboxs.close();
        this.close = function () {
            var closingBox = this.getTopBox();
            if (false != closingBox) {
                closingBox.close();
            }
        }
        $(window).scroll(function () {
            if (arrweebox.length > 0) {
                for (i = 0; i < arrweebox.length; i++) {
                    var box = arrweebox[i];//self.getTopBox();
                    /*if (box.options.position == "center") {
                     box.setCenterPosition();
                     }*/
                    if (box.options.position != "center") {
                        box.setElementPosition();
                    }
                    if (box.mh) {
                        box.mh.css({
                            width: box.bwidth(),
                            height: box.bheight()
                        });
                    }
                }
            }
        }).resize(function () {
            if (arrweebox.length > 0) {
                var box = self.getTopBox();
                if (box.options.position == "center") {
                    box.setCenterPosition();
                }
                if (box.mh) {
                    box.mh.css({
                        width: box.bwidth(),
                        height: box.bheight()
                    });
                }
            }
        });
    }
    $.extend({weefloats: new weefloats()});
})(jQuery);