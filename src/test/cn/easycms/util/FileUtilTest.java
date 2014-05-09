package cn.easycms.util;

import org.junit.Test;

import static org.junit.Assert.assertEquals;

/**
 * Created by hackingwu on 14-5-7.
 */
public class FileUtilTest {
    @Test
    public void getExtTest() {
        String s = FileUtil.getExt("test.flv");
        assertEquals(s, "flv");
    }

    @Test
    public void getFileNameWithoutExt() {
        String s = FileUtil.getFileNameWithoutExt("test.flv");
        assertEquals(s, "test");
    }
}
