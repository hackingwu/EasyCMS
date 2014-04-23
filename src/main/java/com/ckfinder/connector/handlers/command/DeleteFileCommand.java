/*
 * CKFinder
 * ========
 * http://ckfinder.com
 * Copyright (C) 2007-2011, CKSource - Frederico Knabben. All rights reserved.
 *
 * The software, this file and its contents are subject to the CKFinder
 * License. Please read the license.txt file before using, installing, copying,
 * modifying or distribute this file or part of its contents. The contents of
 * this file is part of the Source Code of CKFinder.
*/
package com.ckfinder.connector.handlers.command;

import com.ckfinder.connector.configuration.Constants;
import com.ckfinder.connector.configuration.IConfiguration;
import com.ckfinder.connector.errors.ConnectorException;
import com.ckfinder.connector.utils.AccessControlUtil;
import com.ckfinder.connector.utils.FileUtils;
import org.w3c.dom.Element;

import javax.servlet.http.HttpServletRequest;
import java.io.File;

/**
 * Class to handle <code>DeleteFile</code> command.
 */
public class DeleteFileCommand extends XMLCommand implements IPostCommand{


	private String fileName;

	@Override
	protected void createXMLChildNodes(final int errorNum, final Element rootElement)
															throws ConnectorException {
		if (errorNum == Constants.Errors.CKFINDER_CONNECTOR_ERROR_NONE) {
			createDeleteFielsNode(rootElement);
		}

	}

	/**
	 * adds delete file node in XML.
	 * @param rootElement root element in XML
	 */
	private void createDeleteFielsNode(final Element rootElement) {
		Element element = creator.getDocument().createElement("DeletedFile");
		element.setAttribute("name", this.fileName);
		rootElement.appendChild(element);
	}

	/**
	 * gets data for XML response.
	 * @return error code or 0 if correct
	 */
	@Override
	protected int getDataForXml() {
		if (!AccessControlUtil.getInstance(this.configuration)
							.checkFolderACL(this.type, this.currentFolder, this.userRole,
							AccessControlUtil.CKFINDER_CONNECTOR_ACL_FILE_DELETE)) {
			return Constants.Errors.CKFINDER_CONNECTOR_ERROR_UNAUTHORIZED;
		}
		File file = new File(configuration.getTypes().get(this.type).getPath()
												   + this.currentFolder, this.fileName);
		if (FileUtils.checkIfDirIsHidden(this.currentFolder, configuration)) {
			return Constants.Errors.CKFINDER_CONNECTOR_ERROR_INVALID_REQUEST;
		}

		if (!FileUtils.checkFileName(this.fileName)
			|| FileUtils.checkIfFileIsHidden(this.fileName, this.configuration)
			|| FileUtils.checkFileExtension(this.fileName,
											 this.configuration.getTypes()
											 						.get(this.type),
											  this.configuration,
											  false) == 1) {

			return Constants.Errors.CKFINDER_CONNECTOR_ERROR_INVALID_REQUEST;
		}
		try {
			if (!file.exists()) {
				return Constants.Errors.CKFINDER_CONNECTOR_ERROR_FILE_NOT_FOUND;
			}
			if (FileUtils.delete(file)) {

				File thumbFile = new File(configuration.getThumbsPath()
												   + File.separator
												   + type
												   + this.currentFolder, this.fileName);

				FileUtils.delete(thumbFile);
				return Constants.Errors.CKFINDER_CONNECTOR_ERROR_NONE;
			} else {
				return Constants.Errors.CKFINDER_CONNECTOR_ERROR_ACCESS_DENIED;
			}
		} catch (SecurityException e) {
			if (configuration.isDebugMode()) {
				throw e;
			} else {
				return Constants.Errors.CKFINDER_CONNECTOR_ERROR_ACCESS_DENIED;
			}
		}

	}


	/**
	 * initialize params for command handler.
	 * @param request request
	 * @param configuration connector configuration
	 * @param params execute additional params.
	 * @throws com.ckfinder.connector.errors.ConnectorException when error occurs
	 */
	@Override
	public void initParams(final HttpServletRequest request,
						   final IConfiguration configuration,
						   final Object...params) throws ConnectorException {
		super.initParams(request, configuration);
		this.fileName = getParameter(request, "FileName");
	}



}
