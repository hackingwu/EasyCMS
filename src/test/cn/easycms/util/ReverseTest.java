package cn.easycms.util;

import org.junit.Test;

import java.util.ArrayList;
import java.util.List;

/**
 * Created by hackingwu on 14-5-9.
 */
public class ReverseTest {
    @Test
    public void reverseTest() {
        List<A> aList = new ArrayList<A>();
        aList.add(new A("a"));
        aList.add(new A("b"));
        aList.add(new A("c"));
        aList.add(new A("d"));
        aList.add(new A("d"));
        for (int i = 0; i <= aList.size() / 2; i++) {
            A temp = aList.get(i);
            aList.set(i, aList.get(aList.size() - 1 - i));
            aList.set(aList.size() - 1 - i, temp);
        }
        for (int i = 0; i < aList.size(); i++) {
            System.out.print(aList.get(i).getName());

        }
    }

    class A {
        private String name = "";

        public A(String name) {
            this.name = name;
        }

        public String getName() {
            return name;
        }

        public void setName(String name) {
            this.name = name;
        }

        ;
    }
}
