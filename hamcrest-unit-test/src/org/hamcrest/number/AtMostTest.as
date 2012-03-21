package org.hamcrest.number
{
	import org.hamcrest.AbstractMatcherTestCase;
	
	public class AtMostTest extends AbstractMatcherTestCase
	{
		[Test]
		public function comparesValuesUsingAtMost():void
		{
			assertMatches("less than", atMost(10), 10);
			assertDoesNotMatch("not less than", atMost(10), 11);
		}
		
		[Test]
		public function hasAReadableDescription():void
		{
			assertDescription("at most <3>", atMost(3));
		}
		
		[Test]
		public function hasMismatchDescription():void
		{
			assertMismatch("was <4>", atMost(3), 4);
		}
	}
}
