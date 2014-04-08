package cn.easycms.util;

import javax.swing.plaf.synth.SynthTextAreaUI;
import java.io.File;

/**
 * Created by hackingwu on 2014/4/8.
 */
public class FileUtil {

    /**
     * 创建目录
     * @param foler
     */
    public static void mkdir(String folder){
        File file = new File(folder);
        if (!file.exists()){
            file.mkdir();
            System.out.println(file);
            System.out.println(file.getAbsoluteFile());
            System.out.println(file.getAbsolutePath());
        }
    }

    public static void copyDirectory(String sourceDir, String targetDir) {
        File sourceFolder = new File(sourceDir);
        if (sourceFolder.exists()){
            File targetFolder = new File(targetDir);
            if (!targetFolder.exists()){
                targetFolder.mkdirs();
            }
            File[] files = sourceFolder.listFiles();
            for (int i = 0 ; i < files.length;i++){
                if (files[i].isFile()){
                    File sourceFile = file[i];
                    File targetFile = new File(new File);
                }
            }
        }
    }
}
