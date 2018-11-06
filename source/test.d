import value;
import dunit;

class Test {
    mixin UnitTest;

    @Test
    public void assertEqualsReflexive() {
        DatacheValue value = new DatacheNumber(34203);

        assertEquals(value, value);
    }

    @Test
    public void assertOpEqualsReflexive() {
        DatacheValue value = new DatacheNumber(34203);
        import std.stdio;
        writeln("testing!!!");
        assert(value == value);
    }
}
