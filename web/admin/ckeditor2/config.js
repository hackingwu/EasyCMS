/*
 Copyright (c) 2003-2011, CKSource - Frederico Knabben. All rights reserved.
 For licensing, see LICENSE.html or http://ckeditor.com/license
 */

CKEDITOR.editorConfig = function (config) {
    // Define changes to default configuration here. For example:
    // config.language = 'fr';
    // config.uiColor = '#AADC6E';
    config.filebrowserBrowseUrl = '/admin/ckfinder/ckfinder.html';
    config.filebrowserImageBrowseUrl = '/admin/ckfinder/ckfinder.html?type=Images';
    config.filebrowserFlashBrowseUrl = '/admin/ckfinder/ckfinder.html?type=Flash';
    config.filebrowserUploadUrl = '/admin/ckfinder/core/connector/java/connector.java?command=QuickUpload&type=Files';
    config.filebrowserImageUploadUrl = '/admin/ckfinder/core/connector/java/connector.java?command=QuickUpload&type=Images';
    config.filebrowserFlashUploadUrl = '/admin/ckfinder/core/connector/java/connector.java?command=QuickUpload&type=Flash';
    config.filebrowserWindowWidth = '1000';
    config.filebrowserWindowHeight = '700';
    config.removeDialogTabs = 'link:upload;image:Upload;flash:Upload;';
    config.language = "zh-cn";
    config.extraPlugins += (config.extraPlugins ? ',autoformat' : 'autoformat');
    config.pasteFromWordIgnoreFontFace = false;
    config.pasteFromWordRemoveFontStyles = false;
    config.pasteFromWordRemoveStyles = false;

};
