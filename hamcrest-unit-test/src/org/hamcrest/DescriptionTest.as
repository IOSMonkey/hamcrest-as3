package org.hamcrest
{
	import org.flexunit.runners.Parameterized;
	import org.hamcrest.object.equalTo;

	Parameterized;
	
	[RunWith("org.flexunit.runners.Parameterized")]
	public class DescriptionTest
	{
		public var description:Description;
		
		[Before]
		public function setup():void 
		{
			description = new StringDescription();
		}
			
		public static function appendValueData():Array 
		{
			return [
				[true, '<true>'],
				[false, '<false>'],
				['', '""'],
				['String', '"String"'],
				[0, '<0>'],
				[1, '<1>'],
				[123, '<123>'],
				[[], '[]'],
				[[1, 2, 3], '[<1>,<2>,<3>]'],
				[new XML(<x y='3'>z</x>), '<x y="3">z</x>'],
				[function():void {}, '<Function>']
			];
		}
		
		[Test(dataProvider="appendValueData")]
		public function appendValue(value:*, expected:String):void 
		{
			description = new StringDescription();
			description.appendValue(value);
			assertThat(description.toString(), equalTo(expected));
		}
	}
}