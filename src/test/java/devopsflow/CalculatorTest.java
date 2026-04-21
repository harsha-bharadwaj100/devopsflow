package devopsflow;

import static org.junit.jupiter.api.Assertions.*;

import org.junit.jupiter.api.Test;

class CalculatorTest {
	Calculator calc = new Calculator();
	@Test
	void addTest() {
		assertEquals(calc.add(1, 2), 3);
	}
}
