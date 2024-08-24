package org.example;

import org.junit.jupiter.api.Test;

import static org.junit.jupiter.api.Assertions.assertEquals;

public class UserTests {

    @Test
    void testCalcFunction()
    {
        User user = new User();
        assertEquals(15,user.calc(5));
        assertEquals(10,user.calc(0));
    }

    @Test
    void testCalc2Function()
    {

        
        User user = new User();
        assertEquals(15,user.calc(5));
        assertEquals(1,user.calc(0));
    }


}
