package cn.easycms.util;

import java.io.*;

/**
 * Created by hackingwu on 2014/4/8.
 */
public class FileUtil {

    /**
     * 创建目录
     *
     * @param foler
     */
    public static void mkdir(String folder) {
        File file = new File(folder);
        if (!file.exists()) {
            file.mkdir();
            System.out.println(file);
            System.out.println(file.getAbsoluteFile());
            System.out.println(file.getAbsolutePath());
        }
    }

    public static void copyDirectory(String sourceDir, String targetDir) {
        File sourceFolder = new File(sourceDir);
        if (sourceFolder.exists()) {
            File targetFolder = new File(targetDir);
            if (!targetFolder.exists()) {
                targetFolder.mkdirs();
            }
            File[] files = sourceFolder.listFiles();
            for (int i = 0; i < files.length; i++) {
                if (files[i].isFile()) {
                    File sourceFile = files[i];
                    File targetFile = new File(new File(targetDir).getAbsoluteFile() + File.separator + files[i].getName());
                    copy(sourceFile, targetFile);
                } else if (files[i].isDirectory()) {
                    String dir1 = sourceDir + "/" + files[i].getName();
                    String dir2 = targetDir + "/" + files[i].getName();
                    copyDirectory(dir1, dir2);
                }
            }
        }
    }

    /**
     * 复制文件
     *
     * @param src 源文件
     * @param des 目标文件
     */
    public static void copy(File src, File des) {

        try {
            int BUFFER_SIZE = 32 * 1024;
            InputStream in = null;
            OutputStream out = null;
            try {
                in = new FileInputStream(src);
                out = new FileOutputStream(des);
                byte[] buffer = new byte[BUFFER_SIZE];
                int count = 0;
                while ((count = in.read(buffer)) != -1) {
                    out.write(buffer, 0, count);
                }
            } finally {
                if (in != null) {
                    in.close();
                }
                if (null != out) {
                    out.close();
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    //获取文件的后缀名
    public static String getExt(String fileName) {
        return fileName.substring(fileName.lastIndexOf(".") + 1);
    }

    public static String getFileNameWithoutExt(String fileName) {
        int index = fileName.lastIndexOf(".");
        return fileName.substring(0, index);
    }

    public static String readFile(String fileName) {
        return readFile(new File(fileName), "UTF-8");
    }

    public static String readFile(File file, String encode) {
        String output = "";
        if (file.exists()) {
            if (file.isFile()) {
                try {
                    InputStreamReader inputStreamReader = new InputStreamReader(new FileInputStream(file), encode);
                    BufferedReader bufferedReader = new BufferedReader(inputStreamReader);
                    StringBuffer stringBuffer = new StringBuffer();
                    String text = "";
                    while ((text = bufferedReader.readLine()) != null) {
                        stringBuffer.append(text);
                    }
                    output = stringBuffer.toString();
                } catch (UnsupportedEncodingException e) {
                    e.printStackTrace();
                } catch (FileNotFoundException e) {
                    e.printStackTrace();
                } catch (IOException e) {
                    e.printStackTrace();
                }
            } else if (file.isDirectory()) {
                String[] dir = file.list();
                output += "目录：\n";
                for (String s : dir) {
                    output += s + "\n";
                }
            }
        } else {
            System.err.println("File is not exits!");
        }
        return output;
    }
}
