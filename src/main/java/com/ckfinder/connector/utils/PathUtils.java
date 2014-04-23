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
package com.ckfinder.connector.utils;

import com.ckfinder.connector.configuration.Constants;

import java.util.regex.Pattern;

/**
 * Utils to change paths in connector.
 */
public class PathUtils {

	/**
	 * escaping double / and replace all \ to /.
	 * @param string string to escape
	 * @return escaped string.
	 */
	public static String escape(final String string) {
		if (string == null || string.equals("")) {
			return string;
		}
		String prefix = "";
		String string1 = string;
		if (string.indexOf("://") != -1) {
			prefix = string.substring(0, string.indexOf("://") + 3);
			string1 = string.replaceFirst(prefix, "");
		}
		string1 = string1.replaceAll("\\\\", "/");
		return prefix + string1.replaceAll("/+", "/");
	}


	/**
	 * if nessesry add slash to the end of string.
	 * @param string input string
	 * @return if last char of string is slash then return the same string
	 * else returns string with added slash
	 */
	public static String addSlashToEnd(final String string) {
		if (string == null || string.equals("")) {
			return string;
		}
		if (string.charAt(string.length() - 1) != '/') {
			return string.concat("/");
		}
		return string;
	}

	/**
	 * if nessesry add slash to the end of string.
	 * @param string input string
	 * @return if last char of string is slash then return the same string
	 * else returns string with added slash
	 */
	public static String addSlashToBeginning(final String string) {
		if (string == null || string.charAt(0) == '/'
				|| Pattern.matches(Constants.URL_REGEX, string)) {
			return string;
		}
		return "/".concat(string);
	}


	/**
	 * if first char is slash then return string without this.
	 * @param string input string
	 * @return changed string
	 */
	public static String removeSlashFromBeginning(final String string) {
		if (string == null || string.equals("")) {
			return string;
		}
		if (string.charAt(0) == '/') {
			return string.substring(1, string.length());
		}
		return string;
	}

	/**
	 * if last char is slash then return string without this.
	 * @param string input string
	 * @return changed string
	 */
	public static String removeSlashFromEnd(final String string) {
		if (string.charAt(string.length() - 1) == '/') {
			return string.substring(0, string.length() - 1);
		}
		return string;
	}
}
